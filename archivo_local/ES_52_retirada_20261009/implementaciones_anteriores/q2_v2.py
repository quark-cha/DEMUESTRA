"""Small Shor order-finding: independent Qiskit Q2 and real-channel V2_ref.

Neither local software model is a scalable quantum factoring device.
"""

import argparse
from datetime import datetime, timezone
from fractions import Fraction
import hashlib
from importlib.metadata import version
import json
import math
import platform
from pathlib import Path
from statistics import median
import time

import numpy as np
from qiskit import QuantumCircuit
from qiskit.circuit.library import QFTGate
from qiskit.quantum_info import Operator, Statevector
from sympy import factorint
from sympy.ntheory.factor_ import factor_cache

from q1_v1 import PhaseOscillator

TOLERANCE = 1e-10
MAX_INPUT_BITS = 5


class ResourceLimit(ValueError):
    pass


def resources(n):
    if type(n) is not int or n < 3:
        raise ValueError('N must be an integer greater than two')
    bits = n.bit_length()
    return {'input_bits': bits, 'work_bits': bits, 'control_bits': 2 * bits,
            'register_bits': 3 * bits,
            'v2_state_bytes_formula': f'16 * 2**{3 * bits}',
            'v2_fourier_kernel_bytes_formula': f'16 * 2**{4 * bits}',
            'supported': bits <= MAX_INPUT_BITS}


def dimensions(n, a):
    info = resources(n)
    if not info['supported']:
        raise ResourceLimit(f"N needs {info['register_bits']} register bits; "
                            f"explicit V2 channels exceed the {MAX_INPUT_BITS}-input-bit limit")
    if type(a) is not int or not 1 < a < n or math.gcd(a, n) != 1:
        raise ValueError('The order-finding base must be coprime to N, with 1 < a < N')
    return info['work_bits'], 1 << info['work_bits'], 1 << info['control_bits']


def q2_distribution(n, a):
    bits, work_dim, control_dim = dimensions(n, a)
    circuit = QuantumCircuit(3 * bits)
    circuit.x(0)  # Work register starts in |1>.
    controls = list(range(bits, 3 * bits))
    for qubit in controls:
        circuit.h(qubit)
    state = Statevector.from_instruction(circuit)
    for j, qubit in enumerate(controls):
        multiplier = pow(a, 1 << j, n)
        # Define a permutation on the entire register, including y >= N.
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


class V2:
    """Explicit finite signal register: not the compact hidden-bit architecture.

    The phase readout is deterministic. The caller's ordinary interface cannot
    read until t0, but Python privacy does not certify physical inaccessibility.
    """

    def __init__(self, n, a=2, phase_ticks=None):
        self.__bits, self.__work_dim, self.__control_dim = dimensions(n, a)
        self.__n, self.__a = n, a
        self.__oscillator = PhaseOscillator(phase_ticks)
        self.__probabilities = None
        self.__latched = None

    def execute(self):
        if self.__probabilities is not None:
            raise RuntimeError('Prepare a new machine for a new execution')
        # Hadamards on a zero control register give equal real channels.
        real = np.zeros((self.__control_dim, self.__work_dim))
        real[:, 1] = 1 / math.sqrt(self.__control_dim)
        ys = np.arange(self.__work_dim)
        for j in range(2 * self.__bits):
            multiplier = pow(self.__a, 1 << j, self.__n)
            destinations = np.where(ys < self.__n, multiplier * ys % self.__n, ys)
            inverse = np.argsort(destinations)
            selected = (np.arange(self.__control_dim) & (1 << j)) != 0
            real[selected] = real[selected][:, inverse]
        # Independent real arithmetic for the inverse Fourier block.
        indexes = np.arange(self.__control_dim, dtype=float)
        angles = -2 * np.pi * np.outer(indexes, indexes) / self.__control_dim
        scale = math.sqrt(self.__control_dim)
        real_output = (np.cos(angles) / scale) @ real
        imaginary_output = (np.sin(angles) / scale) @ real
        weights = np.sum(real_output ** 2 + imaginary_output ** 2, axis=1)
        if abs(float(weights.sum()) - 1) > TOLERANCE:
            raise RuntimeError('Register normalization lost')
        self.__probabilities = weights

    def capture_t0(self, t0_ticks=0):
        if self.__probabilities is None:
            raise RuntimeError('Complete the protocol before t0')
        if self.__latched is None:
            phase = self.__oscillator.capture_phase(t0_ticks)
            cumulative = np.cumsum(self.__probabilities)
            threshold = phase * cumulative[-1]
            self.__latched = min(int(np.searchsorted(cumulative, threshold, side='right')),
                                 self.__control_dim - 1)
        return self.__latched

    def read(self):
        if self.__latched is None:
            raise RuntimeError('Readout is blocked until capture_t0')
        return self.__latched

    def audit_after_t0(self):
        self.read()
        return self.__probabilities.copy()


def factors_from_readout(n, a, measured, control_dim):
    """Shared classical postprocessing, not a classical factoring fallback.

    Test up to eight multiples of the observed continued-fraction denominator;
    verify the order relation before trying gcd extraction. No true period is
    supplied by the test, and no scan of all periods or factors is performed.
    """
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


def timed(function, repeats):
    durations, result = [], None
    for _ in range(repeats):
        start = time.perf_counter()
        result = function()
        durations.append(time.perf_counter() - start)
    return result, {'median_seconds': median(durations), 'runs_seconds': durations}


