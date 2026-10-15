import sys
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from v_relacional import MaquinaRelacional, ReglaVPendiente
from v1 import V1
from v2 import V2
from v3 import V3
from protocolo_q3 import make_circuit


class RelationalTests(unittest.TestCase):
    def test_no_generator_is_read_before_t0(self):
        calls = []
        def source(t):
            calls.append(t)
            return 1
        machine = MaquinaRelacional(1, [('not', 0)], [source])
        self.assertEqual(machine.estado_observado(), ('@',))
        machine.execute()
        self.assertEqual(calls, [])
        with self.assertRaises(RuntimeError):
            machine.read()
        self.assertEqual(machine.capture_t0(9), (0,))
        self.assertEqual(calls, [9])

    def test_joint_readout_preserves_inverse_relation(self):
        for value in (0, 1):
            machine = MaquinaRelacional(2, [('xor', 0, 1), ('not', 1)],
                                         [lambda t: value, lambda t: 0])
            machine.execute()
            self.assertEqual(machine.capture_t0(2), (value, 1-value))

    def test_one_capture_then_only_registered_result(self):
        calls = []
        machine = MaquinaRelacional(1, [], [lambda t: calls.append(t) or 0])
        machine.execute()
        self.assertEqual(machine.capture_t0(5), (0,))
        self.assertEqual(machine.capture_t0(5), (0,))
        self.assertEqual(machine.read(), (0,))
        self.assertEqual(calls, [5])
        with self.assertRaises(RuntimeError):
            machine.capture_t0(6)
        with self.assertRaises(RuntimeError):
            machine.execute()

    def test_failure_does_not_allow_another_measurement(self):
        machine = MaquinaRelacional(1, [], [lambda t: '@'])
        machine.execute()
        with self.assertRaises(ValueError):
            machine.capture_t0(0)
        with self.assertRaises(RuntimeError):
            machine.capture_t0(0)

    def test_no_invented_generator(self):
        machine = MaquinaRelacional(1, [])
        machine.execute()
        with self.assertRaises(ReglaVPendiente):
            machine.capture_t0(0)

    def test_unsupported_gate_is_not_replaced_by_randomness(self):
        calls = []
        machine = MaquinaRelacional(1, [('operacion_no_definida', 0)], [lambda t: calls.append(t) or 1])
        with self.assertRaises(ReglaVPendiente):
            machine.execute()
        self.assertEqual(calls, [])

    def test_description_has_linear_size(self):
        machine = MaquinaRelacional(1000, [('not', i) for i in range(1000)])
        machine.execute()
        self.assertEqual(len(machine._nodos), 2000)
        self.assertEqual(len(machine._puertos), 1000)
        self.assertFalse(machine.resources()['tabla_amplitudes'])
        self.assertFalse(machine.resources()['distribucion_calculada'])

    def test_three_protocols_refuse_false_equivalence(self):
        for machine in (V1(), V2(15), V3(make_circuit(4))):
            with self.subTest(machine=type(machine).__name__):
                self.assertFalse(machine.resources()['tabla_amplitudes'])
                if isinstance(machine, (V2, V3)):
                    machine.execute()
                    with self.assertRaises(ReglaVPendiente):
                        machine.capture_t0()
                else:
                    with self.assertRaises(ReglaVPendiente):
                        machine.execute()

    def test_q_reference_paths_use_the_same_relational_classes(self):
        import q1_v1
        import q2_v2
        self.assertIs(q1_v1.V1, V1)
        self.assertIs(q2_v2.V2, V2)

    def test_oracle_wiring_matches_q_for_all_binary_inputs(self):
        from q1_v1 import Oracle, FUNCTIONS
        from qiskit import QuantumCircuit
        from qiskit.quantum_info import Statevector
        for table in FUNCTIONS.values():
            oracle = Oracle(table)
            for x in (0, 1):
                for y in (0, 1):
                    calls = []
                    def source(value):
                        return lambda t: calls.append(t) or value
                    machine = MaquinaRelacional(2, oracle.operaciones_v(),
                                                 [source(x), source(y)])
                    machine.execute()
                    self.assertEqual(calls, [])
                    output = machine.capture_t0(7)
                    self.assertEqual(output, (x, y ^ table[x]))
                    self.assertEqual(calls, [7, 7])
                    circuit = QuantumCircuit(2)
                    if x:
                        circuit.x(0)
                    if y:
                        circuit.x(1)
                    oracle.append_to_q1(circuit)
                    probabilities = Statevector.from_instruction(circuit).probabilities()
                    self.assertAlmostEqual(probabilities[output[0] + 2*output[1]], 1.)

    def test_v1_keeps_oracle_between_h_blocks(self):
        from q1_v1 import Oracle
        calls = []
        machine = V1(reloj=lambda: calls.append('reloj') or 7)
        machine.execute(Oracle((1, 0)))
        self.assertEqual(machine.operaciones_preparadas(),
                         (('h', 0), ('h', 1), ('not', 1), ('cnot', 0, 1), ('h', 0)))
        self.assertEqual(calls, [])
        with self.assertRaises(ReglaVPendiente):
            machine.capture_t0()
        self.assertEqual(calls, [])

    def test_modular_relation_preserves_outside_domain_and_control(self):
        for control in (0, 1):
            for word in range(16):
                values = [(word >> bit) & 1 for bit in range(4)] + [control]
                machine = MaquinaRelacional(5,
                    [('multiplicacion_modular_controlada', 4, (0, 1, 2, 3), 2, 15)],
                    [lambda t, value=v: value for v in values])
                machine.execute()
                output = machine.capture_t0(1)
                actual = sum(output[i] << i for i in range(4))
                expected = 2*word % 15 if control and word < 15 else word
                self.assertEqual(actual, expected)
                self.assertEqual(output[4], control)

    def test_v2_binds_modulus_and_successive_powers(self):
        machine = V2(15)
        machine.execute()
        operations = machine.operaciones_preparadas()
        modular = [op for op in operations if op[0] == 'multiplicacion_modular_controlada']
        self.assertEqual([op[1] for op in modular], list(range(4, 12)))
        self.assertEqual([op[3] for op in modular], [2, 4, 1, 1, 1, 1, 1, 1])
        self.assertTrue(all(op[2] == (0, 1, 2, 3) and op[4] == 15 for op in modular))
        self.assertEqual(operations[:8], tuple(('h', i) for i in range(4, 12)))
        self.assertLess(len(machine._nodos), 100)

    def test_signal_and_binary_order_is_not_discarded(self):
        operations = [('h', 0), ('not', 1), ('fase', 0, .5), ('swap', 0, 1), ('h', 1)]
        machine = MaquinaRelacional(2, operations)
        machine.execute()
        self.assertEqual(machine.operaciones_preparadas(), tuple(operations))

    def test_invalid_time_does_not_read(self):
        calls = []
        machine = MaquinaRelacional(1, [], [lambda t: calls.append(t) or 0])
        machine.execute()
        for invalid in (-1, float('nan'), float('inf'), True, '@'):
            with self.assertRaises(ValueError):
                machine.capture_t0(invalid)
        self.assertEqual(calls, [])

    def test_boolean_relations_match_q_on_computational_basis(self):
        from qiskit import QuantumCircuit
        from qiskit.quantum_info import Statevector
        # Q is a test reference only; no vector is used by the V machine.
        for operation in ('not', 'cnot', 'swap'):
            for a in (0, 1):
                for b in (0, 1):
                    circuit = QuantumCircuit(2)
                    if a:
                        circuit.x(0)
                    if b:
                        circuit.x(1)
                    if operation == 'not':
                        circuit.x(0)
                        relations = [('not', 0)]
                    elif operation == 'cnot':
                        circuit.cx(0, 1)
                        relations = [('cnot', 0, 1)]
                    else:
                        circuit.swap(0, 1)
                        relations = [('swap', 0, 1)]
                    q = Statevector.from_instruction(circuit).probabilities()
                    machine = MaquinaRelacional(2, relations,
                                                 [lambda t: a, lambda t: b])
                    machine.execute()
                    output = machine.capture_t0(1)
                    self.assertAlmostEqual(q[output[0] + 2*output[1]], 1.)


if __name__ == '__main__':
    unittest.main()
