"""Contrast V_ref real signals with Qiskit density matrices, not physical V."""

import argparse
from dataclasses import dataclass
from datetime import datetime, timezone
import hashlib
from importlib.metadata import version
import json
from pathlib import Path

import numpy as np
from qiskit.quantum_info import DensityMatrix, Operator

TOLERANCE = 1e-10
BRANCH_FLOOR = 1e-14
I = np.eye(2, dtype=complex)
X = np.array([[0, 1], [1, 0]], dtype=complex)
Y = np.array([[0, -1j], [1j, 0]], dtype=complex)
Z = np.diag([1, -1]).astype(complex)
H = np.array([[1, 1], [1, -1]], dtype=complex) / np.sqrt(2)
CX = np.array([[1, 0, 0, 0], [0, 1, 0, 0],
               [0, 0, 0, 1], [0, 0, 1, 0]], dtype=complex)


def real_block(matrix):
    return np.block([[matrix.real, -matrix.imag],
                     [matrix.imag, matrix.real]])


def signals(vector):
    return np.concatenate([vector.real, vector.imag])


def complex_vector(vector):
    d = len(vector) // 2
    return vector[:d] + 1j * vector[d:]


def validate_preparation(ensemble):
    if not ensemble or not np.isclose(sum(w for w, _ in ensemble), 1):
        raise ValueError('Preparation weights must sum to one')
    d = len(ensemble[0][1])
    if d < 2 or d & (d - 1):
        raise ValueError('Register dimension must be a power of two')
    for weight, vector in ensemble:
        if (weight < 0 or not np.isfinite(weight) or len(vector) != d
                or not np.all(np.isfinite(vector))
                or not np.isclose(np.vdot(vector, vector), 1)):
            raise ValueError('Invalid normalized preparation')


class VReference:
    """Real signal register plus hidden classical preparation/Kraus branches."""

    @staticmethod
    def prepare(ensemble):
        validate_preparation(ensemble)
        return [(weight, signals(vector)) for weight, vector in ensemble]

    @staticmethod
    def unitary(state, matrix):
        block = real_block(matrix)
        return [(weight, block @ vector) for weight, vector in state]

    @staticmethod
    def instrument(state, groups):
        outcomes = {}
        for label, matrices in groups.items():
            branches = []
            for weight, vector in state:
                for matrix in matrices:
                    moved = real_block(matrix) @ vector
                    norm2 = float(moved @ moved)
                    if norm2 > 0 and weight > 0:
                        branches.append((weight * norm2, moved / np.sqrt(norm2)))
            probability = sum(weight for weight, _ in branches)
            if probability > BRANCH_FLOOR:
                outcomes[label] = (probability,
                                   [(w / probability, v) for w, v in branches])
        return outcomes

    @staticmethod
    def density_for_audit(state):
        # This reconstruction is for the tester, never for protocol control.
        return sum(w * np.outer(complex_vector(v), complex_vector(v).conj())
                   for w, v in state)


class QReference:
    """Independent density-matrix evolution through Qiskit."""

    @staticmethod
    def prepare(ensemble):
        validate_preparation(ensemble)
        return DensityMatrix(sum(w * DensityMatrix(v).data for w, v in ensemble))

    @staticmethod
    def unitary(state, matrix):
        return state.evolve(Operator(matrix))

    @staticmethod
    def instrument(state, groups):
        outcomes = {}
        for label, matrices in groups.items():
            data = sum(state.evolve(Operator(matrix)).data for matrix in matrices)
            probability = float(np.trace(data).real)
            if probability > BRANCH_FLOOR:
                outcomes[label] = (probability, DensityMatrix(data / probability))
        return outcomes

    @staticmethod
    def density_for_audit(state):
        return state.data


@dataclass
class Step:
    kind: str
    operation: object


@dataclass
class Case:
    name: str
    preparation: list
    steps: list


def validate_operation(kind, operation, d):
    if kind == 'unitary':
        if (operation.shape != (d, d) or not np.all(np.isfinite(operation))
                or not np.allclose(operation.conj().T @ operation, np.eye(d),
                                   atol=TOLERANCE, rtol=0)):
            raise ValueError('Invalid unitary operation')
    elif kind == 'instrument':
        if not operation or any(not ks for ks in operation.values()):
            raise ValueError('Empty instrument')
        matrices = [k for ks in operation.values() for k in ks]
        if any(k.shape != (d, d) or not np.all(np.isfinite(k)) for k in matrices):
            raise ValueError('Invalid instrument dimensions')
        complete = sum(k.conj().T @ k for k in matrices)
        if not np.allclose(complete, np.eye(d), atol=TOLERANCE, rtol=0):
            raise ValueError('Instrument is not trace preserving')
    else:
        raise ValueError('Unknown protocol operation')


