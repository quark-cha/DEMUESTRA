import ast
import re
from pathlib import Path
import unittest

SOURCE = Path(__file__).resolve().parents[1] / "publica.py"


class ClasificacionLeanTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        tree = ast.parse(SOURCE.read_text(encoding="utf-8"))
        function = next(node for node in tree.body if isinstance(node, ast.FunctionDef)
                        and node.name == "_clasificacion_evaluacion_lean")
        namespace = {}
        exec(compile(ast.Module(body=[function], type_ignores=[]), str(SOURCE), "exec"), namespace)
        cls.classify = staticmethod(namespace[function.name])
        diagnostic = next(node for node in tree.body if isinstance(node, ast.FunctionDef)
                          and node.name == "_clasificar_fallos_lean_por_nodo")
        namespace["re"] = re
        exec(compile(ast.Module(body=[diagnostic], type_ignores=[]), str(SOURCE), "exec"), namespace)
        cls.diagnose = staticmethod(namespace[diagnostic.name])

    def test_approved_certificate_remains_positive(self):
        self.assertEqual(self.classify({"passed": True})["category"], "certified")

    def test_successful_compile_is_not_a_tool_error(self):
        result = self.classify({"passed": False, "compiled": True, "exit_code": 0})
        self.assertEqual(result["category"], "inconclusive")
        self.assertEqual(result["state"], "CERTIFICACION_GLOBAL_PENDIENTE")

    def test_successful_execution_does_not_lose_its_scope(self):
        self.assertEqual(self.classify({"passed": False, "execution_passed": True})["category"], "inconclusive")

    def test_actual_tool_failure_remains_separate(self):
        self.assertEqual(self.classify({"passed": False, "exit_code": 127, "failure_type": "entorno"})["category"], "tool_error")

    def test_missing_report_is_not_invented_failure_or_approval(self):
        self.assertEqual(self.classify({})["state"], "SIN_EVALUACION_CONCLUYENTE")

    def test_diagnostic_is_preserved(self):
        self.assertEqual(self.classify({"compiled": True, "diagnosis": "Prueba condicional"})["detail"], "Prueba condicional")

    def test_open_goal_does_not_refute_or_disqualify_source(self):
        result = self.diagnose("-- FORMAL_NODE: P\nexample : True := by\n", "x.lean:2:1: error: unsolved goals", ["P"])[0]
        self.assertEqual(result["state"], "VERIFICACION_FORMAL_PENDIENTE")
        self.assertFalse(result["source_refuted"])
        self.assertEqual(result["scope"], "FORMALIZED_REPRESENTATION_ONLY")

    def test_type_error_does_not_refute_source(self):
        result = self.diagnose("-- FORMAL_NODE: P\nexample : True := by\n", "x.lean:2:1: error: type mismatch", ["P"])[0]
        self.assertEqual(result["state"], "ERROR_EVALUADOR")
        self.assertFalse(result["source_refuted"])


if __name__ == "__main__":
    unittest.main()
