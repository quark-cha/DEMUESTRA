import sys
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from q1_v1 import FUNCTIONS, Oracle, PhaseOscillator, V1, q1_probabilities, run


class DeutschTests(unittest.TestCase):
    def test_four_functions(self):
        self.assertTrue(run(shots=1000)['passed'])

    def test_readout_blocked_before_t0(self):
        machine = V1(1)
        with self.assertRaises(RuntimeError):
            machine.read()
        machine.execute(Oracle((0,1)))
        with self.assertRaises(RuntimeError):
            machine.read()
        self.assertEqual(machine.capture_t0(), 1)
        self.assertEqual(machine.read(), 1)

    def test_capture_requires_completed_protocol(self):
        with self.assertRaises(RuntimeError):
            V1().capture_t0()

    def test_latch_retains_result(self):
        machine = V1(42)
        machine.execute(Oracle((1,0)))
        self.assertEqual([machine.capture_t0() for _ in range(10)], [1]*10)
        with self.assertRaises(RuntimeError):
            machine.execute(Oracle((0,0)))

    def test_oracle_is_reversible_on_all_inputs(self):
        for table in FUNCTIONS.values():
            oracle = Oracle(table)
            for y in (0,1):
                for x in (0,1):
                    basis = [0.]*4
                    basis[2*y+x] = 1.
                    moved = oracle.route(basis)
                    self.assertEqual(moved[2*(y ^ table[x])+x], 1.)
                    self.assertEqual(oracle.route(moved), basis)

    def test_q1_known_probabilities(self):
        for table in FUNCTIONS.values():
            expected = table[0] ^ table[1]
            self.assertAlmostEqual(q1_probabilities(Oracle(table))[expected], 1., places=12)

    def test_invalid_inputs_rejected(self):
        for table in [(0,), (0,2), (False,1)]:
            with self.assertRaises(ValueError):
                Oracle(table)
        with self.assertRaises(ValueError):
            run(shots=0)

    def test_one_oracle_application(self):
        machine = V1(9)
        machine.execute(Oracle((1,1)))
        machine.capture_t0()
        self.assertEqual(machine.audit_after_t0(), {'oracle_applications':1})

    def test_phase_evolves_deterministically(self):
        oscillator = PhaseOscillator(250_000)
        self.assertEqual(oscillator.capture_phase(0), .25)
        self.assertEqual(oscillator.capture_phase(500_000), .75)
        self.assertEqual(oscillator.capture_phase(1_000_000), .25)

    def test_same_phase_and_time_same_capture(self):
        for table in FUNCTIONS.values():
            outputs = []
            for _ in range(2):
                machine = V1(375_000)
                machine.execute(Oracle(table))
                outputs.append(machine.capture_t0(125_000))
            self.assertEqual(outputs[0], outputs[1])

    def test_latch_does_not_resample_phase(self):
        machine = V1(250_000)
        machine.execute(Oracle((0,1)))
        first = machine.capture_t0(0)
        self.assertEqual(machine.capture_t0(900_000), first)

    def test_no_random_api_in_v1(self):
        source = (Path(__file__).resolve().parents[1] / 'q1_v1.py').read_text()
        self.assertNotIn('import random', source)
        self.assertNotIn('.random()', source)

    def test_invalid_phase_time(self):
        with self.assertRaises(ValueError):
            PhaseOscillator(.5)
        with self.assertRaises(ValueError):
            PhaseOscillator(0).capture_phase(-1)


if __name__ == '__main__':
    unittest.main()
