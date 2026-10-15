from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import sys
import time
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from ejecucion_v import ejecutar
from protocolo_q3 import make_circuit
from q1_v1 import Oracle
from v_relacional import V1Relacional, V2Relacional, V3Relacional


class DetectorEnsayo:
    """Checks the trigger interface only, not the operation of quantum gates."""

    def __init__(self):
        self.calls = []

    def preparar(self, plan):
        self.units = plan.unidades
        self.calls.append('preparar')

    def disparar(self, t0):
        self.calls.append(('disparar', t0))
        return (0,) * self.units


class ConstitutiveTimeTests(unittest.TestCase):
    def machines(self, device, clock):
        return (V1Relacional(realizacion=device, reloj=clock),
                V2Relacional(15, realizacion=device, reloj=clock),
                V3Relacional(make_circuit(3, 1), realizacion=device, reloj=clock))

    def prepare(self, machine):
        if isinstance(machine, V1Relacional):
            machine.execute(Oracle((0, 1)))
        else:
            machine.execute()

    def test_all_three_take_t0_from_trigger_not_preparation(self):
        for index in range(3):
            times = []
            device = DetectorEnsayo()
            machine = self.machines(device, lambda: times.append('clock') or 27.5)[index]
            self.prepare(machine)
            self.assertEqual(times, [])
            self.assertEqual(device.calls, ['preparar'])
            with self.assertRaises(RuntimeError):
                machine.instante_medida()
            result = machine.capture_t0()
            self.assertEqual(times, ['clock'])
            self.assertEqual(device.calls, ['preparar', ('disparar', 27.5)])
            self.assertEqual(machine.instante_medida(), 27.5)
            self.assertEqual(machine.read(), result)
            self.assertEqual(machine.capture_t0(), result)
            self.assertEqual(times, ['clock'])

    def test_cannot_supply_an_invented_t0(self):
        device = DetectorEnsayo()
        machine = V2Relacional(15, realizacion=device)
        machine.execute()
        for label in (0, 7, 1000, float('nan')):
            with self.assertRaises(ValueError):
                machine.capture_t0(label)
        self.assertEqual(device.calls, ['preparar'])
        self.assertEqual(machine.estado_observado(), ('@',) * 12)

    def test_native_clock_trigger_is_inside_the_call_interval(self):
        device = DetectorEnsayo()
        machine = V2Relacional(15, realizacion=device)
        machine.execute()
        before = time.monotonic()
        machine.capture_t0()
        after = time.monotonic()
        self.assertLessEqual(before, machine.instante_medida())
        self.assertLessEqual(machine.instante_medida(), after)

    def test_no_circuit_or_probability_evaluation_at_trigger(self):
        class NoTraversal:
            def __iter__(self):
                raise AssertionError('El disparo no debe recorrer las conexiones')
        device = DetectorEnsayo()
        machine = V2Relacional(15, realizacion=device, reloj=lambda: 5)
        machine.execute()
        machine._nodos = NoTraversal()
        machine._plan_ejecucion = NoTraversal()
        self.assertEqual(machine.capture_t0(), (0,) * 12)

    def test_legacy_measurement_model_is_not_a_trigger_realization(self):
        class CalculationModel:
            def preparar(self, plan):
                pass
            def medir(self, t0):
                raise AssertionError('No debe entrar en el modelo descartado')
        with self.assertRaises(ValueError):
            V2Relacional(15, realizacion=CalculationModel())

    def test_binary_generator_calculation_is_not_primary_v(self):
        with self.assertRaises(ValueError):
            V1Relacional(generadores=[lambda t: 0, lambda t: 1])

    def test_failure_consumes_the_trigger_and_records_its_time(self):
        class BrokenDetector(DetectorEnsayo):
            def disparar(self, t0):
                super().disparar(t0)
                raise OSError('No response')
        device = BrokenDetector()
        machine = V2Relacional(15, realizacion=device, reloj=lambda: 13)
        machine.execute()
        with self.assertRaises(OSError):
            machine.capture_t0()
        with self.assertRaises(RuntimeError):
            machine.capture_t0()
        self.assertEqual(machine.instante_medida(), 13)
        self.assertEqual(device.calls, ['preparar', ('disparar', 13)])

    def test_concurrent_calls_only_trigger_once(self):
        device = DetectorEnsayo()
        machine = V2Relacional(15, realizacion=device, reloj=lambda: 7)
        machine.execute()
        with ThreadPoolExecutor(max_workers=4) as pool:
            outputs = list(pool.map(lambda _: machine.capture_t0(), range(16)))
        self.assertTrue(all(value == (0,) * 12 for value in outputs))
        self.assertEqual(device.calls, ['preparar', ('disparar', 7)])

    def test_runner_reports_registered_t0(self):
        device = DetectorEnsayo()
        machine = V2Relacional(15, realizacion=device, reloj=lambda: 16.25)
        report = ejecutar(machine)
        self.assertEqual(report['t0'], 16.25)
        self.assertTrue(report['resources']['medida_por_disparo'])
        self.assertFalse(report['resources']['evalua_plan_al_medir'])
        self.assertEqual(report['modalidad'], 'REALIZACION_NO_VERIFICADA')


if __name__ == '__main__':
    unittest.main()