def advance(engine, paths, step, d):
    result = {}
    for history, (joint, state) in paths.items():
        # Controllers receive visible history only, not state or hidden nu.
        operation = step.operation(history) if callable(step.operation) else step.operation
        validate_operation(step.kind, operation, d)
        if step.kind == 'unitary':
            result[history] = (joint, engine.unitary(state, operation))
        else:
            for label, (probability, posterior) in engine.instrument(state, operation).items():
                result[history + (label,)] = (joint * probability, posterior)
    return result


def compare(case, v_engine=VReference, tolerance=TOLERANCE):
    d = len(case.preparation[0][1])
    v_paths = {(): (1., v_engine.prepare(case.preparation))}
    q_paths = {(): (1., QReference.prepare(case.preparation))}
    max_probability_error = max_state_error = max_mass_error = 0.
    rows = []
    for stage in range(len(case.steps) + 1):
        if stage:
            v_paths = advance(v_engine, v_paths, case.steps[stage - 1], d)
            q_paths = advance(QReference, q_paths, case.steps[stage - 1], d)
        max_mass_error = max(max_mass_error,
                             abs(sum(p for p, _ in v_paths.values()) - 1),
                             abs(sum(p for p, _ in q_paths.values()) - 1))
        for history in sorted(set(v_paths) | set(q_paths)):
            pv, sv = v_paths.get(history, (0., None))
            pq, sq = q_paths.get(history, (0., None))
            error = abs(pv - pq)
            max_probability_error = max(max_probability_error, error)
            if sv is not None and sq is not None:
                state_error = float(np.max(np.abs(v_engine.density_for_audit(sv)
                                                 - QReference.density_for_audit(sq))))
                max_state_error = max(max_state_error, state_error)
            if stage == len(case.steps):
                rows.append({'history': list(history), 'p_v': pv, 'p_q': pq})
    return {'case': case.name, 'dimension': d, 'steps': len(case.steps),
            'passed': max(max_probability_error, max_state_error, max_mass_error) <= tolerance,
            'max_probability_error': max_probability_error,
            'max_posterior_entry_error': max_state_error,
            'max_total_mass_error': max_mass_error, 'outcomes': rows}


def measurement(axis=Z, second=False):
    projectors = [(I + axis) / 2, (I - axis) / 2]
    if second:
        projectors = [np.kron(I, p) for p in projectors]
    return {str(i): [p] for i, p in enumerate(projectors)}


def unitary(matrix):
    return Step('unitary', matrix)


def measure(groups):
    return Step('instrument', groups)


