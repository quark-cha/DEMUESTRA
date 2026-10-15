from pathlib import Path
import sys
from types import SimpleNamespace
import unittest

from traductor_support import ROOT, load_vendor, normalize_legacy_distance, without_integer_closure, legacy_stability_source

pack = load_vendor("_demuestra_tipos_test")
parse = pack.formal_ast.parse_formula
semantic = pack.formal_semantic


def infer(*formulas):
    nodes = [SimpleNamespace(declarations=[SimpleNamespace(ast=parse(formula))], claims=[], steps=[])
             for formula in formulas]
    return pack.formal_symbols.SymbolInference().infer(nodes)


class TiposTests(unittest.TestCase):
    def test_mapping_result_membership_does_not_make_function_a_predicate(self):
        table = infer(r"Q:\xi\mapsto b\in\{0,1\}", r"K(Q(t))=\xi")
        self.assertNotEqual(table.functions["Q"].result, "Prop")
        self.assertEqual(semantic.SemanticAnalyzer(table).analyze(parse(r"K(Q(t))=\xi")), "Prop")

    def test_explicit_assignment_shadows_only_bare_domain_alias(self):
        table = infer(r"C=B", r"D=1-C", r"z\in\mathbb{C}")
        self.assertNotIn("C", table.domains)
        self.assertEqual(table.values["C"], "Real")
        self.assertEqual(table.values["D"], "Real")
        self.assertEqual(table.values["z"], "Complex")
        self.assertEqual(parse(r"\mathbb{C}").value, "Complex")

    def test_numeric_widening_is_directional(self):
        table = semantic.SemanticAnalyzer.default_symbols()
        table.functions["f"] = semantic.FunctionType(("Complex",), "Real")
        for kind in ("Nat", "Int", "Real", "Complex"):
            table.values["x"] = kind
            self.assertEqual(semantic.SemanticAnalyzer(table).analyze(parse("f(x)")), "Real")
        table.functions["f"] = semantic.FunctionType(("Real",), "Real")
        with self.assertRaises(semantic.FormalSemanticError):
            semantic.SemanticAnalyzer(table).analyze(parse("f(x)"))
        table.values["x"] = "Prop"
        with self.assertRaises(semantic.FormalSemanticError):
            semantic.SemanticAnalyzer(table).analyze(parse("f(x)"))

    def test_scalar_norm_is_native_and_real_valued(self):
        for kind in ("Nat", "Int", "Real", "Complex"):
            table = infer(r"\operatorname{norm}(x)")
            table.values["x"] = kind
            node = parse(r"\operatorname{norm}(x)")
            self.assertEqual(semantic.SemanticAnalyzer(table).analyze(node), "Real")
            emitted = semantic.LeanExpressionEmitter(symbols=table).emit(node)
            self.assertTrue(emitted.startswith("norm ("))
            self.assertNotIn("ctx.norm", emitted)

    def test_norm_does_not_accept_propositions_as_numbers(self):
        table = infer(r"\operatorname{norm}(x)")
        table.values["x"] = "Prop"
        with self.assertRaises(semantic.FormalSemanticError):
            semantic.SemanticAnalyzer(table).analyze(parse(r"\operatorname{norm}(x)"))

    def test_exponential_factor_before_parentheses_is_a_product(self):
        node = parse(r"e^{i\phi_A}(1+e^{i\phi})")
        self.assertEqual(node.kind, "binary")
        self.assertEqual(node.value, "MUL")
        self.assertEqual(node.children[0].kind, "power")

    def test_inverse_and_trigonometric_calls_are_preserved(self):
        self.assertEqual(parse(r"f^{-1}(x)").kind, "apply")
        node = parse(r"\cos^2(x)")
        self.assertEqual(node.kind, "power")
        self.assertEqual(node.children[0].kind, "apply")

    def test_es46_executable_code_unchanged_by_type_fixes(self):
        old = load_vendor("_demuestra_antes_tipos",
                          ROOT / "documentacion/ES_52/respaldos/traductor_tipos_20261008")
        source = ROOT / "Proyectos/ES_46_RV6/ES_46_RV6.md"
        before = source.read_bytes()
        results = []
        for vendor in (old, pack):
            frontend = object.__new__(vendor.lean.Lean)
            frontend.md = SimpleNamespace(texto=legacy_stability_source(source.read_text(encoding="utf-8-sig")), fichero=source)
            results.append([line for line in frontend._generar().splitlines()
                            if not line.startswith("--")])
        self.assertEqual(without_integer_closure(normalize_legacy_distance(results[0])), without_integer_closure(results[1]))
        self.assertEqual(source.read_bytes(), before)


def write_kernel_fixture(destination):
    text = "import Mathlib\n"
    for kind in ("Nat", "Int", "Real", "Complex"):
        table = infer(r"\operatorname{norm}(x)")
        table.values["x"] = kind
        emitted = semantic.LeanExpressionEmitter(symbols=table).emit(parse(r"\operatorname{norm}(x)"))
        reference = "norm (x : Real)" if kind in {"Nat", "Int"} else "norm x"
        text += f"example (x : {kind}) : ({emitted}) = {reference} := by rfl\n"
    table = semantic.SemanticAnalyzer.default_symbols()
    table.functions["f"] = semantic.FunctionType(("Complex",), "Real")
    emitted = semantic.LeanExpressionEmitter(symbols=table).emit(parse("f(0)"))
    text += f"example (f : Complex -> Real) : ({emitted}) = f (0 : Complex) := by rfl\n"
    Path(destination).write_text(text, encoding="utf-8")


if __name__ == "__main__":
    if len(sys.argv) == 3 and sys.argv[1] == "--emit-lean":
        write_kernel_fixture(sys.argv[2])
    else:
        unittest.main()
