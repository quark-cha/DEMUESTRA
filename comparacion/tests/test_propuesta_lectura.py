import math
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

import numpy as np
from qiskit import QuantumCircuit
from qiskit.circuit.library import QFTGate
from qiskit.quantum_info import Operator, Statevector

from ejecucion_v import ejecutar
from propuesta_lectura import (PropuestaLecturaPorCaminos, amplitud_diagnostico,
                               LimiteCalculoPropuesto)
from protocolo_q3 import make_circuit
from q1_v1 import Oracle, run
from q2_v2 import q2_distribution
from v_relacional import MaquinaRelacional, V2Relacional, V3Relacional


def plan(units, operations, initial=None):
    machine = MaquinaRelacional(units, operations,
        inicial=(0,) * units if initial is None else initial)
    machine.execute()
    return machine.preparacion()


@unittest.skip('Ensayo retirado para V: recorre caminos; se conserva solo como historial')
class PathReadoutTests(unittest.TestCase):
    def assert_amplitudes(self, preparation, circuit):
        expected = Statevector.from_instruction(circuit).data
        for output, value in enumerate(expected):
            self.assertAlmostEqual(abs(amplitud_diagnostico(preparation, output) - value), 0., places=11)

    def test_h_phase_h_retains_interference_for_all_angles(self):
        for angle in (0., .3, math.pi / 2, math.pi, -math.pi / 4):
            preparation = plan(1, [('h', 0), ('fase', 0, angle), ('h', 0)])
            circuit = QuantumCircuit(1)
            circuit.h(0)
            circuit.p(angle, 0)
            circuit.h(0)
            self.assert_amplitudes(preparation, circuit)

    def test_bell_joint_outputs_not_independent_bits(self):
        for threshold, expected in ((0., (0, 0)), (.2, (0, 0)), (.8, (1, 1))):
            detector = PropuestaLecturaPorCaminos(lambda t: threshold)
            machine = MaquinaRelacional(2, [('h', 0), ('cnot', 0, 1)],
                                        inicial=(0, 0), realizacion=detector)
            machine.execute()
            self.assertEqual(machine.capture_t0(1), expected)

    def test_rotations_controlled_phases_and_permutations(self):
        operations = [('h', 0), ('rx', 1, .4), ('rz', 0, -.7), ('cp', 0, 1, .9),
                      ('cz', 0, 1), ('swap', 0, 1), ('cnot', 1, 0), ('not', 1)]
        circuit = QuantumCircuit(2)
        circuit.h(0)
        circuit.rx(.4, 1)
        circuit.rz(-.7, 0)
        circuit.cp(.9, 0, 1)
        circuit.cz(0, 1)
        circuit.swap(0, 1)
        circuit.cx(1, 0)
        circuit.x(1)
        self.assert_amplitudes(plan(2, operations), circuit)

    def test_toffoli_in_superposition(self):
        circuit = QuantumCircuit(3)
        circuit.h(0)
        circuit.h(1)
        circuit.ccx(0, 1, 2)
        self.assert_amplitudes(plan(3, [('h', 0), ('h', 1), ('ccx', 0, 1, 2)]), circuit)

    def test_inverse_fourier_all_basis_inputs(self):
        for value in range(8):
            initial = tuple((value >> i) & 1 for i in range(3))
            circuit = QuantumCircuit(3)
            for i, bit in enumerate(initial):
                if bit:
                    circuit.x(i)
            circuit.append(QFTGate(3).inverse(), [0, 1, 2])
            self.assert_amplitudes(plan(3, [('fourier_inversa', 0, 1, 2)], initial), circuit)

    def test_modular_inverse_and_nonadjacent_ports(self):
        work = (2, 0)
        circuit = QuantumCircuit(3)
        circuit.x(2)
        circuit.h(1)
        matrix = np.zeros((8, 8), dtype=complex)  # Q reference only.
        for value in range(8):
            c, y = value >> 2, value & 3
            target = 2 * y % 3 if c and y < 3 else y
            matrix[target + (c << 2), value] = 1
        circuit.unitary(Operator(matrix), [*work, 1])
        preparation = plan(3, [('h', 1),
            ('multiplicacion_modular_controlada', 1, work, 2, 3)], (0, 0, 1))
        self.assert_amplitudes(preparation, circuit)

    def test_small_order_finding_full_control_distribution(self):
        machine = V2Relacional(3)
        machine.execute()
        probabilities = q2_distribution(3, 2)
        for control, expected in enumerate(probabilities):
            actual = 0.
            for work in range(4):
                amplitude = amplitud_diagnostico(machine.preparacion(), work + (control << 2))
                actual += abs(amplitude)**2
            self.assertAlmostEqual(actual, expected, places=11)

    def test_local_v3_amplitudes_for_multiple_designs(self):
        for seed in (2, 7, 11):
            spec = make_circuit(3, cycles=2, seed=seed)
            machine = V3Relacional(spec)
            machine.execute()
            circuit = QuantumCircuit(3)
            for gate in spec['gates']:
                name, ports = gate['name'], gate['qubits']
                if name in ('rx', 'rz'):
                    getattr(circuit, name)(gate['angle'], ports[0])
                else:
                    getattr(circuit, name)(*ports)
            self.assert_amplitudes(machine.preparacion(), circuit)

    def test_threshold_only_called_at_t0_once_and_not_at_prepare(self):
        calls = []
        detector = PropuestaLecturaPorCaminos(lambda t: calls.append(t) or .2)
        machine = MaquinaRelacional(1, [('h', 0)], inicial=(0,), realizacion=detector)
        machine.execute()
        self.assertEqual(calls, [])
        self.assertEqual(machine.estado_observado(), ('@',))
        with self.assertRaises(RuntimeError):
            detector.auditoria()
        self.assertEqual(machine.capture_t0(8), (0,))
        self.assertEqual(machine.capture_t0(8), (0,))
        self.assertEqual(calls, [8])
        audit = detector.auditoria()
        self.assertFalse(audit['tabla_amplitudes'])
        self.assertFalse(audit['tabla_probabilidades'])
        self.assertLessEqual(audit['max_pila'], 2)

    def test_all_four_deutsch_tasks_without_answer_input(self):
        report = run(shots=2, realizacion_factory=lambda:
                     PropuestaLecturaPorCaminos(lambda t: .31))
        self.assertTrue(all(row['task_matches'] for row in report['results']))
        self.assertFalse(report['equivalence_verified'])
        self.assertTrue(all(row['timing']['comparables_para_ventaja'] is False
                            for row in report['results']))

    def test_budget_failure_does_not_invent_a_bit_or_retry(self):
        detector = PropuestaLecturaPorCaminos(lambda t: .2, max_visitas=1)
        machine = MaquinaRelacional(1, [('h', 0)], inicial=(0,), realizacion=detector)
        report = ejecutar(machine)
        self.assertEqual(report['status'], 'LIMITE_PROPUESTA')
        self.assertIsNone(report['bits_q0_lsb'])
        self.assertFalse(detector.auditoria()['salida_registrada'])
        with self.assertRaises(RuntimeError):
            machine.capture_t0(0)

    def test_invalid_threshold_does_not_allow_another_measurement(self):
        for invalid in (-.1, 1., True, float('nan'), '@'):
            detector = PropuestaLecturaPorCaminos(lambda t: invalid)
            machine = MaquinaRelacional(1, [], inicial=(0,), realizacion=detector)
            machine.execute()
            with self.assertRaises(ValueError):
                machine.capture_t0(1)
            with self.assertRaises(RuntimeError):
                machine.capture_t0(1)

    def test_unknown_preparation_and_irreversible_and_are_not_invented(self):
        for preparation in (plan(1, [], (None,)), plan(2, [('and', 0, 1)])):
            with self.assertRaises(ValueError):
                PropuestaLecturaPorCaminos().preparar(preparation)

    def test_zero_probability_outputs_are_not_selected(self):
        detector = PropuestaLecturaPorCaminos(lambda t: 0.)
        machine = MaquinaRelacional(2, [], inicial=(0, 1), realizacion=detector)
        machine.execute()
        self.assertEqual(machine.capture_t0(0), (0, 1))


if __name__ == '__main__':
    unittest.main()
