import sys
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from protocolo_q3 import circuit_hash, make_circuit
from comparar_q3_v3 import compare_external, local_compare
from v3 import V3
import q3


class SamplingTests(unittest.TestCase):
    def test_independent_distributions(self):
        for n in (2,4,8):
            for seed in (1,23):
                self.assertTrue(local_compare(make_circuit(n,4,seed))['passed'])

    def test_readout_block_and_retention(self):
        machine = V3(make_circuit(4), 250000)
        with self.assertRaises(RuntimeError):
            machine.capture_t0()
        machine.execute()
        with self.assertRaises(RuntimeError):
            machine.probabilities_after_t0()
        first = machine.capture_t0(0)
        self.assertEqual(machine.capture_t0(750000), first)
        with self.assertRaises(RuntimeError):
            machine.execute()

    def test_same_resource_guard_in_both_models(self):
        spec = make_circuit(105,1)
        for constructor in (V3, q3.probabilities):
            with self.assertRaisesRegex(ValueError, 'RESOURCE_LIMIT'):
                constructor(spec)

    def test_uniform_control_is_not_equivalent(self):
        row = local_compare(make_circuit(4,4,seed=1))
        self.assertGreater(row['uniform_control_distance'], .1)

    def test_seed_describes_design_not_runtime_randomness(self):
        self.assertEqual(circuit_hash(make_circuit(4,seed=1)), circuit_hash(make_circuit(4,seed=1)))
        self.assertNotEqual(circuit_hash(make_circuit(4,seed=1)), circuit_hash(make_circuit(4,seed=2)))

    def test_import_does_not_certify_advantage(self):
        spec = make_circuit(2)
        data = {'circuit_sha256': circuit_hash(spec), 'shots': 10, 'elapsed_seconds': 1,
                'backend': 'test_fixture', 'bit_order': 'q0_lsb', 'counts': {'00':10}}
        result = compare_external(spec,data,data)
        self.assertEqual(result['empirical_histogram_distance'], 0)
        self.assertFalse(result['quality_verified'])
        self.assertFalse(result['quantum_advantage_verified'])
        broken = dict(data, circuit_sha256='incorrect')
        with self.assertRaises(ValueError):
            compare_external(spec,data,broken)
        with self.assertRaises(ValueError):
            compare_external(spec,data,dict(data,elapsed_seconds=0))


if __name__ == '__main__':
    unittest.main()
