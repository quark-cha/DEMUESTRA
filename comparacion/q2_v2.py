"""Small Shor order-finding: independent Qiskit Q2 and relational V2.

Neither local software model is a scalable quantum factoring device.
"""

import argparse
from fractions import Fraction
import json
import math
from pathlib import Path
import time

import numpy as np
from qiskit import QuantumCircuit
from qiskit.circuit.library import QFTGate
from qiskit.quantum_info import Operator, Statevector

from ejecucion_v import ejecutar, comparar_tiempos
from v_relacional import V2Relacional as V2

MAX_INPUT_BITS = 5  # Limit of the Q reference, not of V's circuit description.


class ResourceLimit(ValueError):
    pass


def resources(n):
    if type(n) is not int or n < 3:
        raise ValueError('N must be an integer greater than two')
    bits = n.bit_length()
    return {'input_bits': bits, 'work_bits': bits, 'control_bits': 2 * bits,
            'register_bits': 3 * bits,
            'v2_representation': 'deferred connections; no amplitude or probability table',
            'q_reference_supported': bits <= MAX_INPUT_BITS}


def dimensions(n, a):
    info = resources(n)
    if not info['q_reference_supported']:
        raise ResourceLimit('La referencia Q2 local supera su limite de memoria')
    if type(a) is not int or not 1 < a < n or math.gcd(a, n) != 1:
        raise ValueError('The order-finding base must be coprime to N, with 1 < a < N')
    return info['work_bits'], 1 << info['work_bits'], 1 << info['control_bits']


def q2_distribution(n, a):
    bits, work_dim, _ = dimensions(n, a)
    circuit = QuantumCircuit(3 * bits)
    circuit.x(0)
    controls = list(range(bits, 3 * bits))
    for qubit in controls:
        circuit.h(qubit)
    state = Statevector.from_instruction(circuit)
    for j, qubit in enumerate(controls):
        multiplier = pow(a, 1 << j, n)
        matrix = np.zeros((work_dim, work_dim), dtype=complex)
        for y in range(work_dim):
            target = multiplier * y % n if y < n else y
            matrix[target, y] = 1
        controlled = np.zeros((2 * work_dim, 2 * work_dim), dtype=complex)
        controlled[:work_dim, :work_dim] = np.eye(work_dim)
        controlled[work_dim:, work_dim:] = matrix
        state = state.evolve(Operator(controlled), list(range(bits)) + [qubit])
    state = state.evolve(QFTGate(2 * bits).inverse(), controls)
    return state.probabilities(controls)


def factors_from_readout(n, a, measured, control_dim):
    """Classical processing of a measurement, without a supplied true period."""
    if not 0 < measured < control_dim:
        return None
    denominator = Fraction(measured, control_dim).limit_denominator(n).denominator
    if denominator == 1:
        return None
    for multiple in range(1, 9):
        order = multiple * denominator
        if order >= n or order % 2 or pow(a, order, n) != 1:
            continue
        root = pow(a, order // 2, n)
        if root in (1, n - 1):
            continue
        for delta in (-1, 1):
            divisor = math.gcd(root + delta, n)
            if 1 < divisor < n:
                pair = sorted([divisor, n // divisor])
                if pair[0] * pair[1] == n:
                    return {'factors': pair, 'verified_order_multiple': order}
    return None


def compare(n, a=2, repeats=1, *, realizacion_factory=None):
    if type(repeats) is not int or not 1 <= repeats <= 10:
        raise ValueError('repeats must be between one and ten')
    bits = resources(n)['work_bits']
    V2(n, a)  # Validate V independently of the Q memory limit.
    start = time.perf_counter()
    if resources(n)['q_reference_supported']:
        probabilities = q2_distribution(n, a)
        peaks = sorted(range(len(probabilities)), key=probabilities.__getitem__, reverse=True)[:12]
        q_report = {'status': 'MODELO_LOCAL',
                    'peaks': [{'value': i, 'probability': float(probabilities[i])} for i in peaks]}
        q_seconds = time.perf_counter() - start
    else:
        q_report, q_seconds = {'status': 'LIMITE_REFERENCIA_Q'}, None
    attempts = []
    for _ in range(repeats):
        device = None if realizacion_factory is None else realizacion_factory()
        machine = V2(n, a, realizacion=device)
        report = ejecutar(machine)
        if report['status'] == 'MEDIDO':
            measured = machine.valor_control()
            post_start = time.perf_counter()
            report['outcome'] = factors_from_readout(n, a, measured, 1 << (2 * bits))
            report['postprocessing_seconds'] = time.perf_counter() - post_start
            report['control_value'] = measured
        attempts.append(report)
        if report['status'] != 'MEDIDO':
            break
    completed = len(attempts) == repeats and all(r['status'] == 'MEDIDO' for r in attempts)
    return {'N': str(n), 'base': a, 'resources': resources(n), 'q2_reference': q_report,
            'v2_attempts': attempts, 'status': 'MEDIDO' if completed else 'PENDIENTE_REALIZACION',
            'timing': comparar_tiempos(q_seconds, attempts[0]) if q_seconds is not None else None,
            'equivalence_verified': False}


def run(numbers=(15, 21), repeats=1):
    rows = [compare(n, repeats=repeats) for n in numbers]
    return {'scope': 'Q2 local simulado; V2 sin registro exponencial', 'results': rows,
            'status': 'MEDIDO' if rows and all(r['status'] == 'MEDIDO' for r in rows)
                      else 'PENDIENTE_REALIZACION'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--numbers', type=int, nargs='+', default=[15, 21])
    parser.add_argument('--repeats', type=int, default=1)
    parser.add_argument('--report', type=Path)
    args = parser.parse_args()
    report = run(args.numbers, args.repeats)
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
    for row in report['results']:
        print(f"N={row['N']}: {row['status']}")
    return 0 if report['status'] == 'MEDIDO' else 2


if __name__ == '__main__':
    raise SystemExit(main())
