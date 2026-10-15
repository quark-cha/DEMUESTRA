from pathlib import Path
import difflib
import sys
from types import SimpleNamespace
import unittest

from traductor_support import ROOT, load_vendor, normalize_legacy_distance, without_integer_closure, legacy_stability_source

pack = load_vendor("_demuestra_actual_test")
parse = pack.formal_ast.parse_formula
semantic = pack.formal_semantic


class OperadoresTests(unittest.TestCase):
    def test_real_and_imaginary_spellings_keep_same_ast(self):
        for name in ("Re", "Im"):
            expected = parse("\\" + name + "(z)")
            for formula in ("\\" + name + " z", r"\operatorname{" + name + "}(z)",
                            r"\operatorname{" + name + "}z"):
                self.assertEqual(parse(formula), expected)

    def test_argument_indices_are_not_lost(self):
        for name in ("Re", "Im"):
            actual = parse("\\" + name + " z_j")
            self.assertEqual(actual.kind, "call")
            self.assertEqual(actual.children[0].kind, "subscript")

    def test_explicit_power_is_outside_operator(self):
        actual = parse(r"\operatorname{Re}(z)^2")
        self.assertEqual(actual.kind, "power")
        self.assertEqual(actual.children[0].value, "Re")

    def test_builtin_emits_actual_complex_operation(self):
        symbols = semantic.SemanticAnalyzer.default_symbols()
        symbols.values["z"] = "Complex"
        emitter = semantic.LeanExpressionEmitter(symbols=symbols)
        for name in ("Re", "Im"):
            actual = parse(r"\operatorname{" + name + "}(z)")
            self.assertEqual(semantic.SemanticAnalyzer(symbols).analyze(actual), "Real")
            self.assertIn("Complex." + name.lower(), emitter.emit(actual))
            applied = pack.formal_ast.Ast("apply", None,
                                        (pack.formal_ast.Ast("identifier", name), actual.children[0]))
            self.assertEqual(emitter.emit(actual), emitter.emit(applied))

    def test_finite_sum_keeps_upper_bound(self):
        emitter = semantic.LeanExpressionEmitter(symbols=semantic.SemanticAnalyzer.default_symbols())
        first = emitter.emit(parse(r"\sum_{n=1}^{2}n"))
        second = emitter.emit(parse(r"\sum_{n=1}^{3}n"))
        self.assertIn("Finset.Icc", first)
        self.assertIn("(2 :", first)
        self.assertIn("(3 :", second)
        self.assertNotEqual(first, second)
        self.assertNotIn("InfiniteSum", first)

    def test_finite_sum_requires_typed_bounds(self):
        symbols = semantic.SemanticAnalyzer.default_symbols()
        symbols.values["u"] = "Real"
        with self.assertRaises(semantic.FormalSemanticError):
            semantic.LeanExpressionEmitter(symbols=symbols).emit(parse(r"\sum_{n=1}^{u}n"))

    def test_infinite_sum_keeps_existing_contract(self):
        emitter = semantic.LeanExpressionEmitter(symbols=semantic.SemanticAnalyzer.default_symbols())
        self.assertIn("InfiniteSum", emitter.emit(parse(r"\sum_{n=1}^{\infty}n")))

    def test_es46_frontend_does_not_lose_verified_markers(self):
        backups = sorted((ROOT / "documentacion" / "ES_52" / "respaldos").glob("traductor_operadores_*"))
        old = load_vendor("_demuestra_anterior_test", backups[-1])
        source = ROOT / "Proyectos" / "ES_46_RV6" / "ES_46_RV6.md"
        before = source.read_bytes()
        md = SimpleNamespace(texto=legacy_stability_source(source.read_text(encoding="utf-8-sig")), fichero=source)
        results = []
        for vendor in (old, pack):
            frontend = object.__new__(vendor.lean.Lean)
            frontend.md = md
            results.append(frontend._generar())
        markers = lambda result: sorted(line for line in result.splitlines()
                                        if line.startswith("-- DEMUESTRA_ASSERTION:"))
        self.assertEqual(markers(results[0]), markers(results[1]))
        self.assertTrue(markers(results[1]))
        code = lambda result: [line for line in result.splitlines()
                               if not line.startswith("--")]
        difference = list(difflib.unified_diff(without_integer_closure(normalize_legacy_distance(code(results[0]))), without_integer_closure(code(results[1]))))
        self.assertFalse(difference, "\n".join(difference[:80]))
        self.assertEqual(source.read_bytes(), before)


def write_kernel_fixture(destination):
    symbols = semantic.SemanticAnalyzer.default_symbols()
    symbols.values["z"] = "Complex"
    emitter = semantic.LeanExpressionEmitter(symbols=symbols)
    real = emitter.emit(parse(r"\operatorname{Re}(z)"))
    imag = emitter.emit(parse(r"\operatorname{Im}(z)"))
    first = emitter.emit(parse(r"\sum_{n=1}^{2}n"))
    second = emitter.emit(parse(r"\sum_{n=1}^{3}n"))
    Path(destination).write_text(
        "import Mathlib\n"
        f"example (z : Complex) : ({real}) = z.re := by rfl\n"
        f"example (z : Complex) : ({imag}) = z.im := by rfl\n"
        f"example : ({first}) = 3 := by decide\n"
        f"example : ({second}) = 6 := by decide\n", encoding="utf-8")


if __name__ == "__main__":
    if len(sys.argv) == 3 and sys.argv[1] == "--emit-lean":
        write_kernel_fixture(sys.argv[2])
    else:
        unittest.main()
