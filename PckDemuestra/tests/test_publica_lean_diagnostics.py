import unittest

from publica import _clasificar_fallos_lean_por_nodo


class LeanNodeDiagnosticsTests(unittest.TestCase):
    def test_separates_tool_errors_from_unclosed_goals(self):
        source = """-- FORMAL_NODE: A
theorem derive_A : True := by
  trivial
-- FORMAL_NODE: B
theorem derive_B : True := by
  trivial
"""
        log = """candidate.lean:2:1: error: unsolved goals
candidate.lean:5:1: error: Tactic `simp` failed with a nested error:
maximum recursion depth has been reached
"""
        diagnostics = _clasificar_fallos_lean_por_nodo(
            source, log, ["A", "B"]
        )
        self.assertEqual("VERIFICACION_FORMAL_PENDIENTE", diagnostics[0]["state"])
        self.assertFalse(diagnostics[0]["source_refuted"])
        self.assertEqual("ERROR_EVALUADOR", diagnostics[1]["state"])
        self.assertFalse(diagnostics[1]["source_refuted"])


if __name__ == "__main__":
    unittest.main()
