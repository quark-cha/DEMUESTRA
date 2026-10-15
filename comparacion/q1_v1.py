"""Q1 reference and the deferred V1 protocol; no V amplitude register."""

import argparse
import json
from pathlib import Path
import time

from qiskit import QuantumCircuit
from qiskit.quantum_info import Statevector

from ejecucion_v import ejecutar, comparar_tiempos
from v_relacional import V1Relacional as V1

FUNCTIONS = {'constant_0': (0, 0), 'constant_1': (1, 1),
             'identity': (0, 1), 'inverter': (1, 0)}


class Oracle:
    """Compile reversible gates, not the classification of the function."""

    def __init__(self, table):
        if len(table) != 2 or any(type(b) is not int or b not in (0, 1) for b in table):
            raise ValueError('Expected two binary truth-table entries')
        self.__table = tuple(table)

    def append_to_q1(self, circuit):
        f0, f1 = self.__table
        if f0:
            circuit.x(1)
        if f0 != f1:
            circuit.cx(0, 1)

    def operaciones_v(self, control=0, target=1):
        f0, f1 = self.__table
        operations = []
        if f0:
            operations.append(('not', target))
        if f0 != f1:
            operations.append(('cnot', control, target))
        return tuple(operations)


def q1_probabilities(oracle):
    circuit = QuantumCircuit(2)
    circuit.x(1)
    circuit.h(0)
    circuit.h(1)
    oracle.append_to_q1(circuit)
    circuit.h(0)
    return Statevector.from_instruction(circuit).probabilities([0]).tolist()


def run(shots=1, *, realizacion_factory=None):
    if type(shots) is not int or shots < 1:
        raise ValueError('shots must be a positive integer')
    results = []
    for name, table in FUNCTIONS.items():
        oracle = Oracle(table)
        start = time.perf_counter()
        q_probabilities = q1_probabilities(oracle)
        q_seconds = time.perf_counter() - start
        captures = []
        counts = [0, 0]
        for _ in range(shots):
            device = None if realizacion_factory is None else realizacion_factory()
            machine = V1(realizacion=device)
            report = ejecutar(machine, oracle=oracle)
            captures.append(report)
            if report['status'] != 'MEDIDO':
                break
            counts[report['bits_q0_lsb'][0]] += 1
        completed = len(captures) == shots and all(r['status'] == 'MEDIDO' for r in captures)
        expected = table[0] ^ table[1]  # Tester only, never an input to V.
        results.append({'function': name, 'q1_model_probabilities': q_probabilities,
                        'v1_captures': captures, 'v1_counts': counts if completed else None,
                        'status': 'MEDIDO' if completed else 'PENDIENTE_REALIZACION',
                        'task_matches': counts[expected] == shots if completed else None,
                        'timing': comparar_tiempos(q_seconds, captures[0])})
    return {'scope': 'referencia Q1 simulada; V1 relacional sin tabla de amplitudes',
            'shots_requested': shots, 'results': results,
            'status': 'MEDIDO' if all(r['status'] == 'MEDIDO' for r in results)
                      else 'PENDIENTE_REALIZACION',
            'equivalence_verified': False}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--shots', type=int, default=1)
    parser.add_argument('--report', type=Path)
    args = parser.parse_args()
    report = run(args.shots)
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
    for row in report['results']:
        print(f"{row['function']}: {row['status']}")
    return 0 if report['status'] == 'MEDIDO' else 2


if __name__ == '__main__':
    raise SystemExit(main())
