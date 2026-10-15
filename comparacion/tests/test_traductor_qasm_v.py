import importlib.util
from pathlib import Path
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
from traductor_qasm_v import ErrorTraduccion, generar, traducir


def fuente(body, size=2):
    return f'OPENQASM 2.0; include "qelib1.inc"; qreg q[{size}]; creg c[{size}]; {body}'


class TraduccionTests(unittest.TestCase):
    def test_preserves_order_and_readout_mapping(self):
        p = traducir(fuente('h q[0]; cx q[0],q[1]; measure q[0]->c[1]; measure q[1]->c[0];'))
        self.assertEqual(p.operaciones, (('h', 0), ('cnot', 0, 1)))
        self.assertEqual(p.medidas, ((0, 1), (1, 0)))

    def test_named_gate_definition_is_expanded(self):
        p = traducir(fuente('gate par a,b { h a; cx a,b; } par q[0],q[1]; measure q->c;'))
        self.assertEqual(p.operaciones, (('h', 0), ('cnot', 0, 1)))

    def test_phases_and_angles_are_controls_not_random_outcomes(self):
        p = traducir(fuente('s q[0]; tdg q[1]; rx(pi/3) q[0]; cu1(pi/4) q[0],q[1]; measure q->c;'))
        self.assertEqual([op[0] for op in p.operaciones], ['fase', 'fase', 'rx', 'cp'])

    def test_multiple_registers_and_broadcast(self):
        p = traducir('OPENQASM 2.0; include "qelib1.inc"; qreg a[1]; qreg b[1]; creg c[2]; '
                     'h a; x b; measure b[0]->c[0]; measure a[0]->c[1];')
        self.assertEqual(p.operaciones, (('h', 0), ('not', 1)))
        self.assertEqual(p.medidas, ((1, 0), (0, 1)))

    def test_rejects_changed_protocol(self):
        cases = ['measure q[0]->c[0]; x q[1]; measure q[1]->c[1];',
                 'reset q[0]; measure q->c;', 'h q[0];',
                 'measure q[0]->c[0];', 'measure q[0]->c[0]; measure q[1]->c[0];',
                 'ry(pi) q[0]; measure q->c;',
                 'if(c==0) x q[0]; measure q->c;',
                 'opaque unknown a; unknown q[0]; measure q->c;']
        for body in cases:
            with self.subTest(body=body), self.assertRaises(ErrorTraduccion):
                traducir(fuente(body))

    def test_qasm3_reports_unsupported_not_partial_translation(self):
        with self.assertRaises(ErrorTraduccion):
            traducir('OPENQASM 3.0; qubit q; bit c; c=measure q;')

    def test_generates_all_targets_and_requires_realization(self):
        class Detector:
            def __init__(self):
                self.calls = []
            def preparar(self, plan):
                self.calls.append(('preparar', plan))
            def disparar(self, t0):
                self.calls.append(('disparar', t0))
                return (1, 0)

        p = traducir(fuente('h q[0]; cx q[0],q[1]; measure q[0]->c[1]; measure q[1]->c[0];'))
        with tempfile.TemporaryDirectory(dir=ROOT) as folder:
            paths = generar(p, folder)
            self.assertEqual({path.suffix for path in paths}, {'.py', '.hpp', '.cpp', '.pl', '.json'})
            module_spec = importlib.util.spec_from_file_location('generated_v', paths[0])
            module = importlib.util.module_from_spec(module_spec)
            module_spec.loader.exec_module(module)
            detector = Detector()
            machine = module.construir(detector)
            self.assertEqual(machine.estado_observado(), ('@', '@'))
            with self.assertRaises(RuntimeError):
                module.salida_clasica(machine)
            self.assertEqual(len(detector.calls), 1)
            self.assertEqual(module.medir(machine), (1, 0))
            self.assertEqual(module.medir(machine), (1, 0))
            self.assertEqual(module.salida_clasica(machine), (0, 1))
            self.assertEqual(len(detector.calls), 2)
            self.assertEqual(detector.calls[0][1].operaciones, p.operaciones)
            self.assertGreater(detector.calls[1][1], 0)
            # The fixture tests the interface, not physical execution of H/CNOT.
            with self.assertRaises(FileExistsError):
                generar(p, folder)

    def test_no_simulator_or_probabilities_in_targets(self):
        from traductor_qasm_v import cpp_v, prolog_v, python_v
        p = traducir(fuente('h q[0]; measure q->c;'))
        for source in (python_v(p), cpp_v(p), prolog_v(p)):
            for forbidden in ('Statevector', 'probabilities', 'random', 'amplitudes'):
                self.assertNotIn(forbidden, source)


if __name__ == '__main__':
    unittest.main()
