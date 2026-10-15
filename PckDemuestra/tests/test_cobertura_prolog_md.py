import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
import publica


class CoberturaPrologTests(unittest.TestCase):
    def test_qed_does_not_change_reference_reading_or_coverage(self):
        reports = []
        for marker in ('', 'Q.E.D.\n'):
            with self.subTest(marker=marker), tempfile.TemporaryDirectory(dir=ROOT) as temp:
                project = Path(temp)
                (project / 'ES_99.md').write_text(
                    '# ES_99: Prueba\n\n$D_A$ -- Premisa.\n\n$D_B$ -- Premisa.\n\n'
                    '$T_C$ -- Conclusion.\n\nDeps: D_A\n\n$$\nx=1\n$$\n'
                    + marker + 'Por D_B obtenemos la conclusion.\n', encoding='utf-8',
                )
                with patch.object(publica, '_proyecto_dir', return_value=project):
                    self.assertTrue(publica.evaluar_prolog_md_directo('ES_99'))
                report = json.loads((project / 'PROLOG_MD_DIRECTO_ES_99.json').read_text(encoding='utf-8'))
                node = next(n for n in report['nodes'] if n['id'] == 'T_C')
                self.assertEqual(node['deps'], ['D_A', 'D_B'])
                reports.append(report)
        self.assertEqual(reports[0]['coverage'], reports[1]['coverage'])
        self.assertEqual(reports[0]['verdict'], reports[1]['verdict'])

    def test_proof_evaluation_has_no_qed_metadata(self):
        with tempfile.TemporaryDirectory(dir=ROOT) as temp:
            project = Path(temp)
            source = project / 'ES_99.md'
            source.write_text(
                '# ES_99: Prueba\n\n$D_A$ -- Premisa.\n\n'
                '$T_B$ -- Conclusion.\n\nDeps: D_A\n\n$$\nx=1\n$$\n',
                encoding='utf-8',
            )
            before = source.read_bytes()
            with patch.object(publica, '_proyecto_dir', return_value=project):
                self.assertTrue(publica.evaluar_prolog_md_directo('ES_99'))
            report = json.loads((project / 'PROLOG_MD_DIRECTO_ES_99.json').read_text(encoding='utf-8'))
            self.assertEqual(report['coverage']['certified_nodes'], ['T_B'])
            self.assertEqual(report['coverage']['declared_premises'], ['D_A'])
            self.assertEqual(report['coverage']['total'], 1)
            self.assertEqual(report['goal_conditions_missing'], [])
            self.assertEqual(report['verdict'], 'TEOREMA DERIVADO DESDE PREMISAS DECLARADAS')
            self.assertNotIn('goal_qed_line', report)
            self.assertFalse(report['refuted'])
            self.assertEqual(source.read_bytes(), before)

    def test_qed_does_not_certify_circular_dependencies(self):
        with tempfile.TemporaryDirectory(dir=ROOT) as temp:
            project = Path(temp)
            (project / 'ES_99.md').write_text(
                '# ES_99: Prueba\n\n$D_A$ -- Relacion.\n\nDeps: T_B\n\n'
                '$T_B$ -- Conclusion.\n\nDeps: D_A\n\n$$\nx=1\n$$\nQ.E.D.\n',
                encoding='utf-8',
            )
            with patch.object(publica, '_proyecto_dir', return_value=project):
                self.assertFalse(publica.evaluar_prolog_md_directo('ES_99'))
            report = json.loads((project / 'PROLOG_MD_DIRECTO_ES_99.json').read_text(encoding='utf-8'))
            self.assertEqual(report['coverage']['certified_nodes'], [])
            self.assertEqual(report['coverage']['pending_nodes'], ['D_A', 'T_B'])
            self.assertFalse(report['refuted'])


if __name__ == '__main__':
    unittest.main()
