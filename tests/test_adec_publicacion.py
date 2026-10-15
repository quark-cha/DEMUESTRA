import ast
import json
from pathlib import Path
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[1]


class AdecPublicacionTests(unittest.TestCase):
    def namespace(self, folder):
        source = ROOT / "publica.py"
        names = {"_validar_nodos_adec", "_adec_compatibilizar",
                 "_objetivo_formal_desde_nodos", "normalizar_informes_adec_proyecto",
                 "publicar_adjuntos_proyecto"}
        tree = ast.parse(source.read_text(encoding="utf-8"))
        body = [node for node in tree.body if isinstance(node, ast.FunctionDef)
                and node.name in names]
        ns = {"json": json, "PROJECT_ROOT": folder,
              "_proyecto_dir": lambda name: folder / "Proyectos" / name}
        exec(compile(ast.Module(body=body, type_ignores=[]), str(source), "exec"), ns)
        return ns

    def test_translation_failure_has_current_nodes_without_certification(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            folder = root / "Proyectos" / "Proyecto"
            folder.mkdir(parents=True)
            graph = {"nodes": [{"id": "actual", "kind": "definition",
                     "name": "Fuente actual", "description": "Definicion", "deps": []}]}
            (folder / "Proyecto.extracted.json").write_text(json.dumps(graph), encoding="utf-8")
            report = {"status": "ERROR_HERRAMIENTA_TRADUCCION_LEAN",
                      "source_sha256": "hash-actual", "document_verdict": "NO_EMITIDO",
                      "formal_certification": "PENDIENTE"}
            path = folder / "TRADUCCION_Proyecto.json"
            path.write_text(json.dumps(report), encoding="utf-8")
            ns = self.namespace(root)
            for _ in range(2):
                ns["normalizar_informes_adec_proyecto"]("Proyecto")
            result = json.loads(path.read_text(encoding="utf-8"))
            for key, value in report.items():
                self.assertEqual(result[key], value)
            self.assertEqual(len(result["nodes"]), 2)
            self.assertEqual(result["nodes"][0], graph["nodes"][0])
            self.assertEqual(result["nodes"][1]["proof"]["status"], "unverified")
            self.assertTrue(result["adec_compatible"])

    def test_attachment_manifest_validated_before_any_upload(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            folder = root / "Proyectos" / "Proyecto"
            folder.mkdir(parents=True)
            (root / "comparacion").mkdir()
            (root / "comparacion" / "q.py").write_text("pass\n", encoding="utf-8")
            manifest = folder / "publicacion_adjuntos.txt"
            uploaded = []
            class Ftp:
                def upload(self, path, remote):
                    uploaded.append((path, remote))
            ns = self.namespace(root)
            manifest.write_text("comparacion/q.py\n../secreto.txt\n", encoding="utf-8")
            with self.assertRaises(ValueError):
                ns["publicar_adjuntos_proyecto"](Ftp(), "Proyecto")
            self.assertEqual(uploaded, [])
            manifest.write_text("comparacion/q.py\n", encoding="utf-8")
            ns["publicar_adjuntos_proyecto"](Ftp(), "Proyecto")
            self.assertEqual(uploaded[0][1], "/estradad.es/teorias/pdf/DEMUESTRA/comparacion/q.py")


if __name__ == "__main__":
    unittest.main()
