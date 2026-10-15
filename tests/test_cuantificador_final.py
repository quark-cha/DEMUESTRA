from types import SimpleNamespace
import unittest

from traductor_support import load_vendor


pack = load_vendor("_demuestra_cuantificador_final_test")
parse = pack.formal_ast.parse_formula


class CuantificadorFinalTests(unittest.TestCase):
    def test_trailing_universal_requests_reordering_without_refuting_source(self):
        for formula in (
            r"x=x\qquad\forall x\in\mathbb R",
            r"x=x,\forall x\in\mathbb R",
            r"\boxed{x=x\qquad\forall x\in\mathbb R.}",
            r"\boxed{x=x,\forall x\in\mathbb R.}",
            r"x=x\qquad\forall x",
            r"\boxed{\Re[s_{Z,\pm}(k)]=\frac12\qquad\forall k\in\mathbb N^+.}",
        ):
            with self.subTest(formula=formula):
                with self.assertRaises(pack.formal_ast.FormalSyntaxError) as captured:
                    parse(formula, "documento.md:42:P_TEST:formula-1")
                message = str(captured.exception)
                self.assertIn("CUANTIFICADOR_UNIVERSAL_AL_FINAL", message)
                self.assertIn("documento.md:42:P_TEST:formula-1", message)
                self.assertIn("al principio", message)
                self.assertIn("dominio y alcance", message)
                self.assertIn("el orden no cambia", message)
                self.assertIn("limitacion del traductor, no una refutacion", message)
                self.assertIn("No se ha modificado", message)
                self.assertIn(formula, message)

    def test_prefix_universal_still_parses(self):
        for formula in (r"\forall x\in\mathbb R,x=x", r"\boxed{\forall k\in\mathbb N^+,\Re[s_{Z,\pm}(k)]=\frac12.}"):
            with self.subTest(formula=formula):
                self.assertEqual(parse(formula).kind, "quantifier")

    def test_nested_prefix_universal_is_not_flagged_as_trailing(self):
        node = parse(r"\forall x\in\mathbb R,\forall y\in\mathbb R,x=y")
        self.assertEqual(node.kind, "quantifier")
        self.assertEqual(node.children[-1].kind, "quantifier")

    def test_quantifier_with_its_own_body_is_not_misdiagnosed(self):
        with self.assertRaises(pack.formal_ast.FormalSyntaxError) as captured:
            parse(r"x=x\qquad\forall y\in\mathbb R,y=y")
        self.assertNotIn("CUANTIFICADOR_UNIVERSAL_AL_FINAL", str(captured.exception))

    def test_shared_compiler_preserves_actionable_message(self):
        formula = r"x=x\qquad\forall x\in\mathbb R"
        node = {"id": "P_TEST", "kind": "proposition", "formal_source": {
            "formulas": [formula], "source": {"file": "documento.md", "start_line": 42},
        }}
        graph = SimpleNamespace(ordered_nodes=lambda: [node])
        with self.assertRaises(pack.formal_compile.FormalCompilationError) as captured:
            pack.formal_compile.FormalGraphCompiler(graph).parse()
        self.assertIn("CUANTIFICADOR_UNIVERSAL_AL_FINAL", str(captured.exception))
        self.assertIn("documento.md:42:P_TEST:formula-1", str(captured.exception))


if __name__ == "__main__":
    unittest.main()
