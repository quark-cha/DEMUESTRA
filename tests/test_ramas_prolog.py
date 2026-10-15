import ast
import contextlib
from datetime import datetime, timezone
import hashlib
import io
import json
from pathlib import Path
import re
import shutil
from types import SimpleNamespace
import tempfile
import unittest

SOURCE = Path(__file__).resolve().parents[1] / "publica.py"


class RamasPrologTests(unittest.TestCase):
    def run_branch(self, state, code, graph_code=0):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            project = root / "Proyecto"
            project.mkdir()
            (project / "Proyecto.pl").write_text("programa", encoding="utf-8")
            (project / "Proyecto.lean").write_text("entrada lean", encoding="utf-8")
            (root / "PckDemuestra").mkdir()
            (root / "PckDemuestra/audita_lean.pl").write_text("auditor", encoding="utf-8")
            def run(command, **kwargs):
                is_audit = "--skip-lean" in command
                return SimpleNamespace(returncode=code if is_audit else graph_code,
                    stdout=f"RESULTADO AUDITOR LEAN: {state}\n" if is_audit else
                           "RESULTADO PROLOG: ARBOL COMPLETO\n", stderr="")
            tree = ast.parse(SOURCE.read_text(encoding="utf-8"))
            names = {"evaluar_prolog_proyecto", "guardar_resultado_prolog_desde_lean"}
            body = [node for node in tree.body if isinstance(node, ast.FunctionDef) and node.name in names]
            ns = {"PROJECT_ROOT": root, "Path": Path, "json": json, "re": re,
                  "datetime": datetime, "timezone": timezone,
                  "shutil": SimpleNamespace(which=lambda _: "swipl", copy2=shutil.copy2),
                  "subprocess": SimpleNamespace(run=run), "_proyecto_dir": lambda _: project,
                  "_sha256_archivo": lambda path: hashlib.sha256(path.read_bytes()).hexdigest(),
                  "_adec_compatibilizar": lambda *args: None,
                  "_objetivo_formal_desde_nodos": lambda _: None,
                  "_trazas_enlaces_prolog": lambda *args: [],
                  "_trazas_prolog_markdown": lambda *args: ""}
            exec(compile(ast.Module(body=body, type_ignores=[]), str(SOURCE), "exec"), ns)
            with contextlib.redirect_stdout(io.StringIO()):
                passed = ns["evaluar_prolog_proyecto"]("Proyecto")
            graph = json.loads((project / "PROLOG_Proyecto.json").read_text(encoding="utf-8"))
            lean = json.loads((project / "PROLOG_DESDE_LEAN_Proyecto.json").read_text(encoding="utf-8"))
            self.assertNotIn("RESULTADO AUDITOR LEAN", (project / "PROLOG_Proyecto.log").read_text())
            self.assertEqual(lean["verdict"], state)
            self.assertFalse(lean["goal_reachability_verified"])
            self.assertFalse(lean["kernel_executed"])
            self.assertFalse(graph["lean_route_audit_affects_verdict"])
            return passed, graph

    def test_incomplete_lean_audit_does_not_degrade_md_graph(self):
        passed, graph = self.run_branch("INCOMPLETO", 1)
        self.assertTrue(passed)
        self.assertEqual(graph["verdict"], "ARBOL COMPLETO")

    def test_auditor_error_is_isolated(self):
        self.assertTrue(self.run_branch("ERROR_PROPIO_DEL_AUDITOR", 40)[0])

    def test_unknown_lean_result_is_isolated(self):
        self.assertTrue(self.run_branch("ESTADO_DESCONOCIDO", 2)[0])

    def test_structural_lean_success_does_not_upgrade_failed_md_graph(self):
        self.assertFalse(self.run_branch("CERTIFICADO_ESTRUCTURAL", 0, graph_code=1)[0])


if __name__ == "__main__":
    unittest.main()
