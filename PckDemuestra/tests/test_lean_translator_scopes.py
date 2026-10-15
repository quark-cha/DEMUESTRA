import hashlib
import sys
import unittest
from pathlib import Path
from types import SimpleNamespace


ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "vendor" / "PUBLICAR"))

from PackPublica.documento import Documento
from PackPublica.md import Md
from PackPublica.lean import Lean
from PackPublica.formal_ast import parse_formula
from PackPublica.formal_symbols import SymbolInference
from PackPublica.formal_semantic import LeanExpressionEmitter


class LeanTranslatorScopeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.markdown = ROOT / "Proyectos" / "ES_46_RV6" / "ES_46_RV6.md"
        before = hashlib.sha256(cls.markdown.read_bytes()).hexdigest()
        # Esta prueba del backend no publica artefactos ni selecciona fuentes.
        cls.generated = Lean(Md(Documento(cls.markdown))).contenido
        after = hashlib.sha256(cls.markdown.read_bytes()).hexdigest()
        if before != after:
            raise AssertionError("El traductor modifico el Markdown durante la prueba.")

    def test_membership_constrains_function_result_to_nat(self):
        formula = SimpleNamespace(ast=parse_formula(r"n(z)\in\mathbb N"))
        symbols = SymbolInference().infer([
            SimpleNamespace(declarations=[formula], claims=[], steps=[])
        ])
        self.assertEqual(symbols.functions["n"].result, "Nat")

    def test_existing_quantifier_is_not_wrapped_in_another_scope(self):
        source = next(
            line for line in self.generated.splitlines()
            if line.startswith("def Node_P_RIM_S_source_1 ")
        )
        self.assertIn("∀ z : ℂ", source)
        self.assertNotIn("∀ z_all", source)

    def test_isomorphism_uses_only_direct_dependency_contracts(self):
        start = self.generated.index("-- FORMAL_NODE: T_ISO")
        end = self.generated.index("-- FORMAL_NODE:", start + 1)
        block = self.generated[start:end]
        self.assertIn("f_inv_fn_1 (ctx.f_fn_1 x_all)", block)
        self.assertIn("f_fn_1 (ctx.f_inv_fn_1 z_all)", block)
        self.assertNotIn("ctx.zeta", block)
        self.assertNotIn("ctx.n_fn_1", block)
        self.assertIn("ctx.rho_R_fn_1", block)
        self.assertIn("ctx.rho_VED_fn_1", block)
        self.assertIn("let equivalence", block)

    def test_rho_isomorphism_extracts_coordinates_from_isomorphism(self):
        start = self.generated.index("-- FORMAL_NODE: P_RHO_ISO")
        end = self.generated.index("-- FORMAL_NODE:", start + 1)
        block = self.generated[start:end]
        self.assertIn("rcases h_T_ISO with", block)
        self.assertIn(
            "exact ⟨h_forward_coordinate, h_inverse_coordinate⟩",
            block,
        )

    def test_algebraic_rewrite_preserves_all_symbols(self):
        start = self.generated.index("-- FORMAL_NODE: P_F1")
        end = self.generated.index("-- FORMAL_NODE:", start + 1)
        self.assertIn("ring_nf at h_P_F", self.generated[start:end])

        start = self.generated.index("-- FORMAL_NODE: P_F2")
        end = self.generated.index("-- FORMAL_NODE:", start + 1)
        self.assertNotIn("ring_nf", self.generated[start:end])

    def test_riemann_goal_avoids_unbounded_global_simplification(self):
        start = self.generated.index("-- FORMAL_NODE: T_RIEMANN")
        end = self.generated.index("-- FORMAL_NODE:", start + 1)
        block = self.generated[start:end]
        self.assertNotIn("simp_all", block)
        self.assertIn("-- DEMUESTRA_ASSERTION: T_RIEMANN|COMPLETA|NO_DETERMINADO", block)
        self.assertNotIn("theorem derive_T_RIEMANN ", block)

    def test_symmetry_axis_is_not_an_arbitrary_zero_hypothesis(self):
        start = self.generated.index("-- FORMAL_NODE: D_Rim")
        end = self.generated.index("-- FORMAL_NODE:", start + 1)
        block = self.generated[start:end]
        self.assertIn('"role": "CONTEXTUAL_RESULT"', block)
        self.assertNotIn("ctx.a = ((1 : ℝ) / (2 : ℝ))) ∧", block)

        start = self.generated.index("-- FORMAL_NODE: T_RIEMANN")
        end = self.generated.index("-- FORMAL_NODE:", start + 1)
        riemann = self.generated[start:end]
        self.assertNotIn("h_D_Rim_7", riemann)

    def test_conditional_theorem_uses_explicit_implication_as_claim(self):
        formula = SimpleNamespace(ast=parse_formula(
            r"(\forall w\in\mathbb C,Q(w))\Longrightarrow(\forall z\in\mathbb C,P(z))"))
        symbols = SymbolInference().infer([
            SimpleNamespace(declarations=[], claims=[formula], steps=[])
        ])
        emitted = LeanExpressionEmitter(symbols=symbols).emit(formula.ast)
        self.assertIn("∀ w : ℂ", emitted)
        self.assertIn("→", emitted)
        self.assertIn("∀ z : ℂ", emitted)


if __name__ == "__main__":
    unittest.main()
