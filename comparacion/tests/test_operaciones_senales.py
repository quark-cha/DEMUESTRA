import math
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from operaciones_senales import Bloque, compilar_bloque, fourier_inversa
from v_relacional import MaquinaRelacional, ReglaVPendiente


class SignalOperationTests(unittest.TestCase):
    def test_h_twice_is_identity(self):
        block = Bloque('h', (0,))
        for pair in ((1, 0), (0, 1), (1j, 2-3j)):
            result = block.transformar_par(*block.transformar_par(*pair))
            for a, b in zip(result, pair):
                self.assertAlmostEqual(abs(a-b), 0.)

    def test_signal_formulas_match_q(self):
        import numpy as np
        from qiskit import QuantumCircuit
        from qiskit.quantum_info import Operator
        for name in ('h', 'fase', 'rx', 'rz'):
            for angle in (0., .7, -2.3, math.pi):
                circuit = QuantumCircuit(1)
                if name == 'h':
                    circuit.h(0)
                    operation = ('h', 0)
                else:
                    getattr(circuit, 'p' if name == 'fase' else name)(angle, 0)
                    operation = (name, 0, angle)
                block = compilar_bloque(operation, 1)[0]
                for pair in ((1, 0), (0, 1), (1j, 2-3j)):
                    np.testing.assert_allclose(block.transformar_par(*pair),
                                               Operator(circuit).data @ pair,
                                               atol=1e-14, rtol=0)

    def test_compact_fourier_wiring_matches_q(self):
        import numpy as np
        from qiskit import QuantumCircuit
        from qiskit.circuit.library import QFTGate
        from qiskit.quantum_info import Operator
        for width in (1, 2, 3, 4):
            circuit = QuantumCircuit(width)
            for block in fourier_inversa(range(width)):
                if block.nombre == 'cp':
                    circuit.cp(block.angulo, *block.puertos)
                else:
                    getattr(circuit, block.nombre)(*block.puertos)
            np.testing.assert_allclose(Operator(circuit).data,
                                       Operator(QFTGate(width).inverse()).data,
                                       atol=1e-14, rtol=0)

    def test_fourier_description_grows_quadratically(self):
        for width in (10, 100):
            blocks = fourier_inversa(range(width))
            self.assertEqual(len(blocks), width + width*(width-1)//2 + width//2)

    def test_compile_does_not_read_and_does_not_fake_joint_execution(self):
        calls = []
        machine = MaquinaRelacional(1, [('h', 0), ('fase', 0, .7)],
                                     [lambda t: calls.append(t) or 0])
        machine.execute()
        self.assertEqual(calls, [])
        self.assertEqual(machine.resources()['bloques_senales_definidos'], 2)
        with self.assertRaises(ReglaVPendiente):
            machine.capture_t0(4)
        self.assertEqual(calls, [])


if __name__ == '__main__':
    unittest.main()