def cases():
    zero = [(1., np.array([1, 0], dtype=complex))]
    one = [(1., np.array([0, 1], dtype=complex))]
    result = [Case('zero', zero, [measure(measurement())]),
              Case('one', one, [measure(measurement())]),
              Case('H', zero, [unitary(H), measure(measurement())]),
              Case('H_H', zero, [unitary(H), unitary(H), measure(measurement())])]
    for i, angle in enumerate(np.linspace(0, 2 * np.pi, 17)):
        phase = np.diag([np.exp(-.5j * angle), np.exp(.5j * angle)])
        result.append(Case(f'interference_{i:02d}', zero,
                           [unitary(H), unitary(phase), unitary(H), measure(measurement())]))
    for name, axis in [('X', X), ('Y', Y), ('Z', Z)]:
        result.append(Case('basis_' + name, zero,
                           [unitary(H), measure(measurement(axis)), measure(measurement(axis))]))
    result.append(Case('Z_then_X', zero, [unitary(H), measure(measurement()),
                                         measure(measurement(X))]))
    result.append(Case('visible_feed_forward', zero,
                       [unitary(H), measure(measurement()),
                        Step('unitary', lambda history: X if history[-1] == '1' else I),
                        measure(measurement())]))
    register = [(1., np.array([1, 0, 0, 0], dtype=complex))]
    # Basis is |q1 q0>; q0 is the least significant bit, as in Qiskit.
    first_z = {str(i): [np.kron(p[0], I)] for i, p in
               enumerate(measurement().values())}
    result.append(Case('Bell_joint_sequential', register,
                       [unitary(np.kron(H, I)), unitary(CX), measure(first_z),
                        measure(measurement(second=True))]))
    mixed = [(.3, zero[0][1]), (.7, one[0][1])]
    result.append(Case('mixed_preparation', mixed, [unitary(H), measure(measurement(Y))]))
    for gamma in (0., .1, .5, 1.):
        damping = [np.diag([1., np.sqrt(1 - gamma)]).astype(complex),
                   np.array([[0, np.sqrt(gamma)], [0, 0]], dtype=complex)]
        result.append(Case(f'amplitude_damping_{gamma}', one,
                           [measure({'unobserved': damping}), measure(measurement())]))
        dephase = [np.sqrt(1 - gamma) * I, np.sqrt(gamma) * Z]
        result.append(Case(f'phase_noise_{gamma}', zero,
                           [unitary(H), measure({'unobserved': dephase}), unitary(H),
                            measure(measurement())]))
    # Each visible outcome aggregates two hidden Kraus branches.
    result.append(Case('instrument_hidden_nu', zero,
                       [unitary(H), measure({'a': [np.sqrt(.2)*I, np.sqrt(.3)*Z],
                                              'b': [np.sqrt(.1)*X, np.sqrt(.4)*Y]}),
                        measure(measurement(X))]))
    rng = np.random.default_rng(52046)
    for d in (2, 4):
        for trial in range(20):
            vector = rng.normal(size=d) + 1j * rng.normal(size=d)
            vector /= np.linalg.norm(vector)
            gates = []
            for _ in range(3):
                matrix = rng.normal(size=(d, d)) + 1j*rng.normal(size=(d, d))
                q, _ = np.linalg.qr(matrix)
                gates.append(unitary(q))
            readout = measurement() if d == 2 else first_z
            gates.extend([measure(readout), measure(readout)])
            if d == 4:
                gates.append(measure(measurement(second=True)))
            result.append(Case(f'random_d{d}_{trial:02d}', [(1., vector)], gates))
    return result


class MissingPhaseV(VReference):
    @staticmethod
    def unitary(state, matrix):
        if np.max(np.abs(matrix.imag)) > .01:
            return state
        return VReference.unitary(state, matrix)


class LostCorrelationV(VReference):
    @staticmethod
    def instrument(state, groups):
        outcomes = VReference.instrument(state, groups)
        if state[0][1].size == 8:
            # Deliberately destroy the joint posterior after the first readout.
            replacement = VReference.prepare([(1., np.ones(4, dtype=complex) / 2)])
            return {a: (p, replacement) for a, (p, _) in outcomes.items()}
        return outcomes


def run():
    protocols = cases()
    results = [compare(case) for case in protocols]
    controls = [compare(next(c for c in protocols if c.name == 'interference_08'), MissingPhaseV),
                compare(next(c for c in protocols if c.name == 'Bell_joint_sequential'), LostCorrelationV)]
    root = Path(__file__).resolve().parents[1]
    source = root / 'Proyectos/ES_52/ES_52_Maquina_V_UNIHOLOG.md'
    return {'scope': 'V_ref ideal real signal model versus local Qiskit; not physical V or Q',
            'utc': datetime.now(timezone.utc).isoformat(),
            'versions': {'numpy': version('numpy'), 'qiskit': version('qiskit')},
            'model_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
            'source_sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
            'tolerance': TOLERANCE, 'branch_floor': BRANCH_FLOOR,
            'sampling': 'enumerated probabilities; no hardware shots',
            'passed': all(r['passed'] for r in results) and all(not r['passed'] for r in controls),
            'positive_cases': results, 'negative_controls': controls}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--report', type=Path)
    args = parser.parse_args()
    report = run()
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(report, indent=2, ensure_ascii=True) + '\n', encoding='utf-8')
    passed = sum(r['passed'] for r in report['positive_cases'])
    detected = sum(not r['passed'] for r in report['negative_controls'])
    print(f"V_ref: {passed}/{len(report['positive_cases'])}; negative controls detected: {detected}/2")
    print('Scope: ideal V_ref model only; no physical realization or universal certification.')
    return 0 if report['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