def conventional_factors(n):
    # Do not time a remembered factorization from the preceding repetition.
    factor_cache.clear()
    return {str(p): int(e) for p, e in factorint(n).items()}


def compare(n, a=2, repeats=3):
    bits, _, control_dim = dimensions(n, a)
    q_probs, q_time = timed(lambda: q2_distribution(n, a), repeats)

    def execute_v():
        attempts = []
        for phase in (190000, 370000, 610000, 830000):
            machine = V2(n, a, phase_ticks=phase)
            machine.execute()
            measured = machine.capture_t0(0)
            outcome = factors_from_readout(n, a, measured, control_dim)
            attempts.append({'phase_ticks': phase, 't0_ticks': 0, 'value': measured,
                             'outcome': outcome})
            if outcome:
                break
        return measured, machine.audit_after_t0(), attempts

    (measured, v_probs, attempts), v_time = timed(execute_v, repeats)
    start = time.perf_counter()
    captured_factors = factors_from_readout(n, a, measured, control_dim)
    post_seconds = time.perf_counter() - start
    successes = [(i, factors_from_readout(n, a, i, control_dim))
                 for i in range(control_dim)]
    q_success = sum(float(q_probs[i]) for i, outcome in successes if outcome)
    v_success = sum(float(v_probs[i]) for i, outcome in successes if outcome)
    classical, classical_time = timed(lambda: conventional_factors(n), repeats)
    max_error = float(np.max(np.abs(q_probs - v_probs)))
    tv = float(np.sum(np.abs(q_probs - v_probs)) / 2)
    peaks = sorted(range(control_dim), key=lambda i: q_probs[i], reverse=True)[:12]
    return {'N': str(n), 'base': a, 'resources': resources(n),
            'q2_local_model_time': q_time, 'v2_local_model_time': v_time,
            'classical_factorint_time': classical_time, 'classical_factors': classical,
            'v2_timing_scope': 'fresh executions and classical postprocessing until success or four attempts',
            'q2_timing_scope': 'one local order-finding distribution; not full factoring runtime',
            'v2_attempts': attempts,
            'v2_capture': {'phase_ticks': attempts[-1]['phase_ticks'], 't0_ticks': 0, 'value': measured,
                           'postprocessing_seconds': post_seconds, 'outcome': captured_factors},
            'max_probability_error': max_error, 'total_variation_distance': tv,
            'q2_postprocessing_success_probability': q_success,
            'v2_postprocessing_success_probability': v_success,
            'readout_peaks': [{'value': i, 'p_q': float(q_probs[i]), 'p_v': float(v_probs[i])}
                              for i in peaks],
            'passed': max_error < TOLERANCE and tv < TOLERANCE
                      and abs(q_success - v_success) < TOLERANCE
                      and captured_factors is not None}


def run(numbers=(15, 21), repeats=3):
    if type(repeats) is not int or not 1 <= repeats <= 10:
        raise ValueError('repeats must be between one and ten')
    results = []
    for n in numbers:
        if resources(n)['supported']:
            results.append(compare(n, repeats=repeats))
        else:
            results.append({'N': str(n), 'status': 'RESOURCE_LIMIT_NOT_EXECUTED',
                            'resources': resources(n)})
    # A conventional reference on a larger, explicitly declared test integer.
    larger = 982_451_653 * 1_000_000_007
    factors, conventional_time = timed(lambda: conventional_factors(larger), repeats)
    source = Path(__file__).resolve().parents[1] / 'Proyectos/ES_52/ES_52_Maquina_V_UNIHOLOG.md'
    return {'scope': 'finite real-channel V2_ref versus Q2 Shor local model',
            'utc': datetime.now(timezone.utc).isoformat(), 'tolerance': TOLERANCE,
            'platform': platform.platform(), 'python': platform.python_version(),
            'versions': {name: version(name) for name in ('numpy', 'qiskit', 'sympy')},
            'code_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
            'source_sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
            'timing_scope': 'local model construction and execution; no quantum hardware timing',
            'classical_timing': 'factorint cache cleared for every repetition; imports excluded',
            'not_claimed': ['quantum speedup', 'RSA-2048 factoring', 'physical realization',
                            'universal equivalence', 'unknown phase certified'],
            'results': results,
            'larger_conventional_reference': {'N': str(larger), 'input_bits': larger.bit_length(),
                                              'factorint': factors, 'time': conventional_time,
                                              'v2_status': 'RESOURCE_LIMIT_NOT_EXECUTED'},
            'rsa2048_v2_resource_bound': resources(1 << 2047),
            'published_q2_estimate': {'source': 'https://arxiv.org/abs/2505.15917',
                                      'description': 'RSA-2048: under a week, under one million noisy qubits; estimate, not measured runtime'},
            'passed': bool(results) and all(r.get('passed', False) for r in results)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--numbers', type=int, nargs='+', default=[15, 21])
    parser.add_argument('--repeats', type=int, default=3)
    parser.add_argument('--report', type=Path)
    args = parser.parse_args()
    report = run(args.numbers, args.repeats)
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
    for row in report['results']:
        if 'passed' not in row:
            print(f"N={row['N']}: {row['status']}")
        else:
            print(f"N={row['N']}: capture factors={row['v2_capture']['outcome']}; "
                  f"probability error={row['max_probability_error']:.3g}; "
                  f"V2={row['v2_local_model_time']['median_seconds']:.6f}s; "
                  f"classical={row['classical_factorint_time']['median_seconds']:.6f}s")
    print('Times are local software only. Large RSA V2 is not executable with this representation.')
    return 0 if report['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
