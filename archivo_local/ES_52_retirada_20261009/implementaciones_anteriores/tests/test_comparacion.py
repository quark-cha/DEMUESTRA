import sys
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import comparar_v_q as model
import numpy as np


class ComparisonTests(unittest.TestCase):
    def test_all_protocols_agree(self):
        for case in model.cases():
            with self.subTest(case=case.name):
                self.assertTrue(model.compare(case)['passed'])

    def test_interference_has_known_probability(self):
        for case in model.cases():
            if case.name.startswith('interference_'):
                index = int(case.name.rsplit('_', 1)[1])
                expected = np.cos((index * 2 * np.pi / 16) / 2) ** 2
                result = model.compare(case)
                for key in ('p_v', 'p_q'):
                    p0 = sum(row[key] for row in result['outcomes'] if row['history'] == ['0'])
                    self.assertAlmostEqual(p0, expected, places=12)

    def test_bell_joint_not_only_marginals(self):
        case = next(c for c in model.cases() if c.name == 'Bell_joint_sequential')
        result = model.compare(case)
        self.assertEqual({tuple(r['history']) for r in result['outcomes']}, {('0','0'), ('1','1')})
        for row in result['outcomes']:
            self.assertAlmostEqual(row['p_v'], .5)
            self.assertAlmostEqual(row['p_q'], .5)
        broken = model.compare(case, model.LostCorrelationV)
        self.assertFalse(broken['passed'])
        self.assertGreater(broken['max_probability_error'], .2)

    def test_missing_phase_detected(self):
        case = next(c for c in model.cases() if c.name == 'interference_08')
        broken = model.compare(case, model.MissingPhaseV)
        self.assertFalse(broken['passed'])
        self.assertGreater(broken['max_probability_error'], .9)

    def test_feed_forward_only_visible_result(self):
        case = next(c for c in model.cases() if c.name == 'visible_feed_forward')
        result = model.compare(case)
        self.assertEqual({tuple(r['history']) for r in result['outcomes']}, {('0','0'), ('1','0')})

    def test_impossible_outcome_has_no_posterior(self):
        prep = [(1., np.array([1,0], dtype=complex))]
        for engine in (model.VReference, model.QReference):
            outcomes = engine.instrument(engine.prepare(prep), model.measurement())
            self.assertEqual(set(outcomes), {'0'})

    def test_invalid_instrument_rejected(self):
        with self.assertRaises(ValueError):
            model.validate_operation('instrument', {'0':[model.I], '1':[model.I]}, 2)

    def test_hidden_branches_not_exposed(self):
        case = next(c for c in model.cases() if c.name == 'instrument_hidden_nu')
        result = model.compare(case)
        self.assertEqual({r['history'][0] for r in result['outcomes']}, {'a','b'})
        self.assertAlmostEqual(sum(r['p_v'] for r in result['outcomes']), 1)


if __name__ == '__main__':
    unittest.main()
