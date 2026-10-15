import sys
from pathlib import Path
import unittest

import numpy as np

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from q2_v2 import ResourceLimit, V2, compare, factors_from_readout, q2_distribution, resources


class FactoringTests(unittest.TestCase):
    def test_reference_and_v2_distributions(self):
        for n, a in ((15, 2), (15, 7), (21, 2)):
            with self.subTest(n=n, a=a):
                machine = V2(n, a, phase_ticks=190000)
                machine.execute()
                machine.capture_t0(0)
                np.testing.assert_allclose(machine.audit_after_t0(), q2_distribution(n,a),
                                           atol=1e-10, rtol=0)

    def test_known_order_four_readout_peaks(self):
        probs = q2_distribution(15, 2)
        for index in (0, 64, 128, 192):
            self.assertAlmostEqual(probs[index], .25, places=10)

    def test_factor_extraction_does_not_use_supplied_factors(self):
        self.assertEqual(factors_from_readout(15,2,64,256)['factors'], [3,5])
        self.assertEqual(factors_from_readout(21,2,171,1024)['factors'], [3,7])
        self.assertIsNone(factors_from_readout(15,2,0,256))

    def test_capture_and_access(self):
        machine = V2(15,phase_ticks=190000)
        with self.assertRaises(RuntimeError):
            machine.read()
        with self.assertRaises(RuntimeError):
            machine.capture_t0()
        machine.execute()
        with self.assertRaises(RuntimeError):
            machine.audit_after_t0()
        first = machine.capture_t0(0)
        self.assertEqual(machine.capture_t0(500000), first)
        with self.assertRaises(RuntimeError):
            machine.execute()

    def test_resource_limit_before_allocation(self):
        self.assertEqual(resources(1 << 2047)['register_bits'], 6144)
        for function in (V2, q2_distribution):
            with self.assertRaises(ResourceLimit):
                function(1 << 2047, 3)

    def test_invalid_base(self):
        with self.assertRaises(ValueError):
            V2(15,3)

    def test_small_factoring_pipeline(self):
        self.assertTrue(compare(15,repeats=1)['passed'])
        self.assertTrue(compare(21,repeats=1)['passed'])


if __name__ == '__main__':
    unittest.main()
