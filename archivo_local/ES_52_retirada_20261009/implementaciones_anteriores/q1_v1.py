"""Q1 Deutsch circuit versus a V1 candidate with four signed real channels."""

import argparse
from datetime import datetime, timezone
import hashlib
from importlib.metadata import version
import json
from pathlib import Path
import time

import numpy as np
from qiskit import QuantumCircuit
from qiskit.quantum_info import Statevector

FUNCTIONS = {'constant_0': (0, 0), 'constant_1': (1, 1),
             'identity': (0, 1), 'inverter': (1, 0)}
TOLERANCE = 1e-10


class PhaseOscillator:
    """Deterministic phase evolution; no random-number generation.

    Explicit phase is a test fixture, not a claim of unknown preparation.
    Clock-based initialization alone does not certify unpredictability.
    """

    PERIOD_TICKS = 1_000_000

    def __init__(self, phase_ticks=None):
        if phase_ticks is None:
            phase_ticks = time.monotonic_ns()
        if type(phase_ticks) is not int:
            raise ValueError('Initial phase must be an integer number of ticks')
        self.__phase = phase_ticks % self.PERIOD_TICKS

    def capture_phase(self, t0_ticks):
        if type(t0_ticks) is not int or t0_ticks < 0:
            raise ValueError('t0 must be a nonnegative integer number of ticks')
        return ((self.__phase + t0_ticks) % self.PERIOD_TICKS) / self.PERIOD_TICKS


class Oracle:
    """Compiled wiring; its output is not a classification of the function."""

    def __init__(self, table):
        if len(table) != 2 or any(type(b) is not int or b not in (0, 1) for b in table):
            raise ValueError('Expected two binary truth-table entries')
        self.__table = tuple(table)
        self.__permutation = tuple(2 * (y ^ self.__table[x]) + x
                                   for y in (0, 1) for x in (0, 1))

    def route(self, channels):
        result = [0.] * 4
        for source, destination in enumerate(self.__permutation):
            result[destination] = channels[source]
        return result

    def append_to_q1(self, circuit):
        # Qubit 0 is x, qubit 1 is y; implement y XOR f(x) reversibly.
        f0, f1 = self.__table
        if f0:
            circuit.x(1)
        if f0 != f1:
            circuit.cx(0, 1)


class V1:
    """Candidate V1_ref: real-channel arithmetic, not hidden Boolean generators.

    Private fields enforce the ordinary interface, not security against a
    debugger. All channels belong to one jointly transformed register.
    """

    def __init__(self, phase_ticks=None):
        # |q1 q0> = |10>: x is prepared as 0 and y as 1.
        self.__channels = [0., 0., 1., 0.]
        self.__oscillator = PhaseOscillator(phase_ticks)
        self.__ready = False
        self.__latched = None
        self.__oracle_calls = 0

    def __check_unlatched(self):
        if self.__latched is not None:
            raise RuntimeError('Execution already captured; prepare a new machine')

    def __hadamard(self, bit):
        scale = 2 ** -.5
        stride = 1 << bit
        for i in range(4):
            if not i & stride:
                j = i | stride
                a, b = self.__channels[i], self.__channels[j]
                self.__channels[i] = (a + b) * scale
                self.__channels[j] = (a - b) * scale

    def execute(self, oracle):
        self.__check_unlatched()
        if self.__ready:
            raise RuntimeError('Protocol already executed')
        self.__hadamard(0)
        self.__hadamard(1)
        self.__channels = oracle.route(self.__channels)
        self.__oracle_calls += 1
        self.__hadamard(0)
        self.__ready = True

    def capture_t0(self, t0_ticks=None):
        if not self.__ready:
            raise RuntimeError('Protocol must finish before t0')
        if self.__latched is None:
            # The latch reads a pre-existing evolving phase, not a fresh draw.
            weights = [a * a for a in self.__channels]
            total = sum(weights)
            if abs(total - 1) > TOLERANCE:
                raise RuntimeError('Register normalization lost')
            if t0_ticks is None:
                t0_ticks = time.monotonic_ns()
            threshold = self.__oscillator.capture_phase(t0_ticks) * total
            accumulated = 0.
            selected = next(i for i in reversed(range(4)) if weights[i] > 0)
            for i, weight in enumerate(weights):
                accumulated += weight
                if threshold < accumulated:
                    selected = i
                    break
            self.__latched = selected & 1
            self.__channels = None
        return self.__latched

    def read(self):
        if self.__latched is None:
            raise RuntimeError('Readout is blocked before capture_t0')
        return self.__latched

    def audit_after_t0(self):
        self.read()
        return {'oracle_applications': self.__oracle_calls}


