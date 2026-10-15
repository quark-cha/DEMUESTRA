import unittest
import copy
import json
from pathlib import Path
import subprocess
import tempfile
from unittest.mock import patch

import publica
from publica import _validar_nodos_adec, _normalizar_relaciones_adec


class AdecCompatibilityTests(unittest.TestCase):
    def legacy_graph(self):
        return {"title": "Example", "version": "1.0",
                "passed": False, "verdict": "PENDIENTE", "source_sha256": "historico",
                "nodes": [
                    {"id": "D_PROTOCOLO", "kind": "definition", "name": "Protocolo", "description": "Protocolo", "deps": []},
                    {"id": "D_DESCONOCIDO", "kind": "definition", "name": "Desconocido", "description": "Desconocido", "deps": []},
                    {"id": "D_RELACIONES", "kind": "definition", "name": "Relaciones", "description": "Transformar sin observar", "deps": ["D_PROTOCOLO", "D_DESCONOCIDO"]},
                ]}

    def test_missing_relation_reproduced_and_normalized_without_claiming_proof(self):
        data = self.legacy_graph()
        before = copy.deepcopy(data)
        with self.assertRaisesRegex(ValueError, "D_RELACIONES necesita measurement_relationship"):
            _validar_nodos_adec(data)
        _normalizar_relaciones_adec(data)
        self.assertEqual(data["nodes"][-1]["measurement_relationship"], "unclear")
        self.assertEqual(_validar_nodos_adec(data), 3)
        for field in ("passed", "verdict", "source_sha256"):
            self.assertEqual(data[field], before[field])
        for field in ("description", "deps"):
            self.assertEqual(data["nodes"][-1][field], before["nodes"][-1][field])

    def test_identical_source_supplies_existing_metadata(self):
        data = self.legacy_graph()
        source = copy.deepcopy(data)
        source["nodes"][-1]["measurement_relationship"] = "additive"
        _normalizar_relaciones_adec(data, source)
        self.assertEqual(data["nodes"][-1]["measurement_relationship"], "additive")
        self.assertEqual(data["adec_metadata_repairs"][-1]["origin"], "identical_source_node")

    def test_changed_historic_node_does_not_borrow_new_source_relation(self):
        data = self.legacy_graph()
        source = copy.deepcopy(data)
        source["nodes"][-1].update(description="Otra formulacion", measurement_relationship="additive")
        _normalizar_relaciones_adec(data, source)
        self.assertEqual(data["nodes"][-1]["measurement_relationship"], "unclear")

    def test_explicit_relations_preserved_and_invalid_values_still_rejected(self):
        data = self.legacy_graph()
        data["nodes"][-1]["measurement_relationship"] = "overlapping"
        _normalizar_relaciones_adec(data)
        self.assertEqual(data["nodes"][-1]["measurement_relationship"], "overlapping")
        data["nodes"][-1]["measurement_relationship"] = "INVALIDO"
        _normalizar_relaciones_adec(data)
        with self.assertRaisesRegex(ValueError, "measurement_relationship"):
            _validar_nodos_adec(data)

    def test_normalization_is_idempotent(self):
        data = self.legacy_graph()
        _normalizar_relaciones_adec(data)
        before = copy.deepcopy(data)
        _normalizar_relaciones_adec(data)
        self.assertEqual(data, before)

    def test_initial_json_branch_normalizes_before_validation(self):
        with tempfile.TemporaryDirectory(dir=publica.PROJECT_ROOT) as directory:
            project = Path(directory)
            source = project / 'ES_52_Maquina_V_UNIHOLOG.extracted.json'
            data = self.legacy_graph()
            data['nodes'].append({
                'id': 'T_FINAL', 'kind': 'theorem', 'name': 'Objetivo',
                'description': 'Objetivo declarado', 'deps': ['D_RELACIONES'],
            })
            source.write_text(json.dumps(data), encoding='utf-8')
            original = source.read_bytes()
            result = subprocess.CompletedProcess([], 0,
                'RESULTADO PROLOG JSON: OBJETIVO_ALCANZABLE_DESDE_PREMISAS_DECLARADAS', '')
            with patch.object(publica, '_proyecto_dir', return_value=project), \
                 patch.object(publica.shutil, 'which', return_value='swipl-test'), \
                 patch.object(publica.subprocess, 'run', return_value=result) as run:
                self.assertTrue(publica.evaluar_prolog_json_inicial('ES_52_Maquina_V_UNIHOLOG'))
            run.assert_called_once()
            self.assertIn(str(source), run.call_args.args[0])
            self.assertEqual(source.read_bytes(), original)
            report = json.loads((project / 'PROLOG_JSON_ES_52_Maquina_V_UNIHOLOG.json').read_text(encoding='utf-8'))
            self.assertEqual(report['input_metadata_repairs'][0]['node'], 'D_RELACIONES')
            self.assertEqual(report['input_metadata_repairs'][0]['value'], 'unclear')
            self.assertFalse(report['refuted'])
            self.assertEqual(report['mathematical_status'], 'NO DETERMINADO')
            self.assertEqual(report['branch'], 'INITIAL_JSON_TO_PROLOG')

    def test_requires_nodes(self):
        with self.assertRaisesRegex(ValueError, "atributo nodes"):
            _validar_nodos_adec({})

    def test_accepts_complete_graph(self):
        data = {
            "nodes": [
                {
                    "id": "A",
                    "kind": "foundation",
                    "name": "Base",
                    "description": "Base declarada",
                    "deps": [],
                },
                {
                    "id": "T",
                    "kind": "theorem",
                    "name": "Resultado",
                    "description": "Resultado derivado",
                    "deps": ["A"],
                    "proof": {"status": "verified", "steps": ["A implica T"]},
                },
            ]
        }
        self.assertEqual(2, _validar_nodos_adec(data))

    def test_rejects_missing_dependencies(self):
        data = {
            "nodes": [
                {
                    "id": "T",
                    "kind": "theorem",
                    "name": "Resultado",
                    "description": "Resultado derivado",
                    "deps": ["A_INEXISTENTE"],
                }
            ]
        }
        with self.assertRaisesRegex(ValueError, "dependencias inexistentes"):
            _validar_nodos_adec(data)


if __name__ == "__main__":
    unittest.main()
