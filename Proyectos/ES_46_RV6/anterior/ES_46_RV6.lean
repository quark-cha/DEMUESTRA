-- GENERADO_POR: C:\Users\vedq\Desktop\desarrollo\SRC-VED\DEMUESTRA\vendor\PUBLICAR\PackPublica\formal_lean_backend.py
-- FECHA_HORA_GENERACION: 2026-10-10T15:59:49+02:00
-- ARGUMENTO_GENERACION: C:\Users\vedq\Desktop\desarrollo\SRC-VED\DEMUESTRA\ES_46_RV6.md

import Mathlib

noncomputable section

set_option maxHeartbeats 30000

namespace ES_46_RV6

inductive Representation where
  | atom (name : String)

structure FormalContext where
  Assertion_clasifica_exhaustivamente_su_localizaci_n_transversal : ℝ → Prop
  Assertion_contempla_exhaustivamente_todos_los_cierres_finitos : ℕ × ℝ → Prop
  Corresponds_Real_to_Real : ℝ → ℝ → Prop
  Corresponds_Set_Real_to_Set_Complex : Set (ℝ) → Set (ℂ) → Prop
  Corresponds_Set_Real_to_Set_Real : Set (ℝ) → Set (ℝ) → Prop
  D : ℝ
  DerivativeSubject_s : ℝ
  DerivativeSubject_t_prime : ℝ
  DerivativeSubject_v : ℝ
  Derivative_t : ℝ → ℝ
  DivergesToInfinity : ℝ → Prop
  E : ℝ
  F : ℝ
  G : ℝ
  G_fn_1 : ℝ → ℝ
  I : ℝ
  InfiniteSum_Nat_Complex : ℕ → (ℕ → ℂ) → ℂ
  InfiniteSum_Nat_Real : ℕ → (ℕ → ℝ) → ℝ
  L : ℝ
  L_fn_2 : ℕ → ℝ → ℝ
  Lap : ℝ
  Mc : ℝ
  Phi : ℝ
  Phi_tilde_N : ℝ
  Phi_tilde_N_fn_1 : ℝ → ℝ
  Pow_Complex : ℂ → ℂ → ℂ
  Pow_Real : ℝ → ℝ → ℝ
  R_Sch : ℝ
  R_VED : ℝ
  R_VED_fn_2 : ℕ → ℝ → ℝ
  R_rho : ℝ
  R_rho_inv : ℝ
  Representation_U_VED_L__R_VED : Representation
  Representation_U_VED_R_VED : Representation
  Representation_U_VED_cerrada__abierta : Representation
  Representation_U_VED_onda : Representation
  Rim : ℝ
  S : ℝ
  Sch : ℝ
  Stable : ℝ
  Stable_Rim : ℝ
  T : ℝ
  T_fn_2 : ℕ → ℝ → ℝ
  T_k : ℝ
  TendsTo : ℝ → ℝ → Prop
  Text_Lorentz : Prop
  Text_abierta : Prop
  Text_cerrada : Prop
  Text_onda : Prop
  Transforms_Prop_to_Real : Prop → ℝ → Prop
  Transforms_Real_to_Prop : ℝ → Prop → Prop
  Transforms_Real_to_Real : ℝ → ℝ → Prop
  Transforms_Set_Real_to_Set_Complex : Set (ℝ) → Set (ℂ) → Prop
  U : ℝ
  U_Lap : ℝ
  U_Rim : Set (ℂ)
  U_Rim_rho : Set (ℂ)
  U_Sch : Set (ℝ)
  U_VED : Set (ℝ)
  U_VED_cerrado : Set (ℕ × ℝ)
  U_VED_fn_1 : Prop → ℝ
  U_VED_fn_2 : Prop → Prop → ℝ
  U_VED_rho : Set (ℝ)
  VED : ℝ
  Z_Rim : ℝ
  Z_Rim_nt : Set (ℂ)
  Z_Rim_triv : Set (ℤ)
  Z_VED_to_Lap : Set (ℂ)
  a : ℝ
  b : ℝ
  bT : ℝ
  b_fn_2 : ℕ → ℝ → ℝ
  b_k : ℝ
  c : ℝ
  cerrado : ℝ
  d : ℝ
  d_fn_1 : ℝ → ℝ
  dist : ℝ
  ds : ℝ
  ds_0 : ℝ
  dt : ℝ
  dt_prime : ℝ
  dx : ℝ
  dy : ℝ
  dz : ℝ
  e : ℝ
  f : ℝ
  f_fn_1 : ℝ → ℂ
  f_inv : ℝ
  f_inv_fn_1 : ℂ → ℝ
  h : ℝ
  hc : ℝ
  i : ℂ
  ib : ℝ
  ibT : ℝ
  j : ℝ
  k : ℕ
  lambda : ℝ
  ldots : ℝ
  m : ℕ
  mathcal_D : ℝ
  mathcal_E : ℝ
  mathcal_E_VED : Set (ℕ × ℝ)
  mathcal_F : ℝ
  mathcal_I : ℝ
  mathcal_I_VED : Set (ℕ × ℝ)
  mu : ℂ
  mu_PM : ℝ
  mu_PM_fn_2 : ℕ → ℝ → ℂ
  n : ℝ
  nt : ℝ
  onda : ℝ
  rho : ℝ
  rho_1 : ℝ
  rho_2 : ℝ
  rho_R : ℝ
  rho_VED : ℝ
  rho_VED_fn_1 : ℝ → ℝ
  s : ℂ
  s_PM : ℝ
  s_PM_fn_2 : ℕ → ℝ → ℂ
  s_Z_PM : ℝ
  s_Z_PM_fn_1 : ℕ → ℂ
  sqrt : ℝ → ℝ
  t : ℝ
  t_prime : ℝ
  tilde_N : ℝ
  triv : ℝ
  v : ℝ
  v_onda : ℝ
  varepsilon : ℝ
  x : ℝ
  z : ℂ
  z_varepsilon_PM : ℝ
  zeta : ℂ → ℂ
  -- DEMUESTRA_SOURCE_DOMAIN: {"node": "P_VED_E", "source": "La materia se representa en este marco como una onda de longitud de onda Compton positiva $\\lambda$", "symbol": "lambda", "condition": "positive", "scope": "WAVE_PARAMETER_DOMAIN"}
  PositiveDomain_lambda : 0 < lambda
-- DEMUESTRA_TRANSVERSAL_MAP: {"map": "R_rho", "node": "P_VR_rho", "source": "\\boxed{\nR_\\rho(\\rho)=\\rho_R=\\rho.\n}", "method": "DECLARED_IDENTITY_MAP"}
def FormalContext.R_rho_fn_1 (_ctx : FormalContext) (r : ℝ) : ℝ := r
-- DEMUESTRA_TRANSVERSAL_MAP: {"map": "R_rho_inv", "node": "P_VR_rho", "source": "\\boxed{\nR_\\rho^{-1}(\\rho_R)=\\rho_R.\n}", "method": "DECLARED_IDENTITY_MAP"}
def FormalContext.R_rho_inv_fn_1 (_ctx : FormalContext) (r : ℝ) : ℝ := r
theorem transversal_map_preserves_distance (ctx : FormalContext) (r₁ r₂ : ℝ) :
    |ctx.R_rho_fn_1 r₁ - ctx.R_rho_fn_1 r₂| = |r₁ - r₂| := by rfl
theorem transversal_map_preserves_interval (ctx : FormalContext) (r : ℝ)
    (hr : r ∈ Set.Icc (0 : ℝ) (1 / 2 : ℝ)) : ctx.R_rho_fn_1 r ∈ Set.Icc (0 : ℝ) (1 / 2 : ℝ) := by exact hr
theorem transversal_maps_are_inverse (ctx : FormalContext) (r : ℝ) :
    ctx.R_rho_inv_fn_1 (ctx.R_rho_fn_1 r) = r ∧ ctx.R_rho_fn_1 (ctx.R_rho_inv_fn_1 r) = r := by
  exact ⟨rfl, rfl⟩
-- DEMUESTRA_COORDINATE_DEFINITION: {"node": "D_rho_R", "source": "\\boxed{\n\\rho_R\n=\n\\left|\n\\Re(z)-\\frac12\n\\right|.\n}", "expression": "abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))"}
def FormalContext.rho_R_fn_1 (_ctx : FormalContext) (z : ℂ) : ℝ := |z.re - (1 / 2 : ℝ)|
theorem critical_strip_coordinate_bounds (ctx : FormalContext) (z : ℂ)
    (h_left : 0 < z.re) (h_right : z.re < 1) :
    ctx.rho_R_fn_1 z ∈ Set.Icc (0 : ℝ) (1 / 2 : ℝ) := by
  constructor
  · exact abs_nonneg _
  · apply le_of_lt
    change |z.re - (1 / 2 : ℝ)| < (1 / 2 : ℝ)
    exact abs_lt.mpr ⟨by linarith, by linarith⟩
theorem critical_strip_in_transversal_universe (ctx : FormalContext)
    (h_domain : ctx.U_Rim_rho = {z : ℂ | ctx.rho_R_fn_1 z ∈ Set.Icc (0 : ℝ) (1 / 2 : ℝ)})
    (z : ℂ) (h_left : 0 < z.re) (h_right : z.re < 1) : z ∈ ctx.U_Rim_rho := by
  rw [h_domain]
  exact critical_strip_coordinate_bounds ctx z h_left h_right
theorem nontrivial_zero_in_transversal_universe (ctx : FormalContext)
    (h_zeros : ctx.Z_Rim_nt = {z : ℂ | ((z ∈ (Set.univ : Set ℂ)) ∧ ctx.zeta z = 0) ∧ (0 < z.re ∧ z.re < 1)})
    (h_domain : ctx.U_Rim_rho = {z : ℂ | ctx.rho_R_fn_1 z ∈ Set.Icc (0 : ℝ) (1 / 2 : ℝ)})
    (z : ℂ) (hz : z ∈ ctx.Z_Rim_nt) : z ∈ ctx.U_Rim_rho := by
  rw [h_zeros] at hz
  exact critical_strip_in_transversal_universe ctx h_domain z hz.2.1 hz.2.2
-- DEMUESTRA_TEXT_DEFINITION: {"interpretation": "equivalence_label", "label": "onda_abierta_o_libre", "node": "P_VED_Inv", "source": "\\boxed{\nn\\to\\infty\n\\iff\nL\\to\\infty\n\\iff\nR_{\\rm VED}\\to\\infty\n\\iff\n\\text{onda abierta o libre}.\n}"}
def Derived_Text_onda_abierta_o_libre (ctx : FormalContext) : Prop := (ctx.DivergesToInfinity (ctx.n))
-- DEMUESTRA_TEXT_DEFINITION: {"interpretation": "equivalence_label", "label": "clase_estable", "node": "P_RHO_ISO", "source": "\\rho=0\n\\iff\n\\text{clase estable},"}
def Derived_Text_clase_estable (ctx : FormalContext) : Prop := (ctx.rho = 0)
-- DEMUESTRA_TEXT_DEFINITION: {"interpretation": "equivalence_label", "label": "estado_estable", "node": "P_VED_E", "source": "\\boxed{\nP_{\\rm VED}(E):\n\\qquad\n\\rho=0\n\\iff\nn=k\\in\\mathbb N^+\n\\iff\nL=k\\lambda\n\\iff\n\\text{cierre exacto en fase}\n\\iff\n\\text{estado estable}.\n}"}
def Derived_Text_estado_estable (ctx : FormalContext) : Prop := (ctx.rho = 0)
-- DEMUESTRA_TEXT_DEFINITION: {"interpretation": "equivalence_label", "label": "cierre_exacto_en_fase", "node": "P_VED_E", "source": "\\boxed{\nP_{\\rm VED}(E):\n\\qquad\n\\rho=0\n\\iff\nn=k\\in\\mathbb N^+\n\\iff\nL=k\\lambda\n\\iff\n\\text{cierre exacto en fase}\n\\iff\n\\text{estado estable}.\n}"}
def Derived_Text_cierre_exacto_en_fase (ctx : FormalContext) : Prop := (ctx.rho = 0)
-- DEMUESTRA_TEXT_DEFINITION: {"interpretation": "equivalence_label", "label": "clase_no_estable", "node": "P_RHO_ISO", "source": "0<\\rho\\le\\frac12\n\\iff\n\\text{clase no estable}"}
def Derived_Text_clase_no_estable (ctx : FormalContext) : Prop := ((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))
-- DEMUESTRA_TEXT_DEFINITION: {"interpretation": "equivalence_label", "label": "cierre_no_estable", "node": "P_VED_I", "source": "\\boxed{\nP_{\\rm VED}(I):\n\\qquad\n0<\\rho\\le\\frac12\n\\iff\n\\text{cierre no estable}.\n}"}
def Derived_Text_cierre_no_estable (ctx : FormalContext) : Prop := ((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))
-- DEMUESTRA_TEXT_DEFINITION: {"interpretation": "equivalence_label", "label": "estado_no_estable", "node": "P_Z", "source": "\\boxed{\n0<\\rho\\le\\frac12\n\\iff\n\\text{estado no estable}.\n}"}
def Derived_Text_estado_no_estable (ctx : FormalContext) : Prop := ((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))
-- DEMUESTRA_INTEGER_CLOSURE_SOURCE: {"node": "D_rho", "source": "\\boxed{\n\\rho\n=\n\\operatorname{dist}(n,\\mathbb N^+).\n}"}
theorem stable_closure_iff_integer (ctx : FormalContext) (h_distance : (ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x})))))) :
    Derived_Text_estado_estable ctx ↔ ∃ k : ℕ, 0 < k ∧ ctx.n = (k : ℝ) := by
  have closed : IsClosed ((fun k : ℕ => (k : ℝ)) '' {k : ℕ | 0 < k}) :=
    Nat.isClosedEmbedding_coe_real.isClosedMap _ (isClosed_discrete _)
  have nonempty : ((fun k : ℕ => (k : ℝ)) '' {k : ℕ | 0 < k}).Nonempty :=
    ⟨1, 1, Nat.zero_lt_one, by simp⟩
  unfold Derived_Text_estado_estable
  rw [h_distance, ← closed.mem_iff_infDist_zero nonempty]
  constructor
  · rintro ⟨k, hk, hkn⟩
    exact ⟨k, hk, hkn.symm⟩
  · rintro ⟨k, hk, hnk⟩
    exact ⟨k, hk, hnk.symm⟩
theorem noninteger_closure_not_stable (ctx : FormalContext) (h_distance : (ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))))
    (h_noninteger : ¬ ∃ k : ℕ, 0 < k ∧ ctx.n = (k : ℝ)) :
    ¬ Derived_Text_estado_estable ctx := by
  intro h_stable
  exact h_noninteger ((stable_closure_iff_integer ctx h_distance).mp h_stable)

-- DEMUESTRA_TRANSPORT_DEFINITION: {"predicate": "Stable_Rim", "node": "P_RHO_ISO", "target_node": "P_RIM_S", "source": "$P_{\\rm RHO\\_ISO}$ — La coordenada transversal se conserva en las dos\ndirecciones del isomorfismo:\n\n$$\n\\boxed{\n\\rho_R(f(x))=\\rho_{\\rm VED}(x),\n\\qquad\n\\rho_{\\rm VED}(f^{-1}(z))=\\rho_R(z).\n}\n$$\n\n\nEn consecuencia, toda propiedad formulada mediante $\\rho$ se transporta para\ntodos los valores. En particular,\n\n$$\n\\rho=0\n\\iff\n\\text{clase estable},\n$$\n\ny\n\n$$\n0<\\rho\\le\\frac12\n\\iff\n\\text{clase no estable}\n$$\n\nse conservan tanto por $f$ como por $f^{-1}$. Esta conservación es una\nconsecuencia del isomorfismo global y no una condición añadida únicamente a\nlos ceros.\n\n---", "method": "INVERSE_IMAGE_OF_STABLE_CLASS", "domain": "U_Rim_rho", "definition_source": {"label": "clase_estable", "node": "P_RHO_ISO", "source": "\\rho=0\n\\iff\n\\text{clase estable},", "interpretation": "equivalence_label"}}
def Derived_Stable_Rim (ctx : FormalContext) (z_transported : ℂ) : Prop := (z_transported ∈ ctx.U_Rim_rho ∧ Derived_Text_clase_estable { ctx with rho := ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_transported) })
theorem stable_rim_iff_coordinate_zero (ctx : FormalContext)
    (h_domain : ctx.U_Rim_rho = {z : ℂ | ctx.rho_R_fn_1 z ∈ Set.Icc (0 : ℝ) (1 / 2 : ℝ)})
    (h_inverse : ∀ z : ℂ, z ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z) = ctx.rho_R_fn_1 z)
    (z : ℂ) : Derived_Stable_Rim ctx z ↔ ctx.rho_R_fn_1 z = 0 := by
  constructor
  · rintro ⟨hz, h_stable⟩
    change ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z) = 0 at h_stable
    rw [h_inverse z hz] at h_stable
    exact h_stable
  · intro h_zero
    have hz : z ∈ ctx.U_Rim_rho := by
      rw [h_domain]
      change ctx.rho_R_fn_1 z ∈ Set.Icc (0 : ℝ) (1 / 2 : ℝ)
      rw [h_zero]
      constructor <;> norm_num
    exact ⟨hz, by change ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z) = 0; rw [h_inverse z hz]; exact h_zero⟩
theorem nontrivial_zero_stability_iff_critical_line (ctx : FormalContext)
    (h_zeros : ctx.Z_Rim_nt = {z : ℂ | ((z ∈ (Set.univ : Set ℂ)) ∧ ctx.zeta z = 0) ∧ (0 < z.re ∧ z.re < 1)})
    (h_domain : ctx.U_Rim_rho = {z : ℂ | ctx.rho_R_fn_1 z ∈ Set.Icc (0 : ℝ) (1 / 2 : ℝ)})
    (h_inverse : ∀ z : ℂ, z ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z) = ctx.rho_R_fn_1 z)
    (z : ℂ) (hz : z ∈ ctx.Z_Rim_nt) : Derived_Stable_Rim ctx z ↔ z.re = (1 / 2 : ℝ) := by
  have h_transversal := nontrivial_zero_in_transversal_universe ctx h_zeros h_domain z hz
  rw [stable_rim_iff_coordinate_zero ctx h_domain h_inverse z]
  change (|z.re - (1 / 2 : ℝ)| = 0) ↔ (z.re = (1 / 2 : ℝ))
  exact abs_eq_zero.trans sub_eq_zero

-- FORMAL_NODE: D_U
-- SOURCE: ES_46_RV6.md:29
-- DEMUESTRA_SOURCE_PROSE: {"node": "D_U", "location": "ES_46_RV6.md:29", "source": "$D_U$ — El universo físico considerado se representa como\n\n$$\n\\boxed{\nU=3S+T.\n}\n$$\n\nNo se elimina ninguna dimensión espacial.", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ U=3S+T. }
def Node_D_U_source_1_raw : String := "\\boxed{ U=3S+T. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_U", "formula": 1, "location": "ES_46_RV6.md:29:D_U:formula-1", "source": "\\boxed{ U=3S+T. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_U_source_1 (ctx : FormalContext) : Prop := (ctx.U = (((3 : ℝ) * ctx.S) + ctx.T))
def Node_D_U_source_declarations (ctx : FormalContext) : Prop := (Node_D_U_source_1 ctx)
def Node_D_U (ctx : FormalContext) : Prop := (ctx.U = (((3 : ℝ) * ctx.S) + ctx.T))
-- DEMUESTRA_ASSERTION: D_U|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_t_prime
-- SOURCE: ES_46_RV6.md:65
-- DEMUESTRA_SOURCE_PROSE: {"node": "D_t_prime", "location": "ES_46_RV6.md:65", "source": "## 2.1. Convención esencial sobre el apóstrofo\n\n$D_{t'}$ — El apóstrofo de $t'$ **no significa derivada**.\n\n$t'$ representa la coordenada temporal propia del sistema observado respecto del observador en la transformación de Lorentz. En consecuencia, $dt'$ es el diferencial del tiempo propio del sistema observado.\n\nCuando sea necesaria una derivada se escribirá explícitamente, por ejemplo,\n\n$$\n\\frac{dt'}{dt}.\n$$", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \frac{dt'}{dt}.
-- FORMULA: t'
-- FORMULA: t'
-- FORMULA: dt'
def Node_D_t_prime_source_1_raw : String := "\\frac{dt'}{dt}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_t_prime", "formula": 1, "location": "ES_46_RV6.md:65:D_t_prime:formula-1", "source": "\\frac{dt'}{dt}.", "status": "FORMALIZED_TERM", "type": "Real", "role": "STATEMENT"}
def Node_D_t_prime_source_1_term (ctx : FormalContext) : ℝ := (ctx.Derivative_t (ctx.t_prime))
def Node_D_t_prime_source_2_raw : String := "t'"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_t_prime", "formula": 2, "location": "ES_46_RV6.md:65:D_t_prime:formula-2", "source": "t'", "status": "FORMALIZED_TERM", "type": "Real", "role": "DECLARATION"}
def Node_D_t_prime_source_2_term (ctx : FormalContext) : ℝ := (ctx.t_prime)
def Node_D_t_prime_source_3_raw : String := "t'"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_t_prime", "formula": 3, "location": "ES_46_RV6.md:65:D_t_prime:formula-3", "source": "t'", "status": "FORMALIZED_TERM", "type": "Real", "role": "STATEMENT"}
def Node_D_t_prime_source_3_term (ctx : FormalContext) : ℝ := (ctx.t_prime)
def Node_D_t_prime_source_4_raw : String := "dt'"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_t_prime", "formula": 4, "location": "ES_46_RV6.md:65:D_t_prime:formula-4", "source": "dt'", "status": "FORMALIZED_TERM", "type": "Real", "role": "DECLARATION"}
def Node_D_t_prime_source_4_term (ctx : FormalContext) : ℝ := (ctx.dt_prime)
def Node_D_t_prime (ctx : FormalContext) : Prop := True
-- DEMUESTRA_ASSERTION: D_t_prime|COMPLETA|NO_APLICA

-- FORMAL_NODE: A_L
-- SOURCE: ES_46_RV6.md:77
-- DEMUESTRA_SOURCE_PROSE: {"node": "A_L", "location": "ES_46_RV6.md:77", "source": "## 2.2. Antecedente de Lorentz\n\n$A_{\\rm L}$ — Para velocidad relativa $v$,\n\n$$\ndt'\n=\ndt\n\\sqrt{\n1-\\frac{v^2}{c^2}\n}.\n$$\n\nDefinimos la velocidad longitudinal observada como\n\n$$\n\\boxed{\nv=\\frac{ds}{dt}.\n}\n$$\n\nEn unidades naturales,\n\n$$\nc=1.\n$$\n\nPor tanto,\n\n$$\ndt'^2\n=\ndt^2-ds^2,\n$$\n\ny obtenemos", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: dt' = dt \sqrt{ 1-\frac{v^2}{c^2} }.
-- FORMULA: \boxed{ v=\frac{ds}{dt}. }
-- FORMULA: c=1.
-- FORMULA: dt'^2 = dt^2-ds^2,
-- FORMULA: v
def Node_A_L_source_1_raw : String := "dt' = dt \\sqrt{ 1-\\frac{v^2}{c^2} }."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "A_L", "formula": 1, "location": "ES_46_RV6.md:77:A_L:formula-1", "source": "dt' = dt \\sqrt{ 1-\\frac{v^2}{c^2} }.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_A_L_source_1 (ctx : FormalContext) : Prop := (ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2)))))
def Node_A_L_source_2_raw : String := "\\boxed{ v=\\frac{ds}{dt}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "A_L", "formula": 2, "location": "ES_46_RV6.md:77:A_L:formula-2", "source": "\\boxed{ v=\\frac{ds}{dt}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_A_L_source_2 (ctx : FormalContext) : Prop := (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s))
def Node_A_L_source_3_raw : String := "c=1."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "A_L", "formula": 3, "location": "ES_46_RV6.md:77:A_L:formula-3", "source": "c=1.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_A_L_source_3 (ctx : FormalContext) : Prop := (ctx.c = 1)
def Node_A_L_source_4_raw : String := "dt'^2 = dt^2-ds^2,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "A_L", "formula": 4, "location": "ES_46_RV6.md:77:A_L:formula-4", "source": "dt'^2 = dt^2-ds^2,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_A_L_source_4 (ctx : FormalContext) : Prop := (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))
def Node_A_L_source_5_raw : String := "v"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "A_L", "formula": 5, "location": "ES_46_RV6.md:77:A_L:formula-5", "source": "v", "status": "FORMALIZED_TERM", "type": "Real", "role": "STATEMENT"}
def Node_A_L_source_5_term (ctx : FormalContext) : ℝ := (ctx.v)
def Node_A_L_source_declarations (ctx : FormalContext) : Prop := (Node_A_L_source_1 ctx) ∧ (Node_A_L_source_2 ctx) ∧ (Node_A_L_source_3 ctx) ∧ (Node_A_L_source_4 ctx)
def Node_A_L_clause_1 (ctx : FormalContext) : Prop := (ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2)))))
def Node_A_L_clause_2 (ctx : FormalContext) : Prop := (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s))
def Node_A_L_clause_3 (ctx : FormalContext) : Prop := (ctx.c = 1)
def Node_A_L_clause_4 (ctx : FormalContext) : Prop := (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))
def Node_A_L (ctx : FormalContext) : Prop := (ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))
-- DEMUESTRA_ASSERTION: A_L|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_lambda
-- SOURCE: ES_46_RV6.md:174
-- DEMUESTRA_SOURCE_PROSE: {"node": "D_lambda", "location": "ES_46_RV6.md:174", "source": "## 4.1. Longitud de onda base\n\n$D_\\lambda$ — Sea $\\lambda$ la longitud de onda base asociada a la materia considerada.\n\nA partir de las relaciones de Planck y Einstein,\n\n$$\nE=\\frac{hc}{\\lambda},\n$$\n\n$$\nE=Mc^2,\n$$\n\nse obtiene\n\n$$\nMc^2=\\frac{hc}{\\lambda},\n$$\n\ny por tanto\n\n$$\n\\boxed{\n\\lambda=\\frac{h}{Mc}.\n}\n$$", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: E=\frac{hc}{\lambda},
-- FORMULA: E=Mc^2,
-- FORMULA: Mc^2=\frac{hc}{\lambda},
-- FORMULA: \boxed{ \lambda=\frac{h}{Mc}. }
-- FORMULA: \lambda
def Node_D_lambda_source_1_raw : String := "E=\\frac{hc}{\\lambda},"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_lambda", "formula": 1, "location": "ES_46_RV6.md:174:D_lambda:formula-1", "source": "E=\\frac{hc}{\\lambda},", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_lambda_source_1 (ctx : FormalContext) : Prop := (ctx.E = (ctx.hc / ctx.lambda))
def Node_D_lambda_source_2_raw : String := "E=Mc^2,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_lambda", "formula": 2, "location": "ES_46_RV6.md:174:D_lambda:formula-2", "source": "E=Mc^2,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_lambda_source_2 (ctx : FormalContext) : Prop := (ctx.E = ctx.Mc ^ 2)
def Node_D_lambda_source_3_raw : String := "Mc^2=\\frac{hc}{\\lambda},"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_lambda", "formula": 3, "location": "ES_46_RV6.md:174:D_lambda:formula-3", "source": "Mc^2=\\frac{hc}{\\lambda},", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_lambda_source_3 (ctx : FormalContext) : Prop := (ctx.Mc ^ 2 = (ctx.hc / ctx.lambda))
def Node_D_lambda_source_4_raw : String := "\\boxed{ \\lambda=\\frac{h}{Mc}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_lambda", "formula": 4, "location": "ES_46_RV6.md:174:D_lambda:formula-4", "source": "\\boxed{ \\lambda=\\frac{h}{Mc}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_lambda_source_4 (ctx : FormalContext) : Prop := (ctx.lambda = (ctx.h / ctx.Mc))
def Node_D_lambda_source_5_raw : String := "\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_lambda", "formula": 5, "location": "ES_46_RV6.md:174:D_lambda:formula-5", "source": "\\lambda", "status": "FORMALIZED_TERM", "type": "Real", "role": "STATEMENT"}
def Node_D_lambda_source_5_term (ctx : FormalContext) : ℝ := (ctx.lambda)
def Node_D_lambda_source_declarations (ctx : FormalContext) : Prop := (Node_D_lambda_source_1 ctx) ∧ (Node_D_lambda_source_2 ctx) ∧ (Node_D_lambda_source_3 ctx) ∧ (Node_D_lambda_source_4 ctx)
def Node_D_lambda_clause_1 (ctx : FormalContext) : Prop := (ctx.E = (ctx.hc / ctx.lambda))
def Node_D_lambda_clause_2 (ctx : FormalContext) : Prop := (ctx.E = ctx.Mc ^ 2)
def Node_D_lambda_clause_3 (ctx : FormalContext) : Prop := (ctx.Mc ^ 2 = (ctx.hc / ctx.lambda))
def Node_D_lambda_clause_4 (ctx : FormalContext) : Prop := (ctx.lambda = (ctx.h / ctx.Mc))
def Node_D_lambda (ctx : FormalContext) : Prop := (ctx.E = (ctx.hc / ctx.lambda)) ∧ (ctx.E = ctx.Mc ^ 2) ∧ (ctx.Mc ^ 2 = (ctx.hc / ctx.lambda)) ∧ (ctx.lambda = (ctx.h / ctx.Mc))
-- DEMUESTRA_ASSERTION: D_lambda|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_L
-- SOURCE: ES_46_RV6.md:202
-- DEMUESTRA_SOURCE_PROSE: {"node": "D_L", "location": "ES_46_RV6.md:202", "source": "## 4.2. Longitud de contorno\n\n$D_L$ — Sea $L$ la longitud total del contorno espacial recorrido por una onda confinada; es el perímetro de cierre de la onda.\n\nAquí $\\lambda$ es la longitud de onda Compton de la materia considerada,\nestrictamente positiva, y $n=L/\\lambda$ es el número exacto de ciclos\ncontenido en el contorno: no es una aproximación ni un redondeo. El cierre\nexacto en fase exige que ese número sea un entero positivo.\n\nDefinimos\n\n$$\n\\boxed{\nL=n\\lambda.\n}\n$$\n\nPara un cierre finito,\n\n$$\nn\\in\\mathbb R^+.\n$$\n\n**La longitud del contorno de una onda cerrada es siempre estrictamente positiva: $L>0$.** Tanto el número de longitudes de onda contenido en el contorno como la longitud de onda Compton son positivos. Por la relación anterior, su producto es positivo; un contorno de longitud cero no representa una onda material cerrada de este marco.", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ L=n\lambda. }
-- FORMULA: n\in\mathbb R^+.
-- FORMULA: L
-- FORMULA: \lambda
-- FORMULA: n=L/\lambda
-- FORMULA: L>0
def Node_D_L_source_1_raw : String := "\\boxed{ L=n\\lambda. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_L", "formula": 1, "location": "ES_46_RV6.md:202:D_L:formula-1", "source": "\\boxed{ L=n\\lambda. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_L_source_1 (ctx : FormalContext) : Prop := (ctx.L = (ctx.n * ctx.lambda))
def Node_D_L_source_2_raw : String := "n\\in\\mathbb R^+."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_L", "formula": 2, "location": "ES_46_RV6.md:202:D_L:formula-2", "source": "n\\in\\mathbb R^+.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_L_source_2 (ctx : FormalContext) : Prop := (ctx.n ∈ {x : ℝ | 0 < x})
def Node_D_L_source_3_raw : String := "L"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_L", "formula": 3, "location": "ES_46_RV6.md:202:D_L:formula-3", "source": "L", "status": "FORMALIZED_TERM", "type": "Function[Nat,Real,Real]", "role": "STATEMENT"}
def Node_D_L_source_3_term (ctx : FormalContext) : ℕ → ℝ → ℝ := (ctx.L_fn_2)
def Node_D_L_source_4_raw : String := "\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_L", "formula": 4, "location": "ES_46_RV6.md:202:D_L:formula-4", "source": "\\lambda", "status": "FORMALIZED_TERM", "type": "Real", "role": "STATEMENT"}
def Node_D_L_source_4_term (ctx : FormalContext) : ℝ := (ctx.lambda)
def Node_D_L_source_5_raw : String := "n=L/\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_L", "formula": 5, "location": "ES_46_RV6.md:202:D_L:formula-5", "source": "n=L/\\lambda", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_L_source_5 (ctx : FormalContext) : Prop := (ctx.n = (ctx.L / ctx.lambda))
def Node_D_L_source_6_raw : String := "L>0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_L", "formula": 6, "location": "ES_46_RV6.md:202:D_L:formula-6", "source": "L>0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_L_source_6 (ctx : FormalContext) : Prop := (ctx.L > 0)
def Node_D_L_source_declarations (ctx : FormalContext) : Prop := (Node_D_L_source_1 ctx) ∧ (Node_D_L_source_2 ctx)
def Node_D_L_source_steps (ctx : FormalContext) : Prop := (Node_D_L_source_5 ctx) ∧ (Node_D_L_source_6 ctx)
def Node_D_L_clause_1 (ctx : FormalContext) : Prop := (ctx.L = (ctx.n * ctx.lambda))
def Node_D_L_clause_2 (ctx : FormalContext) : Prop := (ctx.n ∈ {x : ℝ | 0 < x})
def Node_D_L (ctx : FormalContext) : Prop := (ctx.L = (ctx.n * ctx.lambda)) ∧ (ctx.n ∈ {x : ℝ | 0 < x})
theorem positive_closure_length_from_D_L (ctx : FormalContext)
    (h_contour : Node_D_L ctx) : 0 < ctx.L := by
  rcases h_contour with ⟨h_length, h_cycles⟩
  rw [h_length]
  exact mul_pos h_cycles ctx.PositiveDomain_lambda
-- DEMUESTRA_ASSERTION: D_L|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_R_VED
-- SOURCE: ES_46_RV6.md:227
-- DEMUESTRA_SOURCE_PROSE: {"node": "D_R_VED", "location": "ES_46_RV6.md:227", "source": "## 4.3. Construcción de $U_{\\rm VED}$\n\n$D_{R_{\\rm VED}}$ — Se representa topológicamente el contorno de longitud $L$ mediante una circunferencia bidimensional de igual longitud:\n\n$$\n2\\pi R_{\\rm VED}=L.\n$$\n\nPor tanto,\n\n$$\n\\boxed{\nR_{\\rm VED}\n=\n\\frac{L}{2\\pi}\n=\n\\frac{n\\lambda}{2\\pi}.\n}\n$$\n\nLa afirmación no es que el confinamiento físico real en $3S+T$ tenga necesariamente forma circular. La circunferencia es una proyección topológica precisa que conserva la longitud $L$ y permite analizar las propiedades de cierre.\n\nAsí,\n\n$$\n\\boxed{\nU_{\\rm VED}(\\text{onda})\n=\nU_{\\rm VED}(\\text{cerrada},\\text{abierta})\n=\nU_{\\rm VED}(R_{\\rm VED})\n=\nU_{\\rm VED}(L,R_{\\rm VED}).\n}\n$$", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: 2\pi R_{\rm VED}=L.
-- FORMULA: \boxed{ R_{\rm VED} = \frac{L}{2\pi} = \frac{n\lambda}{2\pi}. }
-- FORMULA: \boxed{ U_{\rm VED}(\text{onda}) = U_{\rm VED}(\text{cerrada},\text{abierta}) = U_{\rm VED}(R_{\rm VED}) = U_{\rm VED}(L,R_{\rm VED}). }
-- FORMULA: U_{\rm VED}
-- FORMULA: L
-- FORMULA: 3S+T
-- FORMULA: L
def Node_D_R_VED_source_1_raw : String := "2\\pi R_{\\rm VED}=L."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_R_VED", "formula": 1, "location": "ES_46_RV6.md:227:D_R_VED:formula-1", "source": "2\\pi R_{\\rm VED}=L.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_R_VED_source_1 (ctx : FormalContext) : Prop := ((((2 : ℝ) * Real.pi) * ctx.R_VED) = ctx.L)
def Node_D_R_VED_source_2_raw : String := "\\boxed{ R_{\\rm VED} = \\frac{L}{2\\pi} = \\frac{n\\lambda}{2\\pi}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_R_VED", "formula": 2, "location": "ES_46_RV6.md:227:D_R_VED:formula-2", "source": "\\boxed{ R_{\\rm VED} = \\frac{L}{2\\pi} = \\frac{n\\lambda}{2\\pi}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_R_VED_source_2 (ctx : FormalContext) : Prop := ((ctx.R_VED = (ctx.L / ((2 : ℝ) * Real.pi))) ∧ ((ctx.L / ((2 : ℝ) * Real.pi)) = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi))))
def Node_D_R_VED_source_3_raw : String := "\\boxed{ U_{\\rm VED}(\\text{onda}) = U_{\\rm VED}(\\text{cerrada},\\text{abierta}) = U_{\\rm VED}(R_{\\rm VED}) = U_{\\rm VED}(L,R_{\\rm VED}). }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_R_VED", "formula": 3, "location": "ES_46_RV6.md:227:D_R_VED:formula-3", "source": "\\boxed{ U_{\\rm VED}(\\text{onda}) = U_{\\rm VED}(\\text{cerrada},\\text{abierta}) = U_{\\rm VED}(R_{\\rm VED}) = U_{\\rm VED}(L,R_{\\rm VED}). }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_R_VED_source_3 (ctx : FormalContext) : Prop := (((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))
def Node_D_R_VED_source_4_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_R_VED", "formula": 4, "location": "ES_46_RV6.md:227:D_R_VED:formula-4", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "STATEMENT"}
def Node_D_R_VED_source_4_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_D_R_VED_source_5_raw : String := "L"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_R_VED", "formula": 5, "location": "ES_46_RV6.md:227:D_R_VED:formula-5", "source": "L", "status": "FORMALIZED_TERM", "type": "Function[Nat,Real,Real]", "role": "STATEMENT"}
def Node_D_R_VED_source_5_term (ctx : FormalContext) : ℕ → ℝ → ℝ := (ctx.L_fn_2)
def Node_D_R_VED_source_6_raw : String := "3S+T"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_R_VED", "formula": 6, "location": "ES_46_RV6.md:227:D_R_VED:formula-6", "source": "3S+T", "status": "FORMALIZED_TERM", "type": "Real", "role": "STATEMENT"}
def Node_D_R_VED_source_6_term (ctx : FormalContext) : ℝ := (((3 : ℝ) * ctx.S) + ctx.T)
def Node_D_R_VED_source_7_raw : String := "L"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_R_VED", "formula": 7, "location": "ES_46_RV6.md:227:D_R_VED:formula-7", "source": "L", "status": "FORMALIZED_TERM", "type": "Function[Nat,Real,Real]", "role": "STATEMENT"}
def Node_D_R_VED_source_7_term (ctx : FormalContext) : ℕ → ℝ → ℝ := (ctx.L_fn_2)
def Node_D_R_VED_source_declarations (ctx : FormalContext) : Prop := (Node_D_R_VED_source_1 ctx) ∧ (Node_D_R_VED_source_2 ctx) ∧ (Node_D_R_VED_source_3 ctx)
def Node_D_R_VED_clause_1 (ctx : FormalContext) : Prop := ((((2 : ℝ) * Real.pi) * ctx.R_VED) = ctx.L)
def Node_D_R_VED_clause_2 (ctx : FormalContext) : Prop := ((ctx.R_VED = (ctx.L / ((2 : ℝ) * Real.pi))) ∧ ((ctx.L / ((2 : ℝ) * Real.pi)) = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi))))
def Node_D_R_VED_clause_3 (ctx : FormalContext) : Prop := (((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))
def Node_D_R_VED (ctx : FormalContext) : Prop := ((((2 : ℝ) * Real.pi) * ctx.R_VED) = ctx.L) ∧ ((ctx.R_VED = (ctx.L / ((2 : ℝ) * Real.pi))) ∧ ((ctx.L / ((2 : ℝ) * Real.pi)) = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi)))) ∧ (((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))
-- DEMUESTRA_ASSERTION: D_R_VED|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_k
-- SOURCE: ES_46_RV6.md:321
-- DEMUESTRA_SOURCE_PROSE: {"node": "D_k", "location": "ES_46_RV6.md:321", "source": "## 6.1. Entero más próximo y distancia\n\n$D_k$ — Sea $k\\in\\mathbb N^+$ el entero positivo más próximo que sirve como centro de una familia de cierre.", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: k\in\mathbb N^+
def Node_D_k_source_1_raw : String := "k\\in\\mathbb N^+"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_k", "formula": 1, "location": "ES_46_RV6.md:321:D_k:formula-1", "source": "k\\in\\mathbb N^+", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_k_source_1 (ctx : FormalContext) : Prop := (ctx.k ∈ {x : ℕ | 0 < x})
def Node_D_k_source_declarations (ctx : FormalContext) : Prop := (Node_D_k_source_1 ctx)
def Node_D_k (ctx : FormalContext) : Prop := (ctx.k ∈ {x : ℕ | 0 < x})
-- DEMUESTRA_ASSERTION: D_k|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_rho
-- SOURCE: ES_46_RV6.md:323
-- DEMUESTRA_SOURCE_PROSE: {"node": "D_rho", "location": "ES_46_RV6.md:323", "source": "$D_\\rho$ — Sea\n\n$$\n\\boxed{\n\\rho\n=\n\\operatorname{dist}(n,\\mathbb N^+).\n}\n$$\n\nAquí $\\rho$ es la **distancia mínima de $n$ al entero positivo más próximo $k$**, no la distancia a un entero elegido arbitrariamente. Por tanto, $\\rho=|n-k|$. Esta distancia mide cuánto se aparta el número de ciclos del cierre entero y exacto en fase.\n\nPor definición de distancia al entero más próximo,\n\n$$\n\\boxed{\n0\\le\\rho\\le\\frac12.\n}\n$$\n\nTodo cierre finito se representa como\n\n$$\n\\boxed{\nn=k\\pm\\rho,\n\\qquad\nk\\in\\mathbb N^+,\n\\qquad\n0\\le\\rho\\le\\frac12.\n}\n$$\n\nEn el punto exactamente equidistante entre dos enteros, $\\rho=1/2$; las dos etiquetas vecinas representan la misma frontera.\n\nEntonces\n\n$$\n\\boxed{\nL(k,\\rho)\n=\n(k\\pm\\rho)\\lambda,\n}\n$$\n\ny\n\n$$\n\\boxed{\nR_{\\rm VED}(k,\\rho)\n=\n\\frac{(k\\pm\\rho)\\lambda}{2\\pi}.\n}\n$$", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ \rho = \operatorname{dist}(n,\mathbb N^+). }
-- FORMULA: \boxed{ 0\le\rho\le\frac12. }
-- FORMULA: \boxed{ n=k\pm\rho, \qquad k\in\mathbb N^+, \qquad 0\le\rho\le\frac12. }
-- FORMULA: \boxed{ L(k,\rho) = (k\pm\rho)\lambda, }
-- FORMULA: \boxed{ R_{\rm VED}(k,\rho) = \frac{(k\pm\rho)\lambda}{2\pi}. }
-- FORMULA: \rho
-- FORMULA: n
-- FORMULA: k
-- FORMULA: \rho=|n-k|
-- FORMULA: \rho=1/2
def Node_D_rho_source_1_raw : String := "\\boxed{ \\rho = \\operatorname{dist}(n,\\mathbb N^+). }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho", "formula": 1, "location": "ES_46_RV6.md:323:D_rho:formula-1", "source": "\\boxed{ \\rho = \\operatorname{dist}(n,\\mathbb N^+). }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_source_1 (ctx : FormalContext) : Prop := (ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x})))))
def Node_D_rho_source_2_raw : String := "\\boxed{ 0\\le\\rho\\le\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho", "formula": 2, "location": "ES_46_RV6.md:323:D_rho:formula-2", "source": "\\boxed{ 0\\le\\rho\\le\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_source_2 (ctx : FormalContext) : Prop := ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))
def Node_D_rho_source_3_raw : String := "\\boxed{ n=k\\pm\\rho, \\qquad k\\in\\mathbb N^+, \\qquad 0\\le\\rho\\le\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho", "formula": 3, "location": "ES_46_RV6.md:323:D_rho:formula-3", "source": "\\boxed{ n=k\\pm\\rho, \\qquad k\\in\\mathbb N^+, \\qquad 0\\le\\rho\\le\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_source_3 (ctx : FormalContext) : Prop := ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))))
def Node_D_rho_source_4_raw : String := "\\boxed{ L(k,\\rho) = (k\\pm\\rho)\\lambda, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho", "formula": 4, "location": "ES_46_RV6.md:323:D_rho:formula-4", "source": "\\boxed{ L(k,\\rho) = (k\\pm\\rho)\\lambda, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_source_4 (ctx : FormalContext) : Prop := (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))
def Node_D_rho_source_5_raw : String := "\\boxed{ R_{\\rm VED}(k,\\rho) = \\frac{(k\\pm\\rho)\\lambda}{2\\pi}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho", "formula": 5, "location": "ES_46_RV6.md:323:D_rho:formula-5", "source": "\\boxed{ R_{\\rm VED}(k,\\rho) = \\frac{(k\\pm\\rho)\\lambda}{2\\pi}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_source_5 (ctx : FormalContext) : Prop := (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))
def Node_D_rho_source_6_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho", "formula": 6, "location": "ES_46_RV6.md:323:D_rho:formula-6", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "STATEMENT"}
def Node_D_rho_source_6_term (ctx : FormalContext) : ℝ := (ctx.rho)
def Node_D_rho_source_7_raw : String := "n"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho", "formula": 7, "location": "ES_46_RV6.md:323:D_rho:formula-7", "source": "n", "status": "FORMALIZED_TERM", "type": "Real", "role": "STATEMENT"}
def Node_D_rho_source_7_term (ctx : FormalContext) : ℝ := (ctx.n)
def Node_D_rho_source_8_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho", "formula": 8, "location": "ES_46_RV6.md:323:D_rho:formula-8", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "STATEMENT"}
def Node_D_rho_source_8_term (ctx : FormalContext) : ℕ := (ctx.k)
def Node_D_rho_source_9_raw : String := "\\rho=|n-k|"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho", "formula": 9, "location": "ES_46_RV6.md:323:D_rho:formula-9", "source": "\\rho=|n-k|", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_rho_source_9 (ctx : FormalContext) : Prop := (ctx.rho = (abs (ctx.n - (ctx.k : ℝ))))
def Node_D_rho_source_10_raw : String := "\\rho=1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho", "formula": 10, "location": "ES_46_RV6.md:323:D_rho:formula-10", "source": "\\rho=1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_rho_source_10 (ctx : FormalContext) : Prop := (ctx.rho = ((1 : ℝ) / (2 : ℝ)))
def Node_D_rho_source_declarations (ctx : FormalContext) : Prop := (Node_D_rho_source_1 ctx) ∧ (Node_D_rho_source_2 ctx) ∧ (Node_D_rho_source_3 ctx) ∧ (Node_D_rho_source_4 ctx) ∧ (Node_D_rho_source_5 ctx)
def Node_D_rho_source_steps (ctx : FormalContext) : Prop := (Node_D_rho_source_9 ctx) ∧ (Node_D_rho_source_10 ctx)
def Node_D_rho_clause_1 (ctx : FormalContext) : Prop := (ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x})))))
def Node_D_rho_clause_2 (ctx : FormalContext) : Prop := ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))
def Node_D_rho_clause_3 (ctx : FormalContext) : Prop := ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))))
def Node_D_rho_clause_4 (ctx : FormalContext) : Prop := (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))
def Node_D_rho_clause_5 (ctx : FormalContext) : Prop := (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))
def Node_D_rho (ctx : FormalContext) : Prop := (ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))
-- DEMUESTRA_ASSERTION: D_rho|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_mathcal_E_VED
-- SOURCE: ES_46_RV6.md:485
-- DEMUESTRA_SOURCE_PROSE: {"node": "D_mathcal_E_VED", "location": "ES_46_RV6.md:485", "source": "# 7. Completitud de $U_{\\rm VED}$\n\nLa parametrización anterior es exhaustiva.\n\nPara todo $n\\in\\mathbb R^+$ finito existe algún\n\n$$\nk\\in\\mathbb N^+\n$$\n\ny algún\n\n$$\n\\rho\\in\\left[0,\\frac12\\right]\n$$\n\ntales que\n\n$$\nn=k\\pm\\rho.\n$$\n\nPor tanto no existe un cierre finito fuera de esta clasificación.\n\n$D_{\\mathcal E_{\\rm VED}}$ — El conjunto de parámetros de cierre estable\nse define a partir del dominio declarado y del criterio de desfase nulo:\n\n$$\n\\mathcal E_{\\rm VED}\n=\\{(k,\\rho):k\\in\\mathbb N^+,\\rho\\in[0,1/2],\\rho=0\\}.\n$$", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: k\in\mathbb N^+
-- FORMULA: \rho\in\left[0,\frac12\right]
-- FORMULA: n=k\pm\rho.
-- FORMULA: \mathcal E_{\rm VED} =\{(k,\rho):k\in\mathbb N^+,\rho\in[0,1/2],\rho=0\}.
-- FORMULA: U_{\rm VED}
-- FORMULA: n\in\mathbb R^+
def Node_D_mathcal_E_VED_source_1_raw : String := "k\\in\\mathbb N^+"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_mathcal_E_VED", "formula": 1, "location": "ES_46_RV6.md:485:D_mathcal_E_VED:formula-1", "source": "k\\in\\mathbb N^+", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_mathcal_E_VED_source_1 (ctx : FormalContext) : Prop := (ctx.k ∈ {x : ℕ | 0 < x})
def Node_D_mathcal_E_VED_source_2_raw : String := "\\rho\\in\\left[0,\\frac12\\right]"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_mathcal_E_VED", "formula": 2, "location": "ES_46_RV6.md:485:D_mathcal_E_VED:formula-2", "source": "\\rho\\in\\left[0,\\frac12\\right]", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_mathcal_E_VED_source_2 (ctx : FormalContext) : Prop := (ctx.rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))
def Node_D_mathcal_E_VED_source_3_raw : String := "n=k\\pm\\rho."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_mathcal_E_VED", "formula": 3, "location": "ES_46_RV6.md:485:D_mathcal_E_VED:formula-3", "source": "n=k\\pm\\rho.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_mathcal_E_VED_source_3 (ctx : FormalContext) : Prop := (((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho))))
def Node_D_mathcal_E_VED_source_4_raw : String := "\\mathcal E_{\\rm VED} =\\{(k,\\rho):k\\in\\mathbb N^+,\\rho\\in[0,1/2],\\rho=0\\}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_mathcal_E_VED", "formula": 4, "location": "ES_46_RV6.md:485:D_mathcal_E_VED:formula-4", "source": "\\mathcal E_{\\rm VED} =\\{(k,\\rho):k\\in\\mathbb N^+,\\rho\\in[0,1/2],\\rho=0\\}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_mathcal_E_VED_source_4 (ctx : FormalContext) : Prop := (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho = 0)) ∧ (x = ((k, rho)))}))
def Node_D_mathcal_E_VED_source_5_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_mathcal_E_VED", "formula": 5, "location": "ES_46_RV6.md:485:D_mathcal_E_VED:formula-5", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "STATEMENT"}
def Node_D_mathcal_E_VED_source_5_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_D_mathcal_E_VED_source_6_raw : String := "n\\in\\mathbb R^+"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_mathcal_E_VED", "formula": 6, "location": "ES_46_RV6.md:485:D_mathcal_E_VED:formula-6", "source": "n\\in\\mathbb R^+", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_mathcal_E_VED_source_6 (ctx : FormalContext) : Prop := (ctx.n ∈ {x : ℝ | 0 < x})
def Node_D_mathcal_E_VED_source_declarations (ctx : FormalContext) : Prop := (Node_D_mathcal_E_VED_source_1 ctx) ∧ (Node_D_mathcal_E_VED_source_2 ctx) ∧ (Node_D_mathcal_E_VED_source_3 ctx) ∧ (Node_D_mathcal_E_VED_source_4 ctx)
def Node_D_mathcal_E_VED_source_steps (ctx : FormalContext) : Prop := (Node_D_mathcal_E_VED_source_6 ctx)
def Node_D_mathcal_E_VED_clause_1 (ctx : FormalContext) : Prop := (ctx.k ∈ {x : ℕ | 0 < x})
def Node_D_mathcal_E_VED_clause_2 (ctx : FormalContext) : Prop := (ctx.rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))
def Node_D_mathcal_E_VED_clause_3 (ctx : FormalContext) : Prop := (((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho))))
def Node_D_mathcal_E_VED_clause_4 (ctx : FormalContext) : Prop := (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho = 0)) ∧ (x = ((k, rho)))}))
def Node_D_mathcal_E_VED (ctx : FormalContext) : Prop := (ctx.k ∈ {x : ℕ | 0 < x}) ∧ (ctx.rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho = 0)) ∧ (x = ((k, rho)))}))
-- DEMUESTRA_ASSERTION: D_mathcal_E_VED|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_Particion
-- SOURCE: ES_46_RV6.md:549
-- DEMUESTRA_SOURCE_PROSE: {"node": "D_Particion", "location": "ES_46_RV6.md:549", "source": "$D_{\\rm Particion}$ — Los cierres finitos admisibles y su sector no estable\nse expresan mediante el dominio y el criterio ya establecidos:\n\n$$\nU_{\\rm VED}^{\\rm cerrado}\n=\\{(k,\\rho):k\\in\\mathbb N^+,\\rho\\in[0,1/2]\\}.\n$$\n\n$$\n\\mathcal I_{\\rm VED}\n=\\{(k,\\rho):k\\in\\mathbb N^+,\\rho\\in[0,1/2],\\rho>0\\}.\n$$", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: U_{\rm VED}^{\rm cerrado} =\{(k,\rho):k\in\mathbb N^+,\rho\in[0,1/2]\}.
-- FORMULA: \mathcal I_{\rm VED} =\{(k,\rho):k\in\mathbb N^+,\rho\in[0,1/2],\rho>0\}.
def Node_D_Particion_source_1_raw : String := "U_{\\rm VED}^{\\rm cerrado} =\\{(k,\\rho):k\\in\\mathbb N^+,\\rho\\in[0,1/2]\\}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Particion", "formula": 1, "location": "ES_46_RV6.md:549:D_Particion:formula-1", "source": "U_{\\rm VED}^{\\rm cerrado} =\\{(k,\\rho):k\\in\\mathbb N^+,\\rho\\in[0,1/2]\\}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Particion_source_1 (ctx : FormalContext) : Prop := (ctx.U_VED_cerrado = ({x | ∃ k : ℕ, ∃ rho : ℝ, ((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (x = ((k, rho)))}))
def Node_D_Particion_source_2_raw : String := "\\mathcal I_{\\rm VED} =\\{(k,\\rho):k\\in\\mathbb N^+,\\rho\\in[0,1/2],\\rho>0\\}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Particion", "formula": 2, "location": "ES_46_RV6.md:549:D_Particion:formula-2", "source": "\\mathcal I_{\\rm VED} =\\{(k,\\rho):k\\in\\mathbb N^+,\\rho\\in[0,1/2],\\rho>0\\}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Particion_source_2 (ctx : FormalContext) : Prop := (ctx.mathcal_I_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho > 0)) ∧ (x = ((k, rho)))}))
def Node_D_Particion_source_declarations (ctx : FormalContext) : Prop := (Node_D_Particion_source_1 ctx) ∧ (Node_D_Particion_source_2 ctx)
def Node_D_Particion_clause_1 (ctx : FormalContext) : Prop := (ctx.U_VED_cerrado = ({x | ∃ k : ℕ, ∃ rho : ℝ, ((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (x = ((k, rho)))}))
def Node_D_Particion_clause_2 (ctx : FormalContext) : Prop := (ctx.mathcal_I_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho > 0)) ∧ (x = ((k, rho)))}))
def Node_D_Particion (ctx : FormalContext) : Prop := (ctx.U_VED_cerrado = ({x | ∃ k : ℕ, ∃ rho : ℝ, ((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (x = ((k, rho)))})) ∧ (ctx.mathcal_I_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho > 0)) ∧ (x = ((k, rho)))}))
-- DEMUESTRA_ASSERTION: D_Particion|COMPLETA|NO_APLICA

-- FORMAL_NODE: A_7
-- SOURCE: ES_46_RV6.md:596
-- DEMUESTRA_SOURCE_PROSE: {"node": "A_7", "location": "ES_46_RV6.md:596", "source": "# 8. Precedente topológico: $U_{\\rm VED}\\leftrightarrow U_{\\rm Sch}$\n\nEl resultado geométrico de relación de radios, desarrollado con mayor detalle en el Documento 7, se reproduce aquí como antecedente interno del marco.\n\n$A_7$ — En dicho documento se establece la constante geométrica\n\n$$\n\\boxed{\n\\tilde N\n=\nR_{\\rm VED}R_{\\rm Sch}.\n}\n$$\n\nPor tanto,\n\n$$\n\\boxed{\nR_{\\rm Sch}\n=\n\\frac{\\tilde N}{R_{\\rm VED}},\n}\n$$\n\ny\n\n$$\n\\boxed{\nR_{\\rm VED}\n=\n\\frac{\\tilde N}{R_{\\rm Sch}}.\n}\n$$\n\nPara radios positivos, la aplicación\n\n$$\n\\Phi_{\\tilde N}:\nR_{\\rm VED}\n\\mapsto\n\\frac{\\tilde N}{R_{\\rm VED}}\n$$\n\nes biyectiva, continua y su inversa tiene la misma forma. En ese dominio,", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ \tilde N = R_{\rm VED}R_{\rm Sch}. }
-- FORMULA: \boxed{ R_{\rm Sch} = \frac{\tilde N}{R_{\rm VED}}, }
-- FORMULA: \boxed{ R_{\rm VED} = \frac{\tilde N}{R_{\rm Sch}}. }
-- FORMULA: \Phi_{\tilde N}: R_{\rm VED} \mapsto \frac{\tilde N}{R_{\rm VED}}
-- FORMULA: U_{\rm VED}\leftrightarrow U_{\rm Sch}
-- DEMUESTRA_PROSE_CONTRACT: {"node": "A_7", "source": "biyectiva, continua y con inversa", "status": "FORMALIZED_PROP"}
def Node_A_7_source_1_raw : String := "\\boxed{ \\tilde N = R_{\\rm VED}R_{\\rm Sch}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "A_7", "formula": 1, "location": "ES_46_RV6.md:596:A_7:formula-1", "source": "\\boxed{ \\tilde N = R_{\\rm VED}R_{\\rm Sch}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_A_7_source_1 (ctx : FormalContext) : Prop := (ctx.tilde_N = (ctx.R_VED * ctx.R_Sch))
def Node_A_7_source_2_raw : String := "\\boxed{ R_{\\rm Sch} = \\frac{\\tilde N}{R_{\\rm VED}}, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "A_7", "formula": 2, "location": "ES_46_RV6.md:596:A_7:formula-2", "source": "\\boxed{ R_{\\rm Sch} = \\frac{\\tilde N}{R_{\\rm VED}}, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_A_7_source_2 (ctx : FormalContext) : Prop := (ctx.R_Sch = (ctx.tilde_N / ctx.R_VED))
def Node_A_7_source_3_raw : String := "\\boxed{ R_{\\rm VED} = \\frac{\\tilde N}{R_{\\rm Sch}}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "A_7", "formula": 3, "location": "ES_46_RV6.md:596:A_7:formula-3", "source": "\\boxed{ R_{\\rm VED} = \\frac{\\tilde N}{R_{\\rm Sch}}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_A_7_source_3 (ctx : FormalContext) : Prop := (ctx.R_VED = (ctx.tilde_N / ctx.R_Sch))
def Node_A_7_source_4_raw : String := "\\Phi_{\\tilde N}: R_{\\rm VED} \\mapsto \\frac{\\tilde N}{R_{\\rm VED}}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "A_7", "formula": 4, "location": "ES_46_RV6.md:596:A_7:formula-4", "source": "\\Phi_{\\tilde N}: R_{\\rm VED} \\mapsto \\frac{\\tilde N}{R_{\\rm VED}}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_A_7_source_4 (ctx : FormalContext) : Prop := ((ctx.Phi_tilde_N_fn_1 ctx.R_VED = ctx.tilde_N / ctx.R_VED))
def Node_A_7_source_5_raw : String := "U_{\\rm VED}\\leftrightarrow U_{\\rm Sch}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "A_7", "formula": 5, "location": "ES_46_RV6.md:596:A_7:formula-5", "source": "U_{\\rm VED}\\leftrightarrow U_{\\rm Sch}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_A_7_source_5 (ctx : FormalContext) : Prop := (ctx.Corresponds_Set_Real_to_Set_Real ctx.U_VED ctx.U_Sch)
def Node_A_7_source_declarations (ctx : FormalContext) : Prop := (Node_A_7_source_1 ctx) ∧ (Node_A_7_source_2 ctx) ∧ (Node_A_7_source_3 ctx) ∧ (Node_A_7_source_4 ctx)
def Node_A_7_source_steps (ctx : FormalContext) : Prop := (Node_A_7_source_5 ctx)
def Node_A_7_clause_1 (ctx : FormalContext) : Prop := (ctx.tilde_N = (ctx.R_VED * ctx.R_Sch))
def Node_A_7_clause_2 (ctx : FormalContext) : Prop := (ctx.R_Sch = (ctx.tilde_N / ctx.R_VED))
def Node_A_7_clause_3 (ctx : FormalContext) : Prop := (ctx.R_VED = (ctx.tilde_N / ctx.R_Sch))
def Node_A_7_clause_4 (ctx : FormalContext) : Prop := ((ctx.Phi_tilde_N_fn_1 ctx.R_VED = ctx.tilde_N / ctx.R_VED))
def Node_A_7_clause_5 (ctx : FormalContext) : Prop := (Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))
def Node_A_7 (ctx : FormalContext) : Prop := (ctx.tilde_N = (ctx.R_VED * ctx.R_Sch)) ∧ (ctx.R_Sch = (ctx.tilde_N / ctx.R_VED)) ∧ (ctx.R_VED = (ctx.tilde_N / ctx.R_Sch)) ∧ ((ctx.Phi_tilde_N_fn_1 ctx.R_VED = ctx.tilde_N / ctx.R_VED)) ∧ (Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))
-- DEMUESTRA_ASSERTION: A_7|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_Rim
-- SOURCE: ES_46_RV6.md:1263
-- DEMUESTRA_SOURCE_PROSE: {"node": "D_Rim", "location": "ES_46_RV6.md:1263", "source": "# 13. Definición del espacio $U_{\\rm Rim}$\n\n$D_{\\rm Rim}$ — Sea\n\n$$\nz=a\\pm ib\n$$\n\nla coordenada compleja en la que se estudia la función zeta de Riemann.\n\nLa función zeta se define inicialmente por\n\n$$\n\\zeta(s)\n=\n\\sum_{n=1}^{\\infty}\\frac1{n^s}\n$$\n\npara $\\Re(s)>1$ y se prolonga meromórficamente al plano complejo, con un polo simple en\n\n$$\n\\boxed{s=1.}\n$$\n\nSus ceros se dividen en dos sectores.\n\n## 13.1. Sector trivial\n\nLos ceros triviales son\n\n$$\n\\boxed{\nZ_{\\rm Rim}^{\\rm triv}\n=\n\\{-2,-4,-6,\\ldots\\}\n=\n\\{-2m:m\\in\\mathbb N^+\\}.\n}\n$$\n\nEste sector está completamente enumerado y no constituye el objeto de la Hipótesis de Riemann.\n\n## 13.2. Sector no trivial\n\nDefinimos\n\n$$\n\\boxed{\nZ_{\\rm Rim}^{\\rm nt}\n=\n\\{\nz\\in\\mathbb C:\n\\zeta(z)=0,\n\\;\n0<\\Re(z)<1\n\\}.\n}\n$$\n\nPor tanto, para un cero no trivial arbitrario,\n\n$$\n\\boxed{\nz=a\\pm ib,\n\\qquad\n0<a<1.\n}\n$$\n\nLa ecuación funcional de Riemann introduce la simetría transversal\n\n$$\na\n\\longleftrightarrow\n1-a.\n$$\n\nEl eje fijo de esta reflexión es\n\n$$\n\\boxed{\na=\\frac12.\n}\n$$\n\n---", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: z=a\pm ib
-- FORMULA: \zeta(s) = \sum_{n=1}^{\infty}\frac1{n^s}
-- FORMULA: \boxed{s=1.}
-- FORMULA: \boxed{ Z_{\rm Rim}^{\rm triv} = \{-2,-4,-6,\ldots\} = \{-2m:m\in\mathbb N^+\}. }
-- FORMULA: \boxed{ Z_{\rm Rim}^{\rm nt} = \{ z\in\mathbb C: \zeta(z)=0, \; 0<\Re(z)<1 \}. }
-- FORMULA: \boxed{ z=a\pm ib, \qquad 0<a<1. }
-- FORMULA: a \longleftrightarrow 1-a.
-- FORMULA: \boxed{ a=\frac12. }
-- FORMULA: U_{\rm Rim}
-- FORMULA: \Re(s)>1
def Node_D_Rim_source_1_raw : String := "z=a\\pm ib"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 1, "location": "ES_46_RV6.md:1263:D_Rim:formula-1", "source": "z=a\\pm ib", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Rim_source_1 (ctx : FormalContext) : Prop := (((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib))))
def Node_D_Rim_source_2_raw : String := "\\zeta(s) = \\sum_{n=1}^{\\infty}\\frac1{n^s}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 2, "location": "ES_46_RV6.md:1263:D_Rim:formula-2", "source": "\\zeta(s) = \\sum_{n=1}^{\\infty}\\frac1{n^s}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Rim_source_2 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.s) = ctx.InfiniteSum_Nat_Complex (1) (fun n : ℕ => ((1 : ℂ) / ctx.Pow_Complex ((n : ℂ)) (ctx.s) : ℂ)))
def Node_D_Rim_source_3_raw : String := "\\boxed{s=1.}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 3, "location": "ES_46_RV6.md:1263:D_Rim:formula-3", "source": "\\boxed{s=1.}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Rim_source_3 (ctx : FormalContext) : Prop := (ctx.s = 1)
def Node_D_Rim_source_4_raw : String := "\\boxed{ Z_{\\rm Rim}^{\\rm triv} = \\{-2,-4,-6,\\ldots\\} = \\{-2m:m\\in\\mathbb N^+\\}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 4, "location": "ES_46_RV6.md:1263:D_Rim:formula-4", "source": "\\boxed{ Z_{\\rm Rim}^{\\rm triv} = \\{-2,-4,-6,\\ldots\\} = \\{-2m:m\\in\\mathbb N^+\\}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Rim_source_4 (ctx : FormalContext) : Prop := (ctx.Z_Rim_triv = ({x | ∃ m : ℕ, (m ∈ {x : ℕ | 0 < x}) ∧ (x = ((-2 * (m : ℤ))))}))
def Node_D_Rim_source_5_raw : String := "\\boxed{ Z_{\\rm Rim}^{\\rm nt} = \\{ z\\in\\mathbb C: \\zeta(z)=0, \\; 0<\\Re(z)<1 \\}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 5, "location": "ES_46_RV6.md:1263:D_Rim:formula-5", "source": "\\boxed{ Z_{\\rm Rim}^{\\rm nt} = \\{ z\\in\\mathbb C: \\zeta(z)=0, \\; 0<\\Re(z)<1 \\}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Rim_source_5 (ctx : FormalContext) : Prop := (ctx.Z_Rim_nt = ({z | ((z ∈ (Set.univ : Set ℂ)) ∧ ((ctx.zeta z) = 0)) ∧ ((0 < (Complex.re z)) ∧ ((Complex.re z) < 1))}))
def Node_D_Rim_source_6_raw : String := "\\boxed{ z=a\\pm ib, \\qquad 0<a<1. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 6, "location": "ES_46_RV6.md:1263:D_Rim:formula-6", "source": "\\boxed{ z=a\\pm ib, \\qquad 0<a<1. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Rim_source_6 (ctx : FormalContext) : Prop := ((((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib)))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)))
def Node_D_Rim_source_7_raw : String := "a \\longleftrightarrow 1-a."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 7, "location": "ES_46_RV6.md:1263:D_Rim:formula-7", "source": "a \\longleftrightarrow 1-a.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_Rim_source_7 (ctx : FormalContext) : Prop := (ctx.Corresponds_Real_to_Real ctx.a ((1 : ℝ) - ctx.a))
def Node_D_Rim_source_8_raw : String := "\\boxed{ a=\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 8, "location": "ES_46_RV6.md:1263:D_Rim:formula-8", "source": "\\boxed{ a=\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "CONTEXTUAL_RESULT"}
def Node_D_Rim_source_8 (ctx : FormalContext) : Prop := (ctx.a = ((1 : ℝ) / (2 : ℝ)))
def Node_D_Rim_source_9_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 9, "location": "ES_46_RV6.md:1263:D_Rim:formula-9", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "STATEMENT"}
def Node_D_Rim_source_9_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_D_Rim_source_10_raw : String := "\\Re(s)>1"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 10, "location": "ES_46_RV6.md:1263:D_Rim:formula-10", "source": "\\Re(s)>1", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_Rim_source_10 (ctx : FormalContext) : Prop := ((Complex.re ctx.s) > 1)
def Node_D_Rim_source_declarations (ctx : FormalContext) : Prop := (Node_D_Rim_source_1 ctx) ∧ (Node_D_Rim_source_2 ctx) ∧ (Node_D_Rim_source_3 ctx) ∧ (Node_D_Rim_source_4 ctx) ∧ (Node_D_Rim_source_5 ctx) ∧ (Node_D_Rim_source_6 ctx)
def Node_D_Rim_source_steps (ctx : FormalContext) : Prop := (Node_D_Rim_source_7 ctx) ∧ (Node_D_Rim_source_8 ctx) ∧ (Node_D_Rim_source_10 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: D_Rim|8|CONTEXTUAL_RESULT|7|-|NO_CERTIFICADO
def Node_D_Rim_clause_1 (ctx : FormalContext) : Prop := (((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib))))
def Node_D_Rim_clause_2 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.s) = ctx.InfiniteSum_Nat_Complex (1) (fun n : ℕ => ((1 : ℂ) / ctx.Pow_Complex ((n : ℂ)) (ctx.s) : ℂ)))
def Node_D_Rim_clause_3 (ctx : FormalContext) : Prop := (ctx.s = 1)
def Node_D_Rim_clause_4 (ctx : FormalContext) : Prop := (ctx.Z_Rim_triv = ({x | ∃ m : ℕ, (m ∈ {x : ℕ | 0 < x}) ∧ (x = ((-2 * (m : ℤ))))}))
def Node_D_Rim_clause_5 (ctx : FormalContext) : Prop := (ctx.Z_Rim_nt = ({z | ((z ∈ (Set.univ : Set ℂ)) ∧ ((ctx.zeta z) = 0)) ∧ ((0 < (Complex.re z)) ∧ ((Complex.re z) < 1))}))
def Node_D_Rim_clause_6 (ctx : FormalContext) : Prop := ((((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib)))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)))
def Node_D_Rim (ctx : FormalContext) : Prop := (((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib)))) ∧ ((ctx.zeta ctx.s) = ctx.InfiniteSum_Nat_Complex (1) (fun n : ℕ => ((1 : ℂ) / ctx.Pow_Complex ((n : ℂ)) (ctx.s) : ℂ))) ∧ (ctx.s = 1) ∧ (ctx.Z_Rim_triv = ({x | ∃ m : ℕ, (m ∈ {x : ℕ | 0 < x}) ∧ (x = ((-2 * (m : ℤ))))})) ∧ (ctx.Z_Rim_nt = ({z | ((z ∈ (Set.univ : Set ℂ)) ∧ ((ctx.zeta z) = 0)) ∧ ((0 < (Complex.re z)) ∧ ((Complex.re z) < 1))})) ∧ ((((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib)))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)))
-- DEMUESTRA_ASSERTION: D_Rim|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_rho_R
-- SOURCE: ES_46_RV6.md:1354
-- DEMUESTRA_SOURCE_PROSE: {"node": "D_rho_R", "location": "ES_46_RV6.md:1354", "source": "# 14. Partición topológica de $U_{\\rm Rim}$\n\nPara el sector no trivial definimos la distancia transversal al eje de simetría:\n\n$$\n\\boxed{\nD_{\\rho_R}:\n\\qquad\n\\rho_R\n=\n\\left|\na-\\frac12\n\\right|.\n}\n$$\n\nComo\n\n$$\n0<a<1,\n$$\n\nse cumple\n\n$$\n\\boxed{\n0\\le\\rho_R<\\frac12,\n}\n$$\n\nalcanzándose $\\rho_R=1/2$ únicamente como frontera del strip.\n\nIntroduciendo una rama $\\varepsilon=\\pm1$,\n\n$$\n\\boxed{\na\n=\n\\frac12+\\varepsilon\\rho_R.\n}\n$$\n\nPor tanto todo punto del strip crítico puede escribirse como\n\n$$\n\\boxed{\nz_{\\varepsilon,\\pm}\n=\n\\frac12\n+\n\\varepsilon\\rho_R\n\\pm ib.\n}\n$$\n\nLa transformación transversal tiene inversa explícita:\n\n$$\n\\boxed{\n\\rho_R\n=\n\\left|\n\\Re(z)-\\frac12\n\\right|.\n}\n$$\n\n---", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ D_{\rho_R}: \qquad \rho_R = \left| a-\frac12 \right|. }
-- FORMULA: 0<a<1,
-- FORMULA: \boxed{ 0\le\rho_R<\frac12, }
-- FORMULA: \boxed{ a = \frac12+\varepsilon\rho_R. }
-- FORMULA: \boxed{ z_{\varepsilon,\pm} = \frac12 + \varepsilon\rho_R \pm ib. }
-- FORMULA: \boxed{ \rho_R = \left| \Re(z)-\frac12 \right|. }
-- FORMULA: U_{\rm Rim}
-- FORMULA: \rho_R=1/2
-- FORMULA: \varepsilon=\pm1
def Node_D_rho_R_source_1_raw : String := "\\boxed{ D_{\\rho_R}: \\qquad \\rho_R = \\left| a-\\frac12 \\right|. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 1, "location": "ES_46_RV6.md:1354:D_rho_R:formula-1", "source": "\\boxed{ D_{\\rho_R}: \\qquad \\rho_R = \\left| a-\\frac12 \\right|. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_R_source_1 (ctx : FormalContext) : Prop := (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))))
def Node_D_rho_R_source_2_raw : String := "0<a<1,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 2, "location": "ES_46_RV6.md:1354:D_rho_R:formula-2", "source": "0<a<1,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_R_source_2 (ctx : FormalContext) : Prop := ((0 < ctx.a) ∧ (ctx.a < 1))
def Node_D_rho_R_source_3_raw : String := "\\boxed{ 0\\le\\rho_R<\\frac12, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 3, "location": "ES_46_RV6.md:1354:D_rho_R:formula-3", "source": "\\boxed{ 0\\le\\rho_R<\\frac12, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_R_source_3 (ctx : FormalContext) : Prop := ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ))))
def Node_D_rho_R_source_4_raw : String := "\\boxed{ a = \\frac12+\\varepsilon\\rho_R. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 4, "location": "ES_46_RV6.md:1354:D_rho_R:formula-4", "source": "\\boxed{ a = \\frac12+\\varepsilon\\rho_R. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_R_source_4 (ctx : FormalContext) : Prop := (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)))
def Node_D_rho_R_source_5_raw : String := "\\boxed{ z_{\\varepsilon,\\pm} = \\frac12 + \\varepsilon\\rho_R \\pm ib. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 5, "location": "ES_46_RV6.md:1354:D_rho_R:formula-5", "source": "\\boxed{ z_{\\varepsilon,\\pm} = \\frac12 + \\varepsilon\\rho_R \\pm ib. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_R_source_5 (ctx : FormalContext) : Prop := (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib))))
def Node_D_rho_R_source_6_raw : String := "\\boxed{ \\rho_R = \\left| \\Re(z)-\\frac12 \\right|. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 6, "location": "ES_46_RV6.md:1354:D_rho_R:formula-6", "source": "\\boxed{ \\rho_R = \\left| \\Re(z)-\\frac12 \\right|. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_R_source_6 (ctx : FormalContext) : Prop := (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))
def Node_D_rho_R_source_7_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 7, "location": "ES_46_RV6.md:1354:D_rho_R:formula-7", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "STATEMENT"}
def Node_D_rho_R_source_7_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_D_rho_R_source_8_raw : String := "\\rho_R=1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 8, "location": "ES_46_RV6.md:1354:D_rho_R:formula-8", "source": "\\rho_R=1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_rho_R_source_8 (ctx : FormalContext) : Prop := (ctx.rho_R = ((1 : ℝ) / (2 : ℝ)))
def Node_D_rho_R_source_9_raw : String := "\\varepsilon=\\pm1"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 9, "location": "ES_46_RV6.md:1354:D_rho_R:formula-9", "source": "\\varepsilon=\\pm1", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_rho_R_source_9 (ctx : FormalContext) : Prop := (((ctx.varepsilon) = (1) ∨ (ctx.varepsilon) = (-(1))))
def Node_D_rho_R_source_declarations (ctx : FormalContext) : Prop := (Node_D_rho_R_source_1 ctx) ∧ (Node_D_rho_R_source_2 ctx) ∧ (Node_D_rho_R_source_3 ctx) ∧ (Node_D_rho_R_source_4 ctx) ∧ (Node_D_rho_R_source_5 ctx) ∧ (Node_D_rho_R_source_6 ctx)
def Node_D_rho_R_source_steps (ctx : FormalContext) : Prop := (Node_D_rho_R_source_8 ctx) ∧ (Node_D_rho_R_source_9 ctx)
def Node_D_rho_R_clause_1 (ctx : FormalContext) : Prop := (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))))
def Node_D_rho_R_clause_2 (ctx : FormalContext) : Prop := ((0 < ctx.a) ∧ (ctx.a < 1))
def Node_D_rho_R_clause_3 (ctx : FormalContext) : Prop := ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ))))
def Node_D_rho_R_clause_4 (ctx : FormalContext) : Prop := (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)))
def Node_D_rho_R_clause_5 (ctx : FormalContext) : Prop := (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib))))
def Node_D_rho_R_clause_6 (ctx : FormalContext) : Prop := (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))
def Node_D_rho_R (ctx : FormalContext) : Prop := (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))
-- DEMUESTRA_ASSERTION: D_rho_R|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_f
-- SOURCE: ES_46_RV6.md:1423
-- DEMUESTRA_SOURCE_PROSE: {"node": "D_f", "location": "ES_46_RV6.md:1423", "source": "## 14.1. Isomorfismo global previo entre los universos topológicos\n\nLa correspondencia no se limita a los valores estables ni se construye para\nseleccionar ceros. Actúa sobre el conjunto completo de valores transversales\nadmisibles de ambos universos.\n\n$D_f$ — Sean\n\n$$\nU_{\\rm VED}^{\\rho}\n=\n\\left\\{x:\\rho_{\\rm VED}(x)\\in[0,\\tfrac12]\\right\\}\n$$\n\ny\n\n$$\nU_{\\rm Rim}^{\\rho}\n=\n\\left\\{z:\\rho_R(z)\\in[0,\\tfrac12]\\right\\}.\n$$\n\nDefinimos la transformación global\n\n$$\n\\boxed{\nf:U_{\\rm VED}^{\\rho}\\longrightarrow U_{\\rm Rim}^{\\rho}\n}\n$$\n\ncomo la transformación del valor topológico completo cuya coordenada\ntransversal es $\\rho$. Esta definición no impone una fórmula anticipada para\n$a=\\Re(z)$ ni presupone $a=1/2$.", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: U_{\rm VED}^{\rho} = \left\{x:\rho_{\rm VED}(x)\in[0,\tfrac12]\right\}
-- FORMULA: U_{\rm Rim}^{\rho} = \left\{z:\rho_R(z)\in[0,\tfrac12]\right\}.
-- FORMULA: \boxed{ f:U_{\rm VED}^{\rho}\longrightarrow U_{\rm Rim}^{\rho} }
-- FORMULA: \rho
-- FORMULA: a=\Re(z)
-- FORMULA: a=1/2
def Node_D_f_source_1_raw : String := "U_{\\rm VED}^{\\rho} = \\left\\{x:\\rho_{\\rm VED}(x)\\in[0,\\tfrac12]\\right\\}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_f", "formula": 1, "location": "ES_46_RV6.md:1423:D_f:formula-1", "source": "U_{\\rm VED}^{\\rho} = \\left\\{x:\\rho_{\\rm VED}(x)\\in[0,\\tfrac12]\\right\\}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_f_source_1 (ctx : FormalContext) : Prop := (ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))}))
def Node_D_f_source_2_raw : String := "U_{\\rm Rim}^{\\rho} = \\left\\{z:\\rho_R(z)\\in[0,\\tfrac12]\\right\\}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_f", "formula": 2, "location": "ES_46_RV6.md:1423:D_f:formula-2", "source": "U_{\\rm Rim}^{\\rho} = \\left\\{z:\\rho_R(z)\\in[0,\\tfrac12]\\right\\}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_f_source_2 (ctx : FormalContext) : Prop := (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))}))
def Node_D_f_source_3_raw : String := "\\boxed{ f:U_{\\rm VED}^{\\rho}\\longrightarrow U_{\\rm Rim}^{\\rho} }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_f", "formula": 3, "location": "ES_46_RV6.md:1423:D_f:formula-3", "source": "\\boxed{ f:U_{\\rm VED}^{\\rho}\\longrightarrow U_{\\rm Rim}^{\\rho} }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_f_source_3 (ctx : FormalContext) : Prop := (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate))
def Node_D_f_source_4_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_f", "formula": 4, "location": "ES_46_RV6.md:1423:D_f:formula-4", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "STATEMENT"}
def Node_D_f_source_4_term (ctx : FormalContext) : ℝ := (ctx.rho)
def Node_D_f_source_5_raw : String := "a=\\Re(z)"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_f", "formula": 5, "location": "ES_46_RV6.md:1423:D_f:formula-5", "source": "a=\\Re(z)", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_f_source_5 (ctx : FormalContext) : Prop := (ctx.a = (Complex.re ctx.z))
def Node_D_f_source_6_raw : String := "a=1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_f", "formula": 6, "location": "ES_46_RV6.md:1423:D_f:formula-6", "source": "a=1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_f_source_6 (ctx : FormalContext) : Prop := (ctx.a = ((1 : ℝ) / (2 : ℝ)))
def Node_D_f_source_declarations (ctx : FormalContext) : Prop := (Node_D_f_source_1 ctx) ∧ (Node_D_f_source_2 ctx) ∧ (Node_D_f_source_3 ctx)
def Node_D_f_source_steps (ctx : FormalContext) : Prop := (Node_D_f_source_5 ctx) ∧ (Node_D_f_source_6 ctx)
def Node_D_f_clause_1 (ctx : FormalContext) : Prop := (ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))}))
def Node_D_f_clause_2 (ctx : FormalContext) : Prop := (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))}))
def Node_D_f_clause_3 (ctx : FormalContext) : Prop := (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate))
def Node_D_f (ctx : FormalContext) : Prop := (ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate))
-- DEMUESTRA_ASSERTION: D_f|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_fInv
-- SOURCE: ES_46_RV6.md:1451
-- DEMUESTRA_SOURCE_PROSE: {"node": "D_fInv", "location": "ES_46_RV6.md:1451", "source": "$D_{fInv}$ — Definimos la transformación inversa\n\n$$\n\\boxed{\nf^{-1}:U_{\\rm Rim}^{\\rho}\\longrightarrow U_{\\rm VED}^{\\rho}.\n}\n$$\n\nPara todo valor de ambos universos se exige\n\n$$\n\\boxed{\nf^{-1}(f(x))=x,\n\\qquad\nf(f^{-1}(z))=z.\n}\n$$", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ f^{-1}:U_{\rm Rim}^{\rho}\longrightarrow U_{\rm VED}^{\rho}. }
-- FORMULA: \boxed{ f^{-1}(f(x))=x, \qquad f(f^{-1}(z))=z. }
def Node_D_fInv_source_1_raw : String := "\\boxed{ f^{-1}:U_{\\rm Rim}^{\\rho}\\longrightarrow U_{\\rm VED}^{\\rho}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_fInv", "formula": 1, "location": "ES_46_RV6.md:1451:D_fInv:formula-1", "source": "\\boxed{ f^{-1}:U_{\\rm Rim}^{\\rho}\\longrightarrow U_{\\rm VED}^{\\rho}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_fInv_source_1 (ctx : FormalContext) : Prop := ((∀ x_map : ℂ, x_map ∈ ctx.U_Rim_rho → (ctx.f_inv_fn_1 x_map) ∈ ctx.U_VED_rho))
def Node_D_fInv_source_2_raw : String := "\\boxed{ f^{-1}(f(x))=x, \\qquad f(f^{-1}(z))=z. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_fInv", "formula": 2, "location": "ES_46_RV6.md:1451:D_fInv:formula-2", "source": "\\boxed{ f^{-1}(f(x))=x, \\qquad f(f^{-1}(z))=z. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_fInv_source_2 (ctx : FormalContext) : Prop := ((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.f_inv_fn_1 (ctx.f_fn_1 x_all)) = x_all)) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.f_fn_1 (ctx.f_inv_fn_1 z_all)) = z_all)))
def Node_D_fInv_source_declarations (ctx : FormalContext) : Prop := (Node_D_fInv_source_1 ctx) ∧ (Node_D_fInv_source_2 ctx)
def Node_D_fInv_clause_1 (ctx : FormalContext) : Prop := ((∀ x_map : ℂ, x_map ∈ ctx.U_Rim_rho → (ctx.f_inv_fn_1 x_map) ∈ ctx.U_VED_rho))
def Node_D_fInv_clause_2 (ctx : FormalContext) : Prop := ((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.f_inv_fn_1 (ctx.f_fn_1 x_all)) = x_all)) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.f_fn_1 (ctx.f_inv_fn_1 z_all)) = z_all)))
def Node_D_fInv (ctx : FormalContext) : Prop := ((∀ x_map : ℂ, x_map ∈ ctx.U_Rim_rho → (ctx.f_inv_fn_1 x_map) ∈ ctx.U_VED_rho)) ∧ ((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.f_inv_fn_1 (ctx.f_fn_1 x_all)) = x_all)) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.f_fn_1 (ctx.f_inv_fn_1 z_all)) = z_all)))
-- DEMUESTRA_ASSERTION: D_fInv|COMPLETA|NO_APLICA

-- FORMAL_NODE: P_COORD
-- SOURCE: ES_46_RV6.md:57
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_COORD", "location": "ES_46_RV6.md:57", "source": "## 1.2. Elección local de la dirección de propagación\n\nSea una onda que en un punto determinado se propaga según una dirección espacial. Es lícito orientar localmente los ejes de coordenadas de manera que el eje $x$ coincida con la dirección instantánea de propagación.\n\nEntonces, para ese desplazamiento infinitesimal,\n\n$$\ndy=0,\n\\qquad\ndz=0,\n$$\n\ny\n\n$$\nds=dx.\n$$\n\n$P_{\\rm COORD}$ — Esta elección no reduce $3S$ a una dimensión. Sólo alinea una coordenada con la dirección local de propagación.\n\n---\n\n# 2. Significado de $t'$ y relación de Lorentz", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: dy=0, \qquad dz=0,
-- FORMULA: ds=dx.
-- FORMULA: x
-- FORMULA: 3S
-- FORMULA: t'
-- DEMUESTRA_PROSE_CONTRACT: {"node": "P_COORD", "source": "la eleccion local alinea coordenadas sin reducir 3S", "status": "FORMALIZED_PROP"}
def Node_P_COORD_source_1_raw : String := "dy=0, \\qquad dz=0,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_COORD", "formula": 1, "location": "ES_46_RV6.md:57:P_COORD:formula-1", "source": "dy=0, \\qquad dz=0,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_COORD_source_1 (ctx : FormalContext) : Prop := ((ctx.dy = 0) ∧ (ctx.dz = 0))
def Node_P_COORD_source_2_raw : String := "ds=dx."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_COORD", "formula": 2, "location": "ES_46_RV6.md:57:P_COORD:formula-2", "source": "ds=dx.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_COORD_source_2 (ctx : FormalContext) : Prop := (ctx.ds = ctx.dx)
def Node_P_COORD_source_3_raw : String := "x"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_COORD", "formula": 3, "location": "ES_46_RV6.md:57:P_COORD:formula-3", "source": "x", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_COORD_source_3_term (ctx : FormalContext) : ℝ := (ctx.x)
def Node_P_COORD_source_4_raw : String := "3S"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_COORD", "formula": 4, "location": "ES_46_RV6.md:57:P_COORD:formula-4", "source": "3S", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_COORD_source_4_term (ctx : FormalContext) : ℝ := ((3 : ℝ) * ctx.S)
def Node_P_COORD_source_5_raw : String := "t'"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_COORD", "formula": 5, "location": "ES_46_RV6.md:57:P_COORD:formula-5", "source": "t'", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_COORD_source_5_term (ctx : FormalContext) : ℝ := (ctx.t_prime)
def Node_P_COORD_source_steps (ctx : FormalContext) : Prop := (Node_P_COORD_source_1 ctx) ∧ (Node_P_COORD_source_2 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_COORD|1|PROOF_STEP|-|D_U|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_COORD|2|PROOF_STEP|1|D_U|NO_CERTIFICADO
theorem derive_P_COORD (ctx : FormalContext) (h_D_U : ((ctx.U = (((3 : ℝ) * ctx.S) + ctx.T)))) : (((((ctx.dy = 0) ∧ (ctx.dz = 0)) ∧ (ctx.ds = ctx.dx)) → (ctx.U = (((3 : ℝ) * ctx.S) + ctx.T)))) := by
  intro _
  exact h_D_U
-- DEMUESTRA_ASSERTION: P_COORD|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_VED_Inv
-- SOURCE: ES_46_RV6.md:261
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_VED_Inv", "location": "ES_46_RV6.md:261", "source": "$P_{\\rm VED}(\\mathrm{Inv})$ — La representación circular conserva $L$, $\\lambda$, $n$ y, como se definirá enseguida, $\\rho$. Por ello no crea la estabilidad: la hace visible.\n\n---\n\n# 5. Ondas cerradas, ondas abiertas y estabilidad\n\n## 5.1. Onda cerrada\n\nPara todo $n$ finito positivo,\n\n$$\nL=n\\lambda<\\infty,\n$$\n\ny existe un contorno finito de representación.\n\nEl hecho de estar cerrada **no implica** estabilidad.\n\n## 5.2. Onda abierta\n\nLa onda abierta o libre corresponde al límite\n\n$$\n\\boxed{\nn\\to\\infty.\n}\n$$\n\nEntonces,\n\n$$\nL\\to\\infty,\n$$\n\n$$\nR_{\\rm VED}\\to\\infty.\n$$\n\nNo existe un contorno espacial finito de retorno:\n\n$$\n\\boxed{\nn\\to\\infty\n\\iff\nL\\to\\infty\n\\iff\nR_{\\rm VED}\\to\\infty\n\\iff\n\\text{onda abierta o libre}.\n}\n$$\n\nDentro del marco, la onda libre corresponde a energía.\n\n---\n\n# 6. Coordenadas completas de cierre: $k$ y $\\rho$", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: L=n\lambda<\infty,
-- FORMULA: \boxed{ n\to\infty. }
-- FORMULA: L\to\infty,
-- FORMULA: R_{\rm VED}\to\infty.
-- FORMULA: \boxed{ n\to\infty \iff L\to\infty \iff R_{\rm VED}\to\infty \iff \text{onda abierta o libre}. }
-- FORMULA: L
-- FORMULA: \lambda
-- FORMULA: n
-- FORMULA: \rho
-- FORMULA: n
-- FORMULA: k
-- FORMULA: \rho
-- DEMUESTRA_PROSE_CONTRACT: {"node": "P_VED_Inv", "source": "la representacion circular conserva la onda representada", "status": "FORMALIZED_PROP"}
def Node_P_VED_Inv_source_1_raw : String := "L=n\\lambda<\\infty,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 1, "location": "ES_46_RV6.md:261:P_VED_Inv:formula-1", "source": "L=n\\lambda<\\infty,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_1 (ctx : FormalContext) : Prop := ((ctx.L = (ctx.n * ctx.lambda)) ∧ ¬(ctx.DivergesToInfinity (ctx.n * ctx.lambda)))
def Node_P_VED_Inv_source_2_raw : String := "\\boxed{ n\\to\\infty. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 2, "location": "ES_46_RV6.md:261:P_VED_Inv:formula-2", "source": "\\boxed{ n\\to\\infty. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_2 (ctx : FormalContext) : Prop := (ctx.DivergesToInfinity (ctx.n))
def Node_P_VED_Inv_source_3_raw : String := "L\\to\\infty,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 3, "location": "ES_46_RV6.md:261:P_VED_Inv:formula-3", "source": "L\\to\\infty,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_3 (ctx : FormalContext) : Prop := (ctx.DivergesToInfinity (ctx.L))
def Node_P_VED_Inv_source_4_raw : String := "R_{\\rm VED}\\to\\infty."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 4, "location": "ES_46_RV6.md:261:P_VED_Inv:formula-4", "source": "R_{\\rm VED}\\to\\infty.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_4 (ctx : FormalContext) : Prop := (ctx.DivergesToInfinity (ctx.R_VED))
def Node_P_VED_Inv_source_5_raw : String := "\\boxed{ n\\to\\infty \\iff L\\to\\infty \\iff R_{\\rm VED}\\to\\infty \\iff \\text{onda abierta o libre}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 5, "location": "ES_46_RV6.md:261:P_VED_Inv:formula-5", "source": "\\boxed{ n\\to\\infty \\iff L\\to\\infty \\iff R_{\\rm VED}\\to\\infty \\iff \\text{onda abierta o libre}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_5 (ctx : FormalContext) : Prop := ((((ctx.DivergesToInfinity (ctx.n)) ↔ (ctx.DivergesToInfinity (ctx.L))) ∧ ((ctx.DivergesToInfinity (ctx.L)) ↔ (ctx.DivergesToInfinity (ctx.R_VED)))) ∧ ((ctx.DivergesToInfinity (ctx.R_VED)) ↔ Derived_Text_onda_abierta_o_libre ctx))
def Node_P_VED_Inv_source_6_raw : String := "L"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 6, "location": "ES_46_RV6.md:261:P_VED_Inv:formula-6", "source": "L", "status": "FORMALIZED_TERM", "type": "Function[Nat,Real,Real]", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_6_term (ctx : FormalContext) : ℕ → ℝ → ℝ := (ctx.L_fn_2)
def Node_P_VED_Inv_source_7_raw : String := "\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 7, "location": "ES_46_RV6.md:261:P_VED_Inv:formula-7", "source": "\\lambda", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_7_term (ctx : FormalContext) : ℝ := (ctx.lambda)
def Node_P_VED_Inv_source_8_raw : String := "n"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 8, "location": "ES_46_RV6.md:261:P_VED_Inv:formula-8", "source": "n", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_8_term (ctx : FormalContext) : ℝ := (ctx.n)
def Node_P_VED_Inv_source_9_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 9, "location": "ES_46_RV6.md:261:P_VED_Inv:formula-9", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_9_term (ctx : FormalContext) : ℝ := (ctx.rho)
def Node_P_VED_Inv_source_10_raw : String := "n"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 10, "location": "ES_46_RV6.md:261:P_VED_Inv:formula-10", "source": "n", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_10_term (ctx : FormalContext) : ℝ := (ctx.n)
def Node_P_VED_Inv_source_11_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 11, "location": "ES_46_RV6.md:261:P_VED_Inv:formula-11", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_11_term (ctx : FormalContext) : ℕ := (ctx.k)
def Node_P_VED_Inv_source_12_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 12, "location": "ES_46_RV6.md:261:P_VED_Inv:formula-12", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_12_term (ctx : FormalContext) : ℝ := (ctx.rho)
def Node_P_VED_Inv_source_steps (ctx : FormalContext) : Prop := (Node_P_VED_Inv_source_1 ctx) ∧ (Node_P_VED_Inv_source_2 ctx) ∧ (Node_P_VED_Inv_source_3 ctx) ∧ (Node_P_VED_Inv_source_4 ctx) ∧ (Node_P_VED_Inv_source_5 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_Inv|1|PROOF_STEP|-|D_lambda,D_L,D_R_VED|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_Inv|2|PROOF_STEP|1|D_lambda,D_L,D_R_VED|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_Inv|3|PROOF_STEP|2|D_lambda,D_L,D_R_VED|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_Inv|4|PROOF_STEP|3|D_lambda,D_L,D_R_VED|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_Inv|5|PROOF_STEP|4|D_lambda,D_L,D_R_VED|NO_CERTIFICADO
theorem derive_P_VED_Inv (ctx : FormalContext) (h_D_lambda : ((ctx.E = (ctx.hc / ctx.lambda)) ∧ (ctx.E = ctx.Mc ^ 2) ∧ (ctx.Mc ^ 2 = (ctx.hc / ctx.lambda)) ∧ (ctx.lambda = (ctx.h / ctx.Mc)))) (h_D_L : ((ctx.L = (ctx.n * ctx.lambda)) ∧ (ctx.n ∈ {x : ℝ | 0 < x}))) (h_D_R_VED : (((((2 : ℝ) * Real.pi) * ctx.R_VED) = ctx.L) ∧ ((ctx.R_VED = (ctx.L / ((2 : ℝ) * Real.pi))) ∧ ((ctx.L / ((2 : ℝ) * Real.pi)) = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi)))) ∧ (((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED)))) : ((((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) := by
  rcases h_D_lambda with ⟨h_D_lambda_1, h_D_lambda_2, h_D_lambda_3, h_D_lambda_4⟩
  rcases h_D_L with ⟨h_D_L_1, h_D_L_2⟩
  rcases h_D_R_VED with ⟨h_D_R_VED_1, h_D_R_VED_2, h_D_R_VED_3⟩
  exact h_D_R_VED_3
-- DEMUESTRA_ASSERTION: P_VED_Inv|COMPLETA|VERIFICADA

-- FORMAL_NODE: T_ISO
-- SOURCE: ES_46_RV6.md:1469
-- DEMUESTRA_SOURCE_PROSE: {"node": "T_ISO", "location": "ES_46_RV6.md:1469", "source": "$T_{\\rm ISO}$ — **Teorema previo de isomorfismo global.** Las aplicaciones\n$f$ y $f^{-1}$ son mutuamente inversas sobre los universos transversales\ncompletos. Por tanto establecen un isomorfismo topológico\n\n$$\n\\boxed{\nU_{\\rm VED}^{\\rho}\\cong U_{\\rm Rim}^{\\rho}.\n}\n$$\n\n\nEste teorema se establece antes de aplicar la clasificación de estabilidad y\nes válido para $\\rho=0$ y para todo $0<\\rho\\le1/2$.", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ U_{\rm VED}^{\rho}\cong U_{\rm Rim}^{\rho}. }
-- FORMULA: f
-- FORMULA: f^{-1}
-- FORMULA: \rho=0
-- FORMULA: 0<\rho\le1/2
def Node_T_ISO_source_1_raw : String := "\\boxed{ U_{\\rm VED}^{\\rho}\\cong U_{\\rm Rim}^{\\rho}. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "T_ISO", "formula": 1, "location": "ES_46_RV6.md:1469:T_ISO:formula-1", "source": "\\boxed{ U_{\\rm VED}^{\\rho}\\cong U_{\\rm Rim}^{\\rho}. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_T_ISO_source_1 (ctx : FormalContext) : Prop := ((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))
def Node_T_ISO_source_2_raw : String := "f"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_ISO", "formula": 2, "location": "ES_46_RV6.md:1469:T_ISO:formula-2", "source": "f", "status": "FORMALIZED_TERM", "type": "Function[Real,Complex]", "role": "PROOF_STEP"}
def Node_T_ISO_source_2_term (ctx : FormalContext) : ℝ → ℂ := (ctx.f_fn_1)
def Node_T_ISO_source_3_raw : String := "f^{-1}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_ISO", "formula": 3, "location": "ES_46_RV6.md:1469:T_ISO:formula-3", "source": "f^{-1}", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_ISO_source_3_term (ctx : FormalContext) : ℝ := (ctx.f_inv)
def Node_T_ISO_source_4_raw : String := "\\rho=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_ISO", "formula": 4, "location": "ES_46_RV6.md:1469:T_ISO:formula-4", "source": "\\rho=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_ISO_source_4 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_T_ISO_source_5_raw : String := "0<\\rho\\le1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_ISO", "formula": 5, "location": "ES_46_RV6.md:1469:T_ISO:formula-5", "source": "0<\\rho\\le1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_ISO_source_5 (ctx : FormalContext) : Prop := ((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))
def Node_T_ISO_source_steps (ctx : FormalContext) : Prop := (Node_T_ISO_source_4 ctx) ∧ (Node_T_ISO_source_5 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: T_ISO|1|CLAIM|-|D_f,D_fInv|NO_CERTIFICADO
theorem derive_T_ISO (ctx : FormalContext) (h_D_f : ((ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate)))) (h_D_fInv : (((∀ x_map : ℂ, x_map ∈ ctx.U_Rim_rho → (ctx.f_inv_fn_1 x_map) ∈ ctx.U_VED_rho)) ∧ ((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.f_inv_fn_1 (ctx.f_fn_1 x_all)) = x_all)) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.f_fn_1 (ctx.f_inv_fn_1 z_all)) = z_all))))) : (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) := by
  rcases h_D_f with ⟨h_D_f_1, h_D_f_2, h_D_f_3⟩
  rcases h_D_fInv with ⟨h_D_fInv_1, h_D_fInv_2⟩
  rcases h_D_f_3 with ⟨h_forward_maps, h_forward_coordinate⟩
  rcases h_D_fInv_2 with ⟨h_left, h_right⟩
  let equivalence : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho) :=
    {
      toFun := fun x => ⟨ctx.f_fn_1 x.val, h_forward_maps x.val x.property⟩
      invFun := fun z => ⟨ctx.f_inv_fn_1 z.val, h_D_fInv_1 z.val z.property⟩
      left_inv := by
        intro x
        apply Subtype.ext
        exact h_left x.val x.property
      right_inv := by
        intro z
        apply Subtype.ext
        exact h_right z.val z.property
    }
  refine ⟨equivalence, ?_, ?_, h_forward_coordinate, ?_⟩
  · intro x
    rfl
  · intro z
    rfl
  · intro z hz
    have h := h_forward_coordinate (ctx.f_inv_fn_1 z) (h_D_fInv_1 z hz)
    rw [h_right z hz] at h
    exact h.symm
-- DEMUESTRA_ASSERTION: T_ISO|COMPLETA|TEOREMA_EMITIDO

-- FORMAL_NODE: P_ST
-- SOURCE: ES_46_RV6.md:114
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_ST", "location": "ES_46_RV6.md:114", "source": "$$\n\\boxed{\nP_{\\rm ST}:\n\\qquad\nds^2=dt^2-dt'^2.\n}\n$$\n\nEquivalentemente,\n\n$$\n\\boxed{\nds^2=(dt-dt')(dt+dt').\n}\n$$\n\nEstas dos expresiones son la misma relación geométrica escrita de dos formas.\n\n---", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ P_{\rm ST}: \qquad ds^2=dt^2-dt'^2. }
-- FORMULA: \boxed{ ds^2=(dt-dt')(dt+dt'). }
def Node_P_ST_source_1_raw : String := "\\boxed{ P_{\\rm ST}: \\qquad ds^2=dt^2-dt'^2. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_ST", "formula": 1, "location": "ES_46_RV6.md:114:P_ST:formula-1", "source": "\\boxed{ P_{\\rm ST}: \\qquad ds^2=dt^2-dt'^2. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_ST_source_1 (ctx : FormalContext) : Prop := (ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))
def Node_P_ST_source_2_raw : String := "\\boxed{ ds^2=(dt-dt')(dt+dt'). }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_ST", "formula": 2, "location": "ES_46_RV6.md:114:P_ST:formula-2", "source": "\\boxed{ ds^2=(dt-dt')(dt+dt'). }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_ST_source_2 (ctx : FormalContext) : Prop := (ctx.ds ^ 2 = ((ctx.dt - ctx.dt_prime) * (ctx.dt + ctx.dt_prime)))
def Node_P_ST_source_steps (ctx : FormalContext) : Prop := (Node_P_ST_source_2 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_ST|1|CLAIM|-|P_COORD,D_t_prime,A_L|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_ST|2|PROOF_STEP|1|P_COORD,D_t_prime,A_L|NO_CERTIFICADO
theorem derive_P_ST (ctx : FormalContext) (h_P_COORD : (((((ctx.dy = 0) ∧ (ctx.dz = 0)) ∧ (ctx.ds = ctx.dx)) → (ctx.U = (((3 : ℝ) * ctx.S) + ctx.T))))) (h_D_t_prime : (True)) (h_A_L : ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2)))) : ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) := by
  rcases h_A_L with ⟨h_A_L_1, h_A_L_2, h_A_L_3, h_A_L_4⟩
  linarith [h_A_L_4]
-- DEMUESTRA_ASSERTION: P_ST|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_VED_E
-- SOURCE: ES_46_RV6.md:417
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_VED_E", "location": "ES_46_RV6.md:417", "source": "## 6.2. Concepto primordial: estabilidad de la materia como onda cerrada\n\n**Regla básica de $U_{\\rm VED}$: el único valor estable es $\\rho=0$. Todo valor de $\\rho$ en el intervalo $(0,1/2]$ corresponde a un cierre no estable.**\n\nLa materia se representa en este marco como una onda de longitud de onda Compton positiva $\\lambda$, cerrada en un contorno de longitud $L=n\\lambda$. El número $n$ cuenta cuántas longitudes de onda contiene ese contorno. Escribir $L=n\\lambda$ describe su longitud, pero no basta por sí solo para afirmar su estabilidad.\n\n**La estabilidad exige un número entero positivo de ciclos.** Cuando $n=k\\in\\mathbb N^+$, el recorrido completo contiene exactamente un número entero de longitudes de onda: la onda retorna al mismo punto en la misma fase, el contorno es $L=k\\lambda$ y la distancia al entero más próximo es cero. Este es el cierre estable.\n\nSi $n$ es real no entero, el recorrido no contiene un número entero de ciclos. La onda no retorna exactamente en fase y queda un desfase respecto del cierre entero. En la clasificación de este marco, ese desfase es el origen de la inestabilidad y de la evolución destructiva en el tiempo del cierre no entero. Su distancia mínima al entero más próximo es positiva y pertenece al intervalo $(0,1/2]$ de la clasificación.\n\n**Entre dos enteros positivos consecutivos, todo cierre es no estable.** Si $j$ designa el entero inferior del intervalo, cualquier número de ciclos que cumpla $j<n<j+1$ está estrictamente entre los cierres enteros de sus extremos: no cierra exactamente en fase y su distancia mínima al entero más próximo es positiva. En el intervalo abierto entre esos enteros no hay ningún valor estable. Los extremos enteros sí tienen distancia cero y corresponden a cierres estables.\n\nEl intervalo abierto describe los valores de $n$, no los valores de $\\rho$. La letra $j$ designa aquí el extremo inferior; $k$ conserva su significado de entero positivo más próximo a $n$. Al recorrer el intervalo, $k$ puede ser uno u otro extremo, pero la regla no cambia: distancia cero al entero significa estabilidad; distancia positiva significa no estabilidad.\n\n**Esta distinción es la base de la estabilidad y la inestabilidad en $U_{\\rm VED}$.** Se establece en el universo de la onda antes de cualquier correspondencia con otros espacios; no es una condición añadida posteriormente ni una definición obtenida desde Riemann. Las correspondencias posteriores deben conservar esta clasificación de origen.\n\nSi\n\n$$\n\\rho=0,\n$$\n\nentonces\n\n$$\nn=k,\n$$\n\ny\n\n$$\nL=k\\lambda.\n$$\n\nEl contorno contiene un número entero de ciclos y el retorno se produce exactamente en fase.\n\nPor tanto,\n\n$$\n\\boxed{\nP_{\\rm VED}(E):\n\\qquad\n\\rho=0\n\\iff\nn=k\\in\\mathbb N^+\n\\iff\nL=k\\lambda\n\\iff\n\\text{cierre exacto en fase}\n\\iff\n\\text{estado estable}.\n}\n$$\n\nPara\n\n$$\n0<\\rho\\le\\frac12,\n$$\n\nel cierre es finito pero no entero. Existe desfase respecto del cierre exacto:", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \rho=0,
-- FORMULA: n=k,
-- FORMULA: L=k\lambda.
-- FORMULA: \boxed{ P_{\rm VED}(E): \qquad \rho=0 \iff n=k\in\mathbb N^+ \iff L=k\lambda \iff \text{cierre exacto en fase} \iff \text{estado estable}. }
-- FORMULA: 0<\rho\le\frac12,
-- FORMULA: U_{\rm VED}
-- FORMULA: \rho=0
-- FORMULA: \rho
-- FORMULA: (0,1/2]
-- FORMULA: \lambda
-- FORMULA: L=n\lambda
-- FORMULA: n
-- FORMULA: L=n\lambda
-- FORMULA: n=k\in\mathbb N^+
-- FORMULA: L=k\lambda
-- FORMULA: n
-- FORMULA: (0,1/2]
-- FORMULA: j
-- FORMULA: j<n<j+1
-- FORMULA: n
-- FORMULA: \rho
-- FORMULA: j
-- FORMULA: k
-- FORMULA: n
-- FORMULA: k
-- FORMULA: U_{\rm VED}
def Node_P_VED_E_source_1_raw : String := "\\rho=0,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 1, "location": "ES_46_RV6.md:417:P_VED_E:formula-1", "source": "\\rho=0,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_E_source_1 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_P_VED_E_source_2_raw : String := "n=k,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 2, "location": "ES_46_RV6.md:417:P_VED_E:formula-2", "source": "n=k,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_E_source_2 (ctx : FormalContext) : Prop := (ctx.n = ctx.k)
def Node_P_VED_E_source_3_raw : String := "L=k\\lambda."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 3, "location": "ES_46_RV6.md:417:P_VED_E:formula-3", "source": "L=k\\lambda.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_E_source_3 (ctx : FormalContext) : Prop := (ctx.L = ((ctx.k : ℝ) * ctx.lambda))
def Node_P_VED_E_source_4_raw : String := "\\boxed{ P_{\\rm VED}(E): \\qquad \\rho=0 \\iff n=k\\in\\mathbb N^+ \\iff L=k\\lambda \\iff \\text{cierre exacto en fase} \\iff \\text{estado estable}. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VED_E", "formula": 4, "location": "ES_46_RV6.md:417:P_VED_E:formula-4", "source": "\\boxed{ P_{\\rm VED}(E): \\qquad \\rho=0 \\iff n=k\\in\\mathbb N^+ \\iff L=k\\lambda \\iff \\text{cierre exacto en fase} \\iff \\text{estado estable}. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VED_E_source_4 (ctx : FormalContext) : Prop := (((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx))
def Node_P_VED_E_source_5_raw : String := "0<\\rho\\le\\frac12,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 5, "location": "ES_46_RV6.md:417:P_VED_E:formula-5", "source": "0<\\rho\\le\\frac12,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_E_source_5 (ctx : FormalContext) : Prop := ((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))
def Node_P_VED_E_source_6_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 6, "location": "ES_46_RV6.md:417:P_VED_E:formula-6", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_VED_E_source_6_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_VED_E_source_7_raw : String := "\\rho=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 7, "location": "ES_46_RV6.md:417:P_VED_E:formula-7", "source": "\\rho=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_E_source_7 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_P_VED_E_source_8_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 8, "location": "ES_46_RV6.md:417:P_VED_E:formula-8", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_E_source_8_term (ctx : FormalContext) : ℝ := (ctx.rho)
def Node_P_VED_E_source_9_raw : String := "(0,1/2]"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 9, "location": "ES_46_RV6.md:417:P_VED_E:formula-9", "source": "(0,1/2]", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_VED_E_source_9_term (ctx : FormalContext) : Set (ℝ) := (Set.Ioc 0 ((1 : ℝ) / (2 : ℝ)))
def Node_P_VED_E_source_10_raw : String := "\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 10, "location": "ES_46_RV6.md:417:P_VED_E:formula-10", "source": "\\lambda", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_E_source_10_term (ctx : FormalContext) : ℝ := (ctx.lambda)
def Node_P_VED_E_source_11_raw : String := "L=n\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 11, "location": "ES_46_RV6.md:417:P_VED_E:formula-11", "source": "L=n\\lambda", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_E_source_11 (ctx : FormalContext) : Prop := (ctx.L = (ctx.n * ctx.lambda))
def Node_P_VED_E_source_12_raw : String := "n"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 12, "location": "ES_46_RV6.md:417:P_VED_E:formula-12", "source": "n", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_E_source_12_term (ctx : FormalContext) : ℝ := (ctx.n)
def Node_P_VED_E_source_13_raw : String := "L=n\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 13, "location": "ES_46_RV6.md:417:P_VED_E:formula-13", "source": "L=n\\lambda", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_E_source_13 (ctx : FormalContext) : Prop := (ctx.L = (ctx.n * ctx.lambda))
def Node_P_VED_E_source_14_raw : String := "n=k\\in\\mathbb N^+"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 14, "location": "ES_46_RV6.md:417:P_VED_E:formula-14", "source": "n=k\\in\\mathbb N^+", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_E_source_14 (ctx : FormalContext) : Prop := ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))
def Node_P_VED_E_source_15_raw : String := "L=k\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 15, "location": "ES_46_RV6.md:417:P_VED_E:formula-15", "source": "L=k\\lambda", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_E_source_15 (ctx : FormalContext) : Prop := (ctx.L = ((ctx.k : ℝ) * ctx.lambda))
def Node_P_VED_E_source_16_raw : String := "n"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 16, "location": "ES_46_RV6.md:417:P_VED_E:formula-16", "source": "n", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_E_source_16_term (ctx : FormalContext) : ℝ := (ctx.n)
def Node_P_VED_E_source_17_raw : String := "(0,1/2]"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 17, "location": "ES_46_RV6.md:417:P_VED_E:formula-17", "source": "(0,1/2]", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_VED_E_source_17_term (ctx : FormalContext) : Set (ℝ) := (Set.Ioc 0 ((1 : ℝ) / (2 : ℝ)))
def Node_P_VED_E_source_18_raw : String := "j"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 18, "location": "ES_46_RV6.md:417:P_VED_E:formula-18", "source": "j", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_E_source_18_term (ctx : FormalContext) : ℝ := (ctx.j)
def Node_P_VED_E_source_19_raw : String := "j<n<j+1"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 19, "location": "ES_46_RV6.md:417:P_VED_E:formula-19", "source": "j<n<j+1", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_E_source_19 (ctx : FormalContext) : Prop := ((ctx.j < ctx.n) ∧ (ctx.n < (ctx.j + (1 : ℝ))))
def Node_P_VED_E_source_20_raw : String := "n"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 20, "location": "ES_46_RV6.md:417:P_VED_E:formula-20", "source": "n", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_E_source_20_term (ctx : FormalContext) : ℝ := (ctx.n)
def Node_P_VED_E_source_21_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 21, "location": "ES_46_RV6.md:417:P_VED_E:formula-21", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_E_source_21_term (ctx : FormalContext) : ℝ := (ctx.rho)
def Node_P_VED_E_source_22_raw : String := "j"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 22, "location": "ES_46_RV6.md:417:P_VED_E:formula-22", "source": "j", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_E_source_22_term (ctx : FormalContext) : ℝ := (ctx.j)
def Node_P_VED_E_source_23_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 23, "location": "ES_46_RV6.md:417:P_VED_E:formula-23", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "PROOF_STEP"}
def Node_P_VED_E_source_23_term (ctx : FormalContext) : ℕ := (ctx.k)
def Node_P_VED_E_source_24_raw : String := "n"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 24, "location": "ES_46_RV6.md:417:P_VED_E:formula-24", "source": "n", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_E_source_24_term (ctx : FormalContext) : ℝ := (ctx.n)
def Node_P_VED_E_source_25_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 25, "location": "ES_46_RV6.md:417:P_VED_E:formula-25", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "PROOF_STEP"}
def Node_P_VED_E_source_25_term (ctx : FormalContext) : ℕ := (ctx.k)
def Node_P_VED_E_source_26_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 26, "location": "ES_46_RV6.md:417:P_VED_E:formula-26", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_VED_E_source_26_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_VED_E_source_steps (ctx : FormalContext) : Prop := (Node_P_VED_E_source_1 ctx) ∧ (Node_P_VED_E_source_2 ctx) ∧ (Node_P_VED_E_source_3 ctx) ∧ (Node_P_VED_E_source_5 ctx) ∧ (Node_P_VED_E_source_7 ctx) ∧ (Node_P_VED_E_source_11 ctx) ∧ (Node_P_VED_E_source_13 ctx) ∧ (Node_P_VED_E_source_14 ctx) ∧ (Node_P_VED_E_source_15 ctx) ∧ (Node_P_VED_E_source_19 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_E|1|PROOF_STEP|-|P_VED_Inv,D_k,D_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_E|2|PROOF_STEP|1|P_VED_Inv,D_k,D_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_E|3|PROOF_STEP|2|P_VED_Inv,D_k,D_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_E|4|CLAIM|3|P_VED_Inv,D_k,D_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_E|5|PROOF_STEP|4|P_VED_Inv,D_k,D_rho|NO_CERTIFICADO
theorem derive_P_VED_E (ctx : FormalContext) (h_P_VED_Inv : ((((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED)))) (h_D_k : ((ctx.k ∈ {x : ℕ | 0 < x}))) (h_D_rho : ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))))))) (h_D_lambda : ((ctx.E = (ctx.hc / ctx.lambda)) ∧ (ctx.E = ctx.Mc ^ 2) ∧ (ctx.Mc ^ 2 = (ctx.hc / ctx.lambda)) ∧ (ctx.lambda = (ctx.h / ctx.Mc)))) (h_D_L : ((ctx.L = (ctx.n * ctx.lambda)) ∧ (ctx.n ∈ {x : ℝ | 0 < x}))) : ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx))) := by
  rcases h_D_rho with ⟨h_D_rho_1, h_D_rho_2, h_D_rho_3, h_D_rho_4, h_D_rho_5⟩
  rcases h_D_lambda with ⟨h_D_lambda_1, h_D_lambda_2, h_D_lambda_3, h_D_lambda_4⟩
  rcases h_D_L with ⟨h_D_L_1, h_D_L_2⟩
  have h_integer_closure : ((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) := by
    rcases h_D_rho_3 with ⟨h_branches, h_member, h_bounds⟩
    constructor
    · intro h_zero
      constructor
      · rcases h_branches with h_plus | h_minus <;> linarith
      · exact h_member
    · rintro ⟨h_integer, _⟩
      rcases h_branches with h_plus | h_minus <;> linarith
  have h_integer_length : ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)) := by
    constructor
    · rintro ⟨h_integer, _⟩
      rw [h_D_L_1, h_integer]
    · intro h_length
      have h_nonzero : ctx.lambda ≠ 0 := ne_of_gt ctx.PositiveDomain_lambda
      have h_integer : ctx.n = (ctx.k : ℝ) := by
        apply mul_right_cancel₀ h_nonzero
        rw [← h_D_L_1]
        exact h_length
      exact ⟨h_integer, h_D_k⟩
  have h_length_phase : (ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ (Derived_Text_cierre_exacto_en_fase ctx) := by
    exact h_integer_length.symm.trans h_integer_closure.symm
  exact ⟨⟨⟨h_integer_closure, h_integer_length⟩, h_length_phase⟩, Iff.rfl⟩
-- DEMUESTRA_ASSERTION: P_VED_E|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_RHO_ISO
-- SOURCE: ES_46_RV6.md:1484
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_RHO_ISO", "location": "ES_46_RV6.md:1484", "source": "$P_{\\rm RHO\\_ISO}$ — La coordenada transversal se conserva en las dos\ndirecciones del isomorfismo:\n\n$$\n\\boxed{\n\\rho_R(f(x))=\\rho_{\\rm VED}(x),\n\\qquad\n\\rho_{\\rm VED}(f^{-1}(z))=\\rho_R(z).\n}\n$$\n\n\nEn consecuencia, toda propiedad formulada mediante $\\rho$ se transporta para\ntodos los valores. En particular,\n\n$$\n\\rho=0\n\\iff\n\\text{clase estable},\n$$\n\ny\n\n$$\n0<\\rho\\le\\frac12\n\\iff\n\\text{clase no estable}\n$$\n\nse conservan tanto por $f$ como por $f^{-1}$. Esta conservación es una\nconsecuencia del isomorfismo global y no una condición añadida únicamente a\nlos ceros.\n\n---", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ \rho_R(f(x))=\rho_{\rm VED}(x), \qquad \rho_{\rm VED}(f^{-1}(z))=\rho_R(z). }
-- FORMULA: \rho=0 \iff \text{clase estable},
-- FORMULA: 0<\rho\le\frac12 \iff \text{clase no estable}
-- FORMULA: \rho
-- FORMULA: f
-- FORMULA: f^{-1}
def Node_P_RHO_ISO_source_1_raw : String := "\\boxed{ \\rho_R(f(x))=\\rho_{\\rm VED}(x), \\qquad \\rho_{\\rm VED}(f^{-1}(z))=\\rho_R(z). }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_RHO_ISO", "formula": 1, "location": "ES_46_RV6.md:1484:P_RHO_ISO:formula-1", "source": "\\boxed{ \\rho_R(f(x))=\\rho_{\\rm VED}(x), \\qquad \\rho_{\\rm VED}(f^{-1}(z))=\\rho_R(z). }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_RHO_ISO_source_1 (ctx : FormalContext) : Prop := ((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))
def Node_P_RHO_ISO_source_2_raw : String := "\\rho=0 \\iff \\text{clase estable},"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RHO_ISO", "formula": 2, "location": "ES_46_RV6.md:1484:P_RHO_ISO:formula-2", "source": "\\rho=0 \\iff \\text{clase estable},", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_RHO_ISO_source_2 (ctx : FormalContext) : Prop := ((ctx.rho = 0) ↔ Derived_Text_clase_estable ctx)
def Node_P_RHO_ISO_source_3_raw : String := "0<\\rho\\le\\frac12 \\iff \\text{clase no estable}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RHO_ISO", "formula": 3, "location": "ES_46_RV6.md:1484:P_RHO_ISO:formula-3", "source": "0<\\rho\\le\\frac12 \\iff \\text{clase no estable}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_RHO_ISO_source_3 (ctx : FormalContext) : Prop := (((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ Derived_Text_clase_no_estable ctx)
def Node_P_RHO_ISO_source_4_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RHO_ISO", "formula": 4, "location": "ES_46_RV6.md:1484:P_RHO_ISO:formula-4", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_RHO_ISO_source_4_term (ctx : FormalContext) : ℝ := (ctx.rho)
def Node_P_RHO_ISO_source_5_raw : String := "f"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RHO_ISO", "formula": 5, "location": "ES_46_RV6.md:1484:P_RHO_ISO:formula-5", "source": "f", "status": "FORMALIZED_TERM", "type": "Function[Real,Complex]", "role": "PROOF_STEP"}
def Node_P_RHO_ISO_source_5_term (ctx : FormalContext) : ℝ → ℂ := (ctx.f_fn_1)
def Node_P_RHO_ISO_source_6_raw : String := "f^{-1}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RHO_ISO", "formula": 6, "location": "ES_46_RV6.md:1484:P_RHO_ISO:formula-6", "source": "f^{-1}", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_RHO_ISO_source_6_term (ctx : FormalContext) : ℝ := (ctx.f_inv)
def Node_P_RHO_ISO_source_steps (ctx : FormalContext) : Prop := (Node_P_RHO_ISO_source_2 ctx) ∧ (Node_P_RHO_ISO_source_3 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_RHO_ISO|1|CLAIM|-|T_ISO|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_RHO_ISO|2|PROOF_STEP|1|T_ISO|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_RHO_ISO|3|PROOF_STEP|2|T_ISO|NO_CERTIFICADO
theorem derive_P_RHO_ISO (ctx : FormalContext) (h_T_ISO : (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate))))) (h_D_f : ((ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate)))) : (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) := by
  rcases h_D_f with ⟨h_D_f_1, h_D_f_2, h_D_f_3⟩
  rcases h_T_ISO with ⟨h, h_to, h_inv, h_forward_coordinate, h_inverse_coordinate⟩
  exact ⟨h_forward_coordinate, h_inverse_coordinate⟩
-- DEMUESTRA_ASSERTION: P_RHO_ISO|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_v
-- SOURCE: ES_46_RV6.md:138
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_v", "location": "ES_46_RV6.md:138", "source": "# 3. Primer y segundo orden: velocidad y aceleración\n\nLa primera derivada espacial respecto de $t$ es\n\n$$\n\\boxed{\nP_v:\n\\qquad\n\\frac{ds}{dt}=v.\n}\n$$\n\nCuando $v$ es constante,\n\n$$\n\\frac{d^2s}{dt^2}=0.\n$$\n\nLa segunda derivada es", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ P_v: \qquad \frac{ds}{dt}=v. }
-- FORMULA: \frac{d^2s}{dt^2}=0.
-- FORMULA: t
-- FORMULA: v
def Node_P_v_source_1_raw : String := "\\boxed{ P_v: \\qquad \\frac{ds}{dt}=v. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_v", "formula": 1, "location": "ES_46_RV6.md:138:P_v:formula-1", "source": "\\boxed{ P_v: \\qquad \\frac{ds}{dt}=v. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_v_source_1 (ctx : FormalContext) : Prop := (ctx.Derivative_t (ctx.DerivativeSubject_s) = ctx.v)
def Node_P_v_source_2_raw : String := "\\frac{d^2s}{dt^2}=0."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_v", "formula": 2, "location": "ES_46_RV6.md:138:P_v:formula-2", "source": "\\frac{d^2s}{dt^2}=0.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_v_source_2 (ctx : FormalContext) : Prop := (ctx.Derivative_t (ctx.Derivative_t (ctx.DerivativeSubject_s)) = 0)
def Node_P_v_source_3_raw : String := "t"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_v", "formula": 3, "location": "ES_46_RV6.md:138:P_v:formula-3", "source": "t", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_v_source_3_term (ctx : FormalContext) : ℝ := (ctx.t)
def Node_P_v_source_4_raw : String := "v"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_v", "formula": 4, "location": "ES_46_RV6.md:138:P_v:formula-4", "source": "v", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_v_source_4_term (ctx : FormalContext) : ℝ := (ctx.v)
def Node_P_v_source_steps (ctx : FormalContext) : Prop := (Node_P_v_source_2 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_v|1|CLAIM|-|D_t_prime,A_L,P_ST|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_v|2|PROOF_STEP|1|D_t_prime,A_L,P_ST|NO_CERTIFICADO
theorem derive_P_v (ctx : FormalContext) (h_D_t_prime : (True)) (h_A_L : ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2)))) (h_P_ST : ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2)))) : ((ctx.Derivative_t (ctx.DerivativeSubject_s) = ctx.v)) := by
  rcases h_A_L with ⟨h_A_L_1, h_A_L_2, h_A_L_3, h_A_L_4⟩
  exact h_A_L_2.symm
-- DEMUESTRA_ASSERTION: P_v|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_ST_2
-- SOURCE: ES_46_RV6.md:674
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_ST_2", "location": "ES_46_RV6.md:674", "source": "# 9. Ecuación diferencial completa del universo\n\nVolvemos ahora a la geometría ya demostrada:\n\n$$\nP_{\\rm ST}:\n\\qquad\nds^2=dt^2-dt'^2.\n$$\n\nLa ecuación dinámica se construye conservando la relación diferencial y su variación respecto de $t$:", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: P_{\rm ST}: \qquad ds^2=dt^2-dt'^2.
-- FORMULA: t
def Node_P_ST_2_source_1_raw : String := "P_{\\rm ST}: \\qquad ds^2=dt^2-dt'^2."
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_ST_2", "formula": 1, "location": "ES_46_RV6.md:674:P_ST_2:formula-1", "source": "P_{\\rm ST}: \\qquad ds^2=dt^2-dt'^2.", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_ST_2_source_1 (ctx : FormalContext) : Prop := (ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))
def Node_P_ST_2_source_2_raw : String := "t"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_ST_2", "formula": 2, "location": "ES_46_RV6.md:674:P_ST_2:formula-2", "source": "t", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_ST_2_source_2_term (ctx : FormalContext) : ℝ := (ctx.t)
-- DEMUESTRA_DEDUCTIVE_LINK: P_ST_2|1|CLAIM|-|P_ST|NO_CERTIFICADO
theorem derive_P_ST_2 (ctx : FormalContext) (h_P_ST : ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2)))) (h_A_L : ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2)))) : ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) := by
  exact h_P_ST
-- DEMUESTRA_ASSERTION: P_ST_2|COMPLETA|VERIFICADA_ESTRUCTURAL

-- FORMAL_NODE: P_VED_I
-- SOURCE: ES_46_RV6.md:441
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_VED_I", "location": "ES_46_RV6.md:441", "source": "$$\n\\boxed{\nP_{\\rm VED}(I):\n\\qquad\n0<\\rho\\le\\frac12\n\\iff\n\\text{cierre no estable}.\n}\n$$\n\nEl extremo\n\n$$\n\\boxed{\n\\rho=\\frac12\n}\n$$\n\nes la máxima desviación posible respecto del entero más próximo.\n\n---", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ P_{\rm VED}(I): \qquad 0<\rho\le\frac12 \iff \text{cierre no estable}. }
-- FORMULA: \boxed{ \rho=\frac12 }
def Node_P_VED_I_source_1_raw : String := "\\boxed{ P_{\\rm VED}(I): \\qquad 0<\\rho\\le\\frac12 \\iff \\text{cierre no estable}. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VED_I", "formula": 1, "location": "ES_46_RV6.md:441:P_VED_I:formula-1", "source": "\\boxed{ P_{\\rm VED}(I): \\qquad 0<\\rho\\le\\frac12 \\iff \\text{cierre no estable}. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VED_I_source_1 (ctx : FormalContext) : Prop := (((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ Derived_Text_cierre_no_estable ctx)
def Node_P_VED_I_source_2_raw : String := "\\boxed{ \\rho=\\frac12 }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_I", "formula": 2, "location": "ES_46_RV6.md:441:P_VED_I:formula-2", "source": "\\boxed{ \\rho=\\frac12 }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_I_source_2 (ctx : FormalContext) : Prop := (ctx.rho = ((1 : ℝ) / (2 : ℝ)))
def Node_P_VED_I_source_steps (ctx : FormalContext) : Prop := (Node_P_VED_I_source_2 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_I|1|CLAIM|-|D_k,D_rho,P_VED_E|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_I|2|PROOF_STEP|1|D_k,D_rho,P_VED_E|NO_CERTIFICADO
theorem derive_P_VED_I (ctx : FormalContext) (h_D_k : ((ctx.k ∈ {x : ℕ | 0 < x}))) (h_D_rho : ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))))))) (h_P_VED_E : ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx)))) : ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ Derived_Text_cierre_no_estable ctx)) := by
  rcases h_D_rho with ⟨h_D_rho_1, h_D_rho_2, h_D_rho_3, h_D_rho_4, h_D_rho_5⟩
  rfl
-- DEMUESTRA_ASSERTION: P_VED_I|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_VED_E_2
-- SOURCE: ES_46_RV6.md:1217
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_VED_E_2", "location": "ES_46_RV6.md:1217", "source": "# 12. Qué queda asentado antes de Riemann\n\nHasta este punto quedan demostradas dentro del desarrollo las siguientes proposiciones:\n\n$$\nP_{\\rm VED}(E):\n\\quad\n\\rho=0\n\\iff\n\\text{estado estable}.\n$$", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: P_{\rm VED}(E): \quad \rho=0 \iff \text{estado estable}.
def Node_P_VED_E_2_source_1_raw : String := "P_{\\rm VED}(E): \\quad \\rho=0 \\iff \\text{estado estable}."
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VED_E_2", "formula": 1, "location": "ES_46_RV6.md:1217:P_VED_E_2:formula-1", "source": "P_{\\rm VED}(E): \\quad \\rho=0 \\iff \\text{estado estable}.", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VED_E_2_source_1 (ctx : FormalContext) : Prop := ((ctx.rho = 0) ↔ Derived_Text_estado_estable ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_E_2|1|CLAIM|-|P_VED_E|NO_CERTIFICADO
theorem derive_P_VED_E_2 (ctx : FormalContext) (h_P_VED_E : ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx)))) (h_D_rho : ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))))))) : (((ctx.rho = 0) ↔ Derived_Text_estado_estable ctx)) := by
  rcases h_D_rho with ⟨h_D_rho_1, h_D_rho_2, h_D_rho_3, h_D_rho_4, h_D_rho_5⟩
  rfl
-- DEMUESTRA_ASSERTION: P_VED_E_2|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_RIM_S
-- SOURCE: ES_46_RV6.md:1520
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_RIM_S", "location": "ES_46_RV6.md:1520", "source": "$P_{\\rm RIM}(S)$ — Por la conservación de $\\rho$ mediante $f$ y $f^{-1}$,\n\n$$\n\\boxed{\n\\forall z\\in U_{\\rm Rim},\n\\qquad\n\\operatorname{Stable}_{\\rm Rim}(z)\n\\iff\n\\rho_R(z)=0.\n}\n$$\n\nPor tanto, no existe ningún valor estable en $U_{\\rm Rim}$ con\n$\\rho_R(z)\\neq0$. En particular, por la construcción de\n$Z_{\\rm Rim}^{\\rm nt}$,\n\n$$\n\\boxed{\nz\\in Z_{\\rm Rim}^{\\rm nt}\n\\Longrightarrow\n\\operatorname{Stable}_{\\rm Rim}(z)\n\\Longrightarrow\n\\rho_R(z)=0.\n}\n$$\n\n\n---", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ \forall z\in U_{\rm Rim}, \qquad \operatorname{Stable}_{\rm Rim}(z) \iff \rho_R(z)=0. }
-- FORMULA: \boxed{ z\in Z_{\rm Rim}^{\rm nt} \Longrightarrow \operatorname{Stable}_{\rm Rim}(z) \Longrightarrow \rho_R(z)=0. }
-- FORMULA: \rho
-- FORMULA: f
-- FORMULA: f^{-1}
-- FORMULA: U_{\rm Rim}
-- FORMULA: \rho_R(z)\neq0
-- FORMULA: Z_{\rm Rim}^{\rm nt}
def Node_P_RIM_S_source_1_raw : String := "\\boxed{ \\forall z\\in U_{\\rm Rim}, \\qquad \\operatorname{Stable}_{\\rm Rim}(z) \\iff \\rho_R(z)=0. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_RIM_S", "formula": 1, "location": "ES_46_RV6.md:1520:P_RIM_S:formula-1", "source": "\\boxed{ \\forall z\\in U_{\\rm Rim}, \\qquad \\operatorname{Stable}_{\\rm Rim}(z) \\iff \\rho_R(z)=0. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_RIM_S_source_1 (ctx : FormalContext) : Prop := (∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))
def Node_P_RIM_S_source_2_raw : String := "\\boxed{ z\\in Z_{\\rm Rim}^{\\rm nt} \\Longrightarrow \\operatorname{Stable}_{\\rm Rim}(z) \\Longrightarrow \\rho_R(z)=0. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RIM_S", "formula": 2, "location": "ES_46_RV6.md:1520:P_RIM_S:formula-2", "source": "\\boxed{ z\\in Z_{\\rm Rim}^{\\rm nt} \\Longrightarrow \\operatorname{Stable}_{\\rm Rim}(z) \\Longrightarrow \\rho_R(z)=0. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_RIM_S_source_2 (ctx : FormalContext) : Prop := (∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → ((Derived_Stable_Rim ctx z) → ((ctx.rho_R_fn_1 z) = 0)))
def Node_P_RIM_S_source_3_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RIM_S", "formula": 3, "location": "ES_46_RV6.md:1520:P_RIM_S:formula-3", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_RIM_S_source_3_term (ctx : FormalContext) : ℝ := (ctx.rho)
def Node_P_RIM_S_source_4_raw : String := "f"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RIM_S", "formula": 4, "location": "ES_46_RV6.md:1520:P_RIM_S:formula-4", "source": "f", "status": "FORMALIZED_TERM", "type": "Function[Real,Complex]", "role": "PROOF_STEP"}
def Node_P_RIM_S_source_4_term (ctx : FormalContext) : ℝ → ℂ := (ctx.f_fn_1)
def Node_P_RIM_S_source_5_raw : String := "f^{-1}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RIM_S", "formula": 5, "location": "ES_46_RV6.md:1520:P_RIM_S:formula-5", "source": "f^{-1}", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_RIM_S_source_5_term (ctx : FormalContext) : ℝ := (ctx.f_inv)
def Node_P_RIM_S_source_6_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RIM_S", "formula": 6, "location": "ES_46_RV6.md:1520:P_RIM_S:formula-6", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_P_RIM_S_source_6_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_P_RIM_S_source_7_raw : String := "\\rho_R(z)\\neq0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RIM_S", "formula": 7, "location": "ES_46_RV6.md:1520:P_RIM_S:formula-7", "source": "\\rho_R(z)\\neq0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_RIM_S_source_7 (ctx : FormalContext) : Prop := ((ctx.rho_R_fn_1 ctx.z) ≠ 0)
def Node_P_RIM_S_source_8_raw : String := "Z_{\\rm Rim}^{\\rm nt}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RIM_S", "formula": 8, "location": "ES_46_RV6.md:1520:P_RIM_S:formula-8", "source": "Z_{\\rm Rim}^{\\rm nt}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_P_RIM_S_source_8_term (ctx : FormalContext) : Set (ℂ) := (ctx.Z_Rim_nt)
def Node_P_RIM_S_source_steps (ctx : FormalContext) : Prop := (Node_P_RIM_S_source_2 ctx) ∧ (Node_P_RIM_S_source_7 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_RIM_S|1|CLAIM|-|T_ISO,P_RHO_ISO|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_RIM_S|2|PROOF_STEP|1|T_ISO,P_RHO_ISO|NO_CERTIFICADO
theorem derive_P_RIM_S (ctx : FormalContext) (h_T_ISO : (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate))))) (h_P_RHO_ISO : (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all)))))) (h_D_f : ((ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate)))) : ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) := by
  rcases h_D_f with ⟨h_D_f_1, h_D_f_2, h_D_f_3⟩
  intro z _
  exact stable_rim_iff_coordinate_zero ctx h_D_f_2 h_P_RHO_ISO.2 z
-- DEMUESTRA_ASSERTION: P_RIM_S|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_a
-- SOURCE: ES_46_RV6.md:154
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_a", "location": "ES_46_RV6.md:154", "source": "$$\n\\boxed{\nP_a:\n\\qquad\n\\frac{d^2s}{dt^2}\n=\n\\frac{dv}{dt}\n=\na.\n}\n$$\n\nDentro del marco Einstein–VED, la presencia de materia se asocia al confinamiento de onda y a la existencia de dinámica no puramente lineal; la aceleración expresa la variación del régimen de velocidad.\n\nLa geometría define por tanto una estructura diferencial en $t$, $t'$ y sus variaciones. No se añade desde fuera una segunda geometría para introducir la dinámica.\n\n---\n\n# 4. Onda base, longitud de cierre y radio $R_{\\rm VED}$", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ P_a: \qquad \frac{d^2s}{dt^2} = \frac{dv}{dt} = a. }
-- FORMULA: t
-- FORMULA: t'
-- FORMULA: R_{\rm VED}
def Node_P_a_source_1_raw : String := "\\boxed{ P_a: \\qquad \\frac{d^2s}{dt^2} = \\frac{dv}{dt} = a. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_a", "formula": 1, "location": "ES_46_RV6.md:154:P_a:formula-1", "source": "\\boxed{ P_a: \\qquad \\frac{d^2s}{dt^2} = \\frac{dv}{dt} = a. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_a_source_1 (ctx : FormalContext) : Prop := ((ctx.Derivative_t (ctx.Derivative_t (ctx.DerivativeSubject_s)) = ctx.Derivative_t (ctx.v)) ∧ (ctx.Derivative_t (ctx.v) = ctx.Derivative_t (ctx.v)))
def Node_P_a_source_2_raw : String := "t"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_a", "formula": 2, "location": "ES_46_RV6.md:154:P_a:formula-2", "source": "t", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_a_source_2_term (ctx : FormalContext) : ℝ := (ctx.t)
def Node_P_a_source_3_raw : String := "t'"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_a", "formula": 3, "location": "ES_46_RV6.md:154:P_a:formula-3", "source": "t'", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_a_source_3_term (ctx : FormalContext) : ℝ := (ctx.t_prime)
def Node_P_a_source_4_raw : String := "R_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_a", "formula": 4, "location": "ES_46_RV6.md:154:P_a:formula-4", "source": "R_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_a_source_4_term (ctx : FormalContext) : ℝ := (ctx.R_VED)
-- DEMUESTRA_DEDUCTIVE_LINK: P_a|1|CLAIM|-|A_L,P_ST,P_v|NO_CERTIFICADO
theorem derive_P_a (ctx : FormalContext) (h_A_L : ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2)))) (h_P_ST : ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2)))) (h_P_v : ((ctx.Derivative_t (ctx.DerivativeSubject_s) = ctx.v))) : (((ctx.Derivative_t (ctx.Derivative_t (ctx.DerivativeSubject_s)) = ctx.Derivative_t (ctx.v)) ∧ (ctx.Derivative_t (ctx.v) = ctx.Derivative_t (ctx.v)))) := by
  rcases h_A_L with ⟨h_A_L_1, h_A_L_2, h_A_L_3, h_A_L_4⟩
  constructor
  · exact congrArg ctx.Derivative_t h_P_v
  · rfl
-- DEMUESTRA_ASSERTION: P_a|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_VED_K_E
-- SOURCE: ES_46_RV6.md:493
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_VED_K_E", "location": "ES_46_RV6.md:493", "source": "$P_{\\rm VED}(K_E)$ — Para $\\rho=0$,\n\n$$\n\\boxed{\n\\mathcal E_{\\rm VED}\n=\n\\{(k,0):k\\in\\mathbb N^+\\}.\n}\n$$\n\nTodos los enteros\n\n$$\nk=1,2,3,\\ldots\n$$\n\nenumeran todos los casos de estabilidad sin dejar ninguno fuera.\n\nPara cada longitud de onda Compton positiva $\\lambda$, el conjunto completo\nde valores estables corresponde a todos los $k\\in\\mathbb N^+$, con\n$n=k$ y $L=k\\lambda$. Cada par $(k,0)$ representa un cierre material\nposible y estable en la parametrización de $U_{\\rm VED}$. Recíprocamente,\ntodo cierre estable tiene un número exacto de ciclos entero positivo y,\npor ello, queda representado por uno de esos pares. Esta completitud se\nrefiere a todos los cierres estables permitidos por el modelo, no a la\npresencia de cada valor de $k$ en la naturaleza.\n\nEl caso complementario queda igualmente determinado: si el número exacto\nde ciclos $n>0$ no es entero, su distancia al entero positivo más próximo\nes estrictamente positiva. Existe desfase; el contorno no cierra\nexactamente en fase y, por el criterio de $U_{\\rm VED}$, no es estable.\nNo se trata de un redondeo de $n$ ni de una elección de clasificación.\n\nPara todo entero positivo $k$, el contorno $L=k\\lambda$ contiene un número\nentero de ciclos y cierra exactamente en fase. Por el criterio de\n$U_{\\rm VED}$, su desfase es nulo:\n\n$$\n\\forall k\\in\\mathbb N^+,\\qquad n=k\\Rightarrow\\rho=0.\n$$\n\nLa enumeración es numerable y completa en sentido matemático: abarca\ntodos los valores enteros positivos permitidos por la parametrización.\nNo afirma que todos esos valores se realicen en la naturaleza, ni exige\nobservar cada uno para establecer el criterio de estabilidad.\n\nComo asignaciones físicas del marco Einstein–VED, el autor indica:\n\n- k=2 define la gravedad universal.\n- k=4 da el cierre de todos los protones.\n- k=137 da el cierre superficial esférico del electrón.\n\nEstas asignaciones se distinguen del resultado de enumeración: son\ninterpretaciones físicas del marco, no consecuencias de la sola igualdad\nentre cierre entero y desfase nulo.", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ \mathcal E_{\rm VED} = \{(k,0):k\in\mathbb N^+\}. }
-- FORMULA: k=1,2,3,\ldots
-- FORMULA: \forall k\in\mathbb N^+,\qquad n=k\Rightarrow\rho=0.
-- FORMULA: \rho=0
-- FORMULA: \lambda
-- FORMULA: k\in\mathbb N^+
-- FORMULA: n=k
-- FORMULA: L=k\lambda
-- FORMULA: (k,0)
-- FORMULA: U_{\rm VED}
-- FORMULA: k
-- FORMULA: n>0
-- FORMULA: U_{\rm VED}
-- FORMULA: n
-- FORMULA: k
-- FORMULA: L=k\lambda
-- FORMULA: U_{\rm VED}
def Node_P_VED_K_E_source_1_raw : String := "\\boxed{ \\mathcal E_{\\rm VED} = \\{(k,0):k\\in\\mathbb N^+\\}. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VED_K_E", "formula": 1, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-1", "source": "\\boxed{ \\mathcal E_{\\rm VED} = \\{(k,0):k\\in\\mathbb N^+\\}. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VED_K_E_source_1 (ctx : FormalContext) : Prop := (((ctx.rho = 0)) → (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = ((k, 0)))})))
def Node_P_VED_K_E_source_2_raw : String := "k=1,2,3,\\ldots"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 2, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-2", "source": "k=1,2,3,\\ldots", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_2 (ctx : FormalContext) : Prop := (ctx.k ∈ {x : ℕ | 1 ≤ x})
def Node_P_VED_K_E_source_3_raw : String := "\\forall k\\in\\mathbb N^+,\\qquad n=k\\Rightarrow\\rho=0."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 3, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-3", "source": "\\forall k\\in\\mathbb N^+,\\qquad n=k\\Rightarrow\\rho=0.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_3 (ctx : FormalContext) : Prop := (∀ k : ℕ, (ctx.n = k) → (ctx.rho = 0))
def Node_P_VED_K_E_source_4_raw : String := "\\rho=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 4, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-4", "source": "\\rho=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_4 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_P_VED_K_E_source_5_raw : String := "\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 5, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-5", "source": "\\lambda", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_5_term (ctx : FormalContext) : ℝ := (ctx.lambda)
def Node_P_VED_K_E_source_6_raw : String := "k\\in\\mathbb N^+"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 6, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-6", "source": "k\\in\\mathbb N^+", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_6 (ctx : FormalContext) : Prop := (ctx.k ∈ {x : ℕ | 0 < x})
def Node_P_VED_K_E_source_7_raw : String := "n=k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 7, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-7", "source": "n=k", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_7 (ctx : FormalContext) : Prop := (ctx.n = ctx.k)
def Node_P_VED_K_E_source_8_raw : String := "L=k\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 8, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-8", "source": "L=k\\lambda", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_8 (ctx : FormalContext) : Prop := (ctx.L = ((ctx.k : ℝ) * ctx.lambda))
def Node_P_VED_K_E_source_9_raw : String := "(k,0)"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 9, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-9", "source": "(k,0)", "status": "FORMALIZED_TERM", "type": "Tuple[Nat,Nat]", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_9_term (ctx : FormalContext) : ℕ × ℕ := ((ctx.k, 0))
def Node_P_VED_K_E_source_10_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 10, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-10", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_10_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_VED_K_E_source_11_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 11, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-11", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_11_term (ctx : FormalContext) : ℕ := (ctx.k)
def Node_P_VED_K_E_source_12_raw : String := "n>0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 12, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-12", "source": "n>0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_12 (ctx : FormalContext) : Prop := (ctx.n > 0)
def Node_P_VED_K_E_source_13_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 13, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-13", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_13_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_VED_K_E_source_14_raw : String := "n"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 14, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-14", "source": "n", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_14_term (ctx : FormalContext) : ℝ := (ctx.n)
def Node_P_VED_K_E_source_15_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 15, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-15", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_15_term (ctx : FormalContext) : ℕ := (ctx.k)
def Node_P_VED_K_E_source_16_raw : String := "L=k\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 16, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-16", "source": "L=k\\lambda", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_16 (ctx : FormalContext) : Prop := (ctx.L = ((ctx.k : ℝ) * ctx.lambda))
def Node_P_VED_K_E_source_17_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 17, "location": "ES_46_RV6.md:493:P_VED_K_E:formula-17", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_17_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_VED_K_E_source_steps (ctx : FormalContext) : Prop := (Node_P_VED_K_E_source_2 ctx) ∧ (Node_P_VED_K_E_source_3 ctx) ∧ (Node_P_VED_K_E_source_4 ctx) ∧ (Node_P_VED_K_E_source_6 ctx) ∧ (Node_P_VED_K_E_source_7 ctx) ∧ (Node_P_VED_K_E_source_8 ctx) ∧ (Node_P_VED_K_E_source_12 ctx) ∧ (Node_P_VED_K_E_source_16 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_K_E|1|CLAIM|-|P_VED_E,P_VED_I,D_mathcal_E_VED|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_K_E|2|PROOF_STEP|1|P_VED_E,P_VED_I,D_mathcal_E_VED|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_K_E|3|PROOF_STEP|2|P_VED_E,P_VED_I,D_mathcal_E_VED|NO_CERTIFICADO
theorem derive_P_VED_K_E (ctx : FormalContext) (h_P_VED_E : ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx)))) (h_P_VED_I : ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ Derived_Text_cierre_no_estable ctx))) (h_D_mathcal_E_VED : ((ctx.k ∈ {x : ℕ | 0 < x}) ∧ (ctx.rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho = 0)) ∧ (x = ((k, rho)))})))) (h_D_rho : ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))))))) : ((((ctx.rho = 0)) → (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = ((k, 0)))})))) := by
  rcases h_D_mathcal_E_VED with ⟨h_D_mathcal_E_VED_1, h_D_mathcal_E_VED_2, h_D_mathcal_E_VED_3, h_D_mathcal_E_VED_4⟩
  rcases h_D_rho with ⟨h_D_rho_1, h_D_rho_2, h_D_rho_3, h_D_rho_4, h_D_rho_5⟩
  intro _
  rw [h_D_mathcal_E_VED_4]
  ext p
  constructor
  · rintro ⟨k, rho, ⟨⟨hk, _⟩, hrho⟩, hp⟩
    subst rho
    exact ⟨k, hk, hp⟩
  · rintro ⟨k, hk, hp⟩
    exact ⟨k, 0, ⟨⟨hk, ⟨le_rfl, by norm_num⟩⟩, rfl⟩, hp⟩
-- DEMUESTRA_ASSERTION: P_VED_K_E|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_VR_rho
-- SOURCE: ES_46_RV6.md:1623
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_VR_rho", "location": "ES_46_RV6.md:1623", "source": "# 15. Correspondencia topológica directa $U_{\\rm VED}\\leftrightarrow U_{\\rm Rim}$\n\nEn $U_{\\rm VED}$ la estructura transversal alrededor de cada entero es\n\n$$\nk+\\rho\n\\longleftrightarrow\nk-\\rho.\n$$\n\nEl punto fijo es\n\n$$\n\\rho=0.\n$$\n\nEn $U_{\\rm Rim}$ la estructura transversal es\n\n$$\n\\frac12+\\rho_R\n\\longleftrightarrow\n\\frac12-\\rho_R.\n$$\n\nEl punto fijo es\n\n$$\n\\rho_R=0.\n$$\n\nDefinimos el mapa transversal\n\n$$\n\\boxed{\nR_\\rho:\n[0,\\tfrac12]_{\\rm VED}\n\\longrightarrow\n[0,\\tfrac12]_{\\rm Rim}\n}\n$$\n\npor\n\n$$\n\\boxed{\nR_\\rho(\\rho)=\\rho_R=\\rho.\n}\n$$\n\nSu inversa es\n\n$$\n\\boxed{\nR_\\rho^{-1}(\\rho_R)=\\rho_R.\n}\n$$\n\nAdemás,\n\n$$\n\\left|\nR_\\rho(\\rho_1)-R_\\rho(\\rho_2)\n\\right|\n=\n|\\rho_1-\\rho_2|.\n$$\n\nPor tanto $R_\\rho$ conserva la distancia transversal.\n\nQueda asentado:\n\n$$\n\\boxed{\nP_{\\rm VR}(\\rho):\n\\qquad\n\\rho_{\\rm VED}\n=\n\\rho_R\n=\n\\left|\na-\\frac12\n\\right|.\n}\n$$\n\nEsta relación no redefine la estabilidad en Riemann. La estabilidad se conoce previamente desde $U_{\\rm VED}$ y se transporta mediante la coordenada conservada.\n\n---", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: k+\rho \longleftrightarrow k-\rho.
-- FORMULA: \rho=0.
-- FORMULA: \frac12+\rho_R \longleftrightarrow \frac12-\rho_R.
-- FORMULA: \rho_R=0.
-- FORMULA: \boxed{ R_\rho: [0,\tfrac12]_{\rm VED} \longrightarrow [0,\tfrac12]_{\rm Rim} }
-- FORMULA: \boxed{ R_\rho(\rho)=\rho_R=\rho. }
-- FORMULA: \boxed{ R_\rho^{-1}(\rho_R)=\rho_R. }
-- FORMULA: \left| R_\rho(\rho_1)-R_\rho(\rho_2) \right| = |\rho_1-\rho_2|.
-- FORMULA: \boxed{ P_{\rm VR}(\rho): \qquad \rho_{\rm VED} = \rho_R = \left| a-\frac12 \right|. }
-- FORMULA: U_{\rm VED}\leftrightarrow U_{\rm Rim}
-- FORMULA: U_{\rm VED}
-- FORMULA: U_{\rm Rim}
-- FORMULA: R_\rho
-- FORMULA: U_{\rm VED}
def Node_P_VR_rho_source_1_raw : String := "k+\\rho \\longleftrightarrow k-\\rho."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 1, "location": "ES_46_RV6.md:1623:P_VR_rho:formula-1", "source": "k+\\rho \\longleftrightarrow k-\\rho.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_1 (ctx : FormalContext) : Prop := (ctx.Corresponds_Real_to_Real ((ctx.k : ℝ) + ctx.rho) ((ctx.k : ℝ) - ctx.rho))
def Node_P_VR_rho_source_2_raw : String := "\\rho=0."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 2, "location": "ES_46_RV6.md:1623:P_VR_rho:formula-2", "source": "\\rho=0.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_2 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_P_VR_rho_source_3_raw : String := "\\frac12+\\rho_R \\longleftrightarrow \\frac12-\\rho_R."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 3, "location": "ES_46_RV6.md:1623:P_VR_rho:formula-3", "source": "\\frac12+\\rho_R \\longleftrightarrow \\frac12-\\rho_R.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_3 (ctx : FormalContext) : Prop := (ctx.Corresponds_Real_to_Real (((1 : ℝ) / (2 : ℝ)) + ctx.rho_R) (((1 : ℝ) / (2 : ℝ)) - ctx.rho_R))
def Node_P_VR_rho_source_4_raw : String := "\\rho_R=0."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 4, "location": "ES_46_RV6.md:1623:P_VR_rho:formula-4", "source": "\\rho_R=0.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_4 (ctx : FormalContext) : Prop := (ctx.rho_R = 0)
def Node_P_VR_rho_source_5_raw : String := "\\boxed{ R_\\rho: [0,\\tfrac12]_{\\rm VED} \\longrightarrow [0,\\tfrac12]_{\\rm Rim} }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 5, "location": "ES_46_RV6.md:1623:P_VR_rho:formula-5", "source": "\\boxed{ R_\\rho: [0,\\tfrac12]_{\\rm VED} \\longrightarrow [0,\\tfrac12]_{\\rm Rim} }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_5 (ctx : FormalContext) : Prop := ((∀ x_map : ℝ, x_map ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)) → (ctx.R_rho_fn_1 x_map) ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))))
def Node_P_VR_rho_source_6_raw : String := "\\boxed{ R_\\rho(\\rho)=\\rho_R=\\rho. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 6, "location": "ES_46_RV6.md:1623:P_VR_rho:formula-6", "source": "\\boxed{ R_\\rho(\\rho)=\\rho_R=\\rho. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_6 (ctx : FormalContext) : Prop := (((ctx.R_rho_fn_1 ctx.rho) = ctx.rho_R) ∧ (ctx.rho_R = ctx.rho))
def Node_P_VR_rho_source_7_raw : String := "\\boxed{ R_\\rho^{-1}(\\rho_R)=\\rho_R. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 7, "location": "ES_46_RV6.md:1623:P_VR_rho:formula-7", "source": "\\boxed{ R_\\rho^{-1}(\\rho_R)=\\rho_R. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_7 (ctx : FormalContext) : Prop := ((ctx.R_rho_inv_fn_1 ctx.rho_R) = ctx.rho_R)
def Node_P_VR_rho_source_8_raw : String := "\\left| R_\\rho(\\rho_1)-R_\\rho(\\rho_2) \\right| = |\\rho_1-\\rho_2|."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 8, "location": "ES_46_RV6.md:1623:P_VR_rho:formula-8", "source": "\\left| R_\\rho(\\rho_1)-R_\\rho(\\rho_2) \\right| = |\\rho_1-\\rho_2|.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_8 (ctx : FormalContext) : Prop := ((abs ((ctx.R_rho_fn_1 ctx.rho_1) - (ctx.R_rho_fn_1 ctx.rho_2))) = (abs (ctx.rho_1 - ctx.rho_2)))
def Node_P_VR_rho_source_9_raw : String := "\\boxed{ P_{\\rm VR}(\\rho): \\qquad \\rho_{\\rm VED} = \\rho_R = \\left| a-\\frac12 \\right|. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VR_rho", "formula": 9, "location": "ES_46_RV6.md:1623:P_VR_rho:formula-9", "source": "\\boxed{ P_{\\rm VR}(\\rho): \\qquad \\rho_{\\rm VED} = \\rho_R = \\left| a-\\frac12 \\right|. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VR_rho_source_9 (ctx : FormalContext) : Prop := ((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))
def Node_P_VR_rho_source_10_raw : String := "U_{\\rm VED}\\leftrightarrow U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 10, "location": "ES_46_RV6.md:1623:P_VR_rho:formula-10", "source": "U_{\\rm VED}\\leftrightarrow U_{\\rm Rim}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_10 (ctx : FormalContext) : Prop := (ctx.Corresponds_Set_Real_to_Set_Complex ctx.U_VED ctx.U_Rim)
def Node_P_VR_rho_source_11_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 11, "location": "ES_46_RV6.md:1623:P_VR_rho:formula-11", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_11_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_VR_rho_source_12_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 12, "location": "ES_46_RV6.md:1623:P_VR_rho:formula-12", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_12_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_P_VR_rho_source_13_raw : String := "R_\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 13, "location": "ES_46_RV6.md:1623:P_VR_rho:formula-13", "source": "R_\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_13_term (ctx : FormalContext) : ℝ := (ctx.R_rho)
def Node_P_VR_rho_source_14_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 14, "location": "ES_46_RV6.md:1623:P_VR_rho:formula-14", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_14_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_VR_rho_source_steps (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_1 ctx) ∧ (Node_P_VR_rho_source_2 ctx) ∧ (Node_P_VR_rho_source_3 ctx) ∧ (Node_P_VR_rho_source_4 ctx) ∧ (Node_P_VR_rho_source_5 ctx) ∧ (Node_P_VR_rho_source_6 ctx) ∧ (Node_P_VR_rho_source_7 ctx) ∧ (Node_P_VR_rho_source_8 ctx) ∧ (Node_P_VR_rho_source_10 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_rho|1|PROOF_STEP|-|T_ISO,P_RHO_ISO,P_RIM_S|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_rho|2|PROOF_STEP|1|T_ISO,P_RHO_ISO,P_RIM_S|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_rho|3|PROOF_STEP|2|T_ISO,P_RHO_ISO,P_RIM_S|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_rho|4|PROOF_STEP|3|T_ISO,P_RHO_ISO,P_RIM_S|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_rho|5|PROOF_STEP|4|T_ISO,P_RHO_ISO,P_RIM_S|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_rho|6|PROOF_STEP|5|T_ISO,P_RHO_ISO,P_RIM_S|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_rho|7|PROOF_STEP|6|T_ISO,P_RHO_ISO,P_RIM_S|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_rho|8|PROOF_STEP|7|T_ISO,P_RHO_ISO,P_RIM_S|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_rho|9|CLAIM|8|T_ISO,P_RHO_ISO,P_RIM_S|NO_CERTIFICADO
theorem derive_P_VR_rho_forward_coordinate (ctx : FormalContext) (h_T_ISO : (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate))))) (h_P_RHO_ISO : (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all)))))) (h_P_RIM_S : ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0))))) : (∀ x : ℝ, x ∈ ctx.U_VED_rho → ctx.rho_VED_fn_1 x = |(ctx.f_fn_1 x).re - (1 / 2 : ℝ)|) := by
  intro x hx
  change ctx.rho_VED_fn_1 x = ctx.rho_R_fn_1 (ctx.f_fn_1 x)
  exact (h_P_RHO_ISO.1 x hx).symm
theorem derive_P_VR_rho_inverse_coordinate (ctx : FormalContext) (h_T_ISO : (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate))))) (h_P_RHO_ISO : (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all)))))) (h_P_RIM_S : ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0))))) : (∀ z : ℂ, z ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z) = |z.re - (1 / 2 : ℝ)|) := by
  intro z hz
  exact h_P_RHO_ISO.2 z hz
-- DEMUESTRA_PENDING_PROOF: {"node": "P_VR_rho", "location": "ES_46_RV6.md:1623", "origin": "GENERATOR", "reason": "NO_COMPLETE_DERIVATION_GENERATED", "verification_state": "VERIFICACION_FORMAL_PENDIENTE", "interpretation_detail": null, "statement": "((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))", "dependencies": ["T_ISO", "P_RHO_ISO", "P_RIM_S"], "partial_theorems": [{"theorem": "transversal_map_preserves_distance", "statement": "The declared transversal identity map preserves distance.", "scope": "DECLARED_MAP_PROPERTY"}, {"theorem": "transversal_maps_are_inverse", "statement": "The declared transversal maps are mutually inverse.", "scope": "DECLARED_MAP_PROPERTY"}, {"theorem": "derive_P_VR_rho_forward_coordinate", "statement": "∀ x : ℝ, x ∈ ctx.U_VED_rho → ctx.rho_VED_fn_1 x = |(ctx.f_fn_1 x).re - (1 / 2 : ℝ)|", "scope": "CORRESPONDING_POINTS_IN_DECLARED_DOMAINS"}, {"theorem": "derive_P_VR_rho_inverse_coordinate", "statement": "∀ z : ℂ, z ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z) = |z.re - (1 / 2 : ℝ)|", "scope": "CORRESPONDING_POINTS_IN_DECLARED_DOMAINS"}], "pending_parts": ["ctx.rho_VED = ctx.rho_R", "ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))"], "source_present": true, "source_refuted": false, "prose_interpretation_complete": false}
-- DEMUESTRA_ASSERTION: P_VR_rho|COMPLETA|NO_DETERMINADO

-- FORMAL_NODE: P_VED_K_I
-- SOURCE: ES_46_RV6.md:562
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_VED_K_I", "location": "ES_46_RV6.md:562", "source": "$P_{\\rm VED}(K_I)$ — Para $\\rho=1/2$, los mismos $k$ enumeran todas las fronteras de máxima desviación.", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \rho=1/2
-- FORMULA: k
def Node_P_VED_K_I_source_1_raw : String := "\\rho=1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_I", "formula": 1, "location": "ES_46_RV6.md:562:P_VED_K_I:formula-1", "source": "\\rho=1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_I_source_1 (ctx : FormalContext) : Prop := (ctx.rho = ((1 : ℝ) / (2 : ℝ)))
def Node_P_VED_K_I_source_2_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_I", "formula": 2, "location": "ES_46_RV6.md:562:P_VED_K_I:formula-2", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "PROOF_STEP"}
def Node_P_VED_K_I_source_2_term (ctx : FormalContext) : ℕ := (ctx.k)
def Node_P_VED_K_I_source_steps (ctx : FormalContext) : Prop := (Node_P_VED_K_I_source_1 ctx)
def Node_P_VED_K_I_unformalized_source : String := "$P_{\\rm VED}(K_I)$ — Para $\\rho=1/2$, los mismos $k$ enumeran todas las fronteras de máxima desviación."
-- DEMUESTRA_UNDECIDABLE_NODE: P_VED_K_I|PROSE_WITHOUT_FORMULA
-- DEMUESTRA_ASSERTION: P_VED_K_I|DOCUMENTAL|NO_APLICA

-- FORMAL_NODE: P_VED_K_E_2
-- SOURCE: ES_46_RV6.md:1232
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_VED_K_E_2", "location": "ES_46_RV6.md:1232", "source": "$$\nP_{\\rm VED}(K_E):\n\\quad\nk\\in\\mathbb N^+\n\\text{ enumera todos los estados estables.}\n$$", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: P_{\rm VED}(K_E): \quad k\in\mathbb N^+ \text{ enumera todos los estados estables.}
def Node_P_VED_K_E_2_source_1_raw : String := "P_{\\rm VED}(K_E): \\quad k\\in\\mathbb N^+ \\text{ enumera todos los estados estables.}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E_2", "formula": 1, "location": "ES_46_RV6.md:1232:P_VED_K_E_2:formula-1", "source": "P_{\\rm VED}(K_E): \\quad k\\in\\mathbb N^+ \\text{ enumera todos los estados estables.}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_E_2_source_1 (ctx : FormalContext) : Prop := (ctx.k ∈ {x : ℕ | 0 < x})
def Node_P_VED_K_E_2_source_steps (ctx : FormalContext) : Prop := (Node_P_VED_K_E_2_source_1 ctx)
def Node_P_VED_K_E_2_unformalized_source : String := "$$ P_{\\rm VED}(K_E): \\quad k\\in\\mathbb N^+ \\text{ enumera todos los estados estables.} $$"
-- DEMUESTRA_UNDECIDABLE_NODE: P_VED_K_E_2|PROSE_WITHOUT_FORMULA
-- DEMUESTRA_ASSERTION: P_VED_K_E_2|DOCUMENTAL|NO_APLICA

-- FORMAL_NODE: P_VR_E
-- SOURCE: ES_46_RV6.md:1663
-- DEMUESTRA_TEXT_COORDINATE_SCOPE: {"node": "P_VR_E", "label": "estado_estable", "coordinate": "rho_VED", "source": "\\rho_{\\rm VED}=0\n\\iff\n\\text{estado estable}.", "basis": "P_VED_E", "scope": "LOCAL_COORDINATE_PARAMETER"}
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_VR_E", "location": "ES_46_RV6.md:1663", "source": "# 16. Transporte de la estabilidad\n\nPor $P_{\\rm VED}(E)$,\n\n$$\n\\rho_{\\rm VED}=0\n\\iff\n\\text{estado estable}.\n$$\n\nPor $P_{\\rm VR}(\\rho)$,\n\n$$\n\\rho_{\\rm VED}\n=\n\\left|\na-\\frac12\n\\right|.\n$$\n\nPor tanto,\n\n$$\n\\boxed{\nP_{\\rm VR}(E):\n\\qquad\n\\text{estado estable}\n\\iff\n\\left|\na-\\frac12\n\\right|\n=\n0.\n}\n$$\n\nLuego,\n\n$$\n\\boxed{\n\\text{estado estable}\n\\iff\na=\\frac12.\n}\n$$\n\nLa información de estabilidad no se deduce desde Riemann; se transporta desde $U_{\\rm VED}$.\n\n---", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \rho_{\rm VED}=0 \iff \text{estado estable}.
-- FORMULA: \rho_{\rm VED} = \left| a-\frac12 \right|.
-- FORMULA: \boxed{ P_{\rm VR}(E): \qquad \text{estado estable} \iff \left| a-\frac12 \right| = 0. }
-- FORMULA: \boxed{ \text{estado estable} \iff a=\frac12. }
-- FORMULA: U_{\rm VED}
def Node_P_VR_E_source_1_raw : String := "\\rho_{\\rm VED}=0 \\iff \\text{estado estable}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_E", "formula": 1, "location": "ES_46_RV6.md:1663:P_VR_E:formula-1", "source": "\\rho_{\\rm VED}=0 \\iff \\text{estado estable}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_E_source_1 (ctx : FormalContext) : Prop := ((ctx.rho_VED = 0) ↔ Derived_Text_estado_estable { ctx with rho := ctx.rho_VED })
def Node_P_VR_E_source_2_raw : String := "\\rho_{\\rm VED} = \\left| a-\\frac12 \\right|."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_E", "formula": 2, "location": "ES_46_RV6.md:1663:P_VR_E:formula-2", "source": "\\rho_{\\rm VED} = \\left| a-\\frac12 \\right|.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_E_source_2 (ctx : FormalContext) : Prop := (ctx.rho_VED = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))))
def Node_P_VR_E_source_3_raw : String := "\\boxed{ P_{\\rm VR}(E): \\qquad \\text{estado estable} \\iff \\left| a-\\frac12 \\right| = 0. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VR_E", "formula": 3, "location": "ES_46_RV6.md:1663:P_VR_E:formula-3", "source": "\\boxed{ P_{\\rm VR}(E): \\qquad \\text{estado estable} \\iff \\left| a-\\frac12 \\right| = 0. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VR_E_source_3 (ctx : FormalContext) : Prop := (Derived_Text_estado_estable { ctx with rho := ctx.rho_VED } ↔ ((abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))) = 0))
def Node_P_VR_E_source_4_raw : String := "\\boxed{ \\text{estado estable} \\iff a=\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_E", "formula": 4, "location": "ES_46_RV6.md:1663:P_VR_E:formula-4", "source": "\\boxed{ \\text{estado estable} \\iff a=\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_E_source_4 (ctx : FormalContext) : Prop := (Derived_Text_estado_estable { ctx with rho := ctx.rho_VED } ↔ (ctx.a = ((1 : ℝ) / (2 : ℝ))))
def Node_P_VR_E_source_5_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_E", "formula": 5, "location": "ES_46_RV6.md:1663:P_VR_E:formula-5", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_VR_E_source_5_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_VR_E_source_steps (ctx : FormalContext) : Prop := (Node_P_VR_E_source_1 ctx) ∧ (Node_P_VR_E_source_2 ctx) ∧ (Node_P_VR_E_source_4 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_E|1|PROOF_STEP|-|P_VED_E,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_E|2|PROOF_STEP|1|P_VED_E,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_E|3|CLAIM|2|P_VED_E,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_E|4|PROOF_STEP|3|P_VED_E,P_VR_rho|NO_CERTIFICADO
theorem derive_P_VR_E (ctx : FormalContext) (h_P_VED_E : ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx)))) (h_P_VR_rho : (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))))))) : ((Derived_Text_estado_estable { ctx with rho := ctx.rho_VED } ↔ ((abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))) = 0))) := by
  change (ctx.rho_VED = 0) ↔ (|ctx.a - (1 / 2 : ℝ)| = 0)
  rw [h_P_VR_rho.1, h_P_VR_rho.2]
-- DEMUESTRA_ASSERTION: P_VR_E|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_Z
-- SOURCE: ES_46_RV6.md:1805
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_Z", "location": "ES_46_RV6.md:1805", "source": "# 17. Identidad del cero y localización transversal\n\nHasta este punto intervienen dos informaciones distintas que no deben confundirse.\n\nEn $U_{\\rm Rim}$, la condición\n\n$$\n\\boxed{\n\\zeta(z)=0\n}\n$$\n\ndetermina qué es el punto considerado: un cero de la función zeta.\n\nPara el sector no trivial,\n\n$$\n\\boxed{\nz\\in Z_{\\rm Rim}^{\\rm nt}\n}\n$$\n\nsignifica, por definición,\n\n$$\n\\boxed{\n\\zeta(z)=0,\n\\qquad\n0<\\Re(z)<1.\n}\n$$\n\nEsta condición identifica el cero, pero no introduce por sí misma la clasificación transversal de estabilidad. Escribiendo\n\n$$\nz=a\\pm ib,\n$$\n\nsu posición transversal respecto del eje fijo de la simetría funcional queda medida por\n\n$$\n\\boxed{\n\\rho_R\n=\n\\left|\na-\\frac12\n\\right|.\n}\n$$\n\nPor otra parte, $U_{\\rm VED}$ no decide si un punto de $U_{\\rm Rim}$ es o no un cero de $\\zeta$. Esa identidad pertenece a $U_{\\rm Rim}$ mediante $\\zeta(z)=0$.\n\nLo que $U_{\\rm VED}$ aporta es la clasificación exhaustiva de la coordenada transversal:\n\n$$\n\\boxed{\n\\rho=0\n\\iff\n\\text{estado estable},\n}\n$$\n\ny\n\n$$\n\\boxed{\n0<\\rho\\le\\frac12\n\\iff\n\\text{estado no estable}.\n}\n$$\n\nPor $P_{\\rm VR}(\\rho)$,\n\n$$\n\\boxed{\n\\rho_{\\rm VED}\n=\n\\rho_R\n=\n\\left|\na-\\frac12\n\\right|.\n}\n$$\n\nQuedan por tanto separadas las dos funciones lógicas:\n\n$$\n\\boxed{\nU_{\\rm Rim}:\n\\qquad\n\\zeta(z)=0\n\\quad\n\\text{identifica el cero},\n}\n$$\n\nmientras que\n\n$$\n\\boxed{\nU_{\\rm VED}:\n\\qquad\n\\rho\n\\quad\n\\text{clasifica exhaustivamente su localización transversal}.\n}\n$$\n\nEn consecuencia, para un cero ya identificado en $U_{\\rm Rim}$, la pregunta pendiente no es si es cero, sino qué valor transversal $\\rho_R$ puede ocupar bajo la clasificación transportada desde $U_{\\rm VED}$.\n\nQueda asentado:\n\n$$\n\\boxed{\nP_Z:\n\\qquad\nz\\in Z_{\\rm Rim}^{\\rm nt}\n\\Rightarrow\n\\left[\n\\zeta(z)=0\n\\ \\text{en }U_{\\rm Rim}\n\\ \\text{y }\n\\rho_R=\\rho_{\\rm VED}\n\\ \\text{clasifica su localización transversal}\n\\right].\n}\n$$\n\n---", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ \zeta(z)=0 }
-- FORMULA: \boxed{ z\in Z_{\rm Rim}^{\rm nt} }
-- FORMULA: \boxed{ \zeta(z)=0, \qquad 0<\Re(z)<1. }
-- FORMULA: z=a\pm ib,
-- FORMULA: \boxed{ \rho_R = \left| a-\frac12 \right|. }
-- FORMULA: \boxed{ \rho=0 \iff \text{estado estable}, }
-- FORMULA: \boxed{ 0<\rho\le\frac12 \iff \text{estado no estable}. }
-- FORMULA: \boxed{ \rho_{\rm VED} = \rho_R = \left| a-\frac12 \right|. }
-- FORMULA: \boxed{ U_{\rm Rim}: \qquad \zeta(z)=0 \quad \text{identifica el cero}, }
-- FORMULA: \boxed{ U_{\rm VED}: \qquad \rho \quad \text{clasifica exhaustivamente su localización transversal}. }
-- FORMULA: \boxed{ P_Z: \qquad z\in Z_{\rm Rim}^{\rm nt} \Rightarrow \left[ \zeta(z)=0 \ \text{en }U_{\rm Rim} \ \text{y } \rho_R=\rho_{\rm VED} \ \text{clasifica su localización transversal} \right]. }
-- FORMULA: U_{\rm Rim}
-- FORMULA: U_{\rm VED}
-- FORMULA: U_{\rm Rim}
-- FORMULA: \zeta
-- FORMULA: U_{\rm Rim}
-- FORMULA: \zeta(z)=0
-- FORMULA: U_{\rm VED}
-- FORMULA: U_{\rm Rim}
-- FORMULA: \rho_R
-- FORMULA: U_{\rm VED}
def Node_P_Z_source_1_raw : String := "\\boxed{ \\zeta(z)=0 }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 1, "location": "ES_46_RV6.md:1805:P_Z:formula-1", "source": "\\boxed{ \\zeta(z)=0 }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_1 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_P_Z_source_2_raw : String := "\\boxed{ z\\in Z_{\\rm Rim}^{\\rm nt} }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 2, "location": "ES_46_RV6.md:1805:P_Z:formula-2", "source": "\\boxed{ z\\in Z_{\\rm Rim}^{\\rm nt} }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_2 (ctx : FormalContext) : Prop := (ctx.z ∈ ctx.Z_Rim_nt)
def Node_P_Z_source_3_raw : String := "\\boxed{ \\zeta(z)=0, \\qquad 0<\\Re(z)<1. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 3, "location": "ES_46_RV6.md:1805:P_Z:formula-3", "source": "\\boxed{ \\zeta(z)=0, \\qquad 0<\\Re(z)<1. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_3 (ctx : FormalContext) : Prop := (((ctx.zeta ctx.z) = 0) ∧ ((0 < (Complex.re ctx.z)) ∧ ((Complex.re ctx.z) < 1)))
def Node_P_Z_source_4_raw : String := "z=a\\pm ib,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 4, "location": "ES_46_RV6.md:1805:P_Z:formula-4", "source": "z=a\\pm ib,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_4 (ctx : FormalContext) : Prop := (((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib))))
def Node_P_Z_source_5_raw : String := "\\boxed{ \\rho_R = \\left| a-\\frac12 \\right|. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 5, "location": "ES_46_RV6.md:1805:P_Z:formula-5", "source": "\\boxed{ \\rho_R = \\left| a-\\frac12 \\right|. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_5 (ctx : FormalContext) : Prop := (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))))
def Node_P_Z_source_6_raw : String := "\\boxed{ \\rho=0 \\iff \\text{estado estable}, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 6, "location": "ES_46_RV6.md:1805:P_Z:formula-6", "source": "\\boxed{ \\rho=0 \\iff \\text{estado estable}, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_6 (ctx : FormalContext) : Prop := ((ctx.rho = 0) ↔ Derived_Text_estado_estable ctx)
def Node_P_Z_source_7_raw : String := "\\boxed{ 0<\\rho\\le\\frac12 \\iff \\text{estado no estable}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 7, "location": "ES_46_RV6.md:1805:P_Z:formula-7", "source": "\\boxed{ 0<\\rho\\le\\frac12 \\iff \\text{estado no estable}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_7 (ctx : FormalContext) : Prop := (((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ Derived_Text_estado_no_estable ctx)
def Node_P_Z_source_8_raw : String := "\\boxed{ \\rho_{\\rm VED} = \\rho_R = \\left| a-\\frac12 \\right|. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 8, "location": "ES_46_RV6.md:1805:P_Z:formula-8", "source": "\\boxed{ \\rho_{\\rm VED} = \\rho_R = \\left| a-\\frac12 \\right|. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_8 (ctx : FormalContext) : Prop := ((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))
def Node_P_Z_source_9_raw : String := "\\boxed{ U_{\\rm Rim}: \\qquad \\zeta(z)=0 \\quad \\text{identifica el cero}, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 9, "location": "ES_46_RV6.md:1805:P_Z:formula-9", "source": "\\boxed{ U_{\\rm Rim}: \\qquad \\zeta(z)=0 \\quad \\text{identifica el cero}, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_9 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_P_Z_source_10_raw : String := "\\boxed{ U_{\\rm VED}: \\qquad \\rho \\quad \\text{clasifica exhaustivamente su localización transversal}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 10, "location": "ES_46_RV6.md:1805:P_Z:formula-10", "source": "\\boxed{ U_{\\rm VED}: \\qquad \\rho \\quad \\text{clasifica exhaustivamente su localización transversal}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_10 (ctx : FormalContext) : Prop := (ctx.Assertion_clasifica_exhaustivamente_su_localizaci_n_transversal (ctx.rho))
def Node_P_Z_source_11_raw : String := "\\boxed{ P_Z: \\qquad z\\in Z_{\\rm Rim}^{\\rm nt} \\Rightarrow \\left[ \\zeta(z)=0 \\ \\text{en }U_{\\rm Rim} \\ \\text{y } \\rho_R=\\rho_{\\rm VED} \\ \\text{clasifica su localización transversal} \\right]. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_Z", "formula": 11, "location": "ES_46_RV6.md:1805:P_Z:formula-11", "source": "\\boxed{ P_Z: \\qquad z\\in Z_{\\rm Rim}^{\\rm nt} \\Rightarrow \\left[ \\zeta(z)=0 \\ \\text{en }U_{\\rm Rim} \\ \\text{y } \\rho_R=\\rho_{\\rm VED} \\ \\text{clasifica su localización transversal} \\right]. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_Z_source_11 (ctx : FormalContext) : Prop := (∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))
def Node_P_Z_source_12_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 12, "location": "ES_46_RV6.md:1805:P_Z:formula-12", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_P_Z_source_12_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_P_Z_source_13_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 13, "location": "ES_46_RV6.md:1805:P_Z:formula-13", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_Z_source_13_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_Z_source_14_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 14, "location": "ES_46_RV6.md:1805:P_Z:formula-14", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_P_Z_source_14_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_P_Z_source_15_raw : String := "\\zeta"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 15, "location": "ES_46_RV6.md:1805:P_Z:formula-15", "source": "\\zeta", "status": "FORMALIZED_TERM", "type": "Function[Complex,Complex]", "role": "PROOF_STEP"}
def Node_P_Z_source_15_term (ctx : FormalContext) : ℂ → ℂ := (ctx.zeta)
def Node_P_Z_source_16_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 16, "location": "ES_46_RV6.md:1805:P_Z:formula-16", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_P_Z_source_16_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_P_Z_source_17_raw : String := "\\zeta(z)=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 17, "location": "ES_46_RV6.md:1805:P_Z:formula-17", "source": "\\zeta(z)=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_17 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_P_Z_source_18_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 18, "location": "ES_46_RV6.md:1805:P_Z:formula-18", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_Z_source_18_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_Z_source_19_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 19, "location": "ES_46_RV6.md:1805:P_Z:formula-19", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_P_Z_source_19_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_P_Z_source_20_raw : String := "\\rho_R"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 20, "location": "ES_46_RV6.md:1805:P_Z:formula-20", "source": "\\rho_R", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_Z_source_20_term (ctx : FormalContext) : ℝ := (ctx.rho_R)
def Node_P_Z_source_21_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 21, "location": "ES_46_RV6.md:1805:P_Z:formula-21", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_Z_source_21_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_Z_source_steps (ctx : FormalContext) : Prop := (Node_P_Z_source_1 ctx) ∧ (Node_P_Z_source_2 ctx) ∧ (Node_P_Z_source_3 ctx) ∧ (Node_P_Z_source_4 ctx) ∧ (Node_P_Z_source_5 ctx) ∧ (Node_P_Z_source_6 ctx) ∧ (Node_P_Z_source_7 ctx) ∧ (Node_P_Z_source_8 ctx) ∧ (Node_P_Z_source_9 ctx) ∧ (Node_P_Z_source_10 ctx) ∧ (Node_P_Z_source_17 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_Z|1|PROOF_STEP|-|P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_Z|2|PROOF_STEP|1|P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_Z|3|PROOF_STEP|2|P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_Z|4|PROOF_STEP|3|P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_Z|5|PROOF_STEP|4|P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_Z|6|PROOF_STEP|5|P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_Z|7|PROOF_STEP|6|P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_Z|8|PROOF_STEP|7|P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_Z|9|PROOF_STEP|8|P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_Z|10|PROOF_STEP|9|P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_Z|11|CLAIM|10|P_VR_rho|NO_CERTIFICADO
theorem derive_P_Z (ctx : FormalContext) (h_P_VR_rho : (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))))))) (h_D_Rim : ((((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib)))) ∧ ((ctx.zeta ctx.s) = ctx.InfiniteSum_Nat_Complex (1) (fun n : ℕ => ((1 : ℂ) / ctx.Pow_Complex ((n : ℂ)) (ctx.s) : ℂ))) ∧ (ctx.s = 1) ∧ (ctx.Z_Rim_triv = ({x | ∃ m : ℕ, (m ∈ {x : ℕ | 0 < x}) ∧ (x = ((-2 * (m : ℤ))))})) ∧ (ctx.Z_Rim_nt = ({z | ((z ∈ (Set.univ : Set ℂ)) ∧ ((ctx.zeta z) = 0)) ∧ ((0 < (Complex.re z)) ∧ ((Complex.re z) < 1))})) ∧ ((((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib)))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1))))) : ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) := by
  rcases h_D_Rim with ⟨h_D_Rim_1, h_D_Rim_2, h_D_Rim_3, h_D_Rim_4, h_D_Rim_5, h_D_Rim_6⟩
  intro z hz
  rw [h_D_Rim_5] at hz
  constructor
  · exact hz.1.2
  · exact h_P_VR_rho.1.symm
-- DEMUESTRA_ASSERTION: P_Z|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_VED_R_C
-- SOURCE: ES_46_RV6.md:564
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_VED_R_C", "location": "ES_46_RV6.md:564", "source": "$P_{\\rm VED}(R_C)$ — Para cada familia $k$,\n\n$$\n0\\le\\rho\\le\\frac12\n$$\n\nrecorre todo el continuo entre cierre exacto y máxima desviación.\n\nPor tanto,", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: 0\le\rho\le\frac12
-- FORMULA: k
def Node_P_VED_R_C_source_1_raw : String := "0\\le\\rho\\le\\frac12"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VED_R_C", "formula": 1, "location": "ES_46_RV6.md:564:P_VED_R_C:formula-1", "source": "0\\le\\rho\\le\\frac12", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VED_R_C_source_1 (ctx : FormalContext) : Prop := ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))
def Node_P_VED_R_C_source_2_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_R_C", "formula": 2, "location": "ES_46_RV6.md:564:P_VED_R_C:formula-2", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "PROOF_STEP"}
def Node_P_VED_R_C_source_2_term (ctx : FormalContext) : ℕ := (ctx.k)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_R_C|1|CLAIM|-|P_VED_K_E,D_Particion,P_VED_K_I|NO_CERTIFICADO
theorem derive_P_VED_R_C (ctx : FormalContext) (h_P_VED_K_E : ((((ctx.rho = 0)) → (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = ((k, 0)))}))))) (h_D_Particion : ((ctx.U_VED_cerrado = ({x | ∃ k : ℕ, ∃ rho : ℝ, ((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (x = ((k, rho)))})) ∧ (ctx.mathcal_I_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho > 0)) ∧ (x = ((k, rho)))})))) (h_D_rho : ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))))))) : (((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) := by
  rcases h_D_Particion with ⟨h_D_Particion_1, h_D_Particion_2⟩
  rcases h_D_rho with ⟨h_D_rho_1, h_D_rho_2, h_D_rho_3, h_D_rho_4, h_D_rho_5⟩
  exact h_D_rho_2
-- DEMUESTRA_ASSERTION: P_VED_R_C|COMPLETA|VERIFICADA

-- FORMAL_NODE: T_RIEMANN
-- SOURCE: ES_46_RV6.md:1823
-- DEMUESTRA_SOURCE_PROSE: {"node": "T_RIEMANN", "location": "ES_46_RV6.md:1823", "source": "# 18. Teorema de localización transversal del cero no trivial\n\n$T_{\\rm RIEMANN}$ — **Teorema de localización transversal.** Sea\n\n\n$$\nz=a\\pm ib\n$$\n\nun cero no trivial arbitrario del sector $Z_{\\rm Rim}^{\\rm nt}$.\n\nSe demostrará que\n\n$$\n\\boxed{\na=\\frac12.\n}\n$$\n\n## Demostración\n\nPor pertenecer a $Z_{\\rm Rim}^{\\rm nt}$, se sabe en $U_{\\rm Rim}$ que\n\n$$\n\\boxed{\n\\zeta(z)=0.\n}\n$$\n\nEsta afirmación identifica el punto como cero. No fija todavía su localización transversal.\n\nPor $D_{\\rho_R}$ y $P_{\\rm VR}(\\rho)$, esa localización transversal queda medida por\n\n$$\n\\boxed{\n\\rho_R\n=\n\\left|\na-\\frac12\n\\right|\n=\n\\rho_{\\rm VED}.\n}\n$$\n\nLa clasificación de dicha coordenada no se obtiene desde Riemann, sino desde $U_{\\rm VED}$:\n\n$$\n\\rho_{\\rm VED}=0\n\\iff\n\\text{estado estable},\n$$\n\ny\n\n$$\n0<\\rho_{\\rm VED}\\le\\frac12\n\\iff\n\\text{estado no estable}.\n$$\n\nSupongamos, por reducción al absurdo, que\n\n$$\n\\boxed{\na\\neq\\frac12.\n}\n$$\n\nEntonces\n\n$$\n\\left|\na-\\frac12\n\\right|\n>0.\n$$\n\nPor $P_{\\rm VR}(\\rho)$,\n\n$$\n\\rho\n=\n\\left|\na-\\frac12\n\\right|\n>0.\n$$\n\nPero por la clasificación exhaustiva de $U_{\\rm VED}$,\n\n$$\n\\rho>0\n\\Rightarrow\n\\text{estado no estable}.\n$$\n\nEsto sitúa transversalmente al punto identificado por $\\zeta(z)=0$ en el complemento no estable de la clasificación VED.\n\nSin embargo, dentro del transporte establecido, la identidad de cero ya dada en $U_{\\rm Rim}$ debe localizarse en la clase transversal compatible con el estado estable de $U_{\\rm VED}$, porque $U_{\\rm VED}$ ha demostrado exhaustivamente que la estabilidad sólo ocurre en\n\n$$\n\\boxed{\n\\rho=0.\n}\n$$\n\nLa suposición $a\\neq1/2$ obliga entonces simultáneamente a tratar el mismo punto como cero identificado en $U_{\\rm Rim}$ y como localización transversal no estable en $U_{\\rm VED}$. Esa incompatibilidad no afecta a la identidad del cero, que permanece dada por $\\zeta(z)=0$; afecta únicamente a la localización transversal supuesta.\n\nPor tanto la suposición\n\n$$\na\\neq\\frac12\n$$\n\nes falsa.\n\nLuego,\n\n$$\n\\boxed{\na=\\frac12.\n}\n$$\n\nComo $z$ fue elegido arbitrariamente en $Z_{\\rm Rim}^{\\rm nt}$,\n\n$$\n\\boxed{\n\\forall z\\in Z_{\\rm Rim}^{\\rm nt},\n\\qquad\n\\Re(z)=\\frac12.\n}\n$$\n\nEquivalentemente,\n\n$$\n\\boxed{\nZ_{\\rm Rim}^{\\rm nt}\n\\subseteq\n\\left\\{\ns\\in\\mathbb C:\n\\Re(s)=\\frac12\n\\right\\}.\n}\n$$\n\n**Q.E.D.**\n\n---\n\n# 19. Consecuencia\n\nDentro de la cadena deductiva establecida en este documento, los ceros no triviales del sector de Riemann quedan localizados transversalmente en\n\n$$\n\\boxed{\n\\Re(s)=\\frac12.\n}\n$$\n\nLa conclusión no significa que $U_{\\rm VED}$ determine la identidad del cero. La identidad sigue siendo\n\n$$\n\\boxed{\n\\zeta(z)=0,\n}\n$$\n\ny pertenece a $U_{\\rm Rim}$.\n\nLo que queda determinado por $U_{\\rm VED}$, a través de\n\n$$\n\\boxed{\n\\rho_R=\\rho_{\\rm VED},\n}\n$$\n\nes la localización transversal compatible con la clasificación completa de estabilidad.\n\nPor tanto no existe, dentro de la parametrización completa transportada desde $U_{\\rm VED}$, un cero no trivial con\n\n$$\n\\Re(s)\\neq\\frac12,\n$$\n\nporque tal localización tendría necesariamente\n\n$$\n\\rho>0,\n$$\n\ny $U_{\\rm VED}$ ya ha demostrado que todo $\\rho>0$ pertenece al complemento no estable de la clasificación transversal.\n\nLa conclusión no se introduce como normalización ni como hipótesis posterior. Es el resultado de aplicar al espacio $U_{\\rm Rim}$ la clasificación exhaustiva de localización transversal previamente obtenida en $U_{\\rm VED}$, manteniendo separadas la identidad del cero y su posición.\n\n---\n\n# 20. Papel independiente de $U_{\\rm Lap}$\n\nLa demostración topológica directa anterior puede formularse entre\n\n$$\nU_{\\rm VED}\n\\longleftrightarrow\nU_{\\rm Rim}\n$$\n\nsin necesitar $U_{\\rm Lap}$ como puente intermedio.\n\nSin embargo, $U_{\\rm Lap}$ proporciona una comprobación independiente de gran interés:\n\n1. parte de las ecuaciones diferenciales del universo;\n2. conserva $dt'$ hasta el último paso;\n3. aplica la condición $v_{\\rm onda}=c$ sólo al final;\n4. reduce $F$ a\n\n$$\nF=dt^2+2dt;\n$$\n\n5. produce por factorización\n\n$$\nF\n=\n2dt\n\\left(\n1+\\frac12dt\n\\right);\n$$\n\n6. obtiene así el mismo lugar geométrico\n\n$$\n\\boxed{\n\\Re(s)=\\frac12.\n}\n$$\n\nPor tanto existen dos vías que convergen:\n\n$$\n\\boxed{\nU_{\\rm VED}\n\\longrightarrow\nU_{\\rm Rim}\n}\n$$\n\nmediante la conservación topológica de la estabilidad, y\n\n$$\n\\boxed{\n\\text{Lorentz}\n\\longrightarrow\nF\n\\longrightarrow\nU_{\\rm Lap}\n\\longrightarrow\n\\Re(s)=\\frac12\n}\n$$\n\nmediante la dinámica diferencial.\n\n---\n\n# 21. Control de consistencia acumulativo\n\nQuedan fijados los siguientes resultados, que no deben volver a presentarse como hipótesis en revisiones posteriores:\n\n1. $U=3S+T$.\n\n2. La elección local $ds=dx$, $dy=dz=0$ alinea coordenadas con la propagación y no reduce la dimensionalidad del universo.\n\n3. El apóstrofo de $t'$ no significa derivada.\n\n4. Por Lorentz y $v=ds/dt$,\n\n$$\nds^2=dt^2-dt'^2.\n$$\n\n5. $\\lambda$ es la longitud de onda base asociada a la materia y\n\n$$\n\\lambda=\\frac{h}{Mc}.\n$$\n\n6. El contorno se describe por\n\n$$\nL=n\\lambda.\n$$\n\n7. La representación circular de $U_{\\rm VED}$ es\n\n$$\nR_{\\rm VED}\n=\n\\frac{L}{2\\pi}\n=\n\\frac{n\\lambda}{2\\pi}.\n$$\n\n8. La circunferencia es una representación topológica; no se afirma que todo confinamiento real sea físicamente circular.\n\n9. Para cierres finitos,\n\n$$\nn=k\\pm\\rho,\n\\qquad\nk\\in\\mathbb N^+,\n\\qquad\n0\\le\\rho\\le\\frac12.\n$$\n\n10. $\\rho=0$ si y sólo si el cierre es exacto y estable.\n\n11. $0<\\rho\\le1/2$ contempla exhaustivamente los cierres no estables.\n\n12. $\\rho=1/2$ es la máxima desviación respecto del entero más próximo.\n\n13. $k\\in\\mathbb N^+$ enumera todos los cierres estables.\n\n14. $n\\to\\infty$ representa la onda abierta o libre.\n\n15. El desarrollo de relación de radios proporciona el precedente\n\n$$\n\\tilde N=R_{\\rm VED}R_{\\rm Sch}\n$$\n\ny la relación reversible entre $U_{\\rm VED}$ y $U_{\\rm Sch}$.\n\n16. La ecuación completa se conserva como\n\n$$\nF\n=\n(dt^2-dt'^2)\n+\n\\frac{d}{dt}(dt^2-dt'^2).\n$$\n\n17. Su desarrollo adoptado es\n\n$$\nF\n=\ndt^2-dt'^2\n+\n2dt\n-\n2dt'\\frac{dt'}{dt}.\n$$\n\n18. La onda viaja siempre a $c$, libre o confinada.\n\n19. Sólo al final se aplica\n\n$$\ndt'\\to0,\n\\qquad\n\\frac{dt'}{dt}\\to0.\n$$\n\n20. Entonces\n\n$$\nF=dt^2+2dt.\n$$\n\n21. La factorización es\n\n$$\nF\n=\n2dt\n\\left(\n1+\\frac12dt\n\\right).\n$$\n\n22. El $1/2$ no procede de Riemann.\n\n23. En el espacio complejo se conserva siempre el par\n\n$$\ns_\\pm=a\\pm ib.\n$$\n\n24. Los puntos estables son discretos; no toda la recta $\\Re(s)=1/2$ es estable.\n\n25. En $U_{\\rm Rim}$ los ceros triviales se separan del sector no trivial.\n\n26. Para el sector no trivial,\n\n$$\n\\rho_R\n=\n\\left|\n\\Re(z)-\\frac12\n\\right|.\n$$\n\n27. La coordenada transversal se transporta como\n\n$$\n\\rho_{\\rm VED}=\\rho_R.\n$$\n\n28. En $U_{\\rm Rim}$, la condición $\\zeta(z)=0$ identifica el cero; no aporta por sí misma la clasificación transversal de estabilidad.\n\n29. En $U_{\\rm VED}$, la coordenada $\\rho$ clasifica exhaustivamente la localización transversal: $\\rho=0$ corresponde al estado estable y $\\rho>0$ al complemento no estable.\n\n30. Por la correspondencia $\\rho_{\\rm VED}=\\rho_R$, la localización transversal de todo cero no trivial identificado en $U_{\\rm Rim}$ queda restringida a\n\n$$\n\\boxed{\n\\forall z\\in Z_{\\rm Rim}^{\\rm nt},\n\\qquad\n\\Re(z)=\\frac12.\n}\n$$\n\n---\n\n# 22. Conclusión\n\nEl desarrollo comienza en la geometría del universo y no en la Hipótesis de Riemann.\n\n$U_{\\rm VED}$ se obtiene al representar el cierre de onda mediante\n\n$$\nR_{\\rm VED}\n=\n\\frac{n\\lambda}{2\\pi}.\n$$\n\nSu parametrización\n\n$$\nn=k\\pm\\rho\n$$\n\nes completa: $k$ enumera todas las familias de cierre y $\\rho\\in[0,1/2]$ recorre todo el intervalo desde estabilidad hasta máxima desviación. Los estados estables son todos y sólo\n\n$$\n(k,0),\n\\qquad\nk\\in\\mathbb N^+.\n$$\n\nEl precedente $U_{\\rm VED}\\cong U_{\\rm Sch}$ demuestra dentro del marco que una misma información puede representarse mediante topologías diferentes conservando el estado.\n\nLa geometría diferencial produce además la ecuación\n\n$$\nF\n=\n(dt^2-dt'^2)\n+\n\\frac{d}{dt}(dt^2-dt'^2),\n$$\n\nque, conservando $dt'$ hasta aplicar al final el límite propio de una onda a $c$, conduce a\n\n$$\nF=dt^2+2dt\n$$\n\ny\n\n$$\nF\n=\n2dt\n\\left(\n1+\\frac12dt\n\\right).\n$$\n\nEl factor $1/2$ aparece por tanto antes de introducir Riemann.\n\nFinalmente, el sector no trivial de $U_{\\rm Rim}$ aporta la identidad del cero mediante\n\n$$\n\\boxed{\n\\zeta(z)=0,\n}\n$$\n\nmientras que su localización transversal se mide por\n\n$$\n\\rho_R\n=\n\\left|\n\\Re(z)-\\frac12\n\\right|,\n$$\n\nque se corresponde con la desviación $\\rho$ ya definida en $U_{\\rm VED}$.\n\nAsí, $U_{\\rm Rim}$ dice qué es el punto considerado: un cero de $\\zeta$. $U_{\\rm VED}$ dice qué localización transversal es compatible con la clasificación exhaustiva de estabilidad. Como $U_{\\rm VED}$ ha demostrado que sólo $\\rho=0$ corresponde a estabilidad y que todo $\\rho>0$ pertenece al complemento no estable, un cero no trivial con $\\Re(z)\\neq1/2$ implicaría una localización transversal no estable.\n\nLa contradicción no consiste en negar que $z$ sea cero, porque esa identidad viene dada por $\\zeta(z)=0$. La contradicción consiste en atribuir al cero identificado una localización transversal que la clasificación completa de $U_{\\rm VED}$ excluye para el estado estable transportado.\n\nPor tanto,\n\n$$\n\\boxed{\n\\forall z\\in Z_{\\rm Rim}^{\\rm nt},\n\\qquad\n\\Re(z)=\\frac12.\n}\n$$\n\n**Q.E.D.**\n\n---\n\n## Referencias de origen y ampliación\n\n- Documento 7: *La gravedad como relación geométrica de radios*, como origen ampliado del precedente $U_{\\rm VED}\\cong U_{\\rm Sch}$.\n- Documentos previos de la serie ES_46, como origen histórico de la formulación revisada.\n- Fundamentos Einstein–VED / UNIHOLOG.\n- DOI general del marco: `10.5281/zenodo.17172925`.\n\n---", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: z=a\pm ib
-- FORMULA: \boxed{ a=\frac12. }
-- FORMULA: \boxed{ \zeta(z)=0. }
-- FORMULA: \boxed{ \rho_R = \left| a-\frac12 \right| = \rho_{\rm VED}. }
-- FORMULA: \rho_{\rm VED}=0 \iff \text{estado estable},
-- FORMULA: 0<\rho_{\rm VED}\le\frac12 \iff \text{estado no estable}.
-- FORMULA: \boxed{ a\neq\frac12. }
-- FORMULA: \left| a-\frac12 \right| >0.
-- FORMULA: \rho = \left| a-\frac12 \right| >0.
-- FORMULA: \rho>0 \Rightarrow \text{estado no estable}.
-- FORMULA: \boxed{ \rho=0. }
-- FORMULA: a\neq\frac12
-- FORMULA: \boxed{ a=\frac12. }
-- FORMULA: \boxed{ \forall z\in Z_{\rm Rim}^{\rm nt}, \qquad \Re(z)=\frac12. }
-- FORMULA: \boxed{ Z_{\rm Rim}^{\rm nt} \subseteq \left\{ s\in\mathbb C: \Re(s)=\frac12 \right\}. }
-- FORMULA: \boxed{ \Re(s)=\frac12. }
-- FORMULA: \boxed{ \zeta(z)=0, }
-- FORMULA: \boxed{ \rho_R=\rho_{\rm VED}, }
-- FORMULA: \Re(s)\neq\frac12,
-- FORMULA: \rho>0,
-- FORMULA: U_{\rm VED} \longleftrightarrow U_{\rm Rim}
-- FORMULA: F=dt^2+2dt;
-- FORMULA: F = 2dt \left( 1+\frac12dt \right);
-- FORMULA: \boxed{ \Re(s)=\frac12. }
-- FORMULA: \boxed{ U_{\rm VED} \longrightarrow U_{\rm Rim} }
-- FORMULA: \boxed{ \text{Lorentz} \longrightarrow F \longrightarrow U_{\rm Lap} \longrightarrow \Re(s)=\frac12 }
-- FORMULA: ds^2=dt^2-dt'^2.
-- FORMULA: \lambda=\frac{h}{Mc}.
-- FORMULA: L=n\lambda.
-- FORMULA: R_{\rm VED} = \frac{L}{2\pi} = \frac{n\lambda}{2\pi}.
-- FORMULA: n=k\pm\rho, \qquad k\in\mathbb N^+, \qquad 0\le\rho\le\frac12.
-- FORMULA: \tilde N=R_{\rm VED}R_{\rm Sch}
-- FORMULA: F = (dt^2-dt'^2) + \frac{d}{dt}(dt^2-dt'^2).
-- FORMULA: F = dt^2-dt'^2 + 2dt - 2dt'\frac{dt'}{dt}.
-- FORMULA: dt'\to0, \qquad \frac{dt'}{dt}\to0.
-- FORMULA: F=dt^2+2dt.
-- FORMULA: F = 2dt \left( 1+\frac12dt \right).
-- FORMULA: s_\pm=a\pm ib.
-- FORMULA: \rho_R = \left| \Re(z)-\frac12 \right|.
-- FORMULA: \rho_{\rm VED}=\rho_R.
-- FORMULA: \boxed{ \forall z\in Z_{\rm Rim}^{\rm nt}, \qquad \Re(z)=\frac12. }
-- FORMULA: R_{\rm VED} = \frac{n\lambda}{2\pi}.
-- FORMULA: n=k\pm\rho
-- FORMULA: (k,0), \qquad k\in\mathbb N^+.
-- FORMULA: F = (dt^2-dt'^2) + \frac{d}{dt}(dt^2-dt'^2),
-- FORMULA: F=dt^2+2dt
-- FORMULA: F = 2dt \left( 1+\frac12dt \right).
-- FORMULA: \boxed{ \zeta(z)=0, }
-- FORMULA: \rho_R = \left| \Re(z)-\frac12 \right|,
-- FORMULA: \boxed{ \forall z\in Z_{\rm Rim}^{\rm nt}, \qquad \Re(z)=\frac12. }
-- FORMULA: Z_{\rm Rim}^{\rm nt}
-- FORMULA: Z_{\rm Rim}^{\rm nt}
-- FORMULA: U_{\rm Rim}
-- FORMULA: U_{\rm VED}
-- FORMULA: U_{\rm VED}
-- FORMULA: \zeta(z)=0
-- FORMULA: U_{\rm Rim}
-- FORMULA: U_{\rm VED}
-- FORMULA: U_{\rm VED}
-- FORMULA: a\neq1/2
-- FORMULA: U_{\rm Rim}
-- FORMULA: U_{\rm VED}
-- FORMULA: \zeta(z)=0
-- FORMULA: z
-- FORMULA: Z_{\rm Rim}^{\rm nt}
-- FORMULA: U_{\rm VED}
-- FORMULA: U_{\rm Rim}
-- FORMULA: U_{\rm VED}
-- FORMULA: U_{\rm VED}
-- FORMULA: U_{\rm VED}
-- FORMULA: \rho>0
-- FORMULA: U_{\rm Rim}
-- FORMULA: U_{\rm VED}
-- FORMULA: U_{\rm Lap}
-- FORMULA: U_{\rm Lap}
-- FORMULA: U_{\rm Lap}
-- FORMULA: dt'
-- FORMULA: v_{\rm onda}=c
-- FORMULA: F
-- FORMULA: U=3S+T
-- FORMULA: ds=dx
-- FORMULA: dy=dz=0
-- FORMULA: t'
-- FORMULA: v=ds/dt
-- FORMULA: \lambda
-- FORMULA: U_{\rm VED}
-- FORMULA: \rho=0
-- FORMULA: 0<\rho\le1/2
-- FORMULA: \rho=1/2
-- FORMULA: k\in\mathbb N^+
-- FORMULA: n\to\infty
-- FORMULA: U_{\rm VED}
-- FORMULA: U_{\rm Sch}
-- FORMULA: c
-- FORMULA: 1/2
-- FORMULA: \Re(s)=1/2
-- FORMULA: U_{\rm Rim}
-- FORMULA: U_{\rm Rim}
-- FORMULA: \zeta(z)=0
-- FORMULA: U_{\rm VED}
-- FORMULA: \rho
-- FORMULA: \rho=0
-- FORMULA: \rho>0
-- FORMULA: \rho_{\rm VED}=\rho_R
-- FORMULA: U_{\rm Rim}
-- FORMULA: U_{\rm VED}
-- FORMULA: k
-- FORMULA: \rho\in[0,1/2]
-- FORMULA: U_{\rm VED}\cong U_{\rm Sch}
-- FORMULA: dt'
-- FORMULA: c
-- FORMULA: 1/2
-- FORMULA: U_{\rm Rim}
-- FORMULA: \rho
-- FORMULA: U_{\rm VED}
-- FORMULA: U_{\rm Rim}
-- FORMULA: \zeta
-- FORMULA: U_{\rm VED}
-- FORMULA: U_{\rm VED}
-- FORMULA: \rho=0
-- FORMULA: \rho>0
-- FORMULA: \Re(z)\neq1/2
-- FORMULA: z
-- FORMULA: \zeta(z)=0
-- FORMULA: U_{\rm VED}
-- FORMULA: U_{\rm VED}\cong U_{\rm Sch}
def Node_T_RIEMANN_source_1_raw : String := "z=a\\pm ib"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 1, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-1", "source": "z=a\\pm ib", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_1 (ctx : FormalContext) : Prop := (((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib))))
def Node_T_RIEMANN_source_2_raw : String := "\\boxed{ a=\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 2, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-2", "source": "\\boxed{ a=\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "GOAL"}
def Node_T_RIEMANN_source_2 (ctx : FormalContext) : Prop := (ctx.a = ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_3_raw : String := "\\boxed{ \\zeta(z)=0. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 3, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-3", "source": "\\boxed{ \\zeta(z)=0. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_3 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_T_RIEMANN_source_4_raw : String := "\\boxed{ \\rho_R = \\left| a-\\frac12 \\right| = \\rho_{\\rm VED}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 4, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-4", "source": "\\boxed{ \\rho_R = \\left| a-\\frac12 \\right| = \\rho_{\\rm VED}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_4 (ctx : FormalContext) : Prop := ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))) = ctx.rho_VED))
def Node_T_RIEMANN_source_5_raw : String := "\\rho_{\\rm VED}=0 \\iff \\text{estado estable},"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 5, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-5", "source": "\\rho_{\\rm VED}=0 \\iff \\text{estado estable},", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_5 (ctx : FormalContext) : Prop := ((ctx.rho_VED = 0) ↔ Derived_Text_estado_estable ctx)
def Node_T_RIEMANN_source_6_raw : String := "0<\\rho_{\\rm VED}\\le\\frac12 \\iff \\text{estado no estable}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 6, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-6", "source": "0<\\rho_{\\rm VED}\\le\\frac12 \\iff \\text{estado no estable}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_6 (ctx : FormalContext) : Prop := (((0 < ctx.rho_VED) ∧ (ctx.rho_VED ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ Derived_Text_estado_no_estable ctx)
def Node_T_RIEMANN_source_7_raw : String := "\\boxed{ a\\neq\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 7, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-7", "source": "\\boxed{ a\\neq\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "LOCAL_ASSUMPTION"}
def Node_T_RIEMANN_source_7 (ctx : FormalContext) : Prop := (ctx.a ≠ ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_8_raw : String := "\\left| a-\\frac12 \\right| >0."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 8, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-8", "source": "\\left| a-\\frac12 \\right| >0.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_8 (ctx : FormalContext) : Prop := ((abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))) > 0)
def Node_T_RIEMANN_source_9_raw : String := "\\rho = \\left| a-\\frac12 \\right| >0."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 9, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-9", "source": "\\rho = \\left| a-\\frac12 \\right| >0.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_9 (ctx : FormalContext) : Prop := ((ctx.rho = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))) > 0))
def Node_T_RIEMANN_source_10_raw : String := "\\rho>0 \\Rightarrow \\text{estado no estable}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 10, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-10", "source": "\\rho>0 \\Rightarrow \\text{estado no estable}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_10 (ctx : FormalContext) : Prop := ((ctx.rho > 0) → Derived_Text_estado_no_estable ctx)
def Node_T_RIEMANN_source_11_raw : String := "\\boxed{ \\rho=0. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 11, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-11", "source": "\\boxed{ \\rho=0. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_11 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_T_RIEMANN_source_12_raw : String := "a\\neq\\frac12"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 12, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-12", "source": "a\\neq\\frac12", "status": "FORMALIZED_PROP", "type": "Prop", "role": "CONCLUSION"}
def Node_T_RIEMANN_source_12 (ctx : FormalContext) : Prop := (ctx.a ≠ ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_13_raw : String := "\\boxed{ a=\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 13, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-13", "source": "\\boxed{ a=\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "CONCLUSION"}
def Node_T_RIEMANN_source_13 (ctx : FormalContext) : Prop := (ctx.a = ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_14_raw : String := "\\boxed{ \\forall z\\in Z_{\\rm Rim}^{\\rm nt}, \\qquad \\Re(z)=\\frac12. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "T_RIEMANN", "formula": 14, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-14", "source": "\\boxed{ \\forall z\\in Z_{\\rm Rim}^{\\rm nt}, \\qquad \\Re(z)=\\frac12. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_T_RIEMANN_source_14 (ctx : FormalContext) : Prop := (∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → ((Complex.re z) = ((1 : ℝ) / (2 : ℝ))))
def Node_T_RIEMANN_source_15_raw : String := "\\boxed{ Z_{\\rm Rim}^{\\rm nt} \\subseteq \\left\\{ s\\in\\mathbb C: \\Re(s)=\\frac12 \\right\\}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 15, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-15", "source": "\\boxed{ Z_{\\rm Rim}^{\\rm nt} \\subseteq \\left\\{ s\\in\\mathbb C: \\Re(s)=\\frac12 \\right\\}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "EQUIVALENT_CONCLUSION"}
def Node_T_RIEMANN_source_15 (ctx : FormalContext) : Prop := (ctx.Z_Rim_nt ⊆ ({s | (s ∈ (Set.univ : Set ℂ)) ∧ ((Complex.re s) = ((1 : ℝ) / (2 : ℝ)))}))
def Node_T_RIEMANN_source_16_raw : String := "\\boxed{ \\Re(s)=\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 16, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-16", "source": "\\boxed{ \\Re(s)=\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_16 (ctx : FormalContext) : Prop := ((Complex.re ctx.s) = ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_17_raw : String := "\\boxed{ \\zeta(z)=0, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 17, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-17", "source": "\\boxed{ \\zeta(z)=0, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_17 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_T_RIEMANN_source_18_raw : String := "\\boxed{ \\rho_R=\\rho_{\\rm VED}, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 18, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-18", "source": "\\boxed{ \\rho_R=\\rho_{\\rm VED}, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_18 (ctx : FormalContext) : Prop := (ctx.rho_R = ctx.rho_VED)
def Node_T_RIEMANN_source_19_raw : String := "\\Re(s)\\neq\\frac12,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 19, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-19", "source": "\\Re(s)\\neq\\frac12,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "CONCLUSION"}
def Node_T_RIEMANN_source_19 (ctx : FormalContext) : Prop := ((Complex.re ctx.s) ≠ ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_20_raw : String := "\\rho>0,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 20, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-20", "source": "\\rho>0,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_20 (ctx : FormalContext) : Prop := (ctx.rho > 0)
def Node_T_RIEMANN_source_21_raw : String := "U_{\\rm VED} \\longleftrightarrow U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 21, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-21", "source": "U_{\\rm VED} \\longleftrightarrow U_{\\rm Rim}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_21 (ctx : FormalContext) : Prop := (ctx.Corresponds_Set_Real_to_Set_Complex ctx.U_VED ctx.U_Rim)
def Node_T_RIEMANN_source_22_raw : String := "F=dt^2+2dt;"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 22, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-22", "source": "F=dt^2+2dt;", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_22 (ctx : FormalContext) : Prop := (ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))
def Node_T_RIEMANN_source_23_raw : String := "F = 2dt \\left( 1+\\frac12dt \\right);"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 23, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-23", "source": "F = 2dt \\left( 1+\\frac12dt \\right);", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_23 (ctx : FormalContext) : Prop := (ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))
def Node_T_RIEMANN_source_24_raw : String := "\\boxed{ \\Re(s)=\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 24, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-24", "source": "\\boxed{ \\Re(s)=\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_24 (ctx : FormalContext) : Prop := ((Complex.re ctx.s) = ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_25_raw : String := "\\boxed{ U_{\\rm VED} \\longrightarrow U_{\\rm Rim} }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 25, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-25", "source": "\\boxed{ U_{\\rm VED} \\longrightarrow U_{\\rm Rim} }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "CONCLUSION"}
def Node_T_RIEMANN_source_25 (ctx : FormalContext) : Prop := (ctx.Transforms_Set_Real_to_Set_Complex ctx.U_VED ctx.U_Rim)
def Node_T_RIEMANN_source_26_raw : String := "\\boxed{ \\text{Lorentz} \\longrightarrow F \\longrightarrow U_{\\rm Lap} \\longrightarrow \\Re(s)=\\frac12 }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 26, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-26", "source": "\\boxed{ \\text{Lorentz} \\longrightarrow F \\longrightarrow U_{\\rm Lap} \\longrightarrow \\Re(s)=\\frac12 }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_26 (ctx : FormalContext) : Prop := (((ctx.Transforms_Prop_to_Real ctx.Text_Lorentz ctx.F) ∧ (ctx.Transforms_Real_to_Real ctx.F ctx.U_Lap)) ∧ (ctx.Transforms_Real_to_Prop ctx.U_Lap ((Complex.re ctx.s) = ((1 : ℝ) / (2 : ℝ)))))
def Node_T_RIEMANN_source_27_raw : String := "ds^2=dt^2-dt'^2."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 27, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-27", "source": "ds^2=dt^2-dt'^2.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_27 (ctx : FormalContext) : Prop := (ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))
def Node_T_RIEMANN_source_28_raw : String := "\\lambda=\\frac{h}{Mc}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 28, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-28", "source": "\\lambda=\\frac{h}{Mc}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_28 (ctx : FormalContext) : Prop := (ctx.lambda = (ctx.h / ctx.Mc))
def Node_T_RIEMANN_source_29_raw : String := "L=n\\lambda."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 29, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-29", "source": "L=n\\lambda.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_29 (ctx : FormalContext) : Prop := (ctx.L = (ctx.n * ctx.lambda))
def Node_T_RIEMANN_source_30_raw : String := "R_{\\rm VED} = \\frac{L}{2\\pi} = \\frac{n\\lambda}{2\\pi}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 30, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-30", "source": "R_{\\rm VED} = \\frac{L}{2\\pi} = \\frac{n\\lambda}{2\\pi}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_30 (ctx : FormalContext) : Prop := ((ctx.R_VED = (ctx.L / ((2 : ℝ) * Real.pi))) ∧ ((ctx.L / ((2 : ℝ) * Real.pi)) = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi))))
def Node_T_RIEMANN_source_31_raw : String := "n=k\\pm\\rho, \\qquad k\\in\\mathbb N^+, \\qquad 0\\le\\rho\\le\\frac12."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 31, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-31", "source": "n=k\\pm\\rho, \\qquad k\\in\\mathbb N^+, \\qquad 0\\le\\rho\\le\\frac12.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_31 (ctx : FormalContext) : Prop := (((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))))
def Node_T_RIEMANN_source_32_raw : String := "\\tilde N=R_{\\rm VED}R_{\\rm Sch}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 32, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-32", "source": "\\tilde N=R_{\\rm VED}R_{\\rm Sch}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_32 (ctx : FormalContext) : Prop := (ctx.tilde_N = (ctx.R_VED * ctx.R_Sch))
def Node_T_RIEMANN_source_33_raw : String := "F = (dt^2-dt'^2) + \\frac{d}{dt}(dt^2-dt'^2)."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 33, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-33", "source": "F = (dt^2-dt'^2) + \\frac{d}{dt}(dt^2-dt'^2).", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_33 (ctx : FormalContext) : Prop := (ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))
def Node_T_RIEMANN_source_34_raw : String := "F = dt^2-dt'^2 + 2dt - 2dt'\\frac{dt'}{dt}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 34, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-34", "source": "F = dt^2-dt'^2 + 2dt - 2dt'\\frac{dt'}{dt}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_34 (ctx : FormalContext) : Prop := (ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))
def Node_T_RIEMANN_source_35_raw : String := "dt'\\to0, \\qquad \\frac{dt'}{dt}\\to0."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 35, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-35", "source": "dt'\\to0, \\qquad \\frac{dt'}{dt}\\to0.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_35 (ctx : FormalContext) : Prop := ((ctx.TendsTo (ctx.dt_prime) (0)) ∧ (ctx.TendsTo (ctx.Derivative_t (ctx.t_prime)) (0)))
def Node_T_RIEMANN_source_36_raw : String := "F=dt^2+2dt."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 36, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-36", "source": "F=dt^2+2dt.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_36 (ctx : FormalContext) : Prop := (ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))
def Node_T_RIEMANN_source_37_raw : String := "F = 2dt \\left( 1+\\frac12dt \\right)."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 37, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-37", "source": "F = 2dt \\left( 1+\\frac12dt \\right).", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_37 (ctx : FormalContext) : Prop := (ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))
def Node_T_RIEMANN_source_38_raw : String := "s_\\pm=a\\pm ib."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 38, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-38", "source": "s_\\pm=a\\pm ib.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_38 (ctx : FormalContext) : Prop := (((ctx.s_PM) = ((ctx.a + ctx.ib)) ∨ (ctx.s_PM) = ((ctx.a - ctx.ib))))
def Node_T_RIEMANN_source_39_raw : String := "\\rho_R = \\left| \\Re(z)-\\frac12 \\right|."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 39, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-39", "source": "\\rho_R = \\left| \\Re(z)-\\frac12 \\right|.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_39 (ctx : FormalContext) : Prop := (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))
def Node_T_RIEMANN_source_40_raw : String := "\\rho_{\\rm VED}=\\rho_R."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 40, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-40", "source": "\\rho_{\\rm VED}=\\rho_R.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_40 (ctx : FormalContext) : Prop := (ctx.rho_VED = ctx.rho_R)
def Node_T_RIEMANN_source_41_raw : String := "\\boxed{ \\forall z\\in Z_{\\rm Rim}^{\\rm nt}, \\qquad \\Re(z)=\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 41, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-41", "source": "\\boxed{ \\forall z\\in Z_{\\rm Rim}^{\\rm nt}, \\qquad \\Re(z)=\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_41 (ctx : FormalContext) : Prop := (∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → ((Complex.re z) = ((1 : ℝ) / (2 : ℝ))))
def Node_T_RIEMANN_source_42_raw : String := "R_{\\rm VED} = \\frac{n\\lambda}{2\\pi}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 42, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-42", "source": "R_{\\rm VED} = \\frac{n\\lambda}{2\\pi}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_42 (ctx : FormalContext) : Prop := (ctx.R_VED = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi)))
def Node_T_RIEMANN_source_43_raw : String := "n=k\\pm\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 43, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-43", "source": "n=k\\pm\\rho", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_43 (ctx : FormalContext) : Prop := (((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho))))
def Node_T_RIEMANN_source_44_raw : String := "(k,0), \\qquad k\\in\\mathbb N^+."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 44, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-44", "source": "(k,0), \\qquad k\\in\\mathbb N^+.", "status": "FORMALIZED_TERM", "type": "Set[Tuple[Nat,Nat]]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_44_term (ctx : FormalContext) : Set (ℕ × ℕ) := ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = ((k, 0)))})
def Node_T_RIEMANN_source_45_raw : String := "F = (dt^2-dt'^2) + \\frac{d}{dt}(dt^2-dt'^2),"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 45, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-45", "source": "F = (dt^2-dt'^2) + \\frac{d}{dt}(dt^2-dt'^2),", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_45 (ctx : FormalContext) : Prop := (ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))
def Node_T_RIEMANN_source_46_raw : String := "F=dt^2+2dt"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 46, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-46", "source": "F=dt^2+2dt", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_46 (ctx : FormalContext) : Prop := (ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))
def Node_T_RIEMANN_source_47_raw : String := "F = 2dt \\left( 1+\\frac12dt \\right)."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 47, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-47", "source": "F = 2dt \\left( 1+\\frac12dt \\right).", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_47 (ctx : FormalContext) : Prop := (ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))
def Node_T_RIEMANN_source_48_raw : String := "\\boxed{ \\zeta(z)=0, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 48, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-48", "source": "\\boxed{ \\zeta(z)=0, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "CONCLUSION"}
def Node_T_RIEMANN_source_48 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_T_RIEMANN_source_49_raw : String := "\\rho_R = \\left| \\Re(z)-\\frac12 \\right|,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 49, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-49", "source": "\\rho_R = \\left| \\Re(z)-\\frac12 \\right|,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_49 (ctx : FormalContext) : Prop := (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))
def Node_T_RIEMANN_source_50_raw : String := "\\boxed{ \\forall z\\in Z_{\\rm Rim}^{\\rm nt}, \\qquad \\Re(z)=\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 50, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-50", "source": "\\boxed{ \\forall z\\in Z_{\\rm Rim}^{\\rm nt}, \\qquad \\Re(z)=\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "CONCLUSION"}
def Node_T_RIEMANN_source_50 (ctx : FormalContext) : Prop := (∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → ((Complex.re z) = ((1 : ℝ) / (2 : ℝ))))
def Node_T_RIEMANN_source_51_raw : String := "Z_{\\rm Rim}^{\\rm nt}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 51, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-51", "source": "Z_{\\rm Rim}^{\\rm nt}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_51_term (ctx : FormalContext) : Set (ℂ) := (ctx.Z_Rim_nt)
def Node_T_RIEMANN_source_52_raw : String := "Z_{\\rm Rim}^{\\rm nt}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 52, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-52", "source": "Z_{\\rm Rim}^{\\rm nt}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_52_term (ctx : FormalContext) : Set (ℂ) := (ctx.Z_Rim_nt)
def Node_T_RIEMANN_source_53_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 53, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-53", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_53_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_54_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 54, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-54", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_54_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_55_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 55, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-55", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_55_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_56_raw : String := "\\zeta(z)=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 56, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-56", "source": "\\zeta(z)=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_56 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_T_RIEMANN_source_57_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 57, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-57", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_57_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_58_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 58, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-58", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_58_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_59_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 59, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-59", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_59_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_60_raw : String := "a\\neq1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 60, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-60", "source": "a\\neq1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_60 (ctx : FormalContext) : Prop := (ctx.a ≠ ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_61_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 61, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-61", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_61_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_62_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 62, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-62", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_62_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_63_raw : String := "\\zeta(z)=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 63, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-63", "source": "\\zeta(z)=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_63 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_T_RIEMANN_source_64_raw : String := "z"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 64, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-64", "source": "z", "status": "FORMALIZED_TERM", "type": "Complex", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_64_term (ctx : FormalContext) : ℂ := (ctx.z)
def Node_T_RIEMANN_source_65_raw : String := "Z_{\\rm Rim}^{\\rm nt}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 65, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-65", "source": "Z_{\\rm Rim}^{\\rm nt}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_65_term (ctx : FormalContext) : Set (ℂ) := (ctx.Z_Rim_nt)
def Node_T_RIEMANN_source_66_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 66, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-66", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_66_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_67_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 67, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-67", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_67_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_68_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 68, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-68", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_68_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_69_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 69, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-69", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_69_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_70_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 70, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-70", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_70_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_71_raw : String := "\\rho>0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 71, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-71", "source": "\\rho>0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_71 (ctx : FormalContext) : Prop := (ctx.rho > 0)
def Node_T_RIEMANN_source_72_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 72, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-72", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_72_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_73_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 73, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-73", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_73_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_74_raw : String := "U_{\\rm Lap}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 74, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-74", "source": "U_{\\rm Lap}", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_74_term (ctx : FormalContext) : ℝ := (ctx.U_Lap)
def Node_T_RIEMANN_source_75_raw : String := "U_{\\rm Lap}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 75, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-75", "source": "U_{\\rm Lap}", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_75_term (ctx : FormalContext) : ℝ := (ctx.U_Lap)
def Node_T_RIEMANN_source_76_raw : String := "U_{\\rm Lap}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 76, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-76", "source": "U_{\\rm Lap}", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_76_term (ctx : FormalContext) : ℝ := (ctx.U_Lap)
def Node_T_RIEMANN_source_77_raw : String := "dt'"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 77, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-77", "source": "dt'", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_77_term (ctx : FormalContext) : ℝ := (ctx.dt_prime)
def Node_T_RIEMANN_source_78_raw : String := "v_{\\rm onda}=c"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 78, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-78", "source": "v_{\\rm onda}=c", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_78 (ctx : FormalContext) : Prop := (ctx.v_onda = ctx.c)
def Node_T_RIEMANN_source_79_raw : String := "F"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 79, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-79", "source": "F", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_79_term (ctx : FormalContext) : ℝ := (ctx.F)
def Node_T_RIEMANN_source_80_raw : String := "U=3S+T"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 80, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-80", "source": "U=3S+T", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_80 (ctx : FormalContext) : Prop := (ctx.U = (((3 : ℝ) * ctx.S) + ctx.T))
def Node_T_RIEMANN_source_81_raw : String := "ds=dx"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 81, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-81", "source": "ds=dx", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_81 (ctx : FormalContext) : Prop := (ctx.ds = ctx.dx)
def Node_T_RIEMANN_source_82_raw : String := "dy=dz=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 82, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-82", "source": "dy=dz=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_82 (ctx : FormalContext) : Prop := ((ctx.dy = ctx.dz) ∧ (ctx.dz = 0))
def Node_T_RIEMANN_source_83_raw : String := "t'"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 83, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-83", "source": "t'", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_83_term (ctx : FormalContext) : ℝ := (ctx.t_prime)
def Node_T_RIEMANN_source_84_raw : String := "v=ds/dt"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 84, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-84", "source": "v=ds/dt", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_84 (ctx : FormalContext) : Prop := (ctx.v = (ctx.ds / ctx.dt))
def Node_T_RIEMANN_source_85_raw : String := "\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 85, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-85", "source": "\\lambda", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_85_term (ctx : FormalContext) : ℝ := (ctx.lambda)
def Node_T_RIEMANN_source_86_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 86, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-86", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_86_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_87_raw : String := "\\rho=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 87, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-87", "source": "\\rho=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_87 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_T_RIEMANN_source_88_raw : String := "0<\\rho\\le1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 88, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-88", "source": "0<\\rho\\le1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_88 (ctx : FormalContext) : Prop := ((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))
def Node_T_RIEMANN_source_89_raw : String := "\\rho=1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 89, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-89", "source": "\\rho=1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_89 (ctx : FormalContext) : Prop := (ctx.rho = ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_90_raw : String := "k\\in\\mathbb N^+"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 90, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-90", "source": "k\\in\\mathbb N^+", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_90 (ctx : FormalContext) : Prop := (ctx.k ∈ {x : ℕ | 0 < x})
def Node_T_RIEMANN_source_91_raw : String := "n\\to\\infty"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 91, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-91", "source": "n\\to\\infty", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_91 (ctx : FormalContext) : Prop := (ctx.DivergesToInfinity (ctx.n))
def Node_T_RIEMANN_source_92_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 92, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-92", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_92_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_93_raw : String := "U_{\\rm Sch}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 93, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-93", "source": "U_{\\rm Sch}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_93_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_Sch)
def Node_T_RIEMANN_source_94_raw : String := "c"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 94, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-94", "source": "c", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_94_term (ctx : FormalContext) : ℝ := (ctx.c)
def Node_T_RIEMANN_source_95_raw : String := "1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 95, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-95", "source": "1/2", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_95_term (ctx : FormalContext) : ℝ := ((1 : ℝ) / (2 : ℝ))
def Node_T_RIEMANN_source_96_raw : String := "\\Re(s)=1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 96, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-96", "source": "\\Re(s)=1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_96 (ctx : FormalContext) : Prop := ((Complex.re ctx.s) = ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_97_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 97, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-97", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_97_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_98_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 98, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-98", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_98_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_99_raw : String := "\\zeta(z)=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 99, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-99", "source": "\\zeta(z)=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_99 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_T_RIEMANN_source_100_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 100, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-100", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_100_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_101_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 101, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-101", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_101_term (ctx : FormalContext) : ℝ := (ctx.rho)
def Node_T_RIEMANN_source_102_raw : String := "\\rho=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 102, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-102", "source": "\\rho=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_102 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_T_RIEMANN_source_103_raw : String := "\\rho>0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 103, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-103", "source": "\\rho>0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_103 (ctx : FormalContext) : Prop := (ctx.rho > 0)
def Node_T_RIEMANN_source_104_raw : String := "\\rho_{\\rm VED}=\\rho_R"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 104, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-104", "source": "\\rho_{\\rm VED}=\\rho_R", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_104 (ctx : FormalContext) : Prop := (ctx.rho_VED = ctx.rho_R)
def Node_T_RIEMANN_source_105_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 105, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-105", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_105_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_106_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 106, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-106", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_106_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_107_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 107, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-107", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_107_term (ctx : FormalContext) : ℕ := (ctx.k)
def Node_T_RIEMANN_source_108_raw : String := "\\rho\\in[0,1/2]"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 108, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-108", "source": "\\rho\\in[0,1/2]", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_108 (ctx : FormalContext) : Prop := (ctx.rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_109_raw : String := "U_{\\rm VED}\\cong U_{\\rm Sch}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 109, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-109", "source": "U_{\\rm VED}\\cong U_{\\rm Sch}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_109 (ctx : FormalContext) : Prop := (Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))
def Node_T_RIEMANN_source_110_raw : String := "dt'"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 110, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-110", "source": "dt'", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_110_term (ctx : FormalContext) : ℝ := (ctx.dt_prime)
def Node_T_RIEMANN_source_111_raw : String := "c"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 111, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-111", "source": "c", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_111_term (ctx : FormalContext) : ℝ := (ctx.c)
def Node_T_RIEMANN_source_112_raw : String := "1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 112, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-112", "source": "1/2", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_112_term (ctx : FormalContext) : ℝ := ((1 : ℝ) / (2 : ℝ))
def Node_T_RIEMANN_source_113_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 113, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-113", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_113_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_114_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 114, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-114", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_114_term (ctx : FormalContext) : ℝ := (ctx.rho)
def Node_T_RIEMANN_source_115_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 115, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-115", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_115_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_116_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 116, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-116", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_116_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_117_raw : String := "\\zeta"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 117, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-117", "source": "\\zeta", "status": "FORMALIZED_TERM", "type": "Function[Complex,Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_117_term (ctx : FormalContext) : ℂ → ℂ := (ctx.zeta)
def Node_T_RIEMANN_source_118_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 118, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-118", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_118_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_119_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 119, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-119", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_119_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_120_raw : String := "\\rho=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 120, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-120", "source": "\\rho=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_120 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_T_RIEMANN_source_121_raw : String := "\\rho>0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 121, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-121", "source": "\\rho>0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_121 (ctx : FormalContext) : Prop := (ctx.rho > 0)
def Node_T_RIEMANN_source_122_raw : String := "\\Re(z)\\neq1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 122, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-122", "source": "\\Re(z)\\neq1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_122 (ctx : FormalContext) : Prop := ((Complex.re ctx.z) ≠ ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_123_raw : String := "z"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 123, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-123", "source": "z", "status": "FORMALIZED_TERM", "type": "Complex", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_123_term (ctx : FormalContext) : ℂ := (ctx.z)
def Node_T_RIEMANN_source_124_raw : String := "\\zeta(z)=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 124, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-124", "source": "\\zeta(z)=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_124 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_T_RIEMANN_source_125_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 125, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-125", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_125_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_126_raw : String := "U_{\\rm VED}\\cong U_{\\rm Sch}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 126, "location": "ES_46_RV6.md:1823:T_RIEMANN:formula-126", "source": "U_{\\rm VED}\\cong U_{\\rm Sch}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_126 (ctx : FormalContext) : Prop := (Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))
def Node_T_RIEMANN_source_steps (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_1 ctx) ∧ (Node_T_RIEMANN_source_2 ctx) ∧ (Node_T_RIEMANN_source_3 ctx) ∧ (Node_T_RIEMANN_source_4 ctx) ∧ (Node_T_RIEMANN_source_5 ctx) ∧ (Node_T_RIEMANN_source_6 ctx) ∧ (Node_T_RIEMANN_source_7 ctx) ∧ (Node_T_RIEMANN_source_8 ctx) ∧ (Node_T_RIEMANN_source_9 ctx) ∧ (Node_T_RIEMANN_source_10 ctx) ∧ (Node_T_RIEMANN_source_11 ctx) ∧ (Node_T_RIEMANN_source_12 ctx) ∧ (Node_T_RIEMANN_source_13 ctx) ∧ (Node_T_RIEMANN_source_15 ctx) ∧ (Node_T_RIEMANN_source_16 ctx) ∧ (Node_T_RIEMANN_source_17 ctx) ∧ (Node_T_RIEMANN_source_18 ctx) ∧ (Node_T_RIEMANN_source_19 ctx) ∧ (Node_T_RIEMANN_source_20 ctx) ∧ (Node_T_RIEMANN_source_21 ctx) ∧ (Node_T_RIEMANN_source_22 ctx) ∧ (Node_T_RIEMANN_source_23 ctx) ∧ (Node_T_RIEMANN_source_24 ctx) ∧ (Node_T_RIEMANN_source_25 ctx) ∧ (Node_T_RIEMANN_source_26 ctx) ∧ (Node_T_RIEMANN_source_27 ctx) ∧ (Node_T_RIEMANN_source_28 ctx) ∧ (Node_T_RIEMANN_source_29 ctx) ∧ (Node_T_RIEMANN_source_30 ctx) ∧ (Node_T_RIEMANN_source_31 ctx) ∧ (Node_T_RIEMANN_source_32 ctx) ∧ (Node_T_RIEMANN_source_33 ctx) ∧ (Node_T_RIEMANN_source_34 ctx) ∧ (Node_T_RIEMANN_source_35 ctx) ∧ (Node_T_RIEMANN_source_36 ctx) ∧ (Node_T_RIEMANN_source_37 ctx) ∧ (Node_T_RIEMANN_source_38 ctx) ∧ (Node_T_RIEMANN_source_39 ctx) ∧ (Node_T_RIEMANN_source_40 ctx) ∧ (Node_T_RIEMANN_source_41 ctx) ∧ (Node_T_RIEMANN_source_42 ctx) ∧ (Node_T_RIEMANN_source_43 ctx) ∧ (Node_T_RIEMANN_source_45 ctx) ∧ (Node_T_RIEMANN_source_46 ctx) ∧ (Node_T_RIEMANN_source_47 ctx) ∧ (Node_T_RIEMANN_source_48 ctx) ∧ (Node_T_RIEMANN_source_49 ctx) ∧ (Node_T_RIEMANN_source_50 ctx) ∧ (Node_T_RIEMANN_source_56 ctx) ∧ (Node_T_RIEMANN_source_60 ctx) ∧ (Node_T_RIEMANN_source_63 ctx) ∧ (Node_T_RIEMANN_source_71 ctx) ∧ (Node_T_RIEMANN_source_78 ctx) ∧ (Node_T_RIEMANN_source_80 ctx) ∧ (Node_T_RIEMANN_source_81 ctx) ∧ (Node_T_RIEMANN_source_82 ctx) ∧ (Node_T_RIEMANN_source_84 ctx) ∧ (Node_T_RIEMANN_source_87 ctx) ∧ (Node_T_RIEMANN_source_88 ctx) ∧ (Node_T_RIEMANN_source_89 ctx) ∧ (Node_T_RIEMANN_source_90 ctx) ∧ (Node_T_RIEMANN_source_91 ctx) ∧ (Node_T_RIEMANN_source_96 ctx) ∧ (Node_T_RIEMANN_source_99 ctx) ∧ (Node_T_RIEMANN_source_102 ctx) ∧ (Node_T_RIEMANN_source_103 ctx) ∧ (Node_T_RIEMANN_source_104 ctx) ∧ (Node_T_RIEMANN_source_108 ctx) ∧ (Node_T_RIEMANN_source_109 ctx) ∧ (Node_T_RIEMANN_source_120 ctx) ∧ (Node_T_RIEMANN_source_121 ctx) ∧ (Node_T_RIEMANN_source_122 ctx) ∧ (Node_T_RIEMANN_source_124 ctx) ∧ (Node_T_RIEMANN_source_126 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|1|PROOF_STEP|-|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|2|GOAL|1|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|3|PROOF_STEP|2|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|4|DERIVED_STEP|3|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|5|PROOF_STEP|4|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|6|PROOF_STEP|5|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|8|DERIVED_STEP|7|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|9|PROOF_STEP|8|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|10|DERIVED_STEP|9|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|11|DERIVED_STEP|10|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|12|CONCLUSION|11|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|13|CONCLUSION|12|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|14|CLAIM|13|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|15|EQUIVALENT_CONCLUSION|14|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|16|PROOF_STEP|15|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|17|PROOF_STEP|16|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|18|DERIVED_STEP|17|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|19|CONCLUSION|18|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|20|PROOF_STEP|19|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|21|PROOF_STEP|20|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|22|DERIVED_STEP|21|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|23|DERIVED_STEP|22|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|24|PROOF_STEP|23|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|25|CONCLUSION|24|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|26|PROOF_STEP|25|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|27|DERIVED_STEP|26|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|28|PROOF_STEP|27|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|29|PROOF_STEP|28|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|30|PROOF_STEP|29|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|31|PROOF_STEP|30|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|32|PROOF_STEP|31|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|33|PROOF_STEP|32|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|34|PROOF_STEP|33|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|35|PROOF_STEP|34|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|36|DERIVED_STEP|35|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|37|PROOF_STEP|36|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|38|PROOF_STEP|37|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|39|PROOF_STEP|38|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|40|PROOF_STEP|39|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|41|DERIVED_STEP|40|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|42|PROOF_STEP|41|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|43|PROOF_STEP|42|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|45|PROOF_STEP|43|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|46|PROOF_STEP|45|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|47|PROOF_STEP|46|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|48|CONCLUSION|47|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|49|PROOF_STEP|48|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|50|CONCLUSION|49|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|71|PROOF_STEP|50|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|103|PROOF_STEP|71|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|104|PROOF_STEP|103|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: T_RIEMANN|121|PROOF_STEP|104|T_ISO,P_RHO_ISO,P_RIM_S,P_Z,D_rho_R,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_PENDING_PROOF: {"node": "T_RIEMANN", "location": "ES_46_RV6.md:1823", "origin": "GENERATOR", "reason": "NO_COMPLETE_DERIVATION_GENERATED", "verification_state": "VERIFICACION_FORMAL_PENDIENTE", "interpretation_detail": null, "statement": "(∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → ((Complex.re z) = ((1 : ℝ) / (2 : ℝ))))", "dependencies": ["T_ISO", "P_RHO_ISO", "P_RIM_S", "P_Z", "D_rho_R", "P_VR_rho", "D_Rim"], "partial_theorems": [], "pending_parts": ["∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → ((Complex.re z) = ((1 : ℝ) / (2 : ℝ)))"], "source_present": true, "source_refuted": false, "prose_interpretation_complete": false}
-- DEMUESTRA_ASSERTION: T_RIEMANN|COMPLETA|NO_DETERMINADO

-- FORMAL_NODE: P_VED_Completo
-- SOURCE: ES_46_RV6.md:576
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_VED_Completo", "location": "ES_46_RV6.md:576", "source": "$$\n\\boxed{\nP_{\\rm VED}(\\mathrm{Completo}):\n\\quad\nU_{\\rm VED}^{\\rm cerrado}\n=\n\\mathcal E_{\\rm VED}\n\\sqcup\n\\mathcal I_{\\rm VED},\n}\n$$\n\ny, añadiendo el límite $n\\to\\infty$, queda contemplada también la onda abierta.\n\nNo existe una cuarta clase de onda respecto del cierre que no haya sido considerada.\n\n---", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ P_{\rm VED}(\mathrm{Completo}): \quad U_{\rm VED}^{\rm cerrado} = \mathcal E_{\rm VED} \sqcup \mathcal I_{\rm VED}, }
-- FORMULA: n\to\infty
def Node_P_VED_Completo_source_1_raw : String := "\\boxed{ P_{\\rm VED}(\\mathrm{Completo}): \\quad U_{\\rm VED}^{\\rm cerrado} = \\mathcal E_{\\rm VED} \\sqcup \\mathcal I_{\\rm VED}, }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VED_Completo", "formula": 1, "location": "ES_46_RV6.md:576:P_VED_Completo:formula-1", "source": "\\boxed{ P_{\\rm VED}(\\mathrm{Completo}): \\quad U_{\\rm VED}^{\\rm cerrado} = \\mathcal E_{\\rm VED} \\sqcup \\mathcal I_{\\rm VED}, }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VED_Completo_source_1 (ctx : FormalContext) : Prop := (ctx.U_VED_cerrado = (ctx.mathcal_E_VED ∪ ctx.mathcal_I_VED))
def Node_P_VED_Completo_source_2_raw : String := "n\\to\\infty"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Completo", "formula": 2, "location": "ES_46_RV6.md:576:P_VED_Completo:formula-2", "source": "n\\to\\infty", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_Completo_source_2 (ctx : FormalContext) : Prop := (ctx.DivergesToInfinity (ctx.n))
def Node_P_VED_Completo_source_steps (ctx : FormalContext) : Prop := (Node_P_VED_Completo_source_2 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_Completo|1|CLAIM|-|D_Particion,P_VED_K_I,P_VED_R_C|NO_CERTIFICADO
theorem derive_P_VED_Completo (ctx : FormalContext) (h_D_Particion : ((ctx.U_VED_cerrado = ({x | ∃ k : ℕ, ∃ rho : ℝ, ((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (x = ((k, rho)))})) ∧ (ctx.mathcal_I_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho > 0)) ∧ (x = ((k, rho)))})))) (h_P_VED_R_C : (((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))))) (h_D_mathcal_E_VED : ((ctx.k ∈ {x : ℕ | 0 < x}) ∧ (ctx.rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho = 0)) ∧ (x = ((k, rho)))})))) : ((ctx.U_VED_cerrado = (ctx.mathcal_E_VED ∪ ctx.mathcal_I_VED))) := by
  rcases h_D_Particion with ⟨h_D_Particion_1, h_D_Particion_2⟩
  rcases h_D_mathcal_E_VED with ⟨h_D_mathcal_E_VED_1, h_D_mathcal_E_VED_2, h_D_mathcal_E_VED_3, h_D_mathcal_E_VED_4⟩
  rw [h_D_Particion_1, h_D_mathcal_E_VED_4, h_D_Particion_2]
  ext p
  constructor
  · rintro ⟨k, rho, ⟨hk, h_bounds⟩, hp⟩
    by_cases h_zero : rho = 0
    · exact Or.inl ⟨k, rho, ⟨⟨hk, h_bounds⟩, h_zero⟩, hp⟩
    · exact Or.inr ⟨k, rho, ⟨⟨hk, h_bounds⟩, lt_of_le_of_ne h_bounds.1 (Ne.symm h_zero)⟩, hp⟩
  · rintro (⟨k, rho, ⟨h_domain, _⟩, hp⟩ | ⟨k, rho, ⟨h_domain, _⟩, hp⟩)
    · exact ⟨k, rho, h_domain, hp⟩
    · exact ⟨k, rho, h_domain, hp⟩

theorem derive_P_VED_Completo_disjoint (ctx : FormalContext) (h_D_Particion : ((ctx.U_VED_cerrado = ({x | ∃ k : ℕ, ∃ rho : ℝ, ((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (x = ((k, rho)))})) ∧ (ctx.mathcal_I_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho > 0)) ∧ (x = ((k, rho)))})))) (h_P_VED_R_C : (((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))))) (h_D_mathcal_E_VED : ((ctx.k ∈ {x : ℕ | 0 < x}) ∧ (ctx.rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho = 0)) ∧ (x = ((k, rho)))})))) : Disjoint ctx.mathcal_E_VED ctx.mathcal_I_VED := by
  rcases h_D_Particion with ⟨h_D_Particion_1, h_D_Particion_2⟩
  rcases h_D_mathcal_E_VED with ⟨h_D_mathcal_E_VED_1, h_D_mathcal_E_VED_2, h_D_mathcal_E_VED_3, h_D_mathcal_E_VED_4⟩
  rw [h_D_mathcal_E_VED_4, h_D_Particion_2]
  apply Set.disjoint_left.mpr
  intro p hpE hpI
  rcases hpE with ⟨k, rho, ⟨_, h_zero⟩, hp⟩
  rcases hpI with ⟨j, r, ⟨_, h_positive⟩, hq⟩
  have h_coordinate : rho = r := congrArg Prod.snd (hp.symm.trans hq)
  linarith
-- DEMUESTRA_ASSERTION: P_VED_Completo|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_VS
-- SOURCE: ES_46_RV6.md:639
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_VS", "location": "ES_46_RV6.md:639", "source": "$$\n\\boxed{\nP_{\\rm VS}:\n\\qquad\nU_{\\rm VED}\\cong U_{\\rm Sch}.\n}\n$$\n\nEste resultado demuestra que una misma información física puede representarse en topologías distintas mediante una transformación reversible.\n\nEn ese desarrollo de relación de radios, la función gravitatoria del marco depende del cierre $n$ y satisface\n\n$$\n\\boxed{\nG(2)=G,\n}\n$$\n\nmientras que para onda libre\n\n$$\n\\boxed{\n\\lim_{n\\to\\infty}G(n)=0.\n}\n$$\n\nAsí, dentro del marco, el estado $n=2$ fija la gravitación universal observada y el límite de onda libre no aporta respuesta gravitatoria.\n\nEl objetivo de esta sección no es utilizar $U_{\\rm Sch}$ para obtener Riemann, sino establecer un precedente demostrado: es posible transportar información entre topologías conservando el estado representado.\n\n---", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ P_{\rm VS}: \qquad U_{\rm VED}\cong U_{\rm Sch}. }
-- FORMULA: \boxed{ G(2)=G, }
-- FORMULA: \boxed{ \lim_{n\to\infty}G(n)=0. }
-- FORMULA: n
-- FORMULA: n=2
-- FORMULA: U_{\rm Sch}
def Node_P_VS_source_1_raw : String := "\\boxed{ P_{\\rm VS}: \\qquad U_{\\rm VED}\\cong U_{\\rm Sch}. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VS", "formula": 1, "location": "ES_46_RV6.md:639:P_VS:formula-1", "source": "\\boxed{ P_{\\rm VS}: \\qquad U_{\\rm VED}\\cong U_{\\rm Sch}. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VS_source_1 (ctx : FormalContext) : Prop := (Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))
def Node_P_VS_source_2_raw : String := "\\boxed{ G(2)=G, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VS", "formula": 2, "location": "ES_46_RV6.md:639:P_VS:formula-2", "source": "\\boxed{ G(2)=G, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VS_source_2 (ctx : FormalContext) : Prop := ((ctx.G_fn_1 2) = ctx.G)
def Node_P_VS_source_3_raw : String := "\\boxed{ \\lim_{n\\to\\infty}G(n)=0. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VS", "formula": 3, "location": "ES_46_RV6.md:639:P_VS:formula-3", "source": "\\boxed{ \\lim_{n\\to\\infty}G(n)=0. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VS_source_3 (ctx : FormalContext) : Prop := (Filter.Tendsto (fun n : ℝ => ctx.G_fn_1 n) Filter.atTop (nhds (0)))
def Node_P_VS_source_4_raw : String := "n"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VS", "formula": 4, "location": "ES_46_RV6.md:639:P_VS:formula-4", "source": "n", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VS_source_4_term (ctx : FormalContext) : ℝ := (ctx.n)
def Node_P_VS_source_5_raw : String := "n=2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VS", "formula": 5, "location": "ES_46_RV6.md:639:P_VS:formula-5", "source": "n=2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VS_source_5 (ctx : FormalContext) : Prop := (ctx.n = 2)
def Node_P_VS_source_6_raw : String := "U_{\\rm Sch}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VS", "formula": 6, "location": "ES_46_RV6.md:639:P_VS:formula-6", "source": "U_{\\rm Sch}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_VS_source_6_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_Sch)
def Node_P_VS_source_steps (ctx : FormalContext) : Prop := (Node_P_VS_source_2 ctx) ∧ (Node_P_VS_source_3 ctx) ∧ (Node_P_VS_source_5 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VS|1|CLAIM|-|P_VED_R_C,P_VED_Completo,A_7|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VS|2|PROOF_STEP|1|P_VED_R_C,P_VED_Completo,A_7|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VS|3|PROOF_STEP|2|P_VED_R_C,P_VED_Completo,A_7|NO_CERTIFICADO
theorem derive_P_VS (ctx : FormalContext) (h_P_VED_R_C : (((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))))) (h_P_VED_Completo : ((ctx.U_VED_cerrado = (ctx.mathcal_E_VED ∪ ctx.mathcal_I_VED)))) (h_A_7 : ((ctx.tilde_N = (ctx.R_VED * ctx.R_Sch)) ∧ (ctx.R_Sch = (ctx.tilde_N / ctx.R_VED)) ∧ (ctx.R_VED = (ctx.tilde_N / ctx.R_Sch)) ∧ ((ctx.Phi_tilde_N_fn_1 ctx.R_VED = ctx.tilde_N / ctx.R_VED)) ∧ (Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch))))) : ((Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))) := by
  rcases h_A_7 with ⟨h_A_7_1, h_A_7_2, h_A_7_3, h_A_7_4, h_A_7_5⟩
  exact h_A_7_5
-- DEMUESTRA_ASSERTION: P_VS|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_VED_Completo_2
-- SOURCE: ES_46_RV6.md:1225
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_VED_Completo_2", "location": "ES_46_RV6.md:1225", "source": "$$\nP_{\\rm VED}(\\mathrm{Completo}):\n\\quad\n(k,\\rho)\n\\text{ contempla exhaustivamente todos los cierres finitos.}\n$$", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: P_{\rm VED}(\mathrm{Completo}): \quad (k,\rho) \text{ contempla exhaustivamente todos los cierres finitos.}
def Node_P_VED_Completo_2_source_1_raw : String := "P_{\\rm VED}(\\mathrm{Completo}): \\quad (k,\\rho) \\text{ contempla exhaustivamente todos los cierres finitos.}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Completo_2", "formula": 1, "location": "ES_46_RV6.md:1225:P_VED_Completo_2:formula-1", "source": "P_{\\rm VED}(\\mathrm{Completo}): \\quad (k,\\rho) \\text{ contempla exhaustivamente todos los cierres finitos.}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_Completo_2_source_1 (ctx : FormalContext) : Prop := (ctx.Assertion_contempla_exhaustivamente_todos_los_cierres_finitos ((ctx.k, ctx.rho)))
def Node_P_VED_Completo_2_source_steps (ctx : FormalContext) : Prop := (Node_P_VED_Completo_2_source_1 ctx)
def Node_P_VED_Completo_2_unformalized_source : String := "$$ P_{\\rm VED}(\\mathrm{Completo}): \\quad (k,\\rho) \\text{ contempla exhaustivamente todos los cierres finitos.} $$"
-- DEMUESTRA_UNDECIDABLE_NODE: P_VED_Completo_2|PROSE_WITHOUT_FORMULA
-- DEMUESTRA_ASSERTION: P_VED_Completo_2|DOCUMENTAL|NO_APLICA

-- FORMAL_NODE: P_F
-- SOURCE: ES_46_RV6.md:683
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_F", "location": "ES_46_RV6.md:683", "source": "$$\n\\boxed{\nP_F:\n\\qquad\nF\n=\n(dt^2-dt'^2)\n+\n\\frac{d}{dt}(dt^2-dt'^2).\n}\n$$\n\nNo se elimina $dt'$ antes de desarrollar la expresión.\n\nDesarrollando respecto de $t$ en la notación adoptada en este marco,", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ P_F: \qquad F = (dt^2-dt'^2) + \frac{d}{dt}(dt^2-dt'^2). }
-- FORMULA: dt'
-- FORMULA: t
def Node_P_F_source_1_raw : String := "\\boxed{ P_F: \\qquad F = (dt^2-dt'^2) + \\frac{d}{dt}(dt^2-dt'^2). }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_F", "formula": 1, "location": "ES_46_RV6.md:683:P_F:formula-1", "source": "\\boxed{ P_F: \\qquad F = (dt^2-dt'^2) + \\frac{d}{dt}(dt^2-dt'^2). }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_F_source_1 (ctx : FormalContext) : Prop := (ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))
def Node_P_F_source_2_raw : String := "dt'"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F", "formula": 2, "location": "ES_46_RV6.md:683:P_F:formula-2", "source": "dt'", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F_source_2_term (ctx : FormalContext) : ℝ := (ctx.dt_prime)
def Node_P_F_source_3_raw : String := "t"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F", "formula": 3, "location": "ES_46_RV6.md:683:P_F:formula-3", "source": "t", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F_source_3_term (ctx : FormalContext) : ℝ := (ctx.t)
-- DEMUESTRA_DEDUCTIVE_LINK: P_F|1|CLAIM|-|A_7,P_VS,P_ST_2|NO_CERTIFICADO
-- DEMUESTRA_PENDING_PROOF: {"node": "P_F", "location": "ES_46_RV6.md:683", "origin": "GENERATOR", "reason": "NO_COMPLETE_DERIVATION_GENERATED", "verification_state": "VERIFICACION_FORMAL_PENDIENTE", "interpretation_detail": null, "statement": "(ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))", "dependencies": ["A_7", "P_VS", "P_ST_2", "A_L"], "partial_theorems": [], "pending_parts": ["ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime)))"], "source_present": true, "source_refuted": false, "prose_interpretation_complete": false}
-- DEMUESTRA_ASSERTION: P_F|COMPLETA|NO_DETERMINADO

-- FORMAL_NODE: P_F1
-- SOURCE: ES_46_RV6.md:699
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_F1", "location": "ES_46_RV6.md:699", "source": "$$\n\\boxed{\nP_{F1}:\n\\qquad\nF\n=\ndt^2-dt'^2\n+\n2dt\n-\n2dt'\\frac{dt'}{dt}.\n}\n$$\n\nLa única prima presente en $dt'$ continúa significando tiempo propio del observado; la derivada aparece sólo en el cociente explícito $dt'/dt$.\n\n---", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ P_{F1}: \qquad F = dt^2-dt'^2 + 2dt - 2dt'\frac{dt'}{dt}. }
-- FORMULA: dt'
-- FORMULA: dt'/dt
def Node_P_F1_source_1_raw : String := "\\boxed{ P_{F1}: \\qquad F = dt^2-dt'^2 + 2dt - 2dt'\\frac{dt'}{dt}. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_F1", "formula": 1, "location": "ES_46_RV6.md:699:P_F1:formula-1", "source": "\\boxed{ P_{F1}: \\qquad F = dt^2-dt'^2 + 2dt - 2dt'\\frac{dt'}{dt}. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_F1_source_1 (ctx : FormalContext) : Prop := (ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))
def Node_P_F1_source_2_raw : String := "dt'"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F1", "formula": 2, "location": "ES_46_RV6.md:699:P_F1:formula-2", "source": "dt'", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F1_source_2_term (ctx : FormalContext) : ℝ := (ctx.dt_prime)
def Node_P_F1_source_3_raw : String := "dt'/dt"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F1", "formula": 3, "location": "ES_46_RV6.md:699:P_F1:formula-3", "source": "dt'/dt", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F1_source_3_term (ctx : FormalContext) : ℝ := (ctx.dt_prime / ctx.dt)
-- DEMUESTRA_DEDUCTIVE_LINK: P_F1|1|CLAIM|-|P_VS,P_ST_2,P_F|NO_CERTIFICADO
theorem derive_P_F1 (ctx : FormalContext) (h_P_VS : ((Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch))))) (h_P_ST_2 : ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2)))) (h_P_F : ((ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime)))))) (h_A_L : ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2)))) : ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) := by
  rcases h_A_L with ⟨h_A_L_1, h_A_L_2, h_A_L_3, h_A_L_4⟩
  ring_nf at h_P_F ⊢
  exact h_P_F
-- DEMUESTRA_ASSERTION: P_F1|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_W
-- SOURCE: ES_46_RV6.md:721
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_W", "location": "ES_46_RV6.md:721", "source": "# 10. Condición propia de la onda y reducción final de $F$\n\nLa onda viaja localmente a $c$ tanto si es libre como si está confinada:\n\n$$\n\\boxed{\nP_W:\n\\qquad\nv_{\\rm onda}=c.\n}\n$$\n\nEn unidades naturales,\n\n$$\nc=1.\n$$\n\nComo\n\n$$\nv=\\frac{ds}{dt},\n$$\n\npara la onda\n\n$$\n\\frac{ds}{dt}=1.\n$$\n\nEsto implica igualdad numérica de las diferenciales de propagación en esas unidades,\n\n$$\nds=dt,\n$$\n\nsin afirmar que espacio y tiempo sean la misma entidad.\n\nPor Lorentz,\n\n$$\ndt'\n=\ndt\n\\sqrt{\n1-\\frac{v^2}{c^2}\n}.\n$$\n\nEn el límite de la onda,\n\n$$\nv\\to c,\n$$\n\nse obtiene\n\n$$\n\\boxed{\ndt'\\to0.\n}\n$$\n\nEn el desarrollo adoptado, en ese mismo límite,\n\n$$\ndt'^2\\to0,\n$$\n\ny\n\n$$\n\\frac{dt'}{dt}\\to0.\n$$\n\nSólo ahora aplicamos estas condiciones a $P_{F1}$:", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ P_W: \qquad v_{\rm onda}=c. }
-- FORMULA: c=1.
-- FORMULA: v=\frac{ds}{dt},
-- FORMULA: \frac{ds}{dt}=1.
-- FORMULA: ds=dt,
-- FORMULA: dt' = dt \sqrt{ 1-\frac{v^2}{c^2} }.
-- FORMULA: v\to c,
-- FORMULA: \boxed{ dt'\to0. }
-- FORMULA: dt'^2\to0,
-- FORMULA: \frac{dt'}{dt}\to0.
-- FORMULA: F
-- FORMULA: c
def Node_P_W_source_1_raw : String := "\\boxed{ P_W: \\qquad v_{\\rm onda}=c. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_W", "formula": 1, "location": "ES_46_RV6.md:721:P_W:formula-1", "source": "\\boxed{ P_W: \\qquad v_{\\rm onda}=c. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_W_source_1 (ctx : FormalContext) : Prop := (ctx.v_onda = ctx.c)
def Node_P_W_source_2_raw : String := "c=1."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 2, "location": "ES_46_RV6.md:721:P_W:formula-2", "source": "c=1.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_2 (ctx : FormalContext) : Prop := (ctx.c = 1)
def Node_P_W_source_3_raw : String := "v=\\frac{ds}{dt},"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 3, "location": "ES_46_RV6.md:721:P_W:formula-3", "source": "v=\\frac{ds}{dt},", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_3 (ctx : FormalContext) : Prop := (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s))
def Node_P_W_source_4_raw : String := "\\frac{ds}{dt}=1."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 4, "location": "ES_46_RV6.md:721:P_W:formula-4", "source": "\\frac{ds}{dt}=1.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_4 (ctx : FormalContext) : Prop := (ctx.Derivative_t (ctx.DerivativeSubject_s) = 1)
def Node_P_W_source_5_raw : String := "ds=dt,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 5, "location": "ES_46_RV6.md:721:P_W:formula-5", "source": "ds=dt,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_5 (ctx : FormalContext) : Prop := (ctx.ds = ctx.dt)
def Node_P_W_source_6_raw : String := "dt' = dt \\sqrt{ 1-\\frac{v^2}{c^2} }."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 6, "location": "ES_46_RV6.md:721:P_W:formula-6", "source": "dt' = dt \\sqrt{ 1-\\frac{v^2}{c^2} }.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_6 (ctx : FormalContext) : Prop := (ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2)))))
def Node_P_W_source_7_raw : String := "v\\to c,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 7, "location": "ES_46_RV6.md:721:P_W:formula-7", "source": "v\\to c,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_7 (ctx : FormalContext) : Prop := (ctx.TendsTo (ctx.v) (ctx.c))
def Node_P_W_source_8_raw : String := "\\boxed{ dt'\\to0. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 8, "location": "ES_46_RV6.md:721:P_W:formula-8", "source": "\\boxed{ dt'\\to0. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_8 (ctx : FormalContext) : Prop := (ctx.TendsTo (ctx.dt_prime) (0))
def Node_P_W_source_9_raw : String := "dt'^2\\to0,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 9, "location": "ES_46_RV6.md:721:P_W:formula-9", "source": "dt'^2\\to0,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_9 (ctx : FormalContext) : Prop := (ctx.TendsTo (ctx.dt_prime ^ 2) (0))
def Node_P_W_source_10_raw : String := "\\frac{dt'}{dt}\\to0."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 10, "location": "ES_46_RV6.md:721:P_W:formula-10", "source": "\\frac{dt'}{dt}\\to0.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_10 (ctx : FormalContext) : Prop := (ctx.TendsTo (ctx.Derivative_t (ctx.t_prime)) (0))
def Node_P_W_source_11_raw : String := "F"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 11, "location": "ES_46_RV6.md:721:P_W:formula-11", "source": "F", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_W_source_11_term (ctx : FormalContext) : ℝ := (ctx.F)
def Node_P_W_source_12_raw : String := "c"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 12, "location": "ES_46_RV6.md:721:P_W:formula-12", "source": "c", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_W_source_12_term (ctx : FormalContext) : ℝ := (ctx.c)
def Node_P_W_source_steps (ctx : FormalContext) : Prop := (Node_P_W_source_2 ctx) ∧ (Node_P_W_source_3 ctx) ∧ (Node_P_W_source_4 ctx) ∧ (Node_P_W_source_5 ctx) ∧ (Node_P_W_source_6 ctx) ∧ (Node_P_W_source_7 ctx) ∧ (Node_P_W_source_8 ctx) ∧ (Node_P_W_source_9 ctx) ∧ (Node_P_W_source_10 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_W|1|CLAIM|-|P_F1|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_W|2|PROOF_STEP|1|P_F1|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_W|3|PROOF_STEP|2|P_F1|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_W|4|PROOF_STEP|3|P_F1|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_W|5|PROOF_STEP|4|P_F1|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_W|6|PROOF_STEP|5|P_F1|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_W|7|PROOF_STEP|6|P_F1|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_W|8|PROOF_STEP|7|P_F1|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_W|9|PROOF_STEP|8|P_F1|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_W|10|PROOF_STEP|9|P_F1|NO_CERTIFICADO
-- DEMUESTRA_PENDING_PROOF: {"node": "P_W", "location": "ES_46_RV6.md:721", "origin": "GENERATOR", "reason": "NO_COMPLETE_DERIVATION_GENERATED", "verification_state": "VERIFICACION_FORMAL_PENDIENTE", "interpretation_detail": null, "statement": "(ctx.v_onda = ctx.c)", "dependencies": ["P_F1", "A_L"], "partial_theorems": [], "pending_parts": ["ctx.v_onda = ctx.c"], "source_present": true, "source_refuted": false, "prose_interpretation_complete": false}
-- DEMUESTRA_ASSERTION: P_W|COMPLETA|NO_DETERMINADO

-- FORMAL_NODE: P_F2
-- SOURCE: ES_46_RV6.md:794
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_F2", "location": "ES_46_RV6.md:794", "source": "$$\n\\boxed{\nP_{F2}:\n\\qquad\nF=dt^2+2dt.\n}\n$$\n\nFactorizando,\n\n$$\ndt^2+2dt\n=\n2dt\n\\left(\n1+\\frac12dt\n\\right),\n$$\n\npor lo que", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ P_{F2}: \qquad F=dt^2+2dt. }
-- FORMULA: dt^2+2dt = 2dt \left( 1+\frac12dt \right),
def Node_P_F2_source_1_raw : String := "\\boxed{ P_{F2}: \\qquad F=dt^2+2dt. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_F2", "formula": 1, "location": "ES_46_RV6.md:794:P_F2:formula-1", "source": "\\boxed{ P_{F2}: \\qquad F=dt^2+2dt. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_F2_source_1 (ctx : FormalContext) : Prop := (ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))
def Node_P_F2_source_2_raw : String := "dt^2+2dt = 2dt \\left( 1+\\frac12dt \\right),"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F2", "formula": 2, "location": "ES_46_RV6.md:794:P_F2:formula-2", "source": "dt^2+2dt = 2dt \\left( 1+\\frac12dt \\right),", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F2_source_2 (ctx : FormalContext) : Prop := ((ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)) = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))
def Node_P_F2_source_steps (ctx : FormalContext) : Prop := (Node_P_F2_source_2 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_F2|1|CLAIM|-|P_F,P_F1,P_W|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F2|2|PROOF_STEP|1|P_F,P_F1,P_W|NO_CERTIFICADO
-- DEMUESTRA_PENDING_PROOF: {"node": "P_F2", "location": "ES_46_RV6.md:794", "origin": "GENERATOR", "reason": "NO_COMPLETE_DERIVATION_GENERATED", "verification_state": "VERIFICACION_FORMAL_PENDIENTE", "interpretation_detail": null, "statement": "(ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))", "dependencies": ["P_F", "P_F1", "P_W"], "partial_theorems": [], "pending_parts": ["ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt))"], "source_present": true, "source_refuted": false, "prose_interpretation_complete": false}
-- DEMUESTRA_ASSERTION: P_F2|COMPLETA|NO_DETERMINADO

-- FORMAL_NODE: P_F3
-- SOURCE: ES_46_RV6.md:815
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_F3", "location": "ES_46_RV6.md:815", "source": "$$\n\\boxed{\nP_{F3}:\n\\qquad\nF\n=\n2dt\n\\left(\n1+\\frac12dt\n\\right).\n}\n$$\n\nEl factor\n\n$$\n\\boxed{\n\\frac12\n}\n$$\n\naparece algebraicamente en la factorización de $F$.\n\nNo procede de Riemann.  \nNo se introduce como normalización elegida.  \nNo se obtiene suponiendo previamente la recta crítica.\n\n<!-- Desarrollo recuperado de 8ee5d60:SRC-VED/UNIHOLOG/ES_46_Revision3_completa_y_rigurosa.md, secciones 7-11. Encabezados renumerados. Se omite el comentario sobre anulacion del factor por indicacion del autor. -->\n\n## 10.1. Origen geométrico del factor $1/2$\n\nÉste es el paso central.\n\nPartimos de la dinámica exacta\n\n$$\n\\boxed{\n\\mathcal F\n=\n(ds)^2\n+\n\\frac{d}{dt}\\left[(ds)^2\\right].\n}\n$$\n\nLa derivada de una función cuadrática satisface\n\n$$\n\\boxed{\n\\frac{d}{dt}\\left[(ds)^2\\right]\n=\n2ds\\frac{d(ds)}{dt}.\n}\n$$\n\nAsí,\n\n$$\n\\mathcal F\n=\n(ds)^2\n+\n2ds\\frac{d(ds)}{dt}.\n$$\n\nFactorizamos $2ds$:\n\n$$\n(ds)^2\n=\n2ds\\left(\\frac12ds\\right).\n$$\n\nPor tanto,\n\n$$\n\\boxed{\n\\mathcal F\n=\n2ds\n\\left[\n\\frac{d(ds)}{dt}\n+\n\\frac12ds\n\\right].\n}\n$$\n\nEl factor\n\n$$\n\\boxed{\n\\frac12\n}\n$$\n\naparece algebraicamente de la naturaleza cuadrática de la diferencial.\n\nNo se ha introducido desde Riemann.\n\nNo se ha introducido como una normalización elegida para obtener la recta\ncrítica.\n\n---\n\n## 10.2. Operador espectral desplazado\n\nLa factorización anterior define naturalmente el operador\n\n$$\n\\boxed{\n\\mathcal D\n=\n\\frac{d}{dt}+\\frac12.\n}\n$$\n\nDesde este punto, $t$ se entiende como coordenada temporal normalizada de\n$U_{\\rm Lap}$.\n\nSea un modo elemental\n\n$$\n\\boxed{\nds(t)=ds_0e^{\\mu t}.\n}\n$$\n\nEntonces\n\n$$\n\\frac{d(ds)}{dt}\n=\n\\mu ds.\n$$\n\nAplicando $\\mathcal D$,\n\n$$\n\\mathcal D[ds]\n=\n\\left(\\mu+\\frac12\\right)ds.\n$$\n\nDefinimos el autovalor espectral de $\\mathcal D$ como\n\n$$\n\\boxed{\ns=\\mu+\\frac12.\n}\n$$\n\nEquivalente:\n\n$$\n\\boxed{\n\\mu=s-\\frac12.\n}\n$$\n\n---\n\n## 10.3. Estabilidad en la coordenada desplazada\n\nLa amplitud física de un estado estable no crece ni decrece secularmente.\n\nEn la variable modal desplazada $\\mu$, esto exige\n\n$$\n\\boxed{\n\\Re(\\mu)=0.\n}\n$$\n\nPor tanto,\n\n$$\n\\boxed{\n\\mu_\\pm(k,\\rho)\n=\n\\pm i\\,b(k,\\rho).\n}\n$$\n\nComo\n\n$$\ns=\\frac12+\\mu,\n$$\n\nse obtiene\n\n$$\n\\boxed{\ns_\\pm(k,\\rho)\n=\n\\frac12\n\\pm i\\,b(k,\\rho).\n}\n$$\n\nPor tanto,\n\n$$\n\\boxed{\n\\Re[s_\\pm(k,\\rho)]\n=\n\\frac12.\n}\n$$\n\nEl $1/2$ procede del desplazamiento del operador.\n\nLa parte imaginaria procede de la periodicidad del cierre.\n\n---\n\n## 10.4. Familia espectral completa\n\nSustituyendo la periodicidad,\n\n$$\nb(k,\\rho)\n=\n\\frac{2\\pi}\n{(k\\pm\\rho)\\lambda},\n$$\n\nqueda\n\n$$\n\\boxed{\ns_\\pm(k,\\rho)\n=\n\\frac12\n\\pm\ni\\frac{2\\pi}\n{(k\\pm\\rho)\\lambda},\n\\qquad\n0\\leq\\rho\\leq\\frac12.\n}\n$$\n\nÉsta es la familia de soluciones espectrales del sistema regulado dentro de\nla parametrización geométrica adoptada.\n\n---\n\n## 10.5. Todos los estados estables\n\nLos estados estables corresponden a\n\n$$\n\\boxed{\n\\rho=0.\n}\n$$\n\nEntonces\n\n$$\nT_k=k\\lambda\n$$\n\ny\n\n$$\nb_k=\n\\frac{2\\pi}{k\\lambda}.\n$$\n\nPor tanto,\n\n$$\n\\boxed{\ns_{Z,\\pm}(k)\n=\n\\frac12\n\\pm\ni\\frac{2\\pi}{k\\lambda},\n\\qquad\nk\\in\\mathbb N^+.\n}\n$$\n\nDe aquí,\n\n$$\n\\boxed{\n\\forall k\\in\\mathbb N^+,\\qquad\n\\Re[s_{Z,\\pm}(k)]\n=\n\\frac12.\n}\n$$\n\n---", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ P_{F3}: \qquad F = 2dt \left( 1+\frac12dt \right). }
-- FORMULA: \boxed{ \frac12 }
-- FORMULA: \boxed{ \mathcal F = (ds)^2 + \frac{d}{dt}\left[(ds)^2\right]. }
-- FORMULA: \boxed{ \frac{d}{dt}\left[(ds)^2\right] = 2ds\frac{d(ds)}{dt}. }
-- FORMULA: \mathcal F = (ds)^2 + 2ds\frac{d(ds)}{dt}.
-- FORMULA: (ds)^2 = 2ds\left(\frac12ds\right).
-- FORMULA: \boxed{ \mathcal F = 2ds \left[ \frac{d(ds)}{dt} + \frac12ds \right]. }
-- FORMULA: \boxed{ \frac12 }
-- FORMULA: \boxed{ \mathcal D = \frac{d}{dt}+\frac12. }
-- FORMULA: \boxed{ ds(t)=ds_0e^{\mu t}. }
-- FORMULA: \frac{d(ds)}{dt} = \mu ds.
-- FORMULA: \mathcal D[ds] = \left(\mu+\frac12\right)ds.
-- FORMULA: \boxed{ s=\mu+\frac12. }
-- FORMULA: \boxed{ \mu=s-\frac12. }
-- FORMULA: \boxed{ \Re(\mu)=0. }
-- FORMULA: \boxed{ \mu_\pm(k,\rho) = \pm i\,b(k,\rho). }
-- FORMULA: s=\frac12+\mu,
-- FORMULA: \boxed{ s_\pm(k,\rho) = \frac12 \pm i\,b(k,\rho). }
-- FORMULA: \boxed{ \Re[s_\pm(k,\rho)] = \frac12. }
-- FORMULA: b(k,\rho) = \frac{2\pi} {(k\pm\rho)\lambda},
-- FORMULA: \boxed{ s_\pm(k,\rho) = \frac12 \pm i\frac{2\pi} {(k\pm\rho)\lambda}, \qquad 0\leq\rho\leq\frac12. }
-- FORMULA: \boxed{ \rho=0. }
-- FORMULA: T_k=k\lambda
-- FORMULA: b_k= \frac{2\pi}{k\lambda}.
-- FORMULA: \boxed{ s_{Z,\pm}(k) = \frac12 \pm i\frac{2\pi}{k\lambda}, \qquad k\in\mathbb N^+. }
-- FORMULA: \boxed{ \forall k\in\mathbb N^+,\qquad \Re[s_{Z,\pm}(k)] = \frac12. }
-- FORMULA: F
-- FORMULA: 1/2
-- FORMULA: 2ds
-- FORMULA: t
-- FORMULA: U_{\rm Lap}
-- FORMULA: \mathcal D
-- FORMULA: \mathcal D
-- FORMULA: \mu
-- FORMULA: 1/2
def Node_P_F3_source_1_raw : String := "\\boxed{ P_{F3}: \\qquad F = 2dt \\left( 1+\\frac12dt \\right). }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_F3", "formula": 1, "location": "ES_46_RV6.md:815:P_F3:formula-1", "source": "\\boxed{ P_{F3}: \\qquad F = 2dt \\left( 1+\\frac12dt \\right). }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_F3_source_1 (ctx : FormalContext) : Prop := (ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))
def Node_P_F3_source_2_raw : String := "\\boxed{ \\frac12 }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 2, "location": "ES_46_RV6.md:815:P_F3:formula-2", "source": "\\boxed{ \\frac12 }", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F3_source_2_term (ctx : FormalContext) : ℝ := ((1 : ℝ) / (2 : ℝ))
def Node_P_F3_source_3_raw : String := "\\boxed{ \\mathcal F = (ds)^2 + \\frac{d}{dt}\\left[(ds)^2\\right]. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 3, "location": "ES_46_RV6.md:815:P_F3:formula-3", "source": "\\boxed{ \\mathcal F = (ds)^2 + \\frac{d}{dt}\\left[(ds)^2\\right]. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_3 (ctx : FormalContext) : Prop := (ctx.mathcal_F = (ctx.ds ^ 2 + ((2 : ℝ) * ctx.ds) * ctx.Derivative_t (ctx.DerivativeSubject_s)))
def Node_P_F3_source_4_raw : String := "\\boxed{ \\frac{d}{dt}\\left[(ds)^2\\right] = 2ds\\frac{d(ds)}{dt}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 4, "location": "ES_46_RV6.md:815:P_F3:formula-4", "source": "\\boxed{ \\frac{d}{dt}\\left[(ds)^2\\right] = 2ds\\frac{d(ds)}{dt}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_4 (ctx : FormalContext) : Prop := (((2 : ℝ) * ctx.ds) * ctx.Derivative_t (ctx.DerivativeSubject_s) = (((2 : ℝ) * ctx.ds) * ((ctx.d_fn_1 ctx.ds) / ctx.dt)))
def Node_P_F3_source_5_raw : String := "\\mathcal F = (ds)^2 + 2ds\\frac{d(ds)}{dt}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 5, "location": "ES_46_RV6.md:815:P_F3:formula-5", "source": "\\mathcal F = (ds)^2 + 2ds\\frac{d(ds)}{dt}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_5 (ctx : FormalContext) : Prop := (ctx.mathcal_F = (ctx.ds ^ 2 + (((2 : ℝ) * ctx.ds) * ((ctx.d_fn_1 ctx.ds) / ctx.dt))))
def Node_P_F3_source_6_raw : String := "(ds)^2 = 2ds\\left(\\frac12ds\\right)."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 6, "location": "ES_46_RV6.md:815:P_F3:formula-6", "source": "(ds)^2 = 2ds\\left(\\frac12ds\\right).", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_6 (ctx : FormalContext) : Prop := (ctx.ds ^ 2 = (((2 : ℝ) * ctx.ds) * (((1 : ℝ) / (2 : ℝ)) * ctx.ds)))
def Node_P_F3_source_7_raw : String := "\\boxed{ \\mathcal F = 2ds \\left[ \\frac{d(ds)}{dt} + \\frac12ds \\right]. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 7, "location": "ES_46_RV6.md:815:P_F3:formula-7", "source": "\\boxed{ \\mathcal F = 2ds \\left[ \\frac{d(ds)}{dt} + \\frac12ds \\right]. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_7 (ctx : FormalContext) : Prop := (ctx.mathcal_F = (((2 : ℝ) * ctx.ds) * (((ctx.d_fn_1 ctx.ds) / ctx.dt) + (((1 : ℝ) / (2 : ℝ)) * ctx.ds))))
def Node_P_F3_source_8_raw : String := "\\boxed{ \\frac12 }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 8, "location": "ES_46_RV6.md:815:P_F3:formula-8", "source": "\\boxed{ \\frac12 }", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F3_source_8_term (ctx : FormalContext) : ℝ := ((1 : ℝ) / (2 : ℝ))
def Node_P_F3_source_9_raw : String := "\\boxed{ \\mathcal D = \\frac{d}{dt}+\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 9, "location": "ES_46_RV6.md:815:P_F3:formula-9", "source": "\\boxed{ \\mathcal D = \\frac{d}{dt}+\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_9 (ctx : FormalContext) : Prop := (ctx.mathcal_D = ((ctx.d / ctx.dt) + ((1 : ℝ) / (2 : ℝ))))
def Node_P_F3_source_10_raw : String := "\\boxed{ ds(t)=ds_0e^{\\mu t}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 10, "location": "ES_46_RV6.md:815:P_F3:formula-10", "source": "\\boxed{ ds(t)=ds_0e^{\\mu t}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_10 (ctx : FormalContext) : Prop := ((ctx.ds * ctx.t) = ((ctx.ds_0 : ℂ) * ctx.Pow_Complex ((ctx.e : ℂ)) (ctx.mu * (ctx.t : ℂ))))
def Node_P_F3_source_11_raw : String := "\\frac{d(ds)}{dt} = \\mu ds."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 11, "location": "ES_46_RV6.md:815:P_F3:formula-11", "source": "\\frac{d(ds)}{dt} = \\mu ds.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_11 (ctx : FormalContext) : Prop := (((ctx.d_fn_1 ctx.ds) / ctx.dt) = (ctx.mu * (ctx.ds : ℂ)))
def Node_P_F3_source_12_raw : String := "\\mathcal D[ds] = \\left(\\mu+\\frac12\\right)ds."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 12, "location": "ES_46_RV6.md:815:P_F3:formula-12", "source": "\\mathcal D[ds] = \\left(\\mu+\\frac12\\right)ds.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_12 (ctx : FormalContext) : Prop := ((ctx.mathcal_D * ctx.ds) = ((ctx.mu + (((1 : ℝ) / (2 : ℝ)) : ℂ)) * (ctx.ds : ℂ)))
def Node_P_F3_source_13_raw : String := "\\boxed{ s=\\mu+\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 13, "location": "ES_46_RV6.md:815:P_F3:formula-13", "source": "\\boxed{ s=\\mu+\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_13 (ctx : FormalContext) : Prop := (ctx.s = (ctx.mu + (((1 : ℝ) / (2 : ℝ)) : ℂ)))
def Node_P_F3_source_14_raw : String := "\\boxed{ \\mu=s-\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 14, "location": "ES_46_RV6.md:815:P_F3:formula-14", "source": "\\boxed{ \\mu=s-\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_14 (ctx : FormalContext) : Prop := (ctx.mu = (ctx.s - (((1 : ℝ) / (2 : ℝ)) : ℂ)))
def Node_P_F3_source_15_raw : String := "\\boxed{ \\Re(\\mu)=0. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 15, "location": "ES_46_RV6.md:815:P_F3:formula-15", "source": "\\boxed{ \\Re(\\mu)=0. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_15 (ctx : FormalContext) : Prop := ((Complex.re ctx.mu) = 0)
def Node_P_F3_source_16_raw : String := "\\boxed{ \\mu_\\pm(k,\\rho) = \\pm i\\,b(k,\\rho). }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 16, "location": "ES_46_RV6.md:815:P_F3:formula-16", "source": "\\boxed{ \\mu_\\pm(k,\\rho) = \\pm i\\,b(k,\\rho). }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_16 (ctx : FormalContext) : Prop := (((ctx.mu_PM_fn_2 ctx.k ctx.rho) = ((Complex.I * (ctx.b_fn_2 ctx.k ctx.rho : ℂ))) ∨ (ctx.mu_PM_fn_2 ctx.k ctx.rho) = ((-(Complex.I) * (ctx.b_fn_2 ctx.k ctx.rho : ℂ)))))
def Node_P_F3_source_17_raw : String := "s=\\frac12+\\mu,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 17, "location": "ES_46_RV6.md:815:P_F3:formula-17", "source": "s=\\frac12+\\mu,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_17 (ctx : FormalContext) : Prop := (ctx.s = ((((1 : ℝ) / (2 : ℝ)) : ℂ) + ctx.mu))
def Node_P_F3_source_18_raw : String := "\\boxed{ s_\\pm(k,\\rho) = \\frac12 \\pm i\\,b(k,\\rho). }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 18, "location": "ES_46_RV6.md:815:P_F3:formula-18", "source": "\\boxed{ s_\\pm(k,\\rho) = \\frac12 \\pm i\\,b(k,\\rho). }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_18 (ctx : FormalContext) : Prop := (((ctx.s_PM_fn_2 ctx.k ctx.rho) = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (Complex.I * (ctx.b_fn_2 ctx.k ctx.rho : ℂ)))) ∨ (ctx.s_PM_fn_2 ctx.k ctx.rho) = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (Complex.I * (ctx.b_fn_2 ctx.k ctx.rho : ℂ))))))
def Node_P_F3_source_19_raw : String := "\\boxed{ \\Re[s_\\pm(k,\\rho)] = \\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 19, "location": "ES_46_RV6.md:815:P_F3:formula-19", "source": "\\boxed{ \\Re[s_\\pm(k,\\rho)] = \\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_19 (ctx : FormalContext) : Prop := ((Complex.re (ctx.s_PM_fn_2 ctx.k ctx.rho)) = ((1 : ℝ) / (2 : ℝ)))
def Node_P_F3_source_20_raw : String := "b(k,\\rho) = \\frac{2\\pi} {(k\\pm\\rho)\\lambda},"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 20, "location": "ES_46_RV6.md:815:P_F3:formula-20", "source": "b(k,\\rho) = \\frac{2\\pi} {(k\\pm\\rho)\\lambda},", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_20 (ctx : FormalContext) : Prop := (((ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) + ctx.rho) * ctx.lambda))) ∨ (ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))))
def Node_P_F3_source_21_raw : String := "\\boxed{ s_\\pm(k,\\rho) = \\frac12 \\pm i\\frac{2\\pi} {(k\\pm\\rho)\\lambda}, \\qquad 0\\leq\\rho\\leq\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 21, "location": "ES_46_RV6.md:815:P_F3:formula-21", "source": "\\boxed{ s_\\pm(k,\\rho) = \\frac12 \\pm i\\frac{2\\pi} {(k\\pm\\rho)\\lambda}, \\qquad 0\\leq\\rho\\leq\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_21 (ctx : FormalContext) : Prop := ((((ctx.s_PM_fn_2 ctx.k ctx.rho) = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (Complex.I * ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) : ℂ)))) ∨ (ctx.s_PM_fn_2 ctx.k ctx.rho) = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (Complex.I * ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) : ℂ)))) ∨ (ctx.s_PM_fn_2 ctx.k ctx.rho) = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (Complex.I * ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) - ctx.rho) * ctx.lambda)) : ℂ)))) ∨ (ctx.s_PM_fn_2 ctx.k ctx.rho) = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (Complex.I * ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) - ctx.rho) * ctx.lambda)) : ℂ)))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))))
def Node_P_F3_source_22_raw : String := "\\boxed{ \\rho=0. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 22, "location": "ES_46_RV6.md:815:P_F3:formula-22", "source": "\\boxed{ \\rho=0. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_22 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_P_F3_source_23_raw : String := "T_k=k\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 23, "location": "ES_46_RV6.md:815:P_F3:formula-23", "source": "T_k=k\\lambda", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_23 (ctx : FormalContext) : Prop := (ctx.T_k = ((ctx.k : ℝ) * ctx.lambda))
def Node_P_F3_source_24_raw : String := "b_k= \\frac{2\\pi}{k\\lambda}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 24, "location": "ES_46_RV6.md:815:P_F3:formula-24", "source": "b_k= \\frac{2\\pi}{k\\lambda}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_24 (ctx : FormalContext) : Prop := (ctx.b_k = (((2 : ℝ) * Real.pi) / ((ctx.k : ℝ) * ctx.lambda)))
def Node_P_F3_source_25_raw : String := "\\boxed{ s_{Z,\\pm}(k) = \\frac12 \\pm i\\frac{2\\pi}{k\\lambda}, \\qquad k\\in\\mathbb N^+. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 25, "location": "ES_46_RV6.md:815:P_F3:formula-25", "source": "\\boxed{ s_{Z,\\pm}(k) = \\frac12 \\pm i\\frac{2\\pi}{k\\lambda}, \\qquad k\\in\\mathbb N^+. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_25 (ctx : FormalContext) : Prop := ((((ctx.s_Z_PM_fn_1 ctx.k) = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (Complex.I * ((((2 : ℝ) * Real.pi) / ((ctx.k : ℝ) * ctx.lambda)) : ℂ)))) ∨ (ctx.s_Z_PM_fn_1 ctx.k) = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (Complex.I * ((((2 : ℝ) * Real.pi) / ((ctx.k : ℝ) * ctx.lambda)) : ℂ)))))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))
def Node_P_F3_source_26_raw : String := "\\boxed{ \\forall k\\in\\mathbb N^+,\\qquad \\Re[s_{Z,\\pm}(k)] = \\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 26, "location": "ES_46_RV6.md:815:P_F3:formula-26", "source": "\\boxed{ \\forall k\\in\\mathbb N^+,\\qquad \\Re[s_{Z,\\pm}(k)] = \\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F3_source_26 (ctx : FormalContext) : Prop := (∀ k : ℕ, (Complex.re (ctx.s_Z_PM_fn_1 k)) = ((1 : ℝ) / (2 : ℝ)))
def Node_P_F3_source_27_raw : String := "F"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 27, "location": "ES_46_RV6.md:815:P_F3:formula-27", "source": "F", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F3_source_27_term (ctx : FormalContext) : ℝ := (ctx.F)
def Node_P_F3_source_28_raw : String := "1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 28, "location": "ES_46_RV6.md:815:P_F3:formula-28", "source": "1/2", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F3_source_28_term (ctx : FormalContext) : ℝ := ((1 : ℝ) / (2 : ℝ))
def Node_P_F3_source_29_raw : String := "2ds"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 29, "location": "ES_46_RV6.md:815:P_F3:formula-29", "source": "2ds", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F3_source_29_term (ctx : FormalContext) : ℝ := ((2 : ℝ) * ctx.ds)
def Node_P_F3_source_30_raw : String := "t"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 30, "location": "ES_46_RV6.md:815:P_F3:formula-30", "source": "t", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F3_source_30_term (ctx : FormalContext) : ℝ := (ctx.t)
def Node_P_F3_source_31_raw : String := "U_{\\rm Lap}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 31, "location": "ES_46_RV6.md:815:P_F3:formula-31", "source": "U_{\\rm Lap}", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F3_source_31_term (ctx : FormalContext) : ℝ := (ctx.U_Lap)
def Node_P_F3_source_32_raw : String := "\\mathcal D"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 32, "location": "ES_46_RV6.md:815:P_F3:formula-32", "source": "\\mathcal D", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F3_source_32_term (ctx : FormalContext) : ℝ := (ctx.mathcal_D)
def Node_P_F3_source_33_raw : String := "\\mathcal D"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 33, "location": "ES_46_RV6.md:815:P_F3:formula-33", "source": "\\mathcal D", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F3_source_33_term (ctx : FormalContext) : ℝ := (ctx.mathcal_D)
def Node_P_F3_source_34_raw : String := "\\mu"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 34, "location": "ES_46_RV6.md:815:P_F3:formula-34", "source": "\\mu", "status": "FORMALIZED_TERM", "type": "Complex", "role": "PROOF_STEP"}
def Node_P_F3_source_34_term (ctx : FormalContext) : ℂ := (ctx.mu)
def Node_P_F3_source_35_raw : String := "1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 35, "location": "ES_46_RV6.md:815:P_F3:formula-35", "source": "1/2", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F3_source_35_term (ctx : FormalContext) : ℝ := ((1 : ℝ) / (2 : ℝ))
def Node_P_F3_source_steps (ctx : FormalContext) : Prop := (Node_P_F3_source_3 ctx) ∧ (Node_P_F3_source_4 ctx) ∧ (Node_P_F3_source_5 ctx) ∧ (Node_P_F3_source_6 ctx) ∧ (Node_P_F3_source_7 ctx) ∧ (Node_P_F3_source_9 ctx) ∧ (Node_P_F3_source_10 ctx) ∧ (Node_P_F3_source_11 ctx) ∧ (Node_P_F3_source_12 ctx) ∧ (Node_P_F3_source_13 ctx) ∧ (Node_P_F3_source_14 ctx) ∧ (Node_P_F3_source_15 ctx) ∧ (Node_P_F3_source_16 ctx) ∧ (Node_P_F3_source_17 ctx) ∧ (Node_P_F3_source_18 ctx) ∧ (Node_P_F3_source_19 ctx) ∧ (Node_P_F3_source_20 ctx) ∧ (Node_P_F3_source_21 ctx) ∧ (Node_P_F3_source_22 ctx) ∧ (Node_P_F3_source_23 ctx) ∧ (Node_P_F3_source_24 ctx) ∧ (Node_P_F3_source_25 ctx) ∧ (Node_P_F3_source_26 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|1|CLAIM|-|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|3|PROOF_STEP|1|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|4|PROOF_STEP|3|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|5|PROOF_STEP|4|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|6|PROOF_STEP|5|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|7|PROOF_STEP|6|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|9|PROOF_STEP|7|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|10|PROOF_STEP|9|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|11|PROOF_STEP|10|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|12|PROOF_STEP|11|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|13|PROOF_STEP|12|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|14|PROOF_STEP|13|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|15|PROOF_STEP|14|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|16|PROOF_STEP|15|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|17|PROOF_STEP|16|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|18|PROOF_STEP|17|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|19|PROOF_STEP|18|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|20|PROOF_STEP|19|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|21|PROOF_STEP|20|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|22|PROOF_STEP|21|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|23|PROOF_STEP|22|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|24|PROOF_STEP|23|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|25|PROOF_STEP|24|P_F1,P_W,P_F2|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|26|PROOF_STEP|25|P_F1,P_W,P_F2|NO_CERTIFICADO
theorem derive_P_F3 (ctx : FormalContext) (h_P_F1 : ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime)))))) (h_P_W : ((ctx.v_onda = ctx.c))) (h_P_F2 : ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt))))) : ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))) := by
  ring_nf at h_P_F2 ⊢
  exact h_P_F2
-- DEMUESTRA_ASSERTION: P_F3|COMPLETA|VERIFICADA

-- FORMAL_NODE: D_Lap
-- SOURCE: ES_46_RV6.md:1115
-- DEMUESTRA_SOURCE_PROSE: {"node": "D_Lap", "location": "ES_46_RV6.md:1115", "source": "# 11. Construcción de $U_{\\rm Lap}$\n\nUna vez expuestas las ecuaciones diferenciales respecto de $t$, puede construirse su representación de Laplace.\n\n$D_{\\rm Lap}$ — La coordenada espectral compleja se escribe manteniendo siempre el par conjugado:\n\n$$\n\\boxed{\ns_\\pm\n=\na\\pm ib.\n}\n$$\n\nLa parte real y la parte imaginaria cumplen funciones distintas.\n\nDesde $P_{F3}$ se obtiene el desplazamiento algebraico central\n\n$$\n\\boxed{\na=\\frac12\n}\n$$\n\ncomo lugar geométrico del regulador.\n\nLa parte imaginaria se obtiene de la periodicidad de fase del cierre.\n\nPara un contorno\n\n$$\nT(k,\\rho)\n=\n(k\\pm\\rho)\\lambda\n$$\n\nen unidades $c=1$, la condición fundamental de fase es\n\n$$\ne^{\\pm ibT}=1.\n$$\n\nPara una vuelta fundamental,\n\n$$\nbT=2\\pi.\n$$\n\nPor tanto,\n\n$$\n\\boxed{\nb(k,\\rho)\n=\n\\frac{2\\pi}\n{(k\\pm\\rho)\\lambda}.\n}\n$$\n\nPara los cierres estables,\n\n$$\n\\rho=0,\n$$\n\nqueda\n\n$$\n\\boxed{\nb_k\n=\n\\frac{2\\pi}{k\\lambda}.\n}\n$$\n\ny la imagen estable es\n\n$$\n\\boxed{\nZ_{\\rm VED\\to Lap}\n=\n\\left\\{\n\\frac12\n\\pm\ni\\frac{2\\pi}{k\\lambda}\n:\nk\\in\\mathbb N^+\n\\right\\}.\n}\n$$", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \boxed{ s_\pm = a\pm ib. }
-- FORMULA: \boxed{ a=\frac12 }
-- FORMULA: T(k,\rho) = (k\pm\rho)\lambda
-- FORMULA: e^{\pm ibT}=1.
-- FORMULA: bT=2\pi.
-- FORMULA: \boxed{ b(k,\rho) = \frac{2\pi} {(k\pm\rho)\lambda}. }
-- FORMULA: \rho=0,
-- FORMULA: \boxed{ b_k = \frac{2\pi}{k\lambda}. }
-- FORMULA: \boxed{ Z_{\rm VED\to Lap} = \left\{ \frac12 \pm i\frac{2\pi}{k\lambda} : k\in\mathbb N^+ \right\}. }
-- FORMULA: U_{\rm Lap}
-- FORMULA: t
-- FORMULA: c=1
def Node_D_Lap_source_1_raw : String := "\\boxed{ s_\\pm = a\\pm ib. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 1, "location": "ES_46_RV6.md:1115:D_Lap:formula-1", "source": "\\boxed{ s_\\pm = a\\pm ib. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_1 (ctx : FormalContext) : Prop := (((ctx.s_PM) = ((ctx.a + ctx.ib)) ∨ (ctx.s_PM) = ((ctx.a - ctx.ib))))
def Node_D_Lap_source_2_raw : String := "\\boxed{ a=\\frac12 }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 2, "location": "ES_46_RV6.md:1115:D_Lap:formula-2", "source": "\\boxed{ a=\\frac12 }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_2 (ctx : FormalContext) : Prop := (ctx.a = ((1 : ℝ) / (2 : ℝ)))
def Node_D_Lap_source_3_raw : String := "T(k,\\rho) = (k\\pm\\rho)\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 3, "location": "ES_46_RV6.md:1115:D_Lap:formula-3", "source": "T(k,\\rho) = (k\\pm\\rho)\\lambda", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_3 (ctx : FormalContext) : Prop := (((ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))
def Node_D_Lap_source_4_raw : String := "e^{\\pm ibT}=1."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 4, "location": "ES_46_RV6.md:1115:D_Lap:formula-4", "source": "e^{\\pm ibT}=1.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_4 (ctx : FormalContext) : Prop := (((ctx.Pow_Real (ctx.e) (ctx.ibT)) = (1) ∨ (ctx.Pow_Real (ctx.e) (-ctx.ibT)) = (1)))
def Node_D_Lap_source_5_raw : String := "bT=2\\pi."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 5, "location": "ES_46_RV6.md:1115:D_Lap:formula-5", "source": "bT=2\\pi.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_5 (ctx : FormalContext) : Prop := (ctx.bT = ((2 : ℝ) * Real.pi))
def Node_D_Lap_source_6_raw : String := "\\boxed{ b(k,\\rho) = \\frac{2\\pi} {(k\\pm\\rho)\\lambda}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 6, "location": "ES_46_RV6.md:1115:D_Lap:formula-6", "source": "\\boxed{ b(k,\\rho) = \\frac{2\\pi} {(k\\pm\\rho)\\lambda}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_6 (ctx : FormalContext) : Prop := (((ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) + ctx.rho) * ctx.lambda))) ∨ (ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))))
def Node_D_Lap_source_7_raw : String := "\\rho=0,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 7, "location": "ES_46_RV6.md:1115:D_Lap:formula-7", "source": "\\rho=0,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_7 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_D_Lap_source_8_raw : String := "\\boxed{ b_k = \\frac{2\\pi}{k\\lambda}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 8, "location": "ES_46_RV6.md:1115:D_Lap:formula-8", "source": "\\boxed{ b_k = \\frac{2\\pi}{k\\lambda}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_8 (ctx : FormalContext) : Prop := (ctx.b_k = (((2 : ℝ) * Real.pi) / ((ctx.k : ℝ) * ctx.lambda)))
def Node_D_Lap_source_9_raw : String := "\\boxed{ Z_{\\rm VED\\to Lap} = \\left\\{ \\frac12 \\pm i\\frac{2\\pi}{k\\lambda} : k\\in\\mathbb N^+ \\right\\}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 9, "location": "ES_46_RV6.md:1115:D_Lap:formula-9", "source": "\\boxed{ Z_{\\rm VED\\to Lap} = \\left\\{ \\frac12 \\pm i\\frac{2\\pi}{k\\lambda} : k\\in\\mathbb N^+ \\right\\}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_9 (ctx : FormalContext) : Prop := (ctx.Z_VED_to_Lap = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))) ∨ x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))))}))
def Node_D_Lap_source_10_raw : String := "U_{\\rm Lap}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 10, "location": "ES_46_RV6.md:1115:D_Lap:formula-10", "source": "U_{\\rm Lap}", "status": "FORMALIZED_TERM", "type": "Real", "role": "STATEMENT"}
def Node_D_Lap_source_10_term (ctx : FormalContext) : ℝ := (ctx.U_Lap)
def Node_D_Lap_source_11_raw : String := "t"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 11, "location": "ES_46_RV6.md:1115:D_Lap:formula-11", "source": "t", "status": "FORMALIZED_TERM", "type": "Real", "role": "STATEMENT"}
def Node_D_Lap_source_11_term (ctx : FormalContext) : ℝ := (ctx.t)
def Node_D_Lap_source_12_raw : String := "c=1"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 12, "location": "ES_46_RV6.md:1115:D_Lap:formula-12", "source": "c=1", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_Lap_source_12 (ctx : FormalContext) : Prop := (ctx.c = 1)
def Node_D_Lap_source_declarations (ctx : FormalContext) : Prop := (Node_D_Lap_source_1 ctx) ∧ (Node_D_Lap_source_2 ctx) ∧ (Node_D_Lap_source_3 ctx) ∧ (Node_D_Lap_source_4 ctx) ∧ (Node_D_Lap_source_5 ctx) ∧ (Node_D_Lap_source_6 ctx) ∧ (Node_D_Lap_source_7 ctx) ∧ (Node_D_Lap_source_8 ctx) ∧ (Node_D_Lap_source_9 ctx)
def Node_D_Lap_source_steps (ctx : FormalContext) : Prop := (Node_D_Lap_source_12 ctx)
def Node_D_Lap_clause_1 (ctx : FormalContext) : Prop := (((ctx.s_PM) = ((ctx.a + ctx.ib)) ∨ (ctx.s_PM) = ((ctx.a - ctx.ib))))
def Node_D_Lap_clause_2 (ctx : FormalContext) : Prop := (ctx.a = ((1 : ℝ) / (2 : ℝ)))
def Node_D_Lap_clause_3 (ctx : FormalContext) : Prop := (((ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))
def Node_D_Lap_clause_4 (ctx : FormalContext) : Prop := (((ctx.Pow_Real (ctx.e) (ctx.ibT)) = (1) ∨ (ctx.Pow_Real (ctx.e) (-ctx.ibT)) = (1)))
def Node_D_Lap_clause_5 (ctx : FormalContext) : Prop := (ctx.bT = ((2 : ℝ) * Real.pi))
def Node_D_Lap_clause_6 (ctx : FormalContext) : Prop := (((ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) + ctx.rho) * ctx.lambda))) ∨ (ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))))
def Node_D_Lap_clause_7 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_D_Lap_clause_8 (ctx : FormalContext) : Prop := (ctx.b_k = (((2 : ℝ) * Real.pi) / ((ctx.k : ℝ) * ctx.lambda)))
def Node_D_Lap_clause_9 (ctx : FormalContext) : Prop := (ctx.Z_VED_to_Lap = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))) ∨ x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))))}))
def Node_D_Lap (ctx : FormalContext) : Prop := (((ctx.s_PM) = ((ctx.a + ctx.ib)) ∨ (ctx.s_PM) = ((ctx.a - ctx.ib)))) ∧ (ctx.a = ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.Pow_Real (ctx.e) (ctx.ibT)) = (1) ∨ (ctx.Pow_Real (ctx.e) (-ctx.ibT)) = (1))) ∧ (ctx.bT = ((2 : ℝ) * Real.pi)) ∧ (((ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) + ctx.rho) * ctx.lambda))) ∨ (ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))) ∧ (ctx.rho = 0) ∧ (ctx.b_k = (((2 : ℝ) * Real.pi) / ((ctx.k : ℝ) * ctx.lambda))) ∧ (ctx.Z_VED_to_Lap = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))) ∨ x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))))}))
-- DEMUESTRA_ASSERTION: D_Lap|COMPLETA|NO_APLICA

-- FORMAL_NODE: P_F3_2
-- SOURCE: ES_46_RV6.md:1239
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_F3_2", "location": "ES_46_RV6.md:1239", "source": "$$\nP_{F3}:\n\\quad\nF\n=\n2dt\n\\left(\n1+\\frac12dt\n\\right).\n$$", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: P_{F3}: \quad F = 2dt \left( 1+\frac12dt \right).
def Node_P_F3_2_source_1_raw : String := "P_{F3}: \\quad F = 2dt \\left( 1+\\frac12dt \\right)."
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_F3_2", "formula": 1, "location": "ES_46_RV6.md:1239:P_F3_2:formula-1", "source": "P_{F3}: \\quad F = 2dt \\left( 1+\\frac12dt \\right).", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_F3_2_source_1 (ctx : FormalContext) : Prop := (ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3_2|1|CLAIM|-|P_F3|NO_CERTIFICADO
theorem derive_P_F3_2 (ctx : FormalContext) (h_P_F3 : ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt)))))) : ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))) := by
  exact h_P_F3
-- DEMUESTRA_ASSERTION: P_F3_2|COMPLETA|VERIFICADA_ESTRUCTURAL

-- FORMAL_NODE: P_Lap_Z
-- SOURCE: ES_46_RV6.md:1202
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_Lap_Z", "location": "ES_46_RV6.md:1202", "source": "$P_{\\rm Lap}(Z)$ — Todos los estados estables de $U_{\\rm VED}$ aparecen como puntos discretos de la recta\n\n$$\n\\Re(s)=\\frac12.\n$$\n\nLa recta completa no es el conjunto de estados estables. Puede contener puntos que no correspondan a ningún $k$ estable. La estabilidad corresponde a los puntos discretos enumerados por $k$.\n\n---", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: \Re(s)=\frac12.
-- FORMULA: U_{\rm VED}
-- FORMULA: k
-- FORMULA: k
def Node_P_Lap_Z_source_1_raw : String := "\\Re(s)=\\frac12."
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_Lap_Z", "formula": 1, "location": "ES_46_RV6.md:1202:P_Lap_Z:formula-1", "source": "\\Re(s)=\\frac12.", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_Lap_Z_source_1 (ctx : FormalContext) : Prop := (ctx.Z_VED_to_Lap ⊆ ({s | (Complex.re s) = ((1 : ℝ) / (2 : ℝ))}))
def Node_P_Lap_Z_source_2_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Lap_Z", "formula": 2, "location": "ES_46_RV6.md:1202:P_Lap_Z:formula-2", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_Lap_Z_source_2_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_Lap_Z_source_3_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Lap_Z", "formula": 3, "location": "ES_46_RV6.md:1202:P_Lap_Z:formula-3", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "PROOF_STEP"}
def Node_P_Lap_Z_source_3_term (ctx : FormalContext) : ℕ := (ctx.k)
def Node_P_Lap_Z_source_4_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Lap_Z", "formula": 4, "location": "ES_46_RV6.md:1202:P_Lap_Z:formula-4", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "PROOF_STEP"}
def Node_P_Lap_Z_source_4_term (ctx : FormalContext) : ℕ := (ctx.k)
-- DEMUESTRA_DEDUCTIVE_LINK: P_Lap_Z|1|CLAIM|-|P_F2,P_F3,D_Lap|NO_CERTIFICADO
theorem derive_P_Lap_Z (ctx : FormalContext) (h_P_F2 : ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt))))) (h_P_F3 : ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt)))))) (h_D_Lap : ((((ctx.s_PM) = ((ctx.a + ctx.ib)) ∨ (ctx.s_PM) = ((ctx.a - ctx.ib)))) ∧ (ctx.a = ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.Pow_Real (ctx.e) (ctx.ibT)) = (1) ∨ (ctx.Pow_Real (ctx.e) (-ctx.ibT)) = (1))) ∧ (ctx.bT = ((2 : ℝ) * Real.pi)) ∧ (((ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) + ctx.rho) * ctx.lambda))) ∨ (ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))) ∧ (ctx.rho = 0) ∧ (ctx.b_k = (((2 : ℝ) * Real.pi) / ((ctx.k : ℝ) * ctx.lambda))) ∧ (ctx.Z_VED_to_Lap = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))) ∨ x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))))})))) : ((ctx.Z_VED_to_Lap ⊆ ({s | (Complex.re s) = ((1 : ℝ) / (2 : ℝ))}))) := by
  rcases h_D_Lap with ⟨h_D_Lap_1, h_D_Lap_2, h_D_Lap_3, h_D_Lap_4, h_D_Lap_5, h_D_Lap_6, h_D_Lap_7, h_D_Lap_8, h_D_Lap_9⟩
  intro s hs
  rw [h_D_Lap_9] at hs
  rcases hs with ⟨k, hk, hs | hs⟩
  · subst s; simp [Complex.div_im]
  · subst s; simp [Complex.div_im]
-- DEMUESTRA_ASSERTION: P_Lap_Z|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_Lap_Z_2
-- SOURCE: ES_46_RV6.md:1250
-- DEMUESTRA_SOURCE_PROSE: {"node": "P_Lap_Z_2", "location": "ES_46_RV6.md:1250", "source": "$$\nP_{\\rm Lap}(Z):\n\\quad\nZ_{\\rm VED\\to Lap}\n\\subset\n\\{s:\\Re(s)=1/2\\}.\n$$\n\nNinguna de estas proposiciones se reabre en las secciones posteriores.\n\n---", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
-- FORMULA: P_{\rm Lap}(Z): \quad Z_{\rm VED\to Lap} \subset \{s:\Re(s)=1/2\}.
def Node_P_Lap_Z_2_source_1_raw : String := "P_{\\rm Lap}(Z): \\quad Z_{\\rm VED\\to Lap} \\subset \\{s:\\Re(s)=1/2\\}."
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_Lap_Z_2", "formula": 1, "location": "ES_46_RV6.md:1250:P_Lap_Z_2:formula-1", "source": "P_{\\rm Lap}(Z): \\quad Z_{\\rm VED\\to Lap} \\subset \\{s:\\Re(s)=1/2\\}.", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_Lap_Z_2_source_1 (ctx : FormalContext) : Prop := (ctx.Z_VED_to_Lap ⊆ ({s | (Complex.re s) = ((1 : ℝ) / (2 : ℝ))}))
-- DEMUESTRA_DEDUCTIVE_LINK: P_Lap_Z_2|1|CLAIM|-|P_Lap_Z|NO_CERTIFICADO
theorem derive_P_Lap_Z_2 (ctx : FormalContext) (h_P_Lap_Z : ((ctx.Z_VED_to_Lap ⊆ ({s | (Complex.re s) = ((1 : ℝ) / (2 : ℝ))})))) (h_D_Lap : ((((ctx.s_PM) = ((ctx.a + ctx.ib)) ∨ (ctx.s_PM) = ((ctx.a - ctx.ib)))) ∧ (ctx.a = ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.Pow_Real (ctx.e) (ctx.ibT)) = (1) ∨ (ctx.Pow_Real (ctx.e) (-ctx.ibT)) = (1))) ∧ (ctx.bT = ((2 : ℝ) * Real.pi)) ∧ (((ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) + ctx.rho) * ctx.lambda))) ∨ (ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))) ∧ (ctx.rho = 0) ∧ (ctx.b_k = (((2 : ℝ) * Real.pi) / ((ctx.k : ℝ) * ctx.lambda))) ∧ (ctx.Z_VED_to_Lap = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))) ∨ x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))))})))) : ((ctx.Z_VED_to_Lap ⊆ ({s | (Complex.re s) = ((1 : ℝ) / (2 : ℝ))}))) := by
  exact h_P_Lap_Z
-- DEMUESTRA_ASSERTION: P_Lap_Z_2|COMPLETA|VERIFICADA_ESTRUCTURAL


-- Relaciones deductivas trasladadas del Markdown a codigo Lean.
def DeductiveLink_D_Rim_8 (ctx : FormalContext) : Prop := (Node_D_Rim_source_7 ctx) → (Node_D_Rim_source_8 ctx)
def DeductiveLink_P_COORD_1 (ctx : FormalContext) : Prop := ((ctx.U = (((3 : ℝ) * ctx.S) + ctx.T))) → (Node_P_COORD_source_1 ctx)
def DeductiveLink_P_COORD_2 (ctx : FormalContext) : Prop := (Node_P_COORD_source_1 ctx) → ((ctx.U = (((3 : ℝ) * ctx.S) + ctx.T))) → (Node_P_COORD_source_2 ctx)
def DeductiveLink_P_VED_Inv_1 (ctx : FormalContext) : Prop := ((ctx.E = (ctx.hc / ctx.lambda)) ∧ (ctx.E = ctx.Mc ^ 2) ∧ (ctx.Mc ^ 2 = (ctx.hc / ctx.lambda)) ∧ (ctx.lambda = (ctx.h / ctx.Mc))) → ((ctx.L = (ctx.n * ctx.lambda)) ∧ (ctx.n ∈ {x : ℝ | 0 < x})) → (((((2 : ℝ) * Real.pi) * ctx.R_VED) = ctx.L) ∧ ((ctx.R_VED = (ctx.L / ((2 : ℝ) * Real.pi))) ∧ ((ctx.L / ((2 : ℝ) * Real.pi)) = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi)))) ∧ (((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → (Node_P_VED_Inv_source_1 ctx)
def DeductiveLink_P_VED_Inv_2 (ctx : FormalContext) : Prop := (Node_P_VED_Inv_source_1 ctx) → ((ctx.E = (ctx.hc / ctx.lambda)) ∧ (ctx.E = ctx.Mc ^ 2) ∧ (ctx.Mc ^ 2 = (ctx.hc / ctx.lambda)) ∧ (ctx.lambda = (ctx.h / ctx.Mc))) → ((ctx.L = (ctx.n * ctx.lambda)) ∧ (ctx.n ∈ {x : ℝ | 0 < x})) → (((((2 : ℝ) * Real.pi) * ctx.R_VED) = ctx.L) ∧ ((ctx.R_VED = (ctx.L / ((2 : ℝ) * Real.pi))) ∧ ((ctx.L / ((2 : ℝ) * Real.pi)) = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi)))) ∧ (((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → (Node_P_VED_Inv_source_2 ctx)
def DeductiveLink_P_VED_Inv_3 (ctx : FormalContext) : Prop := (Node_P_VED_Inv_source_2 ctx) → ((ctx.E = (ctx.hc / ctx.lambda)) ∧ (ctx.E = ctx.Mc ^ 2) ∧ (ctx.Mc ^ 2 = (ctx.hc / ctx.lambda)) ∧ (ctx.lambda = (ctx.h / ctx.Mc))) → ((ctx.L = (ctx.n * ctx.lambda)) ∧ (ctx.n ∈ {x : ℝ | 0 < x})) → (((((2 : ℝ) * Real.pi) * ctx.R_VED) = ctx.L) ∧ ((ctx.R_VED = (ctx.L / ((2 : ℝ) * Real.pi))) ∧ ((ctx.L / ((2 : ℝ) * Real.pi)) = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi)))) ∧ (((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → (Node_P_VED_Inv_source_3 ctx)
def DeductiveLink_P_VED_Inv_4 (ctx : FormalContext) : Prop := (Node_P_VED_Inv_source_3 ctx) → ((ctx.E = (ctx.hc / ctx.lambda)) ∧ (ctx.E = ctx.Mc ^ 2) ∧ (ctx.Mc ^ 2 = (ctx.hc / ctx.lambda)) ∧ (ctx.lambda = (ctx.h / ctx.Mc))) → ((ctx.L = (ctx.n * ctx.lambda)) ∧ (ctx.n ∈ {x : ℝ | 0 < x})) → (((((2 : ℝ) * Real.pi) * ctx.R_VED) = ctx.L) ∧ ((ctx.R_VED = (ctx.L / ((2 : ℝ) * Real.pi))) ∧ ((ctx.L / ((2 : ℝ) * Real.pi)) = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi)))) ∧ (((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → (Node_P_VED_Inv_source_4 ctx)
def DeductiveLink_P_VED_Inv_5 (ctx : FormalContext) : Prop := (Node_P_VED_Inv_source_4 ctx) → ((ctx.E = (ctx.hc / ctx.lambda)) ∧ (ctx.E = ctx.Mc ^ 2) ∧ (ctx.Mc ^ 2 = (ctx.hc / ctx.lambda)) ∧ (ctx.lambda = (ctx.h / ctx.Mc))) → ((ctx.L = (ctx.n * ctx.lambda)) ∧ (ctx.n ∈ {x : ℝ | 0 < x})) → (((((2 : ℝ) * Real.pi) * ctx.R_VED) = ctx.L) ∧ ((ctx.R_VED = (ctx.L / ((2 : ℝ) * Real.pi))) ∧ ((ctx.L / ((2 : ℝ) * Real.pi)) = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi)))) ∧ (((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → (Node_P_VED_Inv_source_5 ctx)
def DeductiveLink_T_ISO_1 (ctx : FormalContext) : Prop := ((ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate))) → (((∀ x_map : ℂ, x_map ∈ ctx.U_Rim_rho → (ctx.f_inv_fn_1 x_map) ∈ ctx.U_VED_rho)) ∧ ((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.f_inv_fn_1 (ctx.f_fn_1 x_all)) = x_all)) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.f_fn_1 (ctx.f_inv_fn_1 z_all)) = z_all)))) → (Node_T_ISO_source_1 ctx)
def DeductiveLink_P_ST_1 (ctx : FormalContext) : Prop := (((((ctx.dy = 0) ∧ (ctx.dz = 0)) ∧ (ctx.ds = ctx.dx)) → (ctx.U = (((3 : ℝ) * ctx.S) + ctx.T)))) → (True) → ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → (Node_P_ST_source_1 ctx)
def DeductiveLink_P_ST_2 (ctx : FormalContext) : Prop := (Node_P_ST_source_1 ctx) → (((((ctx.dy = 0) ∧ (ctx.dz = 0)) ∧ (ctx.ds = ctx.dx)) → (ctx.U = (((3 : ℝ) * ctx.S) + ctx.T)))) → (True) → ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → (Node_P_ST_source_2 ctx)
def DeductiveLink_P_VED_E_1 (ctx : FormalContext) : Prop := ((((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → (Node_P_VED_E_source_1 ctx)
def DeductiveLink_P_VED_E_2 (ctx : FormalContext) : Prop := (Node_P_VED_E_source_1 ctx) → ((((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → (Node_P_VED_E_source_2 ctx)
def DeductiveLink_P_VED_E_3 (ctx : FormalContext) : Prop := (Node_P_VED_E_source_2 ctx) → ((((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → (Node_P_VED_E_source_3 ctx)
def DeductiveLink_P_VED_E_4 (ctx : FormalContext) : Prop := (Node_P_VED_E_source_3 ctx) → ((((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → (Node_P_VED_E_source_4 ctx)
def DeductiveLink_P_VED_E_5 (ctx : FormalContext) : Prop := (Node_P_VED_E_source_4 ctx) → ((((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → (Node_P_VED_E_source_5 ctx)
def DeductiveLink_P_RHO_ISO_1 (ctx : FormalContext) : Prop := (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (Node_P_RHO_ISO_source_1 ctx)
def DeductiveLink_P_RHO_ISO_2 (ctx : FormalContext) : Prop := (Node_P_RHO_ISO_source_1 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (Node_P_RHO_ISO_source_2 ctx)
def DeductiveLink_P_RHO_ISO_3 (ctx : FormalContext) : Prop := (Node_P_RHO_ISO_source_2 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (Node_P_RHO_ISO_source_3 ctx)
def DeductiveLink_P_v_1 (ctx : FormalContext) : Prop := (True) → ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → (Node_P_v_source_1 ctx)
def DeductiveLink_P_v_2 (ctx : FormalContext) : Prop := (Node_P_v_source_1 ctx) → (True) → ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → (Node_P_v_source_2 ctx)
def DeductiveLink_P_ST_2_1 (ctx : FormalContext) : Prop := ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → (Node_P_ST_2_source_1 ctx)
def DeductiveLink_P_VED_I_1 (ctx : FormalContext) : Prop := ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx))) → (Node_P_VED_I_source_1 ctx)
def DeductiveLink_P_VED_I_2 (ctx : FormalContext) : Prop := (Node_P_VED_I_source_1 ctx) → ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx))) → (Node_P_VED_I_source_2 ctx)
def DeductiveLink_P_VED_E_2_1 (ctx : FormalContext) : Prop := ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx))) → (Node_P_VED_E_2_source_1 ctx)
def DeductiveLink_P_RIM_S_1 (ctx : FormalContext) : Prop := (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → (Node_P_RIM_S_source_1 ctx)
def DeductiveLink_P_RIM_S_2 (ctx : FormalContext) : Prop := (Node_P_RIM_S_source_1 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → (Node_P_RIM_S_source_2 ctx)
def DeductiveLink_P_a_1 (ctx : FormalContext) : Prop := ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → ((ctx.Derivative_t (ctx.DerivativeSubject_s) = ctx.v)) → (Node_P_a_source_1 ctx)
def DeductiveLink_P_VED_K_E_1 (ctx : FormalContext) : Prop := ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx))) → ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ Derived_Text_cierre_no_estable ctx)) → ((ctx.k ∈ {x : ℕ | 0 < x}) ∧ (ctx.rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho = 0)) ∧ (x = ((k, rho)))}))) → (Node_P_VED_K_E_source_1 ctx)
def DeductiveLink_P_VED_K_E_2 (ctx : FormalContext) : Prop := (Node_P_VED_K_E_source_1 ctx) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx))) → ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ Derived_Text_cierre_no_estable ctx)) → ((ctx.k ∈ {x : ℕ | 0 < x}) ∧ (ctx.rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho = 0)) ∧ (x = ((k, rho)))}))) → (Node_P_VED_K_E_source_2 ctx)
def DeductiveLink_P_VED_K_E_3 (ctx : FormalContext) : Prop := (Node_P_VED_K_E_source_2 ctx) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx))) → ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ Derived_Text_cierre_no_estable ctx)) → ((ctx.k ∈ {x : ℕ | 0 < x}) ∧ (ctx.rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho = 0)) ∧ (x = ((k, rho)))}))) → (Node_P_VED_K_E_source_3 ctx)
def DeductiveLink_P_VR_rho_1 (ctx : FormalContext) : Prop := (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_1 ctx)
def DeductiveLink_P_VR_rho_2 (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_1 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_2 ctx)
def DeductiveLink_P_VR_rho_3 (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_2 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_3 ctx)
def DeductiveLink_P_VR_rho_4 (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_3 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_4 ctx)
def DeductiveLink_P_VR_rho_5 (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_4 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_5 ctx)
def DeductiveLink_P_VR_rho_6 (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_5 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_6 ctx)
def DeductiveLink_P_VR_rho_7 (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_6 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_7 ctx)
def DeductiveLink_P_VR_rho_8 (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_7 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_8 ctx)
def DeductiveLink_P_VR_rho_9 (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_8 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_9 ctx)
def DeductiveLink_P_VR_E_1 (ctx : FormalContext) : Prop := ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_VR_E_source_1 ctx)
def DeductiveLink_P_VR_E_2 (ctx : FormalContext) : Prop := (Node_P_VR_E_source_1 ctx) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_VR_E_source_2 ctx)
def DeductiveLink_P_VR_E_3 (ctx : FormalContext) : Prop := (Node_P_VR_E_source_2 ctx) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_VR_E_source_3 ctx)
def DeductiveLink_P_VR_E_4 (ctx : FormalContext) : Prop := (Node_P_VR_E_source_3 ctx) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_VR_E_source_4 ctx)
def DeductiveLink_P_Z_1 (ctx : FormalContext) : Prop := (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_Z_source_1 ctx)
def DeductiveLink_P_Z_2 (ctx : FormalContext) : Prop := (Node_P_Z_source_1 ctx) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_Z_source_2 ctx)
def DeductiveLink_P_Z_3 (ctx : FormalContext) : Prop := (Node_P_Z_source_2 ctx) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_Z_source_3 ctx)
def DeductiveLink_P_Z_4 (ctx : FormalContext) : Prop := (Node_P_Z_source_3 ctx) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_Z_source_4 ctx)
def DeductiveLink_P_Z_5 (ctx : FormalContext) : Prop := (Node_P_Z_source_4 ctx) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_Z_source_5 ctx)
def DeductiveLink_P_Z_6 (ctx : FormalContext) : Prop := (Node_P_Z_source_5 ctx) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_Z_source_6 ctx)
def DeductiveLink_P_Z_7 (ctx : FormalContext) : Prop := (Node_P_Z_source_6 ctx) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_Z_source_7 ctx)
def DeductiveLink_P_Z_8 (ctx : FormalContext) : Prop := (Node_P_Z_source_7 ctx) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_Z_source_8 ctx)
def DeductiveLink_P_Z_9 (ctx : FormalContext) : Prop := (Node_P_Z_source_8 ctx) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_Z_source_9 ctx)
def DeductiveLink_P_Z_10 (ctx : FormalContext) : Prop := (Node_P_Z_source_9 ctx) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_Z_source_10 ctx)
def DeductiveLink_P_Z_11 (ctx : FormalContext) : Prop := (Node_P_Z_source_10 ctx) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_Z_source_11 ctx)
def DeductiveLink_P_VED_R_C_1 (ctx : FormalContext) : Prop := ((((ctx.rho = 0)) → (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = ((k, 0)))})))) → ((ctx.U_VED_cerrado = ({x | ∃ k : ℕ, ∃ rho : ℝ, ((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (x = ((k, rho)))})) ∧ (ctx.mathcal_I_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho > 0)) ∧ (x = ((k, rho)))}))) → (Node_P_VED_R_C_source_1 ctx)
def DeductiveLink_T_RIEMANN_1 (ctx : FormalContext) : Prop := (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_1 ctx)
def DeductiveLink_T_RIEMANN_2 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_1 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_2 ctx)
def DeductiveLink_T_RIEMANN_3 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_2 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_3 ctx)
def DeductiveLink_T_RIEMANN_4 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_3 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_4 ctx)
def DeductiveLink_T_RIEMANN_5 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_4 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_5 ctx)
def DeductiveLink_T_RIEMANN_6 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_5 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_6 ctx)
def DeductiveLink_T_RIEMANN_8 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_7 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_8 ctx)
def DeductiveLink_T_RIEMANN_9 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_8 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_9 ctx)
def DeductiveLink_T_RIEMANN_10 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_9 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_10 ctx)
def DeductiveLink_T_RIEMANN_11 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_10 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_11 ctx)
def DeductiveLink_T_RIEMANN_12 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_11 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_12 ctx)
def DeductiveLink_T_RIEMANN_13 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_12 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_13 ctx)
def DeductiveLink_T_RIEMANN_14 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_13 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_14 ctx)
def DeductiveLink_T_RIEMANN_15 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_14 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_15 ctx)
def DeductiveLink_T_RIEMANN_16 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_15 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_16 ctx)
def DeductiveLink_T_RIEMANN_17 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_16 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_17 ctx)
def DeductiveLink_T_RIEMANN_18 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_17 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_18 ctx)
def DeductiveLink_T_RIEMANN_19 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_18 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_19 ctx)
def DeductiveLink_T_RIEMANN_20 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_19 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_20 ctx)
def DeductiveLink_T_RIEMANN_21 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_20 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_21 ctx)
def DeductiveLink_T_RIEMANN_22 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_21 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_22 ctx)
def DeductiveLink_T_RIEMANN_23 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_22 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_23 ctx)
def DeductiveLink_T_RIEMANN_24 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_23 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_24 ctx)
def DeductiveLink_T_RIEMANN_25 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_24 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_25 ctx)
def DeductiveLink_T_RIEMANN_26 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_25 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_26 ctx)
def DeductiveLink_T_RIEMANN_27 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_26 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_27 ctx)
def DeductiveLink_T_RIEMANN_28 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_27 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_28 ctx)
def DeductiveLink_T_RIEMANN_29 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_28 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_29 ctx)
def DeductiveLink_T_RIEMANN_30 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_29 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_30 ctx)
def DeductiveLink_T_RIEMANN_31 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_30 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_31 ctx)
def DeductiveLink_T_RIEMANN_32 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_31 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_32 ctx)
def DeductiveLink_T_RIEMANN_33 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_32 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_33 ctx)
def DeductiveLink_T_RIEMANN_34 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_33 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_34 ctx)
def DeductiveLink_T_RIEMANN_35 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_34 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_35 ctx)
def DeductiveLink_T_RIEMANN_36 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_35 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_36 ctx)
def DeductiveLink_T_RIEMANN_37 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_36 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_37 ctx)
def DeductiveLink_T_RIEMANN_38 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_37 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_38 ctx)
def DeductiveLink_T_RIEMANN_39 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_38 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_39 ctx)
def DeductiveLink_T_RIEMANN_40 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_39 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_40 ctx)
def DeductiveLink_T_RIEMANN_41 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_40 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_41 ctx)
def DeductiveLink_T_RIEMANN_42 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_41 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_42 ctx)
def DeductiveLink_T_RIEMANN_43 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_42 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_43 ctx)
def DeductiveLink_T_RIEMANN_45 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_43 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_45 ctx)
def DeductiveLink_T_RIEMANN_46 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_45 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_46 ctx)
def DeductiveLink_T_RIEMANN_47 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_46 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_47 ctx)
def DeductiveLink_T_RIEMANN_48 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_47 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_48 ctx)
def DeductiveLink_T_RIEMANN_49 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_48 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_49 ctx)
def DeductiveLink_T_RIEMANN_50 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_49 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_50 ctx)
def DeductiveLink_T_RIEMANN_71 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_50 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_71 ctx)
def DeductiveLink_T_RIEMANN_103 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_71 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_103 ctx)
def DeductiveLink_T_RIEMANN_104 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_103 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_104 ctx)
def DeductiveLink_T_RIEMANN_121 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_104 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_121 ctx)
def DeductiveLink_P_VED_Completo_1 (ctx : FormalContext) : Prop := ((ctx.U_VED_cerrado = ({x | ∃ k : ℕ, ∃ rho : ℝ, ((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (x = ((k, rho)))})) ∧ (ctx.mathcal_I_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho > 0)) ∧ (x = ((k, rho)))}))) → (((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) → (Node_P_VED_Completo_source_1 ctx)
def DeductiveLink_P_VS_1 (ctx : FormalContext) : Prop := (((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) → ((ctx.U_VED_cerrado = (ctx.mathcal_E_VED ∪ ctx.mathcal_I_VED))) → ((ctx.tilde_N = (ctx.R_VED * ctx.R_Sch)) ∧ (ctx.R_Sch = (ctx.tilde_N / ctx.R_VED)) ∧ (ctx.R_VED = (ctx.tilde_N / ctx.R_Sch)) ∧ ((ctx.Phi_tilde_N_fn_1 ctx.R_VED = ctx.tilde_N / ctx.R_VED)) ∧ (Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))) → (Node_P_VS_source_1 ctx)
def DeductiveLink_P_VS_2 (ctx : FormalContext) : Prop := (Node_P_VS_source_1 ctx) → (((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) → ((ctx.U_VED_cerrado = (ctx.mathcal_E_VED ∪ ctx.mathcal_I_VED))) → ((ctx.tilde_N = (ctx.R_VED * ctx.R_Sch)) ∧ (ctx.R_Sch = (ctx.tilde_N / ctx.R_VED)) ∧ (ctx.R_VED = (ctx.tilde_N / ctx.R_Sch)) ∧ ((ctx.Phi_tilde_N_fn_1 ctx.R_VED = ctx.tilde_N / ctx.R_VED)) ∧ (Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))) → (Node_P_VS_source_2 ctx)
def DeductiveLink_P_VS_3 (ctx : FormalContext) : Prop := (Node_P_VS_source_2 ctx) → (((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) → ((ctx.U_VED_cerrado = (ctx.mathcal_E_VED ∪ ctx.mathcal_I_VED))) → ((ctx.tilde_N = (ctx.R_VED * ctx.R_Sch)) ∧ (ctx.R_Sch = (ctx.tilde_N / ctx.R_VED)) ∧ (ctx.R_VED = (ctx.tilde_N / ctx.R_Sch)) ∧ ((ctx.Phi_tilde_N_fn_1 ctx.R_VED = ctx.tilde_N / ctx.R_VED)) ∧ (Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))) → (Node_P_VS_source_3 ctx)
def DeductiveLink_P_F_1 (ctx : FormalContext) : Prop := ((ctx.tilde_N = (ctx.R_VED * ctx.R_Sch)) ∧ (ctx.R_Sch = (ctx.tilde_N / ctx.R_VED)) ∧ (ctx.R_VED = (ctx.tilde_N / ctx.R_Sch)) ∧ ((ctx.Phi_tilde_N_fn_1 ctx.R_VED = ctx.tilde_N / ctx.R_VED)) ∧ (Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))) → ((Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → (Node_P_F_source_1 ctx)
def DeductiveLink_P_F1_1 (ctx : FormalContext) : Prop := ((Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → ((ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → (Node_P_F1_source_1 ctx)
def DeductiveLink_P_W_1 (ctx : FormalContext) : Prop := ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → (Node_P_W_source_1 ctx)
def DeductiveLink_P_W_2 (ctx : FormalContext) : Prop := (Node_P_W_source_1 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → (Node_P_W_source_2 ctx)
def DeductiveLink_P_W_3 (ctx : FormalContext) : Prop := (Node_P_W_source_2 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → (Node_P_W_source_3 ctx)
def DeductiveLink_P_W_4 (ctx : FormalContext) : Prop := (Node_P_W_source_3 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → (Node_P_W_source_4 ctx)
def DeductiveLink_P_W_5 (ctx : FormalContext) : Prop := (Node_P_W_source_4 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → (Node_P_W_source_5 ctx)
def DeductiveLink_P_W_6 (ctx : FormalContext) : Prop := (Node_P_W_source_5 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → (Node_P_W_source_6 ctx)
def DeductiveLink_P_W_7 (ctx : FormalContext) : Prop := (Node_P_W_source_6 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → (Node_P_W_source_7 ctx)
def DeductiveLink_P_W_8 (ctx : FormalContext) : Prop := (Node_P_W_source_7 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → (Node_P_W_source_8 ctx)
def DeductiveLink_P_W_9 (ctx : FormalContext) : Prop := (Node_P_W_source_8 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → (Node_P_W_source_9 ctx)
def DeductiveLink_P_W_10 (ctx : FormalContext) : Prop := (Node_P_W_source_9 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → (Node_P_W_source_10 ctx)
def DeductiveLink_P_F2_1 (ctx : FormalContext) : Prop := ((ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → (Node_P_F2_source_1 ctx)
def DeductiveLink_P_F2_2 (ctx : FormalContext) : Prop := (Node_P_F2_source_1 ctx) → ((ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → (Node_P_F2_source_2 ctx)
def DeductiveLink_P_F3_1 (ctx : FormalContext) : Prop := ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_1 ctx)
def DeductiveLink_P_F3_3 (ctx : FormalContext) : Prop := (Node_P_F3_source_1 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_3 ctx)
def DeductiveLink_P_F3_4 (ctx : FormalContext) : Prop := (Node_P_F3_source_3 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_4 ctx)
def DeductiveLink_P_F3_5 (ctx : FormalContext) : Prop := (Node_P_F3_source_4 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_5 ctx)
def DeductiveLink_P_F3_6 (ctx : FormalContext) : Prop := (Node_P_F3_source_5 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_6 ctx)
def DeductiveLink_P_F3_7 (ctx : FormalContext) : Prop := (Node_P_F3_source_6 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_7 ctx)
def DeductiveLink_P_F3_9 (ctx : FormalContext) : Prop := (Node_P_F3_source_7 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_9 ctx)
def DeductiveLink_P_F3_10 (ctx : FormalContext) : Prop := (Node_P_F3_source_9 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_10 ctx)
def DeductiveLink_P_F3_11 (ctx : FormalContext) : Prop := (Node_P_F3_source_10 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_11 ctx)
def DeductiveLink_P_F3_12 (ctx : FormalContext) : Prop := (Node_P_F3_source_11 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_12 ctx)
def DeductiveLink_P_F3_13 (ctx : FormalContext) : Prop := (Node_P_F3_source_12 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_13 ctx)
def DeductiveLink_P_F3_14 (ctx : FormalContext) : Prop := (Node_P_F3_source_13 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_14 ctx)
def DeductiveLink_P_F3_15 (ctx : FormalContext) : Prop := (Node_P_F3_source_14 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_15 ctx)
def DeductiveLink_P_F3_16 (ctx : FormalContext) : Prop := (Node_P_F3_source_15 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_16 ctx)
def DeductiveLink_P_F3_17 (ctx : FormalContext) : Prop := (Node_P_F3_source_16 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_17 ctx)
def DeductiveLink_P_F3_18 (ctx : FormalContext) : Prop := (Node_P_F3_source_17 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_18 ctx)
def DeductiveLink_P_F3_19 (ctx : FormalContext) : Prop := (Node_P_F3_source_18 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_19 ctx)
def DeductiveLink_P_F3_20 (ctx : FormalContext) : Prop := (Node_P_F3_source_19 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_20 ctx)
def DeductiveLink_P_F3_21 (ctx : FormalContext) : Prop := (Node_P_F3_source_20 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_21 ctx)
def DeductiveLink_P_F3_22 (ctx : FormalContext) : Prop := (Node_P_F3_source_21 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_22 ctx)
def DeductiveLink_P_F3_23 (ctx : FormalContext) : Prop := (Node_P_F3_source_22 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_23 ctx)
def DeductiveLink_P_F3_24 (ctx : FormalContext) : Prop := (Node_P_F3_source_23 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_24 ctx)
def DeductiveLink_P_F3_25 (ctx : FormalContext) : Prop := (Node_P_F3_source_24 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_25 ctx)
def DeductiveLink_P_F3_26 (ctx : FormalContext) : Prop := (Node_P_F3_source_25 ctx) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → (Node_P_F3_source_26 ctx)
def DeductiveLink_P_F3_2_1 (ctx : FormalContext) : Prop := ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))) → (Node_P_F3_2_source_1 ctx)
def DeductiveLink_P_Lap_Z_1 (ctx : FormalContext) : Prop := ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))) → ((((ctx.s_PM) = ((ctx.a + ctx.ib)) ∨ (ctx.s_PM) = ((ctx.a - ctx.ib)))) ∧ (ctx.a = ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.Pow_Real (ctx.e) (ctx.ibT)) = (1) ∨ (ctx.Pow_Real (ctx.e) (-ctx.ibT)) = (1))) ∧ (ctx.bT = ((2 : ℝ) * Real.pi)) ∧ (((ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) + ctx.rho) * ctx.lambda))) ∨ (ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))) ∧ (ctx.rho = 0) ∧ (ctx.b_k = (((2 : ℝ) * Real.pi) / ((ctx.k : ℝ) * ctx.lambda))) ∧ (ctx.Z_VED_to_Lap = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))) ∨ x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))))}))) → (Node_P_Lap_Z_source_1 ctx)
def DeductiveLink_P_Lap_Z_2_1 (ctx : FormalContext) : Prop := ((ctx.Z_VED_to_Lap ⊆ ({s | (Complex.re s) = ((1 : ℝ) / (2 : ℝ))}))) → (Node_P_Lap_Z_2_source_1 ctx)
def DeductiveNode_D_fInv (ctx : FormalContext) : Prop := ((ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate))) → (((∀ x_map : ℂ, x_map ∈ ctx.U_Rim_rho → (ctx.f_inv_fn_1 x_map) ∈ ctx.U_VED_rho)) ∧ ((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.f_inv_fn_1 (ctx.f_fn_1 x_all)) = x_all)) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.f_fn_1 (ctx.f_inv_fn_1 z_all)) = z_all))))
def DeductiveNode_P_COORD (ctx : FormalContext) : Prop := ((ctx.U = (((3 : ℝ) * ctx.S) + ctx.T))) → (((((ctx.dy = 0) ∧ (ctx.dz = 0)) ∧ (ctx.ds = ctx.dx)) → (ctx.U = (((3 : ℝ) * ctx.S) + ctx.T))))
def DeductiveNode_P_VED_Inv (ctx : FormalContext) : Prop := ((ctx.E = (ctx.hc / ctx.lambda)) ∧ (ctx.E = ctx.Mc ^ 2) ∧ (ctx.Mc ^ 2 = (ctx.hc / ctx.lambda)) ∧ (ctx.lambda = (ctx.h / ctx.Mc))) → ((ctx.L = (ctx.n * ctx.lambda)) ∧ (ctx.n ∈ {x : ℝ | 0 < x})) → (((((2 : ℝ) * Real.pi) * ctx.R_VED) = ctx.L) ∧ ((ctx.R_VED = (ctx.L / ((2 : ℝ) * Real.pi))) ∧ ((ctx.L / ((2 : ℝ) * Real.pi)) = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi)))) ∧ (((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → ((((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED)))
def DeductiveNode_T_ISO (ctx : FormalContext) : Prop := ((ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate))) → (((∀ x_map : ℂ, x_map ∈ ctx.U_Rim_rho → (ctx.f_inv_fn_1 x_map) ∈ ctx.U_VED_rho)) ∧ ((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.f_inv_fn_1 (ctx.f_fn_1 x_all)) = x_all)) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.f_fn_1 (ctx.f_inv_fn_1 z_all)) = z_all)))) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate))))
def DeductiveNode_P_ST (ctx : FormalContext) : Prop := (((((ctx.dy = 0) ∧ (ctx.dz = 0)) ∧ (ctx.ds = ctx.dx)) → (ctx.U = (((3 : ℝ) * ctx.S) + ctx.T)))) → (True) → ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2)))
def DeductiveNode_P_VED_E (ctx : FormalContext) : Prop := ((((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → ((ctx.E = (ctx.hc / ctx.lambda)) ∧ (ctx.E = ctx.Mc ^ 2) ∧ (ctx.Mc ^ 2 = (ctx.hc / ctx.lambda)) ∧ (ctx.lambda = (ctx.h / ctx.Mc))) → ((ctx.L = (ctx.n * ctx.lambda)) ∧ (ctx.n ∈ {x : ℝ | 0 < x})) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx)))
def DeductiveNode_P_RHO_ISO (ctx : FormalContext) : Prop := (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → ((ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all)))))
def DeductiveNode_P_v (ctx : FormalContext) : Prop := (True) → ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → ((ctx.Derivative_t (ctx.DerivativeSubject_s) = ctx.v))
def DeductiveNode_P_ST_2 (ctx : FormalContext) : Prop := ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2)))
def DeductiveNode_P_VED_I (ctx : FormalContext) : Prop := ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx))) → ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ Derived_Text_cierre_no_estable ctx))
def DeductiveNode_P_VED_E_2 (ctx : FormalContext) : Prop := ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx))) → ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → (((ctx.rho = 0) ↔ Derived_Text_estado_estable ctx))
def DeductiveNode_P_RIM_S (ctx : FormalContext) : Prop := (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0))))
def DeductiveNode_P_a (ctx : FormalContext) : Prop := ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → ((ctx.Derivative_t (ctx.DerivativeSubject_s) = ctx.v)) → (((ctx.Derivative_t (ctx.Derivative_t (ctx.DerivativeSubject_s)) = ctx.Derivative_t (ctx.v)) ∧ (ctx.Derivative_t (ctx.v) = ctx.Derivative_t (ctx.v))))
def DeductiveNode_P_VED_K_E (ctx : FormalContext) : Prop := ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx))) → ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ Derived_Text_cierre_no_estable ctx)) → ((ctx.k ∈ {x : ℕ | 0 < x}) ∧ (ctx.rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho = 0)) ∧ (x = ((k, rho)))}))) → ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → ((((ctx.rho = 0)) → (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = ((k, 0)))}))))
def DeductiveNode_P_VR_rho (ctx : FormalContext) : Prop := (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))))))
def DeductiveNode_P_VR_E (ctx : FormalContext) : Prop := ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ Derived_Text_cierre_exacto_en_fase ctx)) ∧ (Derived_Text_cierre_exacto_en_fase ctx ↔ Derived_Text_estado_estable ctx))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → ((Derived_Text_estado_estable { ctx with rho := ctx.rho_VED } ↔ ((abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))) = 0)))
def DeductiveNode_P_Z (ctx : FormalContext) : Prop := (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → ((((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib)))) ∧ ((ctx.zeta ctx.s) = ctx.InfiniteSum_Nat_Complex (1) (fun n : ℕ => ((1 : ℂ) / ctx.Pow_Complex ((n : ℂ)) (ctx.s) : ℂ))) ∧ (ctx.s = 1) ∧ (ctx.Z_Rim_triv = ({x | ∃ m : ℕ, (m ∈ {x : ℕ | 0 < x}) ∧ (x = ((-2 * (m : ℤ))))})) ∧ (ctx.Z_Rim_nt = ({z | ((z ∈ (Set.univ : Set ℂ)) ∧ ((ctx.zeta z) = 0)) ∧ ((0 < (Complex.re z)) ∧ ((Complex.re z) < 1))})) ∧ ((((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib)))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED))))
def DeductiveNode_P_VED_R_C (ctx : FormalContext) : Prop := ((((ctx.rho = 0)) → (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = ((k, 0)))})))) → ((ctx.U_VED_cerrado = ({x | ∃ k : ℕ, ∃ rho : ℝ, ((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (x = ((k, rho)))})) ∧ (ctx.mathcal_I_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho > 0)) ∧ (x = ((k, rho)))}))) → ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → (((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))))
def DeductiveNode_T_RIEMANN (ctx : FormalContext) : Prop := (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((Derived_Stable_Rim ctx z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → ((((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib)))) ∧ ((ctx.zeta ctx.s) = ctx.InfiniteSum_Nat_Complex (1) (fun n : ℕ => ((1 : ℂ) / ctx.Pow_Complex ((n : ℂ)) (ctx.s) : ℂ))) ∧ (ctx.s = 1) ∧ (ctx.Z_Rim_triv = ({x | ∃ m : ℕ, (m ∈ {x : ℕ | 0 < x}) ∧ (x = ((-2 * (m : ℤ))))})) ∧ (ctx.Z_Rim_nt = ({z | ((z ∈ (Set.univ : Set ℂ)) ∧ ((ctx.zeta z) = 0)) ∧ ((0 < (Complex.re z)) ∧ ((Complex.re z) < 1))})) ∧ ((((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib)))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → ((Complex.re z) = ((1 : ℝ) / (2 : ℝ)))))
def DeductiveNode_P_VED_Completo (ctx : FormalContext) : Prop := ((ctx.U_VED_cerrado = ({x | ∃ k : ℕ, ∃ rho : ℝ, ((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (x = ((k, rho)))})) ∧ (ctx.mathcal_I_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho > 0)) ∧ (x = ((k, rho)))}))) → (((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) → ((ctx.k ∈ {x : ℕ | 0 < x}) ∧ (ctx.rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, ∃ rho : ℝ, (((k ∈ {x : ℕ | 0 < x}) ∧ (rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))) ∧ (rho = 0)) ∧ (x = ((k, rho)))}))) → ((ctx.U_VED_cerrado = (ctx.mathcal_E_VED ∪ ctx.mathcal_I_VED)))
def DeductiveNode_P_VS (ctx : FormalContext) : Prop := (((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) → ((ctx.U_VED_cerrado = (ctx.mathcal_E_VED ∪ ctx.mathcal_I_VED))) → ((ctx.tilde_N = (ctx.R_VED * ctx.R_Sch)) ∧ (ctx.R_Sch = (ctx.tilde_N / ctx.R_VED)) ∧ (ctx.R_VED = (ctx.tilde_N / ctx.R_Sch)) ∧ ((ctx.Phi_tilde_N_fn_1 ctx.R_VED = ctx.tilde_N / ctx.R_VED)) ∧ (Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))) → ((Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch))))
def DeductiveNode_P_F (ctx : FormalContext) : Prop := ((ctx.tilde_N = (ctx.R_VED * ctx.R_Sch)) ∧ (ctx.R_Sch = (ctx.tilde_N / ctx.R_VED)) ∧ (ctx.R_VED = (ctx.tilde_N / ctx.R_Sch)) ∧ ((ctx.Phi_tilde_N_fn_1 ctx.R_VED = ctx.tilde_N / ctx.R_VED)) ∧ (Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))) → ((Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → ((ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime)))))
def DeductiveNode_P_F1 (ctx : FormalContext) : Prop := ((Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → ((ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime)))))
def DeductiveNode_P_W (ctx : FormalContext) : Prop := ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → ((ctx.v_onda = ctx.c))
def DeductiveNode_P_F2 (ctx : FormalContext) : Prop := ((ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt))))
def DeductiveNode_P_F3 (ctx : FormalContext) : Prop := ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt)))))
def DeductiveNode_D_Lap (ctx : FormalContext) : Prop := ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))) → ((ctx.E = (ctx.hc / ctx.lambda)) ∧ (ctx.E = ctx.Mc ^ 2) ∧ (ctx.Mc ^ 2 = (ctx.hc / ctx.lambda)) ∧ (ctx.lambda = (ctx.h / ctx.Mc))) → ((ctx.rho = (Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → ((((ctx.s_PM) = ((ctx.a + ctx.ib)) ∨ (ctx.s_PM) = ((ctx.a - ctx.ib)))) ∧ (ctx.a = ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.Pow_Real (ctx.e) (ctx.ibT)) = (1) ∨ (ctx.Pow_Real (ctx.e) (-ctx.ibT)) = (1))) ∧ (ctx.bT = ((2 : ℝ) * Real.pi)) ∧ (((ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) + ctx.rho) * ctx.lambda))) ∨ (ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))) ∧ (ctx.rho = 0) ∧ (ctx.b_k = (((2 : ℝ) * Real.pi) / ((ctx.k : ℝ) * ctx.lambda))) ∧ (ctx.Z_VED_to_Lap = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))) ∨ x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))))})))
def DeductiveNode_P_F3_2 (ctx : FormalContext) : Prop := ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))) → ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt)))))
def DeductiveNode_P_Lap_Z (ctx : FormalContext) : Prop := ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))) → ((((ctx.s_PM) = ((ctx.a + ctx.ib)) ∨ (ctx.s_PM) = ((ctx.a - ctx.ib)))) ∧ (ctx.a = ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.Pow_Real (ctx.e) (ctx.ibT)) = (1) ∨ (ctx.Pow_Real (ctx.e) (-ctx.ibT)) = (1))) ∧ (ctx.bT = ((2 : ℝ) * Real.pi)) ∧ (((ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) + ctx.rho) * ctx.lambda))) ∨ (ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))) ∧ (ctx.rho = 0) ∧ (ctx.b_k = (((2 : ℝ) * Real.pi) / ((ctx.k : ℝ) * ctx.lambda))) ∧ (ctx.Z_VED_to_Lap = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))) ∨ x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))))}))) → ((ctx.Z_VED_to_Lap ⊆ ({s | (Complex.re s) = ((1 : ℝ) / (2 : ℝ))})))
def DeductiveNode_P_Lap_Z_2 (ctx : FormalContext) : Prop := ((ctx.Z_VED_to_Lap ⊆ ({s | (Complex.re s) = ((1 : ℝ) / (2 : ℝ))}))) → ((((ctx.s_PM) = ((ctx.a + ctx.ib)) ∨ (ctx.s_PM) = ((ctx.a - ctx.ib)))) ∧ (ctx.a = ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.Pow_Real (ctx.e) (ctx.ibT)) = (1) ∨ (ctx.Pow_Real (ctx.e) (-ctx.ibT)) = (1))) ∧ (ctx.bT = ((2 : ℝ) * Real.pi)) ∧ (((ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) + ctx.rho) * ctx.lambda))) ∨ (ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))) ∧ (ctx.rho = 0) ∧ (ctx.b_k = (((2 : ℝ) * Real.pi) / ((ctx.k : ℝ) * ctx.lambda))) ∧ (ctx.Z_VED_to_Lap = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))) ∨ x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))))}))) → ((ctx.Z_VED_to_Lap ⊆ ({s | (Complex.re s) = ((1 : ℝ) / (2 : ℝ))})))
end ES_46_RV6

-- DEMUESTRA_AUDIT_BEGIN
-- DEMUESTRA_CONSTRUCTION_COMPLETE: TRUE
-- DEMUESTRA_DEDUCTIVE_COVERAGE_COMPLETE: TRUE
-- DEMUESTRA_PROOF_COMPLETE: FALSE
-- DEMUESTRA_FORMALIZATION_STATUS: PARTIAL
-- DEMUESTRA_JSON_NODE: T_RIEMANN
-- DEMUESTRA_AUDIT_END
