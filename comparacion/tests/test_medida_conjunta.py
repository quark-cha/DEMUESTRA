import sys
from pathlib import Path
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from ejecucion_v import ejecutar
from protocolo_q3 import make_circuit
from q1_v1 import Oracle, run
from q2_v2 import compare, factors_from_readout
from comparar_q3_v3 import local_compare
from v_relacional import MaquinaRelacional, V1Relacional, V2Relacional, V3Relacional


class DetectorDePrueba:
    """Contract fixture only: does not implement or validate signal dynamics."""

    def __init__(self, result):
        self.result = result
        self.calls = []

    def preparar(self, plan):
        self.plan = plan
        self.calls.append('preparar')

    def medir(self, t0):
        self.calls.append(('medir', t0))
        return self.result

    def disparar(self, t0):
        self.calls.append(('disparar', t0))
        return self.result


class JointMeasurementTests(unittest.TestCase):
    def test_all_three_pass_preparation_without_reading(self):
        spec = make_circuit(3, cycles=1)
        for construct, initial in (
                (lambda d: V1Relacional(realizacion=d, reloj=lambda: 17), (0, 1)),
                (lambda d: V2Relacional(15, realizacion=d, reloj=lambda: 17), (1,) + (0,) * 11),
                (lambda d: V3Relacional(spec, realizacion=d, reloj=lambda: 17), (0,) * 3)):
            detector = DetectorDePrueba((0,) * len(initial))
            machine = construct(detector)
            if isinstance(machine, V1Relacional):
                machine.execute(Oracle((0, 1)))
            else:
                machine.execute()
            self.assertEqual(detector.calls, ['preparar'])
            self.assertEqual(detector.plan.inicial, initial)
            self.assertEqual(detector.plan.operaciones, machine.operaciones_preparadas())
            self.assertEqual(machine.estado_observado(), ('@',) * len(initial))
            with self.assertRaises(RuntimeError):
                machine.read()
            result = machine.capture_t0()
            self.assertEqual(result, (0,) * len(initial))
            self.assertEqual(machine.capture_t0(), result)
            self.assertEqual(detector.calls, ['preparar', ('disparar', 17)])
            with self.assertRaises(ValueError):
                machine.capture_t0(18)
            with self.assertRaises(RuntimeError):
                machine.execute()

    def test_invalid_capture_is_consumed_and_never_retried(self):
        for result in ((1,), ('@', 0), (True, 0), (0, 2), None):
            detector = DetectorDePrueba(result)
            machine = MaquinaRelacional(2, [('h', 0)], realizacion=detector)
            machine.execute()
            with self.assertRaises((ValueError, TypeError)):
                machine.capture_t0(1)
            with self.assertRaises(RuntimeError):
                machine.capture_t0(1)
            self.assertEqual(detector.calls, ['preparar', ('medir', 1)])

    def test_measurement_exception_does_not_repeat(self):
        detector = DetectorDePrueba((0,))
        with patch.object(detector, 'medir', side_effect=OSError('sensor unavailable')) as read:
            machine = MaquinaRelacional(1, [('h', 0)], realizacion=detector)
            machine.execute()
            with self.assertRaises(OSError):
                machine.capture_t0(1)
            with self.assertRaises(RuntimeError):
                machine.capture_t0(1)
            read.assert_called_once_with(1)

    def test_preparation_failure_does_not_allow_capture(self):
        detector = DetectorDePrueba((0,))
        with patch.object(detector, 'preparar', side_effect=OSError('connection failed')):
            machine = MaquinaRelacional(1, [('h', 0)], realizacion=detector)
            with self.assertRaises(OSError):
                machine.execute()
            with self.assertRaises(RuntimeError):
                machine.capture_t0(1)
            self.assertEqual(detector.calls, [])

    def test_invalid_time_never_reaches_detector(self):
        detector = DetectorDePrueba((0,))
        machine = MaquinaRelacional(1, [('h', 0)], realizacion=detector)
        machine.execute()
        for invalid in (-1, float('inf'), True):
            with self.assertRaises(ValueError):
                machine.capture_t0(invalid)
        self.assertEqual(detector.calls, ['preparar'])

    def test_prepare_cannot_return_an_early_result(self):
        detector = DetectorDePrueba((0,))
        with patch.object(detector, 'preparar', return_value=(0,)):
            machine = MaquinaRelacional(1, [('h', 0)], realizacion=detector)
            with self.assertRaises(ValueError):
                machine.execute()
            with self.assertRaises(RuntimeError):
                machine.capture_t0(1)
            self.assertEqual(machine.estado_observado(), ('@',))

    def test_q3_memory_limit_does_not_limit_v_connections(self):
        report = local_compare(make_circuit(17, cycles=1))
        self.assertEqual(report['q3_reference_status'], 'LIMITE_REFERENCIA_Q')
        self.assertEqual(report['status'], 'PENDIENTE_REALIZACION')
        self.assertIsNone(report['timing'])

    def test_do_not_mix_binary_sources_and_joint_realization(self):
        with self.assertRaises(ValueError):
            MaquinaRelacional(1, [], [lambda t: 0], realizacion=DetectorDePrueba((0,)))

    def test_pending_is_not_failure_or_completed_timing(self):
        report = ejecutar(V1Relacional(), oracle=Oracle((0, 1)))
        self.assertEqual(report['status'], 'PENDIENTE_REALIZACION')
        self.assertIsNone(report['bits_q0_lsb'])
        self.assertIsNone(report['medida_seconds'])
        self.assertEqual(report['etapa'], 'medida')

    def test_control_word_uses_measured_bits_and_little_endian(self):
        # This fixture tests extraction only, not Shor dynamics.
        output = (1, 0, 0, 0) + (0, 0, 0, 0, 0, 0, 1, 0)
        machine = V2Relacional(15, realizacion=DetectorDePrueba(output))
        machine.execute()
        with self.assertRaises(RuntimeError):
            machine.valor_control()
        machine.capture_t0()
        self.assertEqual(machine.valor_control(), 64)
        self.assertEqual(factors_from_readout(15, 2, 64, 256)['factors'], [3, 5])
        self.assertIsNone(factors_from_readout(15, 2, 0, 256))

    def test_comparators_no_longer_call_removed_amplitude_bank(self):
        q1 = run()
        q2 = compare(15)
        q3 = local_compare(make_circuit(3, cycles=1))
        for report in (q1, q2, q3):
            self.assertEqual(report['status'], 'PENDIENTE_REALIZACION')
        self.assertIsNone(q2['timing'])
        self.assertIsNone(q3['timing'])
        self.assertTrue(all(r['task_matches'] is None for r in q1['results']))

    def test_fresh_machine_and_detector_for_every_repetition(self):
        detectors = []
        def factory():
            detector = DetectorDePrueba((0, 0))
            detectors.append(detector)
            return detector
        report = run(shots=2, realizacion_factory=factory)
        self.assertEqual(len(detectors), 8)
        self.assertTrue(all(len(d.calls) == 2 and d.calls[0] == 'preparar'
                            and d.calls[1][0] == 'disparar' for d in detectors))
        self.assertEqual(report['status'], 'MEDIDO')
        self.assertFalse(report['equivalence_verified'])
        self.assertFalse(report['results'][2]['task_matches'])

    def test_q_memory_limit_does_not_prevent_v_preparation(self):
        report = compare(35)
        self.assertEqual(report['q2_reference']['status'], 'LIMITE_REFERENCIA_Q')
        self.assertEqual(report['status'], 'PENDIENTE_REALIZACION')

    def test_toffoli_and_reversible_or_truth_tables(self):
        for a in (0, 1):
            for b in (0, 1):
                for target in (0, 1):
                    sources = [lambda t, value=value: value for value in (a, b, target)]
                    machine = MaquinaRelacional(3, [('toffoli', 0, 1, 2)], sources)
                    machine.execute()
                    self.assertEqual(machine.capture_t0(1), (a, b, target ^ (a & b)))
                    machine = MaquinaRelacional(3,
                        [('cnot', 0, 2), ('cnot', 1, 2), ('ccx', 0, 1, 2)], sources)
                    machine.execute()
                    self.assertEqual(machine.capture_t0(1), (a, b, target ^ (a | b)))


if __name__ == '__main__':
    unittest.main()
