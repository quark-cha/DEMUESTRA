import json
from pathlib import Path
import sys
from types import SimpleNamespace
import unittest

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'vendor' / 'PUBLICAR'))
from PackPublica.json import Json
from PackPublica.adec_contract import validate_artifact


class Es52OwnMachineTests(unittest.TestCase):
    def test_source_and_graph_do_not_reintroduce_withdrawn_model(self):
        path = ROOT / 'Proyectos/ES_52/ES_52_Maquina_V_UNIHOLOG.md'
        text = path.read_text(encoding='utf-8')
        self.assertNotIn('V_ref', text)
        data = json.loads(Json(SimpleNamespace(texto=text, fichero=path, documento=None)).contenido)
        validate_artifact(data)
        ids = {node['id'] for node in data['nodes']}
        removed = {'D_GENERADORCONJUNTO', 'D_REGISTROREF', 'D_CONEXIONREF',
                   'P_CIERRECONJUNTO', 'T_COMPOSICIONCOND'}
        self.assertFalse(ids & removed)
        self.assertTrue({'D_RELACIONES', 'D_REGISTROBINARIO', 'D_OBJETIVORELACIONAL'} <= ids)
        for node in data['nodes']:
            self.assertFalse(set(node['deps']) & removed)
        self.assertIn('Las tres máquinas V son deterministas', text)
        self.assertIn('disparar(t0)', text)

    def test_active_resource_catalog_does_not_publish_withdrawn_results(self):
        root = ROOT / 'Proyectos/ES_52'
        for name in ('publicacion_adjuntos.txt', 'ES_52_Indice_recursos.md'):
            self.assertNotIn('COMPARACION_V_REF_Q', (root / name).read_text(encoding='utf-8'))
