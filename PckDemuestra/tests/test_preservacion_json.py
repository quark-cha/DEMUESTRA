import json
from pathlib import Path
import re
import sys
from types import SimpleNamespace
import unittest

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'vendor' / 'PUBLICAR'))
from PackPublica.json import Json
from PackPublica.adec_contract import validate_artifact
from PackPublica.seleccion_md import es_markdown_demostracion


class ProofPreservationTests(unittest.TestCase):
    def extractor(self):
        return object.__new__(Json)

    def test_no_eight_step_limit(self):
        body = '\n\n'.join(f'Paso {i}: argumento completo.' for i in range(20))
        proof = self.extractor()._proof_from_body(body)
        self.assertEqual(len(proof['steps']), 20)
        self.assertIn('Paso 19:', proof['steps'][-1])
        self.assertEqual(proof['source_text'], body)
        self.assertEqual(proof['status'], 'declared')

    def test_display_math_and_code_are_indivisible(self):
        formula = '$$\na=b\n\nc=d\n$$'
        code = '```python\na = 1\n\nb = 2\n```'
        steps = self.extractor()._proof_steps('Premisa.\n\n' + formula + '\n\n' + code + '\n\nConclusion.')
        self.assertIn(formula, steps)
        self.assertIn(code, steps)
        self.assertEqual(steps[-1], 'Conclusion.')

    def test_conditional_scope_after_step_eight_is_retained(self):
        path = ROOT / 'Proyectos/ES_52/ES_52_Maquina_V_UNIHOLOG.md'
        md = SimpleNamespace(texto=path.read_text(encoding='utf-8'), fichero=path, documento=None)
        data = json.loads(Json(md).contenido)
        node = next(n for n in data['nodes'] if n['id'] == 'P_LECTURAUNIFORME')
        self.assertIn('Proposición condicional', node['proof']['source_text'])
        self.assertTrue(any('Proposición condicional' in s for s in node['proof']['steps']))
        self.assertTrue(any('extremos' in s for s in node['proof']['steps']))

    def test_every_active_project_keeps_nodes_dependencies_and_source_bytes(self):
        paths = [p for folder in ('Proyectos', 'YaEvaluado')
                 for p in (ROOT / folder).rglob('*.md')
                 if not {'historial', 'archivo_local', 'bck'}.intersection(p.parts)
                 and es_markdown_demostracion(p)]
        self.assertTrue(paths)
        for path in paths:
            with self.subTest(source=path.name):
                before = path.read_bytes()
                md = SimpleNamespace(texto=before.decode('utf-8-sig'), fichero=path, documento=None)
                current = json.loads(Json(md).contenido)
                validate_artifact(current)
                for node in current['nodes']:
                    if 'proof' not in node:
                        continue
                    proof = node['proof']
                    self.assertEqual(proof['status'], 'declared')
                    self.assertEqual(proof['source_text'], node['description'])
                    # Ignore whitespace and Markdown separators, not mathematical content.
                    content = lambda text: re.sub(r'\s+', '', re.sub(r'^---\s*$', '', text, flags=re.M))
                    self.assertEqual(content(''.join(proof['steps'])), content(node['description']))
                self.assertEqual(path.read_bytes(), before)
