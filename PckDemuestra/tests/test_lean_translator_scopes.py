import hashlib
import sys
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "vendor" / "PUBLICAR"))

from PackPublica.documento import Documento
from PackPublica.md import Md


class LeanTranslatorScopeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.markdown = ROOT / "Proyectos" / "ES_46_RV6" / "ES_46_RV6.md"
        before = hashlib.sha256(cls.markdown.read_bytes()).hexdigest()
        cls.generated = Md(Documento(cls.markdown)).lean().contenido
        after = hashlib.sha256(cls.markdown.read_bytes()).hexdigest()
        if before != after:
            raise AssertionError("El traductor modifico el Markdown durante la prueba.")

    def test_membership_constrains_function_result_to_nat(self):
        self.assertIn("n_fn_1 : ℝ → ℕ", self.generated)

    def test_existing_quantifier_is_not_wrapped_in_another_scope(self):
        source = next(
            line for line in self.generated.splitlines()
            if line.startswith("def Node_A_ZE_source_1 ")
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
        self.assertIn("assumption", block)

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
        start = self.generated.index("-- FORMAL_NODE: T_ZERO_TO_INTEGER_CLOSURE")
        end = self.generated.index("-- FORMAL_NODE:", start + 1)
        block = self.generated[start:end]
        theorem = next(
            line for line in block.splitlines()
            if line.startswith("theorem derive_T_ZERO_TO_INTEGER_CLOSURE")
        )
        self.assertIn("∀ w : ℂ", theorem)
        self.assertIn("→ (∀ z : ℂ", theorem)
        self.assertNotIn(": ((ctx.a = ((1 : ℝ) / (2 : ℝ))))", theorem)


if __name__ == "__main__":
    unittest.main()