def q1_probabilities(oracle):
    circuit = QuantumCircuit(2)
    circuit.x(1)
    circuit.h(0)
    circuit.h(1)
    oracle.append_to_q1(circuit)
    circuit.h(0)
    # No measure/reset operation until the final computational-basis readout.
    return Statevector.from_instruction(circuit).probabilities([0]).tolist()


def run(shots=1000, seed=52046):
    if type(shots) is not int or shots < 1:
        raise ValueError('shots must be a positive integer')
    results = []
    for index, (name, table) in enumerate(FUNCTIONS.items()):
        oracle = Oracle(table)
        q_probabilities = q1_probabilities(oracle)
        counts = [0, 0]
        calls = []
        for shot in range(shots):
            machine = V1(seed)
            machine.execute(oracle)
            # Declared deterministic phase sweep; not random repetitions.
            t0_ticks = shot * PhaseOscillator.PERIOD_TICKS // shots
            counts[machine.capture_t0(t0_ticks)] += 1
            calls.append(machine.audit_after_t0()['oracle_applications'])
        expected = table[0] ^ table[1]  # Used only by the tester, never by V1.
        frequencies = [count / shots for count in counts]
        error = max(abs(p - f) for p, f in zip(q_probabilities, frequencies))
        results.append({'function': name, 'table': list(table), 'expected': expected,
                        'q1_probabilities': q_probabilities, 'v1_counts': counts,
                        'v1_frequencies': frequencies, 'max_error': error,
                        'passed': counts[expected] == shots and error < TOLERANCE
                                  and all(c == 1 for c in calls)})
    root = Path(__file__).resolve().parents[1]
    source = root / 'Proyectos/ES_52/ES_52_Maquina_V_UNIHOLOG.md'
    return {'scope': 'Q1 local Qiskit model versus V1_ref signed-real-channel candidate',
            'not_claimed': ['physical construction', 'hidden-generator-only realization',
                            'quantum speedup', 'universal equivalence'],
            'utc': datetime.now(timezone.utc).isoformat(), 'shots_per_case': shots,
            'capture': 'deterministic oscillator phase latched at logical t0',
            'sampling': 'declared deterministic phase sweep, not random hardware shots',
            'unknown_phase_certified': False,
            'seed': seed, 'tolerance': TOLERANCE, 'qiskit': version('qiskit'),
            'software_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
            'source_sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
            'resources': {'v1_real_channels': 4, 'truth_table_entries_for_oracle_setup': 2,
                          'oracle_register_applications_per_execution': 1},
            'results': results, 'passed': all(row['passed'] for row in results)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--shots', type=int, default=1000)
    parser.add_argument('--seed', type=int, default=52046)
    parser.add_argument('--report', type=Path)
    args = parser.parse_args()
    report = run(args.shots, args.seed)
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
    for row in report['results']:
        print(f"{row['function']}: Q1={row['q1_probabilities']}; V1={row['v1_counts']}; "
              f"{'OK' if row['passed'] else 'DIFFERENCE'}")
    print('V1 candidate: four signed real channels; not independent hidden bits alone.')
    return 0 if report['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
