from pathlib import Path
import sys
from types import SimpleNamespace
import unittest

from traductor_support import ROOT, load_vendor, normalize_legacy_distance, without_integer_closure, legacy_stability_source

pack = load_vendor("_demuestra_indices_test")
parse = pack.formal_ast.parse_formula
semantic = pack.formal_semantic


def infer(*formulas):
    nodes = [SimpleNamespace(declarations=[SimpleNamespace(ast=parse(formula))],
                             claims=[], steps=[]) for formula in formulas]
    return pack.formal_symbols.SymbolInference().infer(nodes)


class IndicesTests(unittest.TestCase):
    def test_computed_index_is_a_family_application(self):
        table = infer(r"s_0=0", r"s_{j+1}=s_j+p_j", r"s_D=1")
        self.assertIn("s", table.indexed_families)
        emitter = semantic.LeanExpressionEmitter(symbols=table)
        self.assertEqual(emitter.emit(parse(r"s_0")), "s (0)")
        self.assertIn("s (j +", emitter.emit(parse(r"s_{j+1}")))
        self.assertEqual(semantic.SemanticAnalyzer(table).analyze(parse(r"s_{j+1}")), "Real")

    def test_decorated_family_keeps_its_index(self):
        table = infer(r"\mathcal R_j=T_j(\mathcal R_{j-1})")
        self.assertIn("mathcal_R", table.indexed_families)
        emitted = semantic.LeanExpressionEmitter(symbols=table).emit(parse(r"\mathcal R_{j-1}"))
        self.assertIn("mathcal_R (j -", emitted)

    def test_labels_stay_labels(self):
        table = infer(r"P_Q(x)=P_V(x)")
        self.assertFalse(table.indexed_families)

    def test_matching_function_and_index_notation_share_type(self):
        table = infer(r"s(t)=0", r"s_{j+1}=s_j+p_j")
        self.assertIn("s", table.indexed_families)

    def test_incompatible_function_and_family_types_are_reported(self):
        with self.assertRaises(pack.formal_symbols.SymbolInferenceError):
            infer(r"s(x,y)=0", r"s_{j+1}=s_j+p_j")

    def test_multiple_indices_bind_the_whole_product(self):
        node = parse(r"\sum_{a,b\in\{0,1\}}(2a-1)(2b-1)P(a,b)")
        self.assertEqual(node.kind, "summation")
        self.assertEqual(node.children[0].value, "a")
        self.assertEqual(node.children[3].kind, "summation")
        self.assertEqual(node.children[3].children[0].value, "b")
        body = node.children[3].children[3]
        self.assertEqual(body.value, "MUL")
        self.assertEqual(body.children[1].value, "P")
        table = infer(r"\sum_{a,b\in\{0,1\}}(2a-1)(2b-1)P(a,b)")
        self.assertEqual(semantic.SemanticAnalyzer(table).analyze(node), "Real")
        emitted = semantic.LeanExpressionEmitter(symbols=table).emit(node)
        self.assertEqual(emitted.count("Finset.sum"), 2)
        self.assertNotIn("InfiniteSum", emitted)

    def test_nonconsecutive_set_is_not_replaced_with_interval(self):
        node = parse(r"\sum_{a\in\{0,2\}}a")
        table = infer(r"\sum_{a\in\{0,2\}}a")
        emitted = semantic.LeanExpressionEmitter(symbols=table).emit(node)
        self.assertIn("(2 :", emitted)
        self.assertNotIn("Finset.Icc", emitted)

    def test_adjacent_squared_factors_are_a_product_not_a_function(self):
        node = parse(r"(2a-1)^2(2b-1)^2")
        self.assertEqual(node.kind, "binary")
        self.assertEqual(node.value, "MUL")
        self.assertTrue(all(child.kind == "power" for child in node.children))

    def test_duplicate_binder_rejected(self):
        with self.assertRaises(pack.formal_ast.FormalSyntaxError):
            parse(r"\sum_{a,a\in\{0,1\}}a")

    def test_nested_shadowing_restores_outer_scope(self):
        table = infer(r"\sum_{a\in\{0,1\}}a")
        emitter = semantic.LeanExpressionEmitter(symbols=table)
        emitter.bound.add("a")
        emitter.bound_types["a"] = "Complex"
        emitter.emit(parse(r"\sum_{a\in\{0,1\}}a"))
        self.assertIn("a", emitter.bound)
        self.assertEqual(emitter.bound_types["a"], "Complex")

    def test_domain_is_evaluated_before_binding_its_index(self):
        table = infer(r"\sum_{a\in\{a,1\}}a")
        emitter = semantic.LeanExpressionEmitter(symbols=table,
                                                 resolver=lambda name, arity=None: "ctx." + name)
        emitted = emitter.emit(parse(r"\sum_{a\in\{a,1\}}a"))
        self.assertIn("ctx.a", emitted.split("fun a")[0])
        self.assertNotIn("ctx.a", emitted.split("fun a")[1])

    def test_es46_executable_code_unchanged(self):
        backup = ROOT / "documentacion/ES_52/respaldos/traductor_indices_20261008"
        old = load_vendor("_demuestra_antes_indices", backup)
        source = ROOT / "Proyectos/ES_46_RV6/ES_46_RV6.md"
        original = source.read_bytes()
        results = []
        for vendor in (old, pack):
            frontend = object.__new__(vendor.lean.Lean)
            frontend.md = SimpleNamespace(texto=legacy_stability_source(source.read_text(encoding="utf-8-sig")), fichero=source)
            results.append([line for line in frontend._generar().splitlines()
                            if not line.startswith("--")])
        self.assertEqual(without_integer_closure(normalize_legacy_distance(results[0])), without_integer_closure(results[1]))
        self.assertEqual(source.read_bytes(), original)

    def test_actual_es52_correlation_sums_are_typed_without_changing_source(self):
        source = ROOT / "Proyectos/ES_52/ES_52_Maquina_V_UNIHOLOG.md"
        original = source.read_bytes()
        frontend = object.__new__(pack.lean.Lean)
        frontend.md = SimpleNamespace(texto=source.read_text(encoding="utf-8-sig"), fichero=source)
        graph, classified = frontend._frontend()
        table = pack.formal_symbols.SymbolInference().infer(classified)
        checked = 0
        for node in classified:
            for formula in node.source.formulas:
                if "sum_{a,b" not in formula.source:
                    continue
                self.assertEqual(semantic.SemanticAnalyzer(table).analyze(formula.ast), "Prop")
                emitted = semantic.LeanExpressionEmitter(symbols=table).emit(formula.ast)
                self.assertEqual(emitted.count("Finset.sum"), 2)
                self.assertIn("P", emitted)
                checked += 1
        self.assertEqual(checked, 2)
        self.assertEqual(source.read_bytes(), original)


