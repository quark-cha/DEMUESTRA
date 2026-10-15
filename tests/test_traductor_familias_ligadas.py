from types import SimpleNamespace
import unittest

from traductor_support import ROOT, load_vendor, normalize_legacy_distance, without_integer_closure, legacy_stability_source


pack = load_vendor("_familias_ligadas")


def infer(formula):
    ast = pack.formal_ast.parse_formula(formula)
    node = SimpleNamespace(declarations=[SimpleNamespace(ast=ast)], claims=[], steps=[])
    return ast, pack.formal_symbols.SymbolInference().infer([node])


class FamiliasLigadasTests(unittest.TestCase):
    def test_bound_index_is_a_family_not_a_fixed_label(self):
        ast, table = infer(r"\sum_{j=0}^{3}a_j")
        self.assertIn("a", table.indexed_families)
        self.assertEqual(table.functions["a"].arguments, ("Nat",))
        self.assertEqual(pack.formal_semantic.SemanticAnalyzer(table).analyze(ast), "Real")
        code = pack.formal_semantic.LeanExpressionEmitter(symbols=table).emit(ast)
        self.assertIn("a (j)", code)
        self.assertNotIn("a_j", code)

    def test_other_index_is_not_captured(self):
        ast, table = infer(r"\sum_{j=0}^{3}a_k")
        self.assertNotIn("a", table.indexed_families)
        self.assertEqual(pack.formal_semantic.SemanticAnalyzer(table).analyze(ast), "Real")

    def test_product_preserves_both_families(self):
        ast, table = infer(r"\sum_{j=0}^{3}a_j b_j")
        self.assertTrue({"a", "b"}.issubset(table.indexed_families))
        code = pack.formal_semantic.LeanExpressionEmitter(symbols=table).emit(ast)
        self.assertIn("a (j)", code)
        self.assertIn("b (j)", code)

    def test_nested_binders_preserve_each_family(self):
        ast, table = infer(r"\sum_{j=0}^{3}\sum_{k=0}^{2}a_j b_k")
        code = pack.formal_semantic.LeanExpressionEmitter(symbols=table).emit(ast)
        self.assertEqual(code.count("Finset.sum"), 2)
        self.assertIn("a (j)", code)
        self.assertIn("b (k)", code)

    def test_kernel_fixture_contains_current_emission(self):
        fixture = (ROOT / "tests/familias_generadas.lean").read_text(encoding="utf-8")
        for formula in (r"\sum_{j=0}^{3}a_j", r"\sum_{j=0}^{3}a_j b_j",
                        r"\sum_{j=0}^{3}\sum_{k=0}^{2}a_j b_k"):
            ast, table = infer(formula)
            code = pack.formal_semantic.LeanExpressionEmitter(symbols=table).emit(ast)
            self.assertIn(code, fixture)

    def test_es46_executable_code_matches_frozen_reference(self):
        old = load_vendor("_familias_antes", ROOT / "documentacion/ES_46_RV6/no_regresion/vendor")
        source = ROOT / "Proyectos/ES_46_RV6/ES_46_RV6.md"
        original = source.read_bytes()
        code = []
        for vendor in (old, pack):
            frontend = object.__new__(vendor.lean.Lean)
            frontend.md = SimpleNamespace(texto=legacy_stability_source(source.read_text(encoding="utf-8-sig")), fichero=source)
            code.append([line for line in frontend._generar().splitlines()
                         if not line.startswith("--")])
        self.assertEqual(without_integer_closure(normalize_legacy_distance(code[0])), without_integer_closure(code[1]))
        self.assertEqual(source.read_bytes(), original)


if __name__ == "__main__":
    unittest.main()