def write_kernel_fixture(destination):
    expressions = []
    for formula in (r"\sum_{a,b\in\{0,1\}}(2a-1)(2b-1)",
                    r"\sum_{a,b\in\{0,1\}}(2a-1)^2(2b-1)^2",
                    r"\sum_{a\in\{0,2\}}a"):
        table = infer(formula)
        expressions.append(semantic.LeanExpressionEmitter(symbols=table).emit(parse(formula)))
    table = infer(r"s_{j+1}=s_j+p_j")
    index = semantic.LeanExpressionEmitter(symbols=table).emit(parse(r"s_{j+1}"))
    text = "import Mathlib\nnoncomputable section\n"
    for expression, result in zip(expressions, (0, 4, 2)):
        text += f"example : ({expression}) = ({result} : Real) := by norm_num [Finset.sum_insert, Finset.sum_singleton]\n"
    text += f"example (s : Real -> Real) (j : Real) : ({index}) = s (j + 1) := by rfl\n"
    formula = r"\sum_{a,b\in\{0,1\}}(2a-1)(2b-1)P(a,b,x,y)"
    table = infer(formula)
    expression = semantic.LeanExpressionEmitter(symbols=table).emit(parse(formula))
    text += ("example (P : Real -> Real -> Real -> Real -> Real) (x y : Real) : "
             f"({expression}) = P 0 0 x y - P 0 1 x y - P 1 0 x y + P 1 1 x y := by\n"
             "  simp [Finset.sum_insert, Finset.sum_singleton]\n  <;> ring\n")
    Path(destination).write_text(text, encoding="utf-8")


if __name__ == "__main__":
    if len(sys.argv) == 3 and sys.argv[1] == "--emit-lean":
        write_kernel_fixture(sys.argv[2])
    else:
        unittest.main()
