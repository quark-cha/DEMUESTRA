-- GENERADO_POR: C:\Users\vedq\Desktop\desarrollo\SRC-VED\DEMUESTRA\vendor\PUBLICAR\PackPublica\formal_lean_backend.py
-- FECHA_HORA_GENERACION: 2026-09-28T23:51:19+02:00
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
  R_rho_fn_1 : ℝ → ℝ
  R_rho_inv : ℝ
  R_rho_inv_fn_1 : ℝ → ℝ
  Representation_U_VED_L__R_VED : Representation
  Representation_U_VED_R_VED : Representation
  Representation_U_VED_cerrada__abierta : Representation
  Representation_U_VED_onda : Representation
  Rim : ℝ
  S : ℝ
  Sch : ℝ
  Stable : ℝ
  Stable_Rim : ℝ
  Stable_Rim_fn_1 : ℂ → Prop
  T : ℝ
  T_fn_2 : ℕ → ℝ → ℝ
  TendsTo : ℝ → ℝ → Prop
  Text_Lorentz : Prop
  Text_abierta : Prop
  Text_cerrada : Prop
  Text_cierre_exacto_en_fase : Prop
  Text_cierre_no_estable : Prop
  Text_clase_estable : Prop
  Text_clase_no_estable : Prop
  Text_estado_estable : Prop
  Text_estado_no_estable : Prop
  Text_onda : Prop
  Text_onda_abierta_o_libre : Prop
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
  U_VED_cerrado : Set (ℕ × ℕ)
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
  dist : ℝ
  dist_fn_2 : ℝ → Set (ℕ) → ℝ
  ds : ℝ
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
  k : ℕ
  lambda : ℝ
  ldots : ℝ
  m : ℕ
  mathcal_E : ℝ
  mathcal_E_VED : Set (ℕ × ℕ)
  mathcal_I : ℝ
  mathcal_I_VED : Set (ℕ × ℕ)
  n : ℝ
  nt : ℝ
  onda : ℝ
  rho : ℝ
  rho_1 : ℝ
  rho_2 : ℝ
  rho_R : ℝ
  rho_R_fn_1 : ℂ → ℝ
  rho_VED : ℝ
  rho_VED_fn_1 : ℝ → ℝ
  s : ℂ
  s_PM : ℝ
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

-- FORMAL_NODE: D_U
-- SOURCE: ES_46_RV6.md:29
-- FORMULA: \boxed{ U=3S+T. }
def Node_D_U_source_1_raw : String := "\\boxed{ U=3S+T. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_U", "formula": 1, "location": "ES_46_RV6.md:29:D_U:formula-1", "source": "\\boxed{ U=3S+T. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_U_source_1 (ctx : FormalContext) : Prop := (ctx.U = (((3 : ℝ) * ctx.S) + ctx.T))
def Node_D_U_source_declarations (ctx : FormalContext) : Prop := (Node_D_U_source_1 ctx)
def Node_D_U (ctx : FormalContext) : Prop := (ctx.U = (((3 : ℝ) * ctx.S) + ctx.T))
-- DEMUESTRA_ASSERTION: D_U|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_t_prime
-- SOURCE: ES_46_RV6.md:65
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
-- FORMULA: \boxed{ L=n\lambda. }
-- FORMULA: n\in\mathbb R^+.
-- FORMULA: L
def Node_D_L_source_1_raw : String := "\\boxed{ L=n\\lambda. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_L", "formula": 1, "location": "ES_46_RV6.md:202:D_L:formula-1", "source": "\\boxed{ L=n\\lambda. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_L_source_1 (ctx : FormalContext) : Prop := (ctx.L = (ctx.n * ctx.lambda))
def Node_D_L_source_2_raw : String := "n\\in\\mathbb R^+."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_L", "formula": 2, "location": "ES_46_RV6.md:202:D_L:formula-2", "source": "n\\in\\mathbb R^+.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_L_source_2 (ctx : FormalContext) : Prop := (ctx.n ∈ {x : ℝ | 0 < x})
def Node_D_L_source_3_raw : String := "L"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_L", "formula": 3, "location": "ES_46_RV6.md:202:D_L:formula-3", "source": "L", "status": "FORMALIZED_TERM", "type": "Function[Nat,Real,Real]", "role": "STATEMENT"}
def Node_D_L_source_3_term (ctx : FormalContext) : ℕ → ℝ → ℝ := (ctx.L_fn_2)
def Node_D_L_source_declarations (ctx : FormalContext) : Prop := (Node_D_L_source_1 ctx) ∧ (Node_D_L_source_2 ctx)
def Node_D_L_clause_1 (ctx : FormalContext) : Prop := (ctx.L = (ctx.n * ctx.lambda))
def Node_D_L_clause_2 (ctx : FormalContext) : Prop := (ctx.n ∈ {x : ℝ | 0 < x})
def Node_D_L (ctx : FormalContext) : Prop := (ctx.L = (ctx.n * ctx.lambda)) ∧ (ctx.n ∈ {x : ℝ | 0 < x})
-- DEMUESTRA_ASSERTION: D_L|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_R_VED
-- SOURCE: ES_46_RV6.md:220
-- FORMULA: 2\pi R_{\rm VED}=L.
-- FORMULA: \boxed{ R_{\rm VED} = \frac{L}{2\pi} = \frac{n\lambda}{2\pi}. }
-- FORMULA: \boxed{ U_{\rm VED}(\text{onda}) = U_{\rm VED}(\text{cerrada},\text{abierta}) = U_{\rm VED}(R_{\rm VED}) = U_{\rm VED}(L,R_{\rm VED}). }
-- FORMULA: U_{\rm VED}
-- FORMULA: L
-- FORMULA: 3S+T
-- FORMULA: L
def Node_D_R_VED_source_1_raw : String := "2\\pi R_{\\rm VED}=L."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_R_VED", "formula": 1, "location": "ES_46_RV6.md:220:D_R_VED:formula-1", "source": "2\\pi R_{\\rm VED}=L.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_R_VED_source_1 (ctx : FormalContext) : Prop := ((((2 : ℝ) * Real.pi) * ctx.R_VED) = ctx.L)
def Node_D_R_VED_source_2_raw : String := "\\boxed{ R_{\\rm VED} = \\frac{L}{2\\pi} = \\frac{n\\lambda}{2\\pi}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_R_VED", "formula": 2, "location": "ES_46_RV6.md:220:D_R_VED:formula-2", "source": "\\boxed{ R_{\\rm VED} = \\frac{L}{2\\pi} = \\frac{n\\lambda}{2\\pi}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_R_VED_source_2 (ctx : FormalContext) : Prop := ((ctx.R_VED = (ctx.L / ((2 : ℝ) * Real.pi))) ∧ ((ctx.L / ((2 : ℝ) * Real.pi)) = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi))))
def Node_D_R_VED_source_3_raw : String := "\\boxed{ U_{\\rm VED}(\\text{onda}) = U_{\\rm VED}(\\text{cerrada},\\text{abierta}) = U_{\\rm VED}(R_{\\rm VED}) = U_{\\rm VED}(L,R_{\\rm VED}). }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_R_VED", "formula": 3, "location": "ES_46_RV6.md:220:D_R_VED:formula-3", "source": "\\boxed{ U_{\\rm VED}(\\text{onda}) = U_{\\rm VED}(\\text{cerrada},\\text{abierta}) = U_{\\rm VED}(R_{\\rm VED}) = U_{\\rm VED}(L,R_{\\rm VED}). }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_R_VED_source_3 (ctx : FormalContext) : Prop := (((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))
def Node_D_R_VED_source_4_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_R_VED", "formula": 4, "location": "ES_46_RV6.md:220:D_R_VED:formula-4", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "STATEMENT"}
def Node_D_R_VED_source_4_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_D_R_VED_source_5_raw : String := "L"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_R_VED", "formula": 5, "location": "ES_46_RV6.md:220:D_R_VED:formula-5", "source": "L", "status": "FORMALIZED_TERM", "type": "Function[Nat,Real,Real]", "role": "STATEMENT"}
def Node_D_R_VED_source_5_term (ctx : FormalContext) : ℕ → ℝ → ℝ := (ctx.L_fn_2)
def Node_D_R_VED_source_6_raw : String := "3S+T"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_R_VED", "formula": 6, "location": "ES_46_RV6.md:220:D_R_VED:formula-6", "source": "3S+T", "status": "FORMALIZED_TERM", "type": "Real", "role": "STATEMENT"}
def Node_D_R_VED_source_6_term (ctx : FormalContext) : ℝ := (((3 : ℝ) * ctx.S) + ctx.T)
def Node_D_R_VED_source_7_raw : String := "L"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_R_VED", "formula": 7, "location": "ES_46_RV6.md:220:D_R_VED:formula-7", "source": "L", "status": "FORMALIZED_TERM", "type": "Function[Nat,Real,Real]", "role": "STATEMENT"}
def Node_D_R_VED_source_7_term (ctx : FormalContext) : ℕ → ℝ → ℝ := (ctx.L_fn_2)
def Node_D_R_VED_source_declarations (ctx : FormalContext) : Prop := (Node_D_R_VED_source_1 ctx) ∧ (Node_D_R_VED_source_2 ctx) ∧ (Node_D_R_VED_source_3 ctx)
def Node_D_R_VED_clause_1 (ctx : FormalContext) : Prop := ((((2 : ℝ) * Real.pi) * ctx.R_VED) = ctx.L)
def Node_D_R_VED_clause_2 (ctx : FormalContext) : Prop := ((ctx.R_VED = (ctx.L / ((2 : ℝ) * Real.pi))) ∧ ((ctx.L / ((2 : ℝ) * Real.pi)) = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi))))
def Node_D_R_VED_clause_3 (ctx : FormalContext) : Prop := (((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))
def Node_D_R_VED (ctx : FormalContext) : Prop := ((((2 : ℝ) * Real.pi) * ctx.R_VED) = ctx.L) ∧ ((ctx.R_VED = (ctx.L / ((2 : ℝ) * Real.pi))) ∧ ((ctx.L / ((2 : ℝ) * Real.pi)) = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi)))) ∧ (((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))
-- DEMUESTRA_ASSERTION: D_R_VED|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_k
-- SOURCE: ES_46_RV6.md:314
-- FORMULA: k\in\mathbb N^+
def Node_D_k_source_1_raw : String := "k\\in\\mathbb N^+"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_k", "formula": 1, "location": "ES_46_RV6.md:314:D_k:formula-1", "source": "k\\in\\mathbb N^+", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_k_source_1 (ctx : FormalContext) : Prop := (ctx.k ∈ {x : ℕ | 0 < x})
def Node_D_k_source_declarations (ctx : FormalContext) : Prop := (Node_D_k_source_1 ctx)
def Node_D_k (ctx : FormalContext) : Prop := (ctx.k ∈ {x : ℕ | 0 < x})
-- DEMUESTRA_ASSERTION: D_k|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_rho
-- SOURCE: ES_46_RV6.md:316
-- FORMULA: \boxed{ \rho = \operatorname{dist}(n,\mathbb N^+). }
-- FORMULA: \boxed{ 0\le\rho\le\frac12. }
-- FORMULA: \boxed{ n=k\pm\rho, \qquad k\in\mathbb N^+, \qquad 0\le\rho\le\frac12. }
-- FORMULA: \boxed{ L(k,\rho) = (k\pm\rho)\lambda, }
-- FORMULA: \boxed{ R_{\rm VED}(k,\rho) = \frac{(k\pm\rho)\lambda}{2\pi}. }
-- FORMULA: \rho=1/2
def Node_D_rho_source_1_raw : String := "\\boxed{ \\rho = \\operatorname{dist}(n,\\mathbb N^+). }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho", "formula": 1, "location": "ES_46_RV6.md:316:D_rho:formula-1", "source": "\\boxed{ \\rho = \\operatorname{dist}(n,\\mathbb N^+). }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_source_1 (ctx : FormalContext) : Prop := (ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x}))
def Node_D_rho_source_2_raw : String := "\\boxed{ 0\\le\\rho\\le\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho", "formula": 2, "location": "ES_46_RV6.md:316:D_rho:formula-2", "source": "\\boxed{ 0\\le\\rho\\le\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_source_2 (ctx : FormalContext) : Prop := ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))
def Node_D_rho_source_3_raw : String := "\\boxed{ n=k\\pm\\rho, \\qquad k\\in\\mathbb N^+, \\qquad 0\\le\\rho\\le\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho", "formula": 3, "location": "ES_46_RV6.md:316:D_rho:formula-3", "source": "\\boxed{ n=k\\pm\\rho, \\qquad k\\in\\mathbb N^+, \\qquad 0\\le\\rho\\le\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_source_3 (ctx : FormalContext) : Prop := ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))))
def Node_D_rho_source_4_raw : String := "\\boxed{ L(k,\\rho) = (k\\pm\\rho)\\lambda, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho", "formula": 4, "location": "ES_46_RV6.md:316:D_rho:formula-4", "source": "\\boxed{ L(k,\\rho) = (k\\pm\\rho)\\lambda, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_source_4 (ctx : FormalContext) : Prop := (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))
def Node_D_rho_source_5_raw : String := "\\boxed{ R_{\\rm VED}(k,\\rho) = \\frac{(k\\pm\\rho)\\lambda}{2\\pi}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho", "formula": 5, "location": "ES_46_RV6.md:316:D_rho:formula-5", "source": "\\boxed{ R_{\\rm VED}(k,\\rho) = \\frac{(k\\pm\\rho)\\lambda}{2\\pi}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_source_5 (ctx : FormalContext) : Prop := (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))
def Node_D_rho_source_6_raw : String := "\\rho=1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho", "formula": 6, "location": "ES_46_RV6.md:316:D_rho:formula-6", "source": "\\rho=1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_rho_source_6 (ctx : FormalContext) : Prop := (ctx.rho = ((1 : ℝ) / (2 : ℝ)))
def Node_D_rho_source_declarations (ctx : FormalContext) : Prop := (Node_D_rho_source_1 ctx) ∧ (Node_D_rho_source_2 ctx) ∧ (Node_D_rho_source_3 ctx) ∧ (Node_D_rho_source_4 ctx) ∧ (Node_D_rho_source_5 ctx)
def Node_D_rho_source_steps (ctx : FormalContext) : Prop := (Node_D_rho_source_6 ctx)
def Node_D_rho_clause_1 (ctx : FormalContext) : Prop := (ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x}))
def Node_D_rho_clause_2 (ctx : FormalContext) : Prop := ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))
def Node_D_rho_clause_3 (ctx : FormalContext) : Prop := ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))))
def Node_D_rho_clause_4 (ctx : FormalContext) : Prop := (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))
def Node_D_rho_clause_5 (ctx : FormalContext) : Prop := (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))
def Node_D_rho (ctx : FormalContext) : Prop := (ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))
-- DEMUESTRA_ASSERTION: D_rho|COMPLETA|NO_APLICA

-- FORMAL_NODE: A_7
-- SOURCE: ES_46_RV6.md:514
-- FORMULA: \boxed{ \tilde N = R_{\rm VED}R_{\rm Sch}. }
-- FORMULA: \boxed{ R_{\rm Sch} = \frac{\tilde N}{R_{\rm VED}}, }
-- FORMULA: \boxed{ R_{\rm VED} = \frac{\tilde N}{R_{\rm Sch}}. }
-- FORMULA: \Phi_{\tilde N}: R_{\rm VED} \mapsto \frac{\tilde N}{R_{\rm VED}}
-- FORMULA: U_{\rm VED}\leftrightarrow U_{\rm Sch}
-- DEMUESTRA_PROSE_CONTRACT: {"node": "A_7", "source": "biyectiva, continua y con inversa", "status": "FORMALIZED_PROP"}
def Node_A_7_source_1_raw : String := "\\boxed{ \\tilde N = R_{\\rm VED}R_{\\rm Sch}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "A_7", "formula": 1, "location": "ES_46_RV6.md:514:A_7:formula-1", "source": "\\boxed{ \\tilde N = R_{\\rm VED}R_{\\rm Sch}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_A_7_source_1 (ctx : FormalContext) : Prop := (ctx.tilde_N = (ctx.R_VED * ctx.R_Sch))
def Node_A_7_source_2_raw : String := "\\boxed{ R_{\\rm Sch} = \\frac{\\tilde N}{R_{\\rm VED}}, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "A_7", "formula": 2, "location": "ES_46_RV6.md:514:A_7:formula-2", "source": "\\boxed{ R_{\\rm Sch} = \\frac{\\tilde N}{R_{\\rm VED}}, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_A_7_source_2 (ctx : FormalContext) : Prop := (ctx.R_Sch = (ctx.tilde_N / ctx.R_VED))
def Node_A_7_source_3_raw : String := "\\boxed{ R_{\\rm VED} = \\frac{\\tilde N}{R_{\\rm Sch}}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "A_7", "formula": 3, "location": "ES_46_RV6.md:514:A_7:formula-3", "source": "\\boxed{ R_{\\rm VED} = \\frac{\\tilde N}{R_{\\rm Sch}}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_A_7_source_3 (ctx : FormalContext) : Prop := (ctx.R_VED = (ctx.tilde_N / ctx.R_Sch))
def Node_A_7_source_4_raw : String := "\\Phi_{\\tilde N}: R_{\\rm VED} \\mapsto \\frac{\\tilde N}{R_{\\rm VED}}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "A_7", "formula": 4, "location": "ES_46_RV6.md:514:A_7:formula-4", "source": "\\Phi_{\\tilde N}: R_{\\rm VED} \\mapsto \\frac{\\tilde N}{R_{\\rm VED}}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_A_7_source_4 (ctx : FormalContext) : Prop := ((ctx.Phi_tilde_N_fn_1 ctx.R_VED = ctx.tilde_N / ctx.R_VED))
def Node_A_7_source_5_raw : String := "U_{\\rm VED}\\leftrightarrow U_{\\rm Sch}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "A_7", "formula": 5, "location": "ES_46_RV6.md:514:A_7:formula-5", "source": "U_{\\rm VED}\\leftrightarrow U_{\\rm Sch}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
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
-- SOURCE: ES_46_RV6.md:912
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
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 1, "location": "ES_46_RV6.md:912:D_Rim:formula-1", "source": "z=a\\pm ib", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Rim_source_1 (ctx : FormalContext) : Prop := (((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib))))
def Node_D_Rim_source_2_raw : String := "\\zeta(s) = \\sum_{n=1}^{\\infty}\\frac1{n^s}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 2, "location": "ES_46_RV6.md:912:D_Rim:formula-2", "source": "\\zeta(s) = \\sum_{n=1}^{\\infty}\\frac1{n^s}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Rim_source_2 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.s) = ctx.InfiniteSum_Nat_Complex (1) (fun n : ℕ => ((1 : ℂ) / ctx.Pow_Complex ((n : ℂ)) (ctx.s) : ℂ)))
def Node_D_Rim_source_3_raw : String := "\\boxed{s=1.}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 3, "location": "ES_46_RV6.md:912:D_Rim:formula-3", "source": "\\boxed{s=1.}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Rim_source_3 (ctx : FormalContext) : Prop := (ctx.s = 1)
def Node_D_Rim_source_4_raw : String := "\\boxed{ Z_{\\rm Rim}^{\\rm triv} = \\{-2,-4,-6,\\ldots\\} = \\{-2m:m\\in\\mathbb N^+\\}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 4, "location": "ES_46_RV6.md:912:D_Rim:formula-4", "source": "\\boxed{ Z_{\\rm Rim}^{\\rm triv} = \\{-2,-4,-6,\\ldots\\} = \\{-2m:m\\in\\mathbb N^+\\}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Rim_source_4 (ctx : FormalContext) : Prop := (ctx.Z_Rim_triv = ({x | ∃ m : ℕ, (m ∈ {x : ℕ | 0 < x}) ∧ (x = ((-2 * (m : ℤ))))}))
def Node_D_Rim_source_5_raw : String := "\\boxed{ Z_{\\rm Rim}^{\\rm nt} = \\{ z\\in\\mathbb C: \\zeta(z)=0, \\; 0<\\Re(z)<1 \\}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 5, "location": "ES_46_RV6.md:912:D_Rim:formula-5", "source": "\\boxed{ Z_{\\rm Rim}^{\\rm nt} = \\{ z\\in\\mathbb C: \\zeta(z)=0, \\; 0<\\Re(z)<1 \\}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Rim_source_5 (ctx : FormalContext) : Prop := (ctx.Z_Rim_nt = ({z | ((z ∈ (Set.univ : Set ℂ)) ∧ ((ctx.zeta z) = 0)) ∧ ((0 < (Complex.re z)) ∧ ((Complex.re z) < 1))}))
def Node_D_Rim_source_6_raw : String := "\\boxed{ z=a\\pm ib, \\qquad 0<a<1. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 6, "location": "ES_46_RV6.md:912:D_Rim:formula-6", "source": "\\boxed{ z=a\\pm ib, \\qquad 0<a<1. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Rim_source_6 (ctx : FormalContext) : Prop := ((((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib)))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)))
def Node_D_Rim_source_7_raw : String := "a \\longleftrightarrow 1-a."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 7, "location": "ES_46_RV6.md:912:D_Rim:formula-7", "source": "a \\longleftrightarrow 1-a.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_Rim_source_7 (ctx : FormalContext) : Prop := (ctx.Corresponds_Real_to_Real ctx.a ((1 : ℝ) - ctx.a))
def Node_D_Rim_source_8_raw : String := "\\boxed{ a=\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 8, "location": "ES_46_RV6.md:912:D_Rim:formula-8", "source": "\\boxed{ a=\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "CONTEXTUAL_RESULT"}
def Node_D_Rim_source_8 (ctx : FormalContext) : Prop := (ctx.a = ((1 : ℝ) / (2 : ℝ)))
def Node_D_Rim_source_9_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 9, "location": "ES_46_RV6.md:912:D_Rim:formula-9", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "STATEMENT"}
def Node_D_Rim_source_9_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_D_Rim_source_10_raw : String := "\\Re(s)>1"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Rim", "formula": 10, "location": "ES_46_RV6.md:912:D_Rim:formula-10", "source": "\\Re(s)>1", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
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
-- SOURCE: ES_46_RV6.md:1003
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
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 1, "location": "ES_46_RV6.md:1003:D_rho_R:formula-1", "source": "\\boxed{ D_{\\rho_R}: \\qquad \\rho_R = \\left| a-\\frac12 \\right|. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_R_source_1 (ctx : FormalContext) : Prop := (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))))
def Node_D_rho_R_source_2_raw : String := "0<a<1,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 2, "location": "ES_46_RV6.md:1003:D_rho_R:formula-2", "source": "0<a<1,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_R_source_2 (ctx : FormalContext) : Prop := ((0 < ctx.a) ∧ (ctx.a < 1))
def Node_D_rho_R_source_3_raw : String := "\\boxed{ 0\\le\\rho_R<\\frac12, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 3, "location": "ES_46_RV6.md:1003:D_rho_R:formula-3", "source": "\\boxed{ 0\\le\\rho_R<\\frac12, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_R_source_3 (ctx : FormalContext) : Prop := ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ))))
def Node_D_rho_R_source_4_raw : String := "\\boxed{ a = \\frac12+\\varepsilon\\rho_R. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 4, "location": "ES_46_RV6.md:1003:D_rho_R:formula-4", "source": "\\boxed{ a = \\frac12+\\varepsilon\\rho_R. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_R_source_4 (ctx : FormalContext) : Prop := (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)))
def Node_D_rho_R_source_5_raw : String := "\\boxed{ z_{\\varepsilon,\\pm} = \\frac12 + \\varepsilon\\rho_R \\pm ib. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 5, "location": "ES_46_RV6.md:1003:D_rho_R:formula-5", "source": "\\boxed{ z_{\\varepsilon,\\pm} = \\frac12 + \\varepsilon\\rho_R \\pm ib. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_R_source_5 (ctx : FormalContext) : Prop := (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib))))
def Node_D_rho_R_source_6_raw : String := "\\boxed{ \\rho_R = \\left| \\Re(z)-\\frac12 \\right|. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 6, "location": "ES_46_RV6.md:1003:D_rho_R:formula-6", "source": "\\boxed{ \\rho_R = \\left| \\Re(z)-\\frac12 \\right|. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_rho_R_source_6 (ctx : FormalContext) : Prop := (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))
def Node_D_rho_R_source_7_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 7, "location": "ES_46_RV6.md:1003:D_rho_R:formula-7", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "STATEMENT"}
def Node_D_rho_R_source_7_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_D_rho_R_source_8_raw : String := "\\rho_R=1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 8, "location": "ES_46_RV6.md:1003:D_rho_R:formula-8", "source": "\\rho_R=1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_rho_R_source_8 (ctx : FormalContext) : Prop := (ctx.rho_R = ((1 : ℝ) / (2 : ℝ)))
def Node_D_rho_R_source_9_raw : String := "\\varepsilon=\\pm1"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_rho_R", "formula": 9, "location": "ES_46_RV6.md:1003:D_rho_R:formula-9", "source": "\\varepsilon=\\pm1", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
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
-- SOURCE: ES_46_RV6.md:1072
-- FORMULA: U_{\rm VED}^{\rho} = \left\{x:\rho_{\rm VED}(x)\in[0,\tfrac12]\right\}
-- FORMULA: U_{\rm Rim}^{\rho} = \left\{z:\rho_R(z)\in[0,\tfrac12]\right\}.
-- FORMULA: \boxed{ f:U_{\rm VED}^{\rho}\longrightarrow U_{\rm Rim}^{\rho} }
-- FORMULA: \rho
-- FORMULA: a=\Re(z)
-- FORMULA: a=1/2
def Node_D_f_source_1_raw : String := "U_{\\rm VED}^{\\rho} = \\left\\{x:\\rho_{\\rm VED}(x)\\in[0,\\tfrac12]\\right\\}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_f", "formula": 1, "location": "ES_46_RV6.md:1072:D_f:formula-1", "source": "U_{\\rm VED}^{\\rho} = \\left\\{x:\\rho_{\\rm VED}(x)\\in[0,\\tfrac12]\\right\\}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_f_source_1 (ctx : FormalContext) : Prop := (ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))}))
def Node_D_f_source_2_raw : String := "U_{\\rm Rim}^{\\rho} = \\left\\{z:\\rho_R(z)\\in[0,\\tfrac12]\\right\\}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_f", "formula": 2, "location": "ES_46_RV6.md:1072:D_f:formula-2", "source": "U_{\\rm Rim}^{\\rho} = \\left\\{z:\\rho_R(z)\\in[0,\\tfrac12]\\right\\}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_f_source_2 (ctx : FormalContext) : Prop := (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))}))
def Node_D_f_source_3_raw : String := "\\boxed{ f:U_{\\rm VED}^{\\rho}\\longrightarrow U_{\\rm Rim}^{\\rho} }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_f", "formula": 3, "location": "ES_46_RV6.md:1072:D_f:formula-3", "source": "\\boxed{ f:U_{\\rm VED}^{\\rho}\\longrightarrow U_{\\rm Rim}^{\\rho} }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_f_source_3 (ctx : FormalContext) : Prop := (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate))
def Node_D_f_source_4_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_f", "formula": 4, "location": "ES_46_RV6.md:1072:D_f:formula-4", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "STATEMENT"}
def Node_D_f_source_4_term (ctx : FormalContext) : ℝ := (ctx.rho)
def Node_D_f_source_5_raw : String := "a=\\Re(z)"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_f", "formula": 5, "location": "ES_46_RV6.md:1072:D_f:formula-5", "source": "a=\\Re(z)", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_f_source_5 (ctx : FormalContext) : Prop := (ctx.a = (Complex.re ctx.z))
def Node_D_f_source_6_raw : String := "a=1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_f", "formula": 6, "location": "ES_46_RV6.md:1072:D_f:formula-6", "source": "a=1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
def Node_D_f_source_6 (ctx : FormalContext) : Prop := (ctx.a = ((1 : ℝ) / (2 : ℝ)))
def Node_D_f_source_declarations (ctx : FormalContext) : Prop := (Node_D_f_source_1 ctx) ∧ (Node_D_f_source_2 ctx) ∧ (Node_D_f_source_3 ctx)
def Node_D_f_source_steps (ctx : FormalContext) : Prop := (Node_D_f_source_5 ctx) ∧ (Node_D_f_source_6 ctx)
def Node_D_f_clause_1 (ctx : FormalContext) : Prop := (ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))}))
def Node_D_f_clause_2 (ctx : FormalContext) : Prop := (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))}))
def Node_D_f_clause_3 (ctx : FormalContext) : Prop := (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate))
def Node_D_f (ctx : FormalContext) : Prop := (ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate))
-- DEMUESTRA_ASSERTION: D_f|COMPLETA|NO_APLICA

-- FORMAL_NODE: D_fInv
-- SOURCE: ES_46_RV6.md:1100
-- FORMULA: \boxed{ f^{-1}:U_{\rm Rim}^{\rho}\longrightarrow U_{\rm VED}^{\rho}. }
-- FORMULA: \boxed{ f^{-1}(f(x))=x, \qquad f(f^{-1}(z))=z. }
def Node_D_fInv_source_1_raw : String := "\\boxed{ f^{-1}:U_{\\rm Rim}^{\\rho}\\longrightarrow U_{\\rm VED}^{\\rho}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_fInv", "formula": 1, "location": "ES_46_RV6.md:1100:D_fInv:formula-1", "source": "\\boxed{ f^{-1}:U_{\\rm Rim}^{\\rho}\\longrightarrow U_{\\rm VED}^{\\rho}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_fInv_source_1 (ctx : FormalContext) : Prop := ((∀ x_map : ℂ, x_map ∈ ctx.U_Rim_rho → (ctx.f_inv_fn_1 x_map) ∈ ctx.U_VED_rho))
def Node_D_fInv_source_2_raw : String := "\\boxed{ f^{-1}(f(x))=x, \\qquad f(f^{-1}(z))=z. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_fInv", "formula": 2, "location": "ES_46_RV6.md:1100:D_fInv:formula-2", "source": "\\boxed{ f^{-1}(f(x))=x, \\qquad f(f^{-1}(z))=z. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_fInv_source_2 (ctx : FormalContext) : Prop := ((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.f_inv_fn_1 (ctx.f_fn_1 x_all)) = x_all)) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.f_fn_1 (ctx.f_inv_fn_1 z_all)) = z_all)))
def Node_D_fInv_source_declarations (ctx : FormalContext) : Prop := (Node_D_fInv_source_1 ctx) ∧ (Node_D_fInv_source_2 ctx)
def Node_D_fInv_clause_1 (ctx : FormalContext) : Prop := ((∀ x_map : ℂ, x_map ∈ ctx.U_Rim_rho → (ctx.f_inv_fn_1 x_map) ∈ ctx.U_VED_rho))
def Node_D_fInv_clause_2 (ctx : FormalContext) : Prop := ((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.f_inv_fn_1 (ctx.f_fn_1 x_all)) = x_all)) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.f_fn_1 (ctx.f_inv_fn_1 z_all)) = z_all)))
def Node_D_fInv (ctx : FormalContext) : Prop := ((∀ x_map : ℂ, x_map ∈ ctx.U_Rim_rho → (ctx.f_inv_fn_1 x_map) ∈ ctx.U_VED_rho)) ∧ ((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.f_inv_fn_1 (ctx.f_fn_1 x_all)) = x_all)) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.f_fn_1 (ctx.f_inv_fn_1 z_all)) = z_all)))
-- DEMUESTRA_ASSERTION: D_fInv|COMPLETA|NO_APLICA

-- FORMAL_NODE: P_COORD
-- SOURCE: ES_46_RV6.md:57
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
-- SOURCE: ES_46_RV6.md:254
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
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 1, "location": "ES_46_RV6.md:254:P_VED_Inv:formula-1", "source": "L=n\\lambda<\\infty,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_1 (ctx : FormalContext) : Prop := ((ctx.L = (ctx.n * ctx.lambda)) ∧ ¬(ctx.DivergesToInfinity (ctx.n * ctx.lambda)))
def Node_P_VED_Inv_source_2_raw : String := "\\boxed{ n\\to\\infty. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 2, "location": "ES_46_RV6.md:254:P_VED_Inv:formula-2", "source": "\\boxed{ n\\to\\infty. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_2 (ctx : FormalContext) : Prop := (ctx.DivergesToInfinity (ctx.n))
def Node_P_VED_Inv_source_3_raw : String := "L\\to\\infty,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 3, "location": "ES_46_RV6.md:254:P_VED_Inv:formula-3", "source": "L\\to\\infty,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_3 (ctx : FormalContext) : Prop := (ctx.DivergesToInfinity (ctx.L))
def Node_P_VED_Inv_source_4_raw : String := "R_{\\rm VED}\\to\\infty."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 4, "location": "ES_46_RV6.md:254:P_VED_Inv:formula-4", "source": "R_{\\rm VED}\\to\\infty.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_4 (ctx : FormalContext) : Prop := (ctx.DivergesToInfinity (ctx.R_VED))
def Node_P_VED_Inv_source_5_raw : String := "\\boxed{ n\\to\\infty \\iff L\\to\\infty \\iff R_{\\rm VED}\\to\\infty \\iff \\text{onda abierta o libre}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 5, "location": "ES_46_RV6.md:254:P_VED_Inv:formula-5", "source": "\\boxed{ n\\to\\infty \\iff L\\to\\infty \\iff R_{\\rm VED}\\to\\infty \\iff \\text{onda abierta o libre}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_5 (ctx : FormalContext) : Prop := ((((ctx.DivergesToInfinity (ctx.n)) ↔ (ctx.DivergesToInfinity (ctx.L))) ∧ ((ctx.DivergesToInfinity (ctx.L)) ↔ (ctx.DivergesToInfinity (ctx.R_VED)))) ∧ ((ctx.DivergesToInfinity (ctx.R_VED)) ↔ ctx.Text_onda_abierta_o_libre))
def Node_P_VED_Inv_source_6_raw : String := "L"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 6, "location": "ES_46_RV6.md:254:P_VED_Inv:formula-6", "source": "L", "status": "FORMALIZED_TERM", "type": "Function[Nat,Real,Real]", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_6_term (ctx : FormalContext) : ℕ → ℝ → ℝ := (ctx.L_fn_2)
def Node_P_VED_Inv_source_7_raw : String := "\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 7, "location": "ES_46_RV6.md:254:P_VED_Inv:formula-7", "source": "\\lambda", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_7_term (ctx : FormalContext) : ℝ := (ctx.lambda)
def Node_P_VED_Inv_source_8_raw : String := "n"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 8, "location": "ES_46_RV6.md:254:P_VED_Inv:formula-8", "source": "n", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_8_term (ctx : FormalContext) : ℝ := (ctx.n)
def Node_P_VED_Inv_source_9_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 9, "location": "ES_46_RV6.md:254:P_VED_Inv:formula-9", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_9_term (ctx : FormalContext) : ℝ := (ctx.rho)
def Node_P_VED_Inv_source_10_raw : String := "n"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 10, "location": "ES_46_RV6.md:254:P_VED_Inv:formula-10", "source": "n", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_10_term (ctx : FormalContext) : ℝ := (ctx.n)
def Node_P_VED_Inv_source_11_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 11, "location": "ES_46_RV6.md:254:P_VED_Inv:formula-11", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "PROOF_STEP"}
def Node_P_VED_Inv_source_11_term (ctx : FormalContext) : ℕ := (ctx.k)
def Node_P_VED_Inv_source_12_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Inv", "formula": 12, "location": "ES_46_RV6.md:254:P_VED_Inv:formula-12", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
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
-- SOURCE: ES_46_RV6.md:1118
-- FORMULA: \boxed{ U_{\rm VED}^{\rho}\cong U_{\rm Rim}^{\rho}. }
-- FORMULA: f
-- FORMULA: f^{-1}
-- FORMULA: \rho=0
-- FORMULA: 0<\rho\le1/2
def Node_T_ISO_source_1_raw : String := "\\boxed{ U_{\\rm VED}^{\\rho}\\cong U_{\\rm Rim}^{\\rho}. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "T_ISO", "formula": 1, "location": "ES_46_RV6.md:1118:T_ISO:formula-1", "source": "\\boxed{ U_{\\rm VED}^{\\rho}\\cong U_{\\rm Rim}^{\\rho}. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_T_ISO_source_1 (ctx : FormalContext) : Prop := ((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))
def Node_T_ISO_source_2_raw : String := "f"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_ISO", "formula": 2, "location": "ES_46_RV6.md:1118:T_ISO:formula-2", "source": "f", "status": "FORMALIZED_TERM", "type": "Function[Real,Complex]", "role": "PROOF_STEP"}
def Node_T_ISO_source_2_term (ctx : FormalContext) : ℝ → ℂ := (ctx.f_fn_1)
def Node_T_ISO_source_3_raw : String := "f^{-1}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_ISO", "formula": 3, "location": "ES_46_RV6.md:1118:T_ISO:formula-3", "source": "f^{-1}", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_ISO_source_3_term (ctx : FormalContext) : ℝ := (ctx.f_inv)
def Node_T_ISO_source_4_raw : String := "\\rho=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_ISO", "formula": 4, "location": "ES_46_RV6.md:1118:T_ISO:formula-4", "source": "\\rho=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_ISO_source_4 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_T_ISO_source_5_raw : String := "0<\\rho\\le1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_ISO", "formula": 5, "location": "ES_46_RV6.md:1118:T_ISO:formula-5", "source": "0<\\rho\\le1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
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
-- SOURCE: ES_46_RV6.md:394
-- FORMULA: \rho=0,
-- FORMULA: n=k,
-- FORMULA: L=k\lambda.
-- FORMULA: \boxed{ P_{\rm VED}(E): \qquad \rho=0 \iff n=k\in\mathbb N^+ \iff L=k\lambda \iff \text{cierre exacto en fase} \iff \text{estado estable}. }
-- FORMULA: 0<\rho\le\frac12,
def Node_P_VED_E_source_1_raw : String := "\\rho=0,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 1, "location": "ES_46_RV6.md:394:P_VED_E:formula-1", "source": "\\rho=0,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_E_source_1 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_P_VED_E_source_2_raw : String := "n=k,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 2, "location": "ES_46_RV6.md:394:P_VED_E:formula-2", "source": "n=k,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_E_source_2 (ctx : FormalContext) : Prop := (ctx.n = ctx.k)
def Node_P_VED_E_source_3_raw : String := "L=k\\lambda."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 3, "location": "ES_46_RV6.md:394:P_VED_E:formula-3", "source": "L=k\\lambda.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_E_source_3 (ctx : FormalContext) : Prop := (ctx.L = ((ctx.k : ℝ) * ctx.lambda))
def Node_P_VED_E_source_4_raw : String := "\\boxed{ P_{\\rm VED}(E): \\qquad \\rho=0 \\iff n=k\\in\\mathbb N^+ \\iff L=k\\lambda \\iff \\text{cierre exacto en fase} \\iff \\text{estado estable}. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VED_E", "formula": 4, "location": "ES_46_RV6.md:394:P_VED_E:formula-4", "source": "\\boxed{ P_{\\rm VED}(E): \\qquad \\rho=0 \\iff n=k\\in\\mathbb N^+ \\iff L=k\\lambda \\iff \\text{cierre exacto en fase} \\iff \\text{estado estable}. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VED_E_source_4 (ctx : FormalContext) : Prop := (((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))
def Node_P_VED_E_source_5_raw : String := "0<\\rho\\le\\frac12,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_E", "formula": 5, "location": "ES_46_RV6.md:394:P_VED_E:formula-5", "source": "0<\\rho\\le\\frac12,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_E_source_5 (ctx : FormalContext) : Prop := ((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))
def Node_P_VED_E_source_steps (ctx : FormalContext) : Prop := (Node_P_VED_E_source_1 ctx) ∧ (Node_P_VED_E_source_2 ctx) ∧ (Node_P_VED_E_source_3 ctx) ∧ (Node_P_VED_E_source_5 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_E|1|PROOF_STEP|-|P_VED_Inv,D_k,D_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_E|2|PROOF_STEP|1|P_VED_Inv,D_k,D_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_E|3|PROOF_STEP|2|P_VED_Inv,D_k,D_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_E|4|CLAIM|3|P_VED_Inv,D_k,D_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_E|5|PROOF_STEP|4|P_VED_Inv,D_k,D_rho|NO_CERTIFICADO
-- DEMUESTRA_ASSERTION: P_VED_E|COMPLETA|NO_DETERMINADO

-- FORMAL_NODE: P_RHO_ISO
-- SOURCE: ES_46_RV6.md:1133
-- FORMULA: \boxed{ \rho_R(f(x))=\rho_{\rm VED}(x), \qquad \rho_{\rm VED}(f^{-1}(z))=\rho_R(z). }
-- FORMULA: \rho=0 \iff \text{clase estable},
-- FORMULA: 0<\rho\le\frac12 \iff \text{clase no estable}
-- FORMULA: \rho
-- FORMULA: f
-- FORMULA: f^{-1}
def Node_P_RHO_ISO_source_1_raw : String := "\\boxed{ \\rho_R(f(x))=\\rho_{\\rm VED}(x), \\qquad \\rho_{\\rm VED}(f^{-1}(z))=\\rho_R(z). }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_RHO_ISO", "formula": 1, "location": "ES_46_RV6.md:1133:P_RHO_ISO:formula-1", "source": "\\boxed{ \\rho_R(f(x))=\\rho_{\\rm VED}(x), \\qquad \\rho_{\\rm VED}(f^{-1}(z))=\\rho_R(z). }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_RHO_ISO_source_1 (ctx : FormalContext) : Prop := ((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))
def Node_P_RHO_ISO_source_2_raw : String := "\\rho=0 \\iff \\text{clase estable},"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RHO_ISO", "formula": 2, "location": "ES_46_RV6.md:1133:P_RHO_ISO:formula-2", "source": "\\rho=0 \\iff \\text{clase estable},", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_RHO_ISO_source_2 (ctx : FormalContext) : Prop := ((ctx.rho = 0) ↔ ctx.Text_clase_estable)
def Node_P_RHO_ISO_source_3_raw : String := "0<\\rho\\le\\frac12 \\iff \\text{clase no estable}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RHO_ISO", "formula": 3, "location": "ES_46_RV6.md:1133:P_RHO_ISO:formula-3", "source": "0<\\rho\\le\\frac12 \\iff \\text{clase no estable}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_RHO_ISO_source_3 (ctx : FormalContext) : Prop := (((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_clase_no_estable)
def Node_P_RHO_ISO_source_4_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RHO_ISO", "formula": 4, "location": "ES_46_RV6.md:1133:P_RHO_ISO:formula-4", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_RHO_ISO_source_4_term (ctx : FormalContext) : ℝ := (ctx.rho)
def Node_P_RHO_ISO_source_5_raw : String := "f"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RHO_ISO", "formula": 5, "location": "ES_46_RV6.md:1133:P_RHO_ISO:formula-5", "source": "f", "status": "FORMALIZED_TERM", "type": "Function[Real,Complex]", "role": "PROOF_STEP"}
def Node_P_RHO_ISO_source_5_term (ctx : FormalContext) : ℝ → ℂ := (ctx.f_fn_1)
def Node_P_RHO_ISO_source_6_raw : String := "f^{-1}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RHO_ISO", "formula": 6, "location": "ES_46_RV6.md:1133:P_RHO_ISO:formula-6", "source": "f^{-1}", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
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
-- SOURCE: ES_46_RV6.md:592
-- FORMULA: P_{\rm ST}: \qquad ds^2=dt^2-dt'^2.
-- FORMULA: t
def Node_P_ST_2_source_1_raw : String := "P_{\\rm ST}: \\qquad ds^2=dt^2-dt'^2."
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_ST_2", "formula": 1, "location": "ES_46_RV6.md:592:P_ST_2:formula-1", "source": "P_{\\rm ST}: \\qquad ds^2=dt^2-dt'^2.", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_ST_2_source_1 (ctx : FormalContext) : Prop := (ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))
def Node_P_ST_2_source_2_raw : String := "t"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_ST_2", "formula": 2, "location": "ES_46_RV6.md:592:P_ST_2:formula-2", "source": "t", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_ST_2_source_2_term (ctx : FormalContext) : ℝ := (ctx.t)
-- DEMUESTRA_DEDUCTIVE_LINK: P_ST_2|1|CLAIM|-|P_ST|NO_CERTIFICADO
theorem derive_P_ST_2 (ctx : FormalContext) (h_P_ST : ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2)))) : ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) := by
  exact h_P_ST
-- DEMUESTRA_ASSERTION: P_ST_2|COMPLETA|VERIFICADA_ESTRUCTURAL

-- FORMAL_NODE: P_VED_I
-- SOURCE: ES_46_RV6.md:418
-- FORMULA: \boxed{ P_{\rm VED}(I): \qquad 0<\rho\le\frac12 \iff \text{cierre no estable}. }
-- FORMULA: \boxed{ \rho=\frac12 }
def Node_P_VED_I_source_1_raw : String := "\\boxed{ P_{\\rm VED}(I): \\qquad 0<\\rho\\le\\frac12 \\iff \\text{cierre no estable}. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VED_I", "formula": 1, "location": "ES_46_RV6.md:418:P_VED_I:formula-1", "source": "\\boxed{ P_{\\rm VED}(I): \\qquad 0<\\rho\\le\\frac12 \\iff \\text{cierre no estable}. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VED_I_source_1 (ctx : FormalContext) : Prop := (((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_cierre_no_estable)
def Node_P_VED_I_source_2_raw : String := "\\boxed{ \\rho=\\frac12 }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_I", "formula": 2, "location": "ES_46_RV6.md:418:P_VED_I:formula-2", "source": "\\boxed{ \\rho=\\frac12 }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_I_source_2 (ctx : FormalContext) : Prop := (ctx.rho = ((1 : ℝ) / (2 : ℝ)))
def Node_P_VED_I_source_steps (ctx : FormalContext) : Prop := (Node_P_VED_I_source_2 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_I|1|CLAIM|-|D_k,D_rho,P_VED_E|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_I|2|PROOF_STEP|1|D_k,D_rho,P_VED_E|NO_CERTIFICADO
-- DEMUESTRA_ASSERTION: P_VED_I|COMPLETA|NO_DETERMINADO

-- FORMAL_NODE: P_VED_E_2
-- SOURCE: ES_46_RV6.md:866
-- FORMULA: P_{\rm VED}(E): \quad \rho=0 \iff \text{estado estable}.
def Node_P_VED_E_2_source_1_raw : String := "P_{\\rm VED}(E): \\quad \\rho=0 \\iff \\text{estado estable}."
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VED_E_2", "formula": 1, "location": "ES_46_RV6.md:866:P_VED_E_2:formula-1", "source": "P_{\\rm VED}(E): \\quad \\rho=0 \\iff \\text{estado estable}.", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VED_E_2_source_1 (ctx : FormalContext) : Prop := ((ctx.rho = 0) ↔ ctx.Text_estado_estable)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_E_2|1|CLAIM|-|P_VED_E|NO_CERTIFICADO
theorem derive_P_VED_E_2 (ctx : FormalContext) (h_P_VED_E : ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable)))) : (((ctx.rho = 0) ↔ ctx.Text_estado_estable)) := by
  rcases h_P_VED_E with ⟨⟨⟨h_document_1, h_document_2⟩, h_document_3⟩, h_document_4⟩
  exact h_document_1.trans (h_document_2.trans (h_document_3.trans (h_document_4)))
-- DEMUESTRA_ASSERTION: P_VED_E_2|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_RIM_S
-- SOURCE: ES_46_RV6.md:1169
-- FORMULA: \boxed{ \forall z\in U_{\rm Rim}, \qquad \operatorname{Stable}_{\rm Rim}(z) \iff \rho_R(z)=0. }
-- FORMULA: \boxed{ z\in Z_{\rm Rim}^{\rm nt} \Longrightarrow \operatorname{Stable}_{\rm Rim}(z) \Longrightarrow \rho_R(z)=0. }
-- FORMULA: \rho
-- FORMULA: f
-- FORMULA: f^{-1}
-- FORMULA: U_{\rm Rim}
-- FORMULA: \rho_R(z)\neq0
-- FORMULA: Z_{\rm Rim}^{\rm nt}
def Node_P_RIM_S_source_1_raw : String := "\\boxed{ \\forall z\\in U_{\\rm Rim}, \\qquad \\operatorname{Stable}_{\\rm Rim}(z) \\iff \\rho_R(z)=0. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_RIM_S", "formula": 1, "location": "ES_46_RV6.md:1169:P_RIM_S:formula-1", "source": "\\boxed{ \\forall z\\in U_{\\rm Rim}, \\qquad \\operatorname{Stable}_{\\rm Rim}(z) \\iff \\rho_R(z)=0. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_RIM_S_source_1 (ctx : FormalContext) : Prop := (∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))
def Node_P_RIM_S_source_2_raw : String := "\\boxed{ z\\in Z_{\\rm Rim}^{\\rm nt} \\Longrightarrow \\operatorname{Stable}_{\\rm Rim}(z) \\Longrightarrow \\rho_R(z)=0. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RIM_S", "formula": 2, "location": "ES_46_RV6.md:1169:P_RIM_S:formula-2", "source": "\\boxed{ z\\in Z_{\\rm Rim}^{\\rm nt} \\Longrightarrow \\operatorname{Stable}_{\\rm Rim}(z) \\Longrightarrow \\rho_R(z)=0. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_RIM_S_source_2 (ctx : FormalContext) : Prop := (∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → ((ctx.Stable_Rim_fn_1 z) → ((ctx.rho_R_fn_1 z) = 0)))
def Node_P_RIM_S_source_3_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RIM_S", "formula": 3, "location": "ES_46_RV6.md:1169:P_RIM_S:formula-3", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_RIM_S_source_3_term (ctx : FormalContext) : ℝ := (ctx.rho)
def Node_P_RIM_S_source_4_raw : String := "f"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RIM_S", "formula": 4, "location": "ES_46_RV6.md:1169:P_RIM_S:formula-4", "source": "f", "status": "FORMALIZED_TERM", "type": "Function[Real,Complex]", "role": "PROOF_STEP"}
def Node_P_RIM_S_source_4_term (ctx : FormalContext) : ℝ → ℂ := (ctx.f_fn_1)
def Node_P_RIM_S_source_5_raw : String := "f^{-1}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RIM_S", "formula": 5, "location": "ES_46_RV6.md:1169:P_RIM_S:formula-5", "source": "f^{-1}", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_RIM_S_source_5_term (ctx : FormalContext) : ℝ := (ctx.f_inv)
def Node_P_RIM_S_source_6_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RIM_S", "formula": 6, "location": "ES_46_RV6.md:1169:P_RIM_S:formula-6", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_P_RIM_S_source_6_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_P_RIM_S_source_7_raw : String := "\\rho_R(z)\\neq0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RIM_S", "formula": 7, "location": "ES_46_RV6.md:1169:P_RIM_S:formula-7", "source": "\\rho_R(z)\\neq0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_RIM_S_source_7 (ctx : FormalContext) : Prop := ((ctx.rho_R_fn_1 ctx.z) ≠ 0)
def Node_P_RIM_S_source_8_raw : String := "Z_{\\rm Rim}^{\\rm nt}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_RIM_S", "formula": 8, "location": "ES_46_RV6.md:1169:P_RIM_S:formula-8", "source": "Z_{\\rm Rim}^{\\rm nt}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_P_RIM_S_source_8_term (ctx : FormalContext) : Set (ℂ) := (ctx.Z_Rim_nt)
def Node_P_RIM_S_source_steps (ctx : FormalContext) : Prop := (Node_P_RIM_S_source_2 ctx) ∧ (Node_P_RIM_S_source_7 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_RIM_S|1|CLAIM|-|T_ISO,P_RHO_ISO|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_RIM_S|2|PROOF_STEP|1|T_ISO,P_RHO_ISO|NO_CERTIFICADO
-- DEMUESTRA_ASSERTION: P_RIM_S|COMPLETA|NO_DETERMINADO

-- FORMAL_NODE: P_a
-- SOURCE: ES_46_RV6.md:154
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
-- SOURCE: ES_46_RV6.md:462
-- FORMULA: k\in\mathbb N^+
-- FORMULA: \rho\in\left[0,\frac12\right]
-- FORMULA: n=k\pm\rho.
-- FORMULA: \boxed{ \mathcal E_{\rm VED} = \{(k,0):k\in\mathbb N^+\}. }
-- FORMULA: k=1,2,3,\ldots
-- FORMULA: U_{\rm VED}
-- FORMULA: n\in\mathbb R^+
-- FORMULA: \rho=0
def Node_P_VED_K_E_source_1_raw : String := "k\\in\\mathbb N^+"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 1, "location": "ES_46_RV6.md:462:P_VED_K_E:formula-1", "source": "k\\in\\mathbb N^+", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_1 (ctx : FormalContext) : Prop := (ctx.k ∈ {x : ℕ | 0 < x})
def Node_P_VED_K_E_source_2_raw : String := "\\rho\\in\\left[0,\\frac12\\right]"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 2, "location": "ES_46_RV6.md:462:P_VED_K_E:formula-2", "source": "\\rho\\in\\left[0,\\frac12\\right]", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_2 (ctx : FormalContext) : Prop := (ctx.rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))
def Node_P_VED_K_E_source_3_raw : String := "n=k\\pm\\rho."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 3, "location": "ES_46_RV6.md:462:P_VED_K_E:formula-3", "source": "n=k\\pm\\rho.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_3 (ctx : FormalContext) : Prop := (((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho))))
def Node_P_VED_K_E_source_4_raw : String := "\\boxed{ \\mathcal E_{\\rm VED} = \\{(k,0):k\\in\\mathbb N^+\\}. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VED_K_E", "formula": 4, "location": "ES_46_RV6.md:462:P_VED_K_E:formula-4", "source": "\\boxed{ \\mathcal E_{\\rm VED} = \\{(k,0):k\\in\\mathbb N^+\\}. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VED_K_E_source_4 (ctx : FormalContext) : Prop := (((ctx.rho = 0)) → (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = ((k, 0)))})))
def Node_P_VED_K_E_source_5_raw : String := "k=1,2,3,\\ldots"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 5, "location": "ES_46_RV6.md:462:P_VED_K_E:formula-5", "source": "k=1,2,3,\\ldots", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_5 (ctx : FormalContext) : Prop := (ctx.k ∈ {x : ℕ | 1 ≤ x})
def Node_P_VED_K_E_source_6_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 6, "location": "ES_46_RV6.md:462:P_VED_K_E:formula-6", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_6_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_VED_K_E_source_7_raw : String := "n\\in\\mathbb R^+"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 7, "location": "ES_46_RV6.md:462:P_VED_K_E:formula-7", "source": "n\\in\\mathbb R^+", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_7 (ctx : FormalContext) : Prop := (ctx.n ∈ {x : ℝ | 0 < x})
def Node_P_VED_K_E_source_8_raw : String := "\\rho=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E", "formula": 8, "location": "ES_46_RV6.md:462:P_VED_K_E:formula-8", "source": "\\rho=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_E_source_8 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_P_VED_K_E_source_steps (ctx : FormalContext) : Prop := (Node_P_VED_K_E_source_1 ctx) ∧ (Node_P_VED_K_E_source_2 ctx) ∧ (Node_P_VED_K_E_source_3 ctx) ∧ (Node_P_VED_K_E_source_5 ctx) ∧ (Node_P_VED_K_E_source_7 ctx) ∧ (Node_P_VED_K_E_source_8 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_K_E|1|PROOF_STEP|-|D_rho,P_VED_E,P_VED_I|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_K_E|2|PROOF_STEP|1|D_rho,P_VED_E,P_VED_I|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_K_E|3|PROOF_STEP|2|D_rho,P_VED_E,P_VED_I|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_K_E|4|CLAIM|3|D_rho,P_VED_E,P_VED_I|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_K_E|5|PROOF_STEP|4|D_rho,P_VED_E,P_VED_I|NO_CERTIFICADO
-- DEMUESTRA_ASSERTION: P_VED_K_E|COMPLETA|NO_DETERMINADO

-- FORMAL_NODE: P_VR_rho
-- SOURCE: ES_46_RV6.md:1272
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
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 1, "location": "ES_46_RV6.md:1272:P_VR_rho:formula-1", "source": "k+\\rho \\longleftrightarrow k-\\rho.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_1 (ctx : FormalContext) : Prop := (ctx.Corresponds_Real_to_Real ((ctx.k : ℝ) + ctx.rho) ((ctx.k : ℝ) - ctx.rho))
def Node_P_VR_rho_source_2_raw : String := "\\rho=0."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 2, "location": "ES_46_RV6.md:1272:P_VR_rho:formula-2", "source": "\\rho=0.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_2 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_P_VR_rho_source_3_raw : String := "\\frac12+\\rho_R \\longleftrightarrow \\frac12-\\rho_R."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 3, "location": "ES_46_RV6.md:1272:P_VR_rho:formula-3", "source": "\\frac12+\\rho_R \\longleftrightarrow \\frac12-\\rho_R.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_3 (ctx : FormalContext) : Prop := (ctx.Corresponds_Real_to_Real (((1 : ℝ) / (2 : ℝ)) + ctx.rho_R) (((1 : ℝ) / (2 : ℝ)) - ctx.rho_R))
def Node_P_VR_rho_source_4_raw : String := "\\rho_R=0."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 4, "location": "ES_46_RV6.md:1272:P_VR_rho:formula-4", "source": "\\rho_R=0.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_4 (ctx : FormalContext) : Prop := (ctx.rho_R = 0)
def Node_P_VR_rho_source_5_raw : String := "\\boxed{ R_\\rho: [0,\\tfrac12]_{\\rm VED} \\longrightarrow [0,\\tfrac12]_{\\rm Rim} }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 5, "location": "ES_46_RV6.md:1272:P_VR_rho:formula-5", "source": "\\boxed{ R_\\rho: [0,\\tfrac12]_{\\rm VED} \\longrightarrow [0,\\tfrac12]_{\\rm Rim} }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_5 (ctx : FormalContext) : Prop := ((∀ x_map : ℝ, x_map ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)) → (ctx.R_rho_fn_1 x_map) ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))))
def Node_P_VR_rho_source_6_raw : String := "\\boxed{ R_\\rho(\\rho)=\\rho_R=\\rho. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 6, "location": "ES_46_RV6.md:1272:P_VR_rho:formula-6", "source": "\\boxed{ R_\\rho(\\rho)=\\rho_R=\\rho. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_6 (ctx : FormalContext) : Prop := (((ctx.R_rho_fn_1 ctx.rho) = ctx.rho_R) ∧ (ctx.rho_R = ctx.rho))
def Node_P_VR_rho_source_7_raw : String := "\\boxed{ R_\\rho^{-1}(\\rho_R)=\\rho_R. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 7, "location": "ES_46_RV6.md:1272:P_VR_rho:formula-7", "source": "\\boxed{ R_\\rho^{-1}(\\rho_R)=\\rho_R. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_7 (ctx : FormalContext) : Prop := ((ctx.R_rho_inv_fn_1 ctx.rho_R) = ctx.rho_R)
def Node_P_VR_rho_source_8_raw : String := "\\left| R_\\rho(\\rho_1)-R_\\rho(\\rho_2) \\right| = |\\rho_1-\\rho_2|."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 8, "location": "ES_46_RV6.md:1272:P_VR_rho:formula-8", "source": "\\left| R_\\rho(\\rho_1)-R_\\rho(\\rho_2) \\right| = |\\rho_1-\\rho_2|.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_8 (ctx : FormalContext) : Prop := ((abs ((ctx.R_rho_fn_1 ctx.rho_1) - (ctx.R_rho_fn_1 ctx.rho_2))) = (abs (ctx.rho_1 - ctx.rho_2)))
def Node_P_VR_rho_source_9_raw : String := "\\boxed{ P_{\\rm VR}(\\rho): \\qquad \\rho_{\\rm VED} = \\rho_R = \\left| a-\\frac12 \\right|. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VR_rho", "formula": 9, "location": "ES_46_RV6.md:1272:P_VR_rho:formula-9", "source": "\\boxed{ P_{\\rm VR}(\\rho): \\qquad \\rho_{\\rm VED} = \\rho_R = \\left| a-\\frac12 \\right|. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VR_rho_source_9 (ctx : FormalContext) : Prop := ((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))
def Node_P_VR_rho_source_10_raw : String := "U_{\\rm VED}\\leftrightarrow U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 10, "location": "ES_46_RV6.md:1272:P_VR_rho:formula-10", "source": "U_{\\rm VED}\\leftrightarrow U_{\\rm Rim}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_10 (ctx : FormalContext) : Prop := (ctx.Corresponds_Set_Real_to_Set_Complex ctx.U_VED ctx.U_Rim)
def Node_P_VR_rho_source_11_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 11, "location": "ES_46_RV6.md:1272:P_VR_rho:formula-11", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_11_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_VR_rho_source_12_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 12, "location": "ES_46_RV6.md:1272:P_VR_rho:formula-12", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_12_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_P_VR_rho_source_13_raw : String := "R_\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 13, "location": "ES_46_RV6.md:1272:P_VR_rho:formula-13", "source": "R_\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VR_rho_source_13_term (ctx : FormalContext) : ℝ := (ctx.R_rho)
def Node_P_VR_rho_source_14_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_rho", "formula": 14, "location": "ES_46_RV6.md:1272:P_VR_rho:formula-14", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
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
-- DEMUESTRA_ASSERTION: P_VR_rho|COMPLETA|NO_DETERMINADO

-- FORMAL_NODE: P_VED_K_I
-- SOURCE: ES_46_RV6.md:480
-- FORMULA: \rho=1/2
-- FORMULA: k
def Node_P_VED_K_I_source_1_raw : String := "\\rho=1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_I", "formula": 1, "location": "ES_46_RV6.md:480:P_VED_K_I:formula-1", "source": "\\rho=1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_I_source_1 (ctx : FormalContext) : Prop := (ctx.rho = ((1 : ℝ) / (2 : ℝ)))
def Node_P_VED_K_I_source_2_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_I", "formula": 2, "location": "ES_46_RV6.md:480:P_VED_K_I:formula-2", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "PROOF_STEP"}
def Node_P_VED_K_I_source_2_term (ctx : FormalContext) : ℕ := (ctx.k)
def Node_P_VED_K_I_source_steps (ctx : FormalContext) : Prop := (Node_P_VED_K_I_source_1 ctx)
def Node_P_VED_K_I_unformalized_source : String := "$P_{\\rm VED}(K_I)$ — Para $\\rho=1/2$, los mismos $k$ enumeran todas las fronteras de máxima desviación."
-- DEMUESTRA_UNDECIDABLE_NODE: P_VED_K_I|PROSE_WITHOUT_FORMULA
-- DEMUESTRA_ASSERTION: P_VED_K_I|DOCUMENTAL|NO_APLICA

-- FORMAL_NODE: P_VED_K_E_2
-- SOURCE: ES_46_RV6.md:881
-- FORMULA: P_{\rm VED}(K_E): \quad k\in\mathbb N^+ \text{ enumera todos los estados estables.}
def Node_P_VED_K_E_2_source_1_raw : String := "P_{\\rm VED}(K_E): \\quad k\\in\\mathbb N^+ \\text{ enumera todos los estados estables.}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_K_E_2", "formula": 1, "location": "ES_46_RV6.md:881:P_VED_K_E_2:formula-1", "source": "P_{\\rm VED}(K_E): \\quad k\\in\\mathbb N^+ \\text{ enumera todos los estados estables.}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_K_E_2_source_1 (ctx : FormalContext) : Prop := (ctx.k ∈ {x : ℕ | 0 < x})
def Node_P_VED_K_E_2_source_steps (ctx : FormalContext) : Prop := (Node_P_VED_K_E_2_source_1 ctx)
def Node_P_VED_K_E_2_unformalized_source : String := "$$ P_{\\rm VED}(K_E): \\quad k\\in\\mathbb N^+ \\text{ enumera todos los estados estables.} $$"
-- DEMUESTRA_UNDECIDABLE_NODE: P_VED_K_E_2|PROSE_WITHOUT_FORMULA
-- DEMUESTRA_ASSERTION: P_VED_K_E_2|DOCUMENTAL|NO_APLICA

-- FORMAL_NODE: P_VR_E
-- SOURCE: ES_46_RV6.md:1312
-- FORMULA: \rho_{\rm VED}=0 \iff \text{estado estable}.
-- FORMULA: \rho_{\rm VED} = \left| a-\frac12 \right|.
-- FORMULA: \boxed{ P_{\rm VR}(E): \qquad \text{estado estable} \iff \left| a-\frac12 \right| = 0. }
-- FORMULA: \boxed{ \text{estado estable} \iff a=\frac12. }
-- FORMULA: U_{\rm VED}
def Node_P_VR_E_source_1_raw : String := "\\rho_{\\rm VED}=0 \\iff \\text{estado estable}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_E", "formula": 1, "location": "ES_46_RV6.md:1312:P_VR_E:formula-1", "source": "\\rho_{\\rm VED}=0 \\iff \\text{estado estable}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_E_source_1 (ctx : FormalContext) : Prop := ((ctx.rho_VED = 0) ↔ ctx.Text_estado_estable)
def Node_P_VR_E_source_2_raw : String := "\\rho_{\\rm VED} = \\left| a-\\frac12 \\right|."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_E", "formula": 2, "location": "ES_46_RV6.md:1312:P_VR_E:formula-2", "source": "\\rho_{\\rm VED} = \\left| a-\\frac12 \\right|.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_E_source_2 (ctx : FormalContext) : Prop := (ctx.rho_VED = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))))
def Node_P_VR_E_source_3_raw : String := "\\boxed{ P_{\\rm VR}(E): \\qquad \\text{estado estable} \\iff \\left| a-\\frac12 \\right| = 0. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VR_E", "formula": 3, "location": "ES_46_RV6.md:1312:P_VR_E:formula-3", "source": "\\boxed{ P_{\\rm VR}(E): \\qquad \\text{estado estable} \\iff \\left| a-\\frac12 \\right| = 0. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VR_E_source_3 (ctx : FormalContext) : Prop := (ctx.Text_estado_estable ↔ ((abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))) = 0))
def Node_P_VR_E_source_4_raw : String := "\\boxed{ \\text{estado estable} \\iff a=\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_E", "formula": 4, "location": "ES_46_RV6.md:1312:P_VR_E:formula-4", "source": "\\boxed{ \\text{estado estable} \\iff a=\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VR_E_source_4 (ctx : FormalContext) : Prop := (ctx.Text_estado_estable ↔ (ctx.a = ((1 : ℝ) / (2 : ℝ))))
def Node_P_VR_E_source_5_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VR_E", "formula": 5, "location": "ES_46_RV6.md:1312:P_VR_E:formula-5", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_VR_E_source_5_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_VR_E_source_steps (ctx : FormalContext) : Prop := (Node_P_VR_E_source_1 ctx) ∧ (Node_P_VR_E_source_2 ctx) ∧ (Node_P_VR_E_source_4 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_E|1|PROOF_STEP|-|P_VED_E,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_E|2|PROOF_STEP|1|P_VED_E,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_E|3|CLAIM|2|P_VED_E,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_VR_E|4|PROOF_STEP|3|P_VED_E,P_VR_rho|NO_CERTIFICADO
-- DEMUESTRA_ASSERTION: P_VR_E|COMPLETA|NO_DETERMINADO

-- FORMAL_NODE: P_Z
-- SOURCE: ES_46_RV6.md:1454
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
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 1, "location": "ES_46_RV6.md:1454:P_Z:formula-1", "source": "\\boxed{ \\zeta(z)=0 }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_1 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_P_Z_source_2_raw : String := "\\boxed{ z\\in Z_{\\rm Rim}^{\\rm nt} }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 2, "location": "ES_46_RV6.md:1454:P_Z:formula-2", "source": "\\boxed{ z\\in Z_{\\rm Rim}^{\\rm nt} }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_2 (ctx : FormalContext) : Prop := (ctx.z ∈ ctx.Z_Rim_nt)
def Node_P_Z_source_3_raw : String := "\\boxed{ \\zeta(z)=0, \\qquad 0<\\Re(z)<1. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 3, "location": "ES_46_RV6.md:1454:P_Z:formula-3", "source": "\\boxed{ \\zeta(z)=0, \\qquad 0<\\Re(z)<1. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_3 (ctx : FormalContext) : Prop := (((ctx.zeta ctx.z) = 0) ∧ ((0 < (Complex.re ctx.z)) ∧ ((Complex.re ctx.z) < 1)))
def Node_P_Z_source_4_raw : String := "z=a\\pm ib,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 4, "location": "ES_46_RV6.md:1454:P_Z:formula-4", "source": "z=a\\pm ib,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_4 (ctx : FormalContext) : Prop := (((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib))))
def Node_P_Z_source_5_raw : String := "\\boxed{ \\rho_R = \\left| a-\\frac12 \\right|. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 5, "location": "ES_46_RV6.md:1454:P_Z:formula-5", "source": "\\boxed{ \\rho_R = \\left| a-\\frac12 \\right|. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_5 (ctx : FormalContext) : Prop := (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))))
def Node_P_Z_source_6_raw : String := "\\boxed{ \\rho=0 \\iff \\text{estado estable}, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 6, "location": "ES_46_RV6.md:1454:P_Z:formula-6", "source": "\\boxed{ \\rho=0 \\iff \\text{estado estable}, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_6 (ctx : FormalContext) : Prop := ((ctx.rho = 0) ↔ ctx.Text_estado_estable)
def Node_P_Z_source_7_raw : String := "\\boxed{ 0<\\rho\\le\\frac12 \\iff \\text{estado no estable}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 7, "location": "ES_46_RV6.md:1454:P_Z:formula-7", "source": "\\boxed{ 0<\\rho\\le\\frac12 \\iff \\text{estado no estable}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_7 (ctx : FormalContext) : Prop := (((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_estado_no_estable)
def Node_P_Z_source_8_raw : String := "\\boxed{ \\rho_{\\rm VED} = \\rho_R = \\left| a-\\frac12 \\right|. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 8, "location": "ES_46_RV6.md:1454:P_Z:formula-8", "source": "\\boxed{ \\rho_{\\rm VED} = \\rho_R = \\left| a-\\frac12 \\right|. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_8 (ctx : FormalContext) : Prop := ((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))
def Node_P_Z_source_9_raw : String := "\\boxed{ U_{\\rm Rim}: \\qquad \\zeta(z)=0 \\quad \\text{identifica el cero}, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 9, "location": "ES_46_RV6.md:1454:P_Z:formula-9", "source": "\\boxed{ U_{\\rm Rim}: \\qquad \\zeta(z)=0 \\quad \\text{identifica el cero}, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_9 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_P_Z_source_10_raw : String := "\\boxed{ U_{\\rm VED}: \\qquad \\rho \\quad \\text{clasifica exhaustivamente su localización transversal}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 10, "location": "ES_46_RV6.md:1454:P_Z:formula-10", "source": "\\boxed{ U_{\\rm VED}: \\qquad \\rho \\quad \\text{clasifica exhaustivamente su localización transversal}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_10 (ctx : FormalContext) : Prop := (ctx.Assertion_clasifica_exhaustivamente_su_localizaci_n_transversal (ctx.rho))
def Node_P_Z_source_11_raw : String := "\\boxed{ P_Z: \\qquad z\\in Z_{\\rm Rim}^{\\rm nt} \\Rightarrow \\left[ \\zeta(z)=0 \\ \\text{en }U_{\\rm Rim} \\ \\text{y } \\rho_R=\\rho_{\\rm VED} \\ \\text{clasifica su localización transversal} \\right]. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_Z", "formula": 11, "location": "ES_46_RV6.md:1454:P_Z:formula-11", "source": "\\boxed{ P_Z: \\qquad z\\in Z_{\\rm Rim}^{\\rm nt} \\Rightarrow \\left[ \\zeta(z)=0 \\ \\text{en }U_{\\rm Rim} \\ \\text{y } \\rho_R=\\rho_{\\rm VED} \\ \\text{clasifica su localización transversal} \\right]. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_Z_source_11 (ctx : FormalContext) : Prop := (∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))
def Node_P_Z_source_12_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 12, "location": "ES_46_RV6.md:1454:P_Z:formula-12", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_P_Z_source_12_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_P_Z_source_13_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 13, "location": "ES_46_RV6.md:1454:P_Z:formula-13", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_Z_source_13_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_Z_source_14_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 14, "location": "ES_46_RV6.md:1454:P_Z:formula-14", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_P_Z_source_14_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_P_Z_source_15_raw : String := "\\zeta"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 15, "location": "ES_46_RV6.md:1454:P_Z:formula-15", "source": "\\zeta", "status": "FORMALIZED_TERM", "type": "Function[Complex,Complex]", "role": "PROOF_STEP"}
def Node_P_Z_source_15_term (ctx : FormalContext) : ℂ → ℂ := (ctx.zeta)
def Node_P_Z_source_16_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 16, "location": "ES_46_RV6.md:1454:P_Z:formula-16", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_P_Z_source_16_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_P_Z_source_17_raw : String := "\\zeta(z)=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 17, "location": "ES_46_RV6.md:1454:P_Z:formula-17", "source": "\\zeta(z)=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_Z_source_17 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_P_Z_source_18_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 18, "location": "ES_46_RV6.md:1454:P_Z:formula-18", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_Z_source_18_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_Z_source_19_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 19, "location": "ES_46_RV6.md:1454:P_Z:formula-19", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_P_Z_source_19_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_P_Z_source_20_raw : String := "\\rho_R"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 20, "location": "ES_46_RV6.md:1454:P_Z:formula-20", "source": "\\rho_R", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_Z_source_20_term (ctx : FormalContext) : ℝ := (ctx.rho_R)
def Node_P_Z_source_21_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Z", "formula": 21, "location": "ES_46_RV6.md:1454:P_Z:formula-21", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
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
-- SOURCE: ES_46_RV6.md:482
-- FORMULA: 0\le\rho\le\frac12
-- FORMULA: k
def Node_P_VED_R_C_source_1_raw : String := "0\\le\\rho\\le\\frac12"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VED_R_C", "formula": 1, "location": "ES_46_RV6.md:482:P_VED_R_C:formula-1", "source": "0\\le\\rho\\le\\frac12", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VED_R_C_source_1 (ctx : FormalContext) : Prop := ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))
def Node_P_VED_R_C_source_2_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_R_C", "formula": 2, "location": "ES_46_RV6.md:482:P_VED_R_C:formula-2", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "PROOF_STEP"}
def Node_P_VED_R_C_source_2_term (ctx : FormalContext) : ℕ := (ctx.k)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_R_C|1|CLAIM|-|P_VED_I,P_VED_K_E,P_VED_K_I|NO_CERTIFICADO
theorem derive_P_VED_R_C (ctx : FormalContext) (h_P_VED_I : ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_cierre_no_estable))) (h_P_VED_K_E : ((((ctx.rho = 0)) → (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = ((k, 0)))}))))) (h_D_rho : ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))))))) : (((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) := by
  rcases h_D_rho with ⟨h_D_rho_1, h_D_rho_2, h_D_rho_3, h_D_rho_4, h_D_rho_5⟩
  exact h_D_rho_2
-- DEMUESTRA_ASSERTION: P_VED_R_C|COMPLETA|VERIFICADA

-- FORMAL_NODE: T_RIEMANN
-- SOURCE: ES_46_RV6.md:1472
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
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 1, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-1", "source": "z=a\\pm ib", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_1 (ctx : FormalContext) : Prop := (((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib))))
def Node_T_RIEMANN_source_2_raw : String := "\\boxed{ a=\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 2, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-2", "source": "\\boxed{ a=\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "GOAL"}
def Node_T_RIEMANN_source_2 (ctx : FormalContext) : Prop := (ctx.a = ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_3_raw : String := "\\boxed{ \\zeta(z)=0. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 3, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-3", "source": "\\boxed{ \\zeta(z)=0. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_3 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_T_RIEMANN_source_4_raw : String := "\\boxed{ \\rho_R = \\left| a-\\frac12 \\right| = \\rho_{\\rm VED}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 4, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-4", "source": "\\boxed{ \\rho_R = \\left| a-\\frac12 \\right| = \\rho_{\\rm VED}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_4 (ctx : FormalContext) : Prop := ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))) = ctx.rho_VED))
def Node_T_RIEMANN_source_5_raw : String := "\\rho_{\\rm VED}=0 \\iff \\text{estado estable},"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 5, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-5", "source": "\\rho_{\\rm VED}=0 \\iff \\text{estado estable},", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_5 (ctx : FormalContext) : Prop := ((ctx.rho_VED = 0) ↔ ctx.Text_estado_estable)
def Node_T_RIEMANN_source_6_raw : String := "0<\\rho_{\\rm VED}\\le\\frac12 \\iff \\text{estado no estable}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 6, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-6", "source": "0<\\rho_{\\rm VED}\\le\\frac12 \\iff \\text{estado no estable}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_6 (ctx : FormalContext) : Prop := (((0 < ctx.rho_VED) ∧ (ctx.rho_VED ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_estado_no_estable)
def Node_T_RIEMANN_source_7_raw : String := "\\boxed{ a\\neq\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 7, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-7", "source": "\\boxed{ a\\neq\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "LOCAL_ASSUMPTION"}
def Node_T_RIEMANN_source_7 (ctx : FormalContext) : Prop := (ctx.a ≠ ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_8_raw : String := "\\left| a-\\frac12 \\right| >0."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 8, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-8", "source": "\\left| a-\\frac12 \\right| >0.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_8 (ctx : FormalContext) : Prop := ((abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))) > 0)
def Node_T_RIEMANN_source_9_raw : String := "\\rho = \\left| a-\\frac12 \\right| >0."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 9, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-9", "source": "\\rho = \\left| a-\\frac12 \\right| >0.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_9 (ctx : FormalContext) : Prop := ((ctx.rho = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))) > 0))
def Node_T_RIEMANN_source_10_raw : String := "\\rho>0 \\Rightarrow \\text{estado no estable}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 10, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-10", "source": "\\rho>0 \\Rightarrow \\text{estado no estable}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_10 (ctx : FormalContext) : Prop := ((ctx.rho > 0) → ctx.Text_estado_no_estable)
def Node_T_RIEMANN_source_11_raw : String := "\\boxed{ \\rho=0. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 11, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-11", "source": "\\boxed{ \\rho=0. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_11 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_T_RIEMANN_source_12_raw : String := "a\\neq\\frac12"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 12, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-12", "source": "a\\neq\\frac12", "status": "FORMALIZED_PROP", "type": "Prop", "role": "CONCLUSION"}
def Node_T_RIEMANN_source_12 (ctx : FormalContext) : Prop := (ctx.a ≠ ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_13_raw : String := "\\boxed{ a=\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 13, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-13", "source": "\\boxed{ a=\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "CONCLUSION"}
def Node_T_RIEMANN_source_13 (ctx : FormalContext) : Prop := (ctx.a = ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_14_raw : String := "\\boxed{ \\forall z\\in Z_{\\rm Rim}^{\\rm nt}, \\qquad \\Re(z)=\\frac12. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "T_RIEMANN", "formula": 14, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-14", "source": "\\boxed{ \\forall z\\in Z_{\\rm Rim}^{\\rm nt}, \\qquad \\Re(z)=\\frac12. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_T_RIEMANN_source_14 (ctx : FormalContext) : Prop := (∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → ((Complex.re z) = ((1 : ℝ) / (2 : ℝ))))
def Node_T_RIEMANN_source_15_raw : String := "\\boxed{ Z_{\\rm Rim}^{\\rm nt} \\subseteq \\left\\{ s\\in\\mathbb C: \\Re(s)=\\frac12 \\right\\}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 15, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-15", "source": "\\boxed{ Z_{\\rm Rim}^{\\rm nt} \\subseteq \\left\\{ s\\in\\mathbb C: \\Re(s)=\\frac12 \\right\\}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "EQUIVALENT_CONCLUSION"}
def Node_T_RIEMANN_source_15 (ctx : FormalContext) : Prop := (ctx.Z_Rim_nt ⊆ ({s | (s ∈ (Set.univ : Set ℂ)) ∧ ((Complex.re s) = ((1 : ℝ) / (2 : ℝ)))}))
def Node_T_RIEMANN_source_16_raw : String := "\\boxed{ \\Re(s)=\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 16, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-16", "source": "\\boxed{ \\Re(s)=\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_16 (ctx : FormalContext) : Prop := ((Complex.re ctx.s) = ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_17_raw : String := "\\boxed{ \\zeta(z)=0, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 17, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-17", "source": "\\boxed{ \\zeta(z)=0, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_17 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_T_RIEMANN_source_18_raw : String := "\\boxed{ \\rho_R=\\rho_{\\rm VED}, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 18, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-18", "source": "\\boxed{ \\rho_R=\\rho_{\\rm VED}, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_18 (ctx : FormalContext) : Prop := (ctx.rho_R = ctx.rho_VED)
def Node_T_RIEMANN_source_19_raw : String := "\\Re(s)\\neq\\frac12,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 19, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-19", "source": "\\Re(s)\\neq\\frac12,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "CONCLUSION"}
def Node_T_RIEMANN_source_19 (ctx : FormalContext) : Prop := ((Complex.re ctx.s) ≠ ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_20_raw : String := "\\rho>0,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 20, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-20", "source": "\\rho>0,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_20 (ctx : FormalContext) : Prop := (ctx.rho > 0)
def Node_T_RIEMANN_source_21_raw : String := "U_{\\rm VED} \\longleftrightarrow U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 21, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-21", "source": "U_{\\rm VED} \\longleftrightarrow U_{\\rm Rim}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_21 (ctx : FormalContext) : Prop := (ctx.Corresponds_Set_Real_to_Set_Complex ctx.U_VED ctx.U_Rim)
def Node_T_RIEMANN_source_22_raw : String := "F=dt^2+2dt;"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 22, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-22", "source": "F=dt^2+2dt;", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_22 (ctx : FormalContext) : Prop := (ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))
def Node_T_RIEMANN_source_23_raw : String := "F = 2dt \\left( 1+\\frac12dt \\right);"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 23, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-23", "source": "F = 2dt \\left( 1+\\frac12dt \\right);", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_23 (ctx : FormalContext) : Prop := (ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))
def Node_T_RIEMANN_source_24_raw : String := "\\boxed{ \\Re(s)=\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 24, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-24", "source": "\\boxed{ \\Re(s)=\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_24 (ctx : FormalContext) : Prop := ((Complex.re ctx.s) = ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_25_raw : String := "\\boxed{ U_{\\rm VED} \\longrightarrow U_{\\rm Rim} }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 25, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-25", "source": "\\boxed{ U_{\\rm VED} \\longrightarrow U_{\\rm Rim} }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "CONCLUSION"}
def Node_T_RIEMANN_source_25 (ctx : FormalContext) : Prop := (ctx.Transforms_Set_Real_to_Set_Complex ctx.U_VED ctx.U_Rim)
def Node_T_RIEMANN_source_26_raw : String := "\\boxed{ \\text{Lorentz} \\longrightarrow F \\longrightarrow U_{\\rm Lap} \\longrightarrow \\Re(s)=\\frac12 }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 26, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-26", "source": "\\boxed{ \\text{Lorentz} \\longrightarrow F \\longrightarrow U_{\\rm Lap} \\longrightarrow \\Re(s)=\\frac12 }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_26 (ctx : FormalContext) : Prop := (((ctx.Transforms_Prop_to_Real ctx.Text_Lorentz ctx.F) ∧ (ctx.Transforms_Real_to_Real ctx.F ctx.U_Lap)) ∧ (ctx.Transforms_Real_to_Prop ctx.U_Lap ((Complex.re ctx.s) = ((1 : ℝ) / (2 : ℝ)))))
def Node_T_RIEMANN_source_27_raw : String := "ds^2=dt^2-dt'^2."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 27, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-27", "source": "ds^2=dt^2-dt'^2.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_27 (ctx : FormalContext) : Prop := (ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))
def Node_T_RIEMANN_source_28_raw : String := "\\lambda=\\frac{h}{Mc}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 28, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-28", "source": "\\lambda=\\frac{h}{Mc}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_28 (ctx : FormalContext) : Prop := (ctx.lambda = (ctx.h / ctx.Mc))
def Node_T_RIEMANN_source_29_raw : String := "L=n\\lambda."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 29, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-29", "source": "L=n\\lambda.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_29 (ctx : FormalContext) : Prop := (ctx.L = (ctx.n * ctx.lambda))
def Node_T_RIEMANN_source_30_raw : String := "R_{\\rm VED} = \\frac{L}{2\\pi} = \\frac{n\\lambda}{2\\pi}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 30, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-30", "source": "R_{\\rm VED} = \\frac{L}{2\\pi} = \\frac{n\\lambda}{2\\pi}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_30 (ctx : FormalContext) : Prop := ((ctx.R_VED = (ctx.L / ((2 : ℝ) * Real.pi))) ∧ ((ctx.L / ((2 : ℝ) * Real.pi)) = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi))))
def Node_T_RIEMANN_source_31_raw : String := "n=k\\pm\\rho, \\qquad k\\in\\mathbb N^+, \\qquad 0\\le\\rho\\le\\frac12."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 31, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-31", "source": "n=k\\pm\\rho, \\qquad k\\in\\mathbb N^+, \\qquad 0\\le\\rho\\le\\frac12.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_31 (ctx : FormalContext) : Prop := (((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))))
def Node_T_RIEMANN_source_32_raw : String := "\\tilde N=R_{\\rm VED}R_{\\rm Sch}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 32, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-32", "source": "\\tilde N=R_{\\rm VED}R_{\\rm Sch}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_32 (ctx : FormalContext) : Prop := (ctx.tilde_N = (ctx.R_VED * ctx.R_Sch))
def Node_T_RIEMANN_source_33_raw : String := "F = (dt^2-dt'^2) + \\frac{d}{dt}(dt^2-dt'^2)."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 33, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-33", "source": "F = (dt^2-dt'^2) + \\frac{d}{dt}(dt^2-dt'^2).", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_33 (ctx : FormalContext) : Prop := (ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))
def Node_T_RIEMANN_source_34_raw : String := "F = dt^2-dt'^2 + 2dt - 2dt'\\frac{dt'}{dt}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 34, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-34", "source": "F = dt^2-dt'^2 + 2dt - 2dt'\\frac{dt'}{dt}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_34 (ctx : FormalContext) : Prop := (ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))
def Node_T_RIEMANN_source_35_raw : String := "dt'\\to0, \\qquad \\frac{dt'}{dt}\\to0."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 35, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-35", "source": "dt'\\to0, \\qquad \\frac{dt'}{dt}\\to0.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_35 (ctx : FormalContext) : Prop := ((ctx.TendsTo (ctx.dt_prime) (0)) ∧ (ctx.TendsTo (ctx.Derivative_t (ctx.t_prime)) (0)))
def Node_T_RIEMANN_source_36_raw : String := "F=dt^2+2dt."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 36, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-36", "source": "F=dt^2+2dt.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_36 (ctx : FormalContext) : Prop := (ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))
def Node_T_RIEMANN_source_37_raw : String := "F = 2dt \\left( 1+\\frac12dt \\right)."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 37, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-37", "source": "F = 2dt \\left( 1+\\frac12dt \\right).", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_37 (ctx : FormalContext) : Prop := (ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))
def Node_T_RIEMANN_source_38_raw : String := "s_\\pm=a\\pm ib."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 38, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-38", "source": "s_\\pm=a\\pm ib.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_38 (ctx : FormalContext) : Prop := (((ctx.s_PM) = ((ctx.a + ctx.ib)) ∨ (ctx.s_PM) = ((ctx.a - ctx.ib))))
def Node_T_RIEMANN_source_39_raw : String := "\\rho_R = \\left| \\Re(z)-\\frac12 \\right|."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 39, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-39", "source": "\\rho_R = \\left| \\Re(z)-\\frac12 \\right|.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_39 (ctx : FormalContext) : Prop := (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))
def Node_T_RIEMANN_source_40_raw : String := "\\rho_{\\rm VED}=\\rho_R."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 40, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-40", "source": "\\rho_{\\rm VED}=\\rho_R.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_40 (ctx : FormalContext) : Prop := (ctx.rho_VED = ctx.rho_R)
def Node_T_RIEMANN_source_41_raw : String := "\\boxed{ \\forall z\\in Z_{\\rm Rim}^{\\rm nt}, \\qquad \\Re(z)=\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 41, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-41", "source": "\\boxed{ \\forall z\\in Z_{\\rm Rim}^{\\rm nt}, \\qquad \\Re(z)=\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DERIVED_STEP"}
def Node_T_RIEMANN_source_41 (ctx : FormalContext) : Prop := (∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → ((Complex.re z) = ((1 : ℝ) / (2 : ℝ))))
def Node_T_RIEMANN_source_42_raw : String := "R_{\\rm VED} = \\frac{n\\lambda}{2\\pi}."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 42, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-42", "source": "R_{\\rm VED} = \\frac{n\\lambda}{2\\pi}.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_42 (ctx : FormalContext) : Prop := (ctx.R_VED = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi)))
def Node_T_RIEMANN_source_43_raw : String := "n=k\\pm\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 43, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-43", "source": "n=k\\pm\\rho", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_43 (ctx : FormalContext) : Prop := (((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho))))
def Node_T_RIEMANN_source_44_raw : String := "(k,0), \\qquad k\\in\\mathbb N^+."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 44, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-44", "source": "(k,0), \\qquad k\\in\\mathbb N^+.", "status": "FORMALIZED_TERM", "type": "Set[Tuple[Nat,Nat]]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_44_term (ctx : FormalContext) : Set (ℕ × ℕ) := ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = ((k, 0)))})
def Node_T_RIEMANN_source_45_raw : String := "F = (dt^2-dt'^2) + \\frac{d}{dt}(dt^2-dt'^2),"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 45, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-45", "source": "F = (dt^2-dt'^2) + \\frac{d}{dt}(dt^2-dt'^2),", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_45 (ctx : FormalContext) : Prop := (ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))
def Node_T_RIEMANN_source_46_raw : String := "F=dt^2+2dt"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 46, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-46", "source": "F=dt^2+2dt", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_46 (ctx : FormalContext) : Prop := (ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))
def Node_T_RIEMANN_source_47_raw : String := "F = 2dt \\left( 1+\\frac12dt \\right)."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 47, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-47", "source": "F = 2dt \\left( 1+\\frac12dt \\right).", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_47 (ctx : FormalContext) : Prop := (ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))
def Node_T_RIEMANN_source_48_raw : String := "\\boxed{ \\zeta(z)=0, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 48, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-48", "source": "\\boxed{ \\zeta(z)=0, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "CONCLUSION"}
def Node_T_RIEMANN_source_48 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_T_RIEMANN_source_49_raw : String := "\\rho_R = \\left| \\Re(z)-\\frac12 \\right|,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 49, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-49", "source": "\\rho_R = \\left| \\Re(z)-\\frac12 \\right|,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_49 (ctx : FormalContext) : Prop := (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))
def Node_T_RIEMANN_source_50_raw : String := "\\boxed{ \\forall z\\in Z_{\\rm Rim}^{\\rm nt}, \\qquad \\Re(z)=\\frac12. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 50, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-50", "source": "\\boxed{ \\forall z\\in Z_{\\rm Rim}^{\\rm nt}, \\qquad \\Re(z)=\\frac12. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "CONCLUSION"}
def Node_T_RIEMANN_source_50 (ctx : FormalContext) : Prop := (∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → ((Complex.re z) = ((1 : ℝ) / (2 : ℝ))))
def Node_T_RIEMANN_source_51_raw : String := "Z_{\\rm Rim}^{\\rm nt}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 51, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-51", "source": "Z_{\\rm Rim}^{\\rm nt}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_51_term (ctx : FormalContext) : Set (ℂ) := (ctx.Z_Rim_nt)
def Node_T_RIEMANN_source_52_raw : String := "Z_{\\rm Rim}^{\\rm nt}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 52, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-52", "source": "Z_{\\rm Rim}^{\\rm nt}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_52_term (ctx : FormalContext) : Set (ℂ) := (ctx.Z_Rim_nt)
def Node_T_RIEMANN_source_53_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 53, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-53", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_53_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_54_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 54, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-54", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_54_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_55_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 55, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-55", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_55_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_56_raw : String := "\\zeta(z)=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 56, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-56", "source": "\\zeta(z)=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_56 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_T_RIEMANN_source_57_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 57, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-57", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_57_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_58_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 58, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-58", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_58_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_59_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 59, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-59", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_59_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_60_raw : String := "a\\neq1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 60, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-60", "source": "a\\neq1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_60 (ctx : FormalContext) : Prop := (ctx.a ≠ ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_61_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 61, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-61", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_61_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_62_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 62, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-62", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_62_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_63_raw : String := "\\zeta(z)=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 63, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-63", "source": "\\zeta(z)=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_63 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_T_RIEMANN_source_64_raw : String := "z"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 64, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-64", "source": "z", "status": "FORMALIZED_TERM", "type": "Complex", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_64_term (ctx : FormalContext) : ℂ := (ctx.z)
def Node_T_RIEMANN_source_65_raw : String := "Z_{\\rm Rim}^{\\rm nt}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 65, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-65", "source": "Z_{\\rm Rim}^{\\rm nt}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_65_term (ctx : FormalContext) : Set (ℂ) := (ctx.Z_Rim_nt)
def Node_T_RIEMANN_source_66_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 66, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-66", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_66_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_67_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 67, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-67", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_67_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_68_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 68, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-68", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_68_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_69_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 69, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-69", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_69_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_70_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 70, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-70", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_70_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_71_raw : String := "\\rho>0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 71, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-71", "source": "\\rho>0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_71 (ctx : FormalContext) : Prop := (ctx.rho > 0)
def Node_T_RIEMANN_source_72_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 72, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-72", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_72_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_73_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 73, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-73", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_73_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_74_raw : String := "U_{\\rm Lap}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 74, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-74", "source": "U_{\\rm Lap}", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_74_term (ctx : FormalContext) : ℝ := (ctx.U_Lap)
def Node_T_RIEMANN_source_75_raw : String := "U_{\\rm Lap}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 75, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-75", "source": "U_{\\rm Lap}", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_75_term (ctx : FormalContext) : ℝ := (ctx.U_Lap)
def Node_T_RIEMANN_source_76_raw : String := "U_{\\rm Lap}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 76, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-76", "source": "U_{\\rm Lap}", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_76_term (ctx : FormalContext) : ℝ := (ctx.U_Lap)
def Node_T_RIEMANN_source_77_raw : String := "dt'"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 77, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-77", "source": "dt'", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_77_term (ctx : FormalContext) : ℝ := (ctx.dt_prime)
def Node_T_RIEMANN_source_78_raw : String := "v_{\\rm onda}=c"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 78, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-78", "source": "v_{\\rm onda}=c", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_78 (ctx : FormalContext) : Prop := (ctx.v_onda = ctx.c)
def Node_T_RIEMANN_source_79_raw : String := "F"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 79, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-79", "source": "F", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_79_term (ctx : FormalContext) : ℝ := (ctx.F)
def Node_T_RIEMANN_source_80_raw : String := "U=3S+T"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 80, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-80", "source": "U=3S+T", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_80 (ctx : FormalContext) : Prop := (ctx.U = (((3 : ℝ) * ctx.S) + ctx.T))
def Node_T_RIEMANN_source_81_raw : String := "ds=dx"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 81, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-81", "source": "ds=dx", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_81 (ctx : FormalContext) : Prop := (ctx.ds = ctx.dx)
def Node_T_RIEMANN_source_82_raw : String := "dy=dz=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 82, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-82", "source": "dy=dz=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_82 (ctx : FormalContext) : Prop := ((ctx.dy = ctx.dz) ∧ (ctx.dz = 0))
def Node_T_RIEMANN_source_83_raw : String := "t'"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 83, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-83", "source": "t'", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_83_term (ctx : FormalContext) : ℝ := (ctx.t_prime)
def Node_T_RIEMANN_source_84_raw : String := "v=ds/dt"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 84, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-84", "source": "v=ds/dt", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_84 (ctx : FormalContext) : Prop := (ctx.v = (ctx.ds / ctx.dt))
def Node_T_RIEMANN_source_85_raw : String := "\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 85, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-85", "source": "\\lambda", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_85_term (ctx : FormalContext) : ℝ := (ctx.lambda)
def Node_T_RIEMANN_source_86_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 86, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-86", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_86_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_87_raw : String := "\\rho=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 87, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-87", "source": "\\rho=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_87 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_T_RIEMANN_source_88_raw : String := "0<\\rho\\le1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 88, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-88", "source": "0<\\rho\\le1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_88 (ctx : FormalContext) : Prop := ((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))
def Node_T_RIEMANN_source_89_raw : String := "\\rho=1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 89, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-89", "source": "\\rho=1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_89 (ctx : FormalContext) : Prop := (ctx.rho = ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_90_raw : String := "k\\in\\mathbb N^+"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 90, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-90", "source": "k\\in\\mathbb N^+", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_90 (ctx : FormalContext) : Prop := (ctx.k ∈ {x : ℕ | 0 < x})
def Node_T_RIEMANN_source_91_raw : String := "n\\to\\infty"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 91, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-91", "source": "n\\to\\infty", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_91 (ctx : FormalContext) : Prop := (ctx.DivergesToInfinity (ctx.n))
def Node_T_RIEMANN_source_92_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 92, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-92", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_92_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_93_raw : String := "U_{\\rm Sch}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 93, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-93", "source": "U_{\\rm Sch}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_93_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_Sch)
def Node_T_RIEMANN_source_94_raw : String := "c"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 94, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-94", "source": "c", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_94_term (ctx : FormalContext) : ℝ := (ctx.c)
def Node_T_RIEMANN_source_95_raw : String := "1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 95, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-95", "source": "1/2", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_95_term (ctx : FormalContext) : ℝ := ((1 : ℝ) / (2 : ℝ))
def Node_T_RIEMANN_source_96_raw : String := "\\Re(s)=1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 96, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-96", "source": "\\Re(s)=1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_96 (ctx : FormalContext) : Prop := ((Complex.re ctx.s) = ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_97_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 97, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-97", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_97_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_98_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 98, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-98", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_98_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_99_raw : String := "\\zeta(z)=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 99, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-99", "source": "\\zeta(z)=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_99 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_T_RIEMANN_source_100_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 100, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-100", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_100_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_101_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 101, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-101", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_101_term (ctx : FormalContext) : ℝ := (ctx.rho)
def Node_T_RIEMANN_source_102_raw : String := "\\rho=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 102, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-102", "source": "\\rho=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_102 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_T_RIEMANN_source_103_raw : String := "\\rho>0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 103, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-103", "source": "\\rho>0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_103 (ctx : FormalContext) : Prop := (ctx.rho > 0)
def Node_T_RIEMANN_source_104_raw : String := "\\rho_{\\rm VED}=\\rho_R"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 104, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-104", "source": "\\rho_{\\rm VED}=\\rho_R", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_104 (ctx : FormalContext) : Prop := (ctx.rho_VED = ctx.rho_R)
def Node_T_RIEMANN_source_105_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 105, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-105", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_105_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_106_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 106, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-106", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_106_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_107_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 107, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-107", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_107_term (ctx : FormalContext) : ℕ := (ctx.k)
def Node_T_RIEMANN_source_108_raw : String := "\\rho\\in[0,1/2]"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 108, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-108", "source": "\\rho\\in[0,1/2]", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_108 (ctx : FormalContext) : Prop := (ctx.rho ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_109_raw : String := "U_{\\rm VED}\\cong U_{\\rm Sch}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 109, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-109", "source": "U_{\\rm VED}\\cong U_{\\rm Sch}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_109 (ctx : FormalContext) : Prop := (Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))
def Node_T_RIEMANN_source_110_raw : String := "dt'"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 110, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-110", "source": "dt'", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_110_term (ctx : FormalContext) : ℝ := (ctx.dt_prime)
def Node_T_RIEMANN_source_111_raw : String := "c"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 111, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-111", "source": "c", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_111_term (ctx : FormalContext) : ℝ := (ctx.c)
def Node_T_RIEMANN_source_112_raw : String := "1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 112, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-112", "source": "1/2", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_112_term (ctx : FormalContext) : ℝ := ((1 : ℝ) / (2 : ℝ))
def Node_T_RIEMANN_source_113_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 113, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-113", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_113_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_114_raw : String := "\\rho"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 114, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-114", "source": "\\rho", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_114_term (ctx : FormalContext) : ℝ := (ctx.rho)
def Node_T_RIEMANN_source_115_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 115, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-115", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_115_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_116_raw : String := "U_{\\rm Rim}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 116, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-116", "source": "U_{\\rm Rim}", "status": "FORMALIZED_TERM", "type": "Set[Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_116_term (ctx : FormalContext) : Set (ℂ) := (ctx.U_Rim)
def Node_T_RIEMANN_source_117_raw : String := "\\zeta"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 117, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-117", "source": "\\zeta", "status": "FORMALIZED_TERM", "type": "Function[Complex,Complex]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_117_term (ctx : FormalContext) : ℂ → ℂ := (ctx.zeta)
def Node_T_RIEMANN_source_118_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 118, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-118", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_118_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_119_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 119, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-119", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_119_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_120_raw : String := "\\rho=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 120, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-120", "source": "\\rho=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_120 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_T_RIEMANN_source_121_raw : String := "\\rho>0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 121, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-121", "source": "\\rho>0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_121 (ctx : FormalContext) : Prop := (ctx.rho > 0)
def Node_T_RIEMANN_source_122_raw : String := "\\Re(z)\\neq1/2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 122, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-122", "source": "\\Re(z)\\neq1/2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_122 (ctx : FormalContext) : Prop := ((Complex.re ctx.z) ≠ ((1 : ℝ) / (2 : ℝ)))
def Node_T_RIEMANN_source_123_raw : String := "z"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 123, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-123", "source": "z", "status": "FORMALIZED_TERM", "type": "Complex", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_123_term (ctx : FormalContext) : ℂ := (ctx.z)
def Node_T_RIEMANN_source_124_raw : String := "\\zeta(z)=0"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 124, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-124", "source": "\\zeta(z)=0", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_124 (ctx : FormalContext) : Prop := ((ctx.zeta ctx.z) = 0)
def Node_T_RIEMANN_source_125_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 125, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-125", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_T_RIEMANN_source_125_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_T_RIEMANN_source_126_raw : String := "U_{\\rm VED}\\cong U_{\\rm Sch}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "T_RIEMANN", "formula": 126, "location": "ES_46_RV6.md:1472:T_RIEMANN:formula-126", "source": "U_{\\rm VED}\\cong U_{\\rm Sch}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
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
-- DEMUESTRA_ASSERTION: T_RIEMANN|COMPLETA|NO_DETERMINADO

-- FORMAL_NODE: P_VED_Completo
-- SOURCE: ES_46_RV6.md:494
-- FORMULA: \boxed{ P_{\rm VED}(\mathrm{Completo}): \quad U_{\rm VED}^{\rm cerrado} = \mathcal E_{\rm VED} \sqcup \mathcal I_{\rm VED}, }
-- FORMULA: n\to\infty
def Node_P_VED_Completo_source_1_raw : String := "\\boxed{ P_{\\rm VED}(\\mathrm{Completo}): \\quad U_{\\rm VED}^{\\rm cerrado} = \\mathcal E_{\\rm VED} \\sqcup \\mathcal I_{\\rm VED}, }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VED_Completo", "formula": 1, "location": "ES_46_RV6.md:494:P_VED_Completo:formula-1", "source": "\\boxed{ P_{\\rm VED}(\\mathrm{Completo}): \\quad U_{\\rm VED}^{\\rm cerrado} = \\mathcal E_{\\rm VED} \\sqcup \\mathcal I_{\\rm VED}, }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VED_Completo_source_1 (ctx : FormalContext) : Prop := (ctx.U_VED_cerrado = (ctx.mathcal_E_VED ∪ ctx.mathcal_I_VED))
def Node_P_VED_Completo_source_2_raw : String := "n\\to\\infty"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Completo", "formula": 2, "location": "ES_46_RV6.md:494:P_VED_Completo:formula-2", "source": "n\\to\\infty", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_Completo_source_2 (ctx : FormalContext) : Prop := (ctx.DivergesToInfinity (ctx.n))
def Node_P_VED_Completo_source_steps (ctx : FormalContext) : Prop := (Node_P_VED_Completo_source_2 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_VED_Completo|1|CLAIM|-|P_VED_K_E,P_VED_K_I,P_VED_R_C|NO_CERTIFICADO
-- DEMUESTRA_ASSERTION: P_VED_Completo|COMPLETA|NO_DETERMINADO

-- FORMAL_NODE: P_VS
-- SOURCE: ES_46_RV6.md:557
-- FORMULA: \boxed{ P_{\rm VS}: \qquad U_{\rm VED}\cong U_{\rm Sch}. }
-- FORMULA: \boxed{ G(2)=G, }
-- FORMULA: \boxed{ \lim_{n\to\infty}G(n)=0. }
-- FORMULA: n
-- FORMULA: n=2
-- FORMULA: U_{\rm Sch}
def Node_P_VS_source_1_raw : String := "\\boxed{ P_{\\rm VS}: \\qquad U_{\\rm VED}\\cong U_{\\rm Sch}. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_VS", "formula": 1, "location": "ES_46_RV6.md:557:P_VS:formula-1", "source": "\\boxed{ P_{\\rm VS}: \\qquad U_{\\rm VED}\\cong U_{\\rm Sch}. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_VS_source_1 (ctx : FormalContext) : Prop := (Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))
def Node_P_VS_source_2_raw : String := "\\boxed{ G(2)=G, }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VS", "formula": 2, "location": "ES_46_RV6.md:557:P_VS:formula-2", "source": "\\boxed{ G(2)=G, }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VS_source_2 (ctx : FormalContext) : Prop := ((ctx.G_fn_1 2) = ctx.G)
def Node_P_VS_source_3_raw : String := "\\boxed{ \\lim_{n\\to\\infty}G(n)=0. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VS", "formula": 3, "location": "ES_46_RV6.md:557:P_VS:formula-3", "source": "\\boxed{ \\lim_{n\\to\\infty}G(n)=0. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VS_source_3 (ctx : FormalContext) : Prop := (Filter.Tendsto (fun n : ℝ => ctx.G_fn_1 n) Filter.atTop (nhds (0)))
def Node_P_VS_source_4_raw : String := "n"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VS", "formula": 4, "location": "ES_46_RV6.md:557:P_VS:formula-4", "source": "n", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_VS_source_4_term (ctx : FormalContext) : ℝ := (ctx.n)
def Node_P_VS_source_5_raw : String := "n=2"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VS", "formula": 5, "location": "ES_46_RV6.md:557:P_VS:formula-5", "source": "n=2", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VS_source_5 (ctx : FormalContext) : Prop := (ctx.n = 2)
def Node_P_VS_source_6_raw : String := "U_{\\rm Sch}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VS", "formula": 6, "location": "ES_46_RV6.md:557:P_VS:formula-6", "source": "U_{\\rm Sch}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
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
-- SOURCE: ES_46_RV6.md:874
-- FORMULA: P_{\rm VED}(\mathrm{Completo}): \quad (k,\rho) \text{ contempla exhaustivamente todos los cierres finitos.}
def Node_P_VED_Completo_2_source_1_raw : String := "P_{\\rm VED}(\\mathrm{Completo}): \\quad (k,\\rho) \\text{ contempla exhaustivamente todos los cierres finitos.}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_VED_Completo_2", "formula": 1, "location": "ES_46_RV6.md:874:P_VED_Completo_2:formula-1", "source": "P_{\\rm VED}(\\mathrm{Completo}): \\quad (k,\\rho) \\text{ contempla exhaustivamente todos los cierres finitos.}", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_VED_Completo_2_source_1 (ctx : FormalContext) : Prop := (ctx.Assertion_contempla_exhaustivamente_todos_los_cierres_finitos ((ctx.k, ctx.rho)))
def Node_P_VED_Completo_2_source_steps (ctx : FormalContext) : Prop := (Node_P_VED_Completo_2_source_1 ctx)
def Node_P_VED_Completo_2_unformalized_source : String := "$$ P_{\\rm VED}(\\mathrm{Completo}): \\quad (k,\\rho) \\text{ contempla exhaustivamente todos los cierres finitos.} $$"
-- DEMUESTRA_UNDECIDABLE_NODE: P_VED_Completo_2|PROSE_WITHOUT_FORMULA
-- DEMUESTRA_ASSERTION: P_VED_Completo_2|DOCUMENTAL|NO_APLICA

-- FORMAL_NODE: P_F
-- SOURCE: ES_46_RV6.md:601
-- FORMULA: \boxed{ P_F: \qquad F = (dt^2-dt'^2) + \frac{d}{dt}(dt^2-dt'^2). }
-- FORMULA: dt'
-- FORMULA: t
def Node_P_F_source_1_raw : String := "\\boxed{ P_F: \\qquad F = (dt^2-dt'^2) + \\frac{d}{dt}(dt^2-dt'^2). }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_F", "formula": 1, "location": "ES_46_RV6.md:601:P_F:formula-1", "source": "\\boxed{ P_F: \\qquad F = (dt^2-dt'^2) + \\frac{d}{dt}(dt^2-dt'^2). }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_F_source_1 (ctx : FormalContext) : Prop := (ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))
def Node_P_F_source_2_raw : String := "dt'"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F", "formula": 2, "location": "ES_46_RV6.md:601:P_F:formula-2", "source": "dt'", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F_source_2_term (ctx : FormalContext) : ℝ := (ctx.dt_prime)
def Node_P_F_source_3_raw : String := "t"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F", "formula": 3, "location": "ES_46_RV6.md:601:P_F:formula-3", "source": "t", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F_source_3_term (ctx : FormalContext) : ℝ := (ctx.t)
-- DEMUESTRA_DEDUCTIVE_LINK: P_F|1|CLAIM|-|A_7,P_VS,P_ST_2|NO_CERTIFICADO
-- DEMUESTRA_ASSERTION: P_F|COMPLETA|NO_DETERMINADO

-- FORMAL_NODE: P_F1
-- SOURCE: ES_46_RV6.md:617
-- FORMULA: \boxed{ P_{F1}: \qquad F = dt^2-dt'^2 + 2dt - 2dt'\frac{dt'}{dt}. }
-- FORMULA: dt'
-- FORMULA: dt'/dt
def Node_P_F1_source_1_raw : String := "\\boxed{ P_{F1}: \\qquad F = dt^2-dt'^2 + 2dt - 2dt'\\frac{dt'}{dt}. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_F1", "formula": 1, "location": "ES_46_RV6.md:617:P_F1:formula-1", "source": "\\boxed{ P_{F1}: \\qquad F = dt^2-dt'^2 + 2dt - 2dt'\\frac{dt'}{dt}. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_F1_source_1 (ctx : FormalContext) : Prop := (ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))
def Node_P_F1_source_2_raw : String := "dt'"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F1", "formula": 2, "location": "ES_46_RV6.md:617:P_F1:formula-2", "source": "dt'", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F1_source_2_term (ctx : FormalContext) : ℝ := (ctx.dt_prime)
def Node_P_F1_source_3_raw : String := "dt'/dt"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F1", "formula": 3, "location": "ES_46_RV6.md:617:P_F1:formula-3", "source": "dt'/dt", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F1_source_3_term (ctx : FormalContext) : ℝ := (ctx.dt_prime / ctx.dt)
-- DEMUESTRA_DEDUCTIVE_LINK: P_F1|1|CLAIM|-|P_VS,P_ST_2,P_F|NO_CERTIFICADO
theorem derive_P_F1 (ctx : FormalContext) (h_P_VS : ((Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch))))) (h_P_ST_2 : ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2)))) (h_P_F : ((ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime)))))) : ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) := by
  ring_nf at h_P_F ⊢
  exact h_P_F
-- DEMUESTRA_ASSERTION: P_F1|COMPLETA|VERIFICADA

-- FORMAL_NODE: P_W
-- SOURCE: ES_46_RV6.md:639
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
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_W", "formula": 1, "location": "ES_46_RV6.md:639:P_W:formula-1", "source": "\\boxed{ P_W: \\qquad v_{\\rm onda}=c. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_W_source_1 (ctx : FormalContext) : Prop := (ctx.v_onda = ctx.c)
def Node_P_W_source_2_raw : String := "c=1."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 2, "location": "ES_46_RV6.md:639:P_W:formula-2", "source": "c=1.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_2 (ctx : FormalContext) : Prop := (ctx.c = 1)
def Node_P_W_source_3_raw : String := "v=\\frac{ds}{dt},"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 3, "location": "ES_46_RV6.md:639:P_W:formula-3", "source": "v=\\frac{ds}{dt},", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_3 (ctx : FormalContext) : Prop := (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s))
def Node_P_W_source_4_raw : String := "\\frac{ds}{dt}=1."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 4, "location": "ES_46_RV6.md:639:P_W:formula-4", "source": "\\frac{ds}{dt}=1.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_4 (ctx : FormalContext) : Prop := (ctx.Derivative_t (ctx.DerivativeSubject_s) = 1)
def Node_P_W_source_5_raw : String := "ds=dt,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 5, "location": "ES_46_RV6.md:639:P_W:formula-5", "source": "ds=dt,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_5 (ctx : FormalContext) : Prop := (ctx.ds = ctx.dt)
def Node_P_W_source_6_raw : String := "dt' = dt \\sqrt{ 1-\\frac{v^2}{c^2} }."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 6, "location": "ES_46_RV6.md:639:P_W:formula-6", "source": "dt' = dt \\sqrt{ 1-\\frac{v^2}{c^2} }.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_6 (ctx : FormalContext) : Prop := (ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2)))))
def Node_P_W_source_7_raw : String := "v\\to c,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 7, "location": "ES_46_RV6.md:639:P_W:formula-7", "source": "v\\to c,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_7 (ctx : FormalContext) : Prop := (ctx.TendsTo (ctx.v) (ctx.c))
def Node_P_W_source_8_raw : String := "\\boxed{ dt'\\to0. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 8, "location": "ES_46_RV6.md:639:P_W:formula-8", "source": "\\boxed{ dt'\\to0. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_8 (ctx : FormalContext) : Prop := (ctx.TendsTo (ctx.dt_prime) (0))
def Node_P_W_source_9_raw : String := "dt'^2\\to0,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 9, "location": "ES_46_RV6.md:639:P_W:formula-9", "source": "dt'^2\\to0,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_9 (ctx : FormalContext) : Prop := (ctx.TendsTo (ctx.dt_prime ^ 2) (0))
def Node_P_W_source_10_raw : String := "\\frac{dt'}{dt}\\to0."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 10, "location": "ES_46_RV6.md:639:P_W:formula-10", "source": "\\frac{dt'}{dt}\\to0.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_W_source_10 (ctx : FormalContext) : Prop := (ctx.TendsTo (ctx.Derivative_t (ctx.t_prime)) (0))
def Node_P_W_source_11_raw : String := "F"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 11, "location": "ES_46_RV6.md:639:P_W:formula-11", "source": "F", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_W_source_11_term (ctx : FormalContext) : ℝ := (ctx.F)
def Node_P_W_source_12_raw : String := "c"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_W", "formula": 12, "location": "ES_46_RV6.md:639:P_W:formula-12", "source": "c", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
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
-- DEMUESTRA_ASSERTION: P_W|COMPLETA|NO_DETERMINADO

-- FORMAL_NODE: P_F2
-- SOURCE: ES_46_RV6.md:712
-- FORMULA: \boxed{ P_{F2}: \qquad F=dt^2+2dt. }
-- FORMULA: dt^2+2dt = 2dt \left( 1+\frac12dt \right),
def Node_P_F2_source_1_raw : String := "\\boxed{ P_{F2}: \\qquad F=dt^2+2dt. }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_F2", "formula": 1, "location": "ES_46_RV6.md:712:P_F2:formula-1", "source": "\\boxed{ P_{F2}: \\qquad F=dt^2+2dt. }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_F2_source_1 (ctx : FormalContext) : Prop := (ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))
def Node_P_F2_source_2_raw : String := "dt^2+2dt = 2dt \\left( 1+\\frac12dt \\right),"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F2", "formula": 2, "location": "ES_46_RV6.md:712:P_F2:formula-2", "source": "dt^2+2dt = 2dt \\left( 1+\\frac12dt \\right),", "status": "FORMALIZED_PROP", "type": "Prop", "role": "PROOF_STEP"}
def Node_P_F2_source_2 (ctx : FormalContext) : Prop := ((ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)) = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))
def Node_P_F2_source_steps (ctx : FormalContext) : Prop := (Node_P_F2_source_2 ctx)
-- DEMUESTRA_DEDUCTIVE_LINK: P_F2|1|CLAIM|-|P_F,P_F1,P_W|NO_CERTIFICADO
-- DEMUESTRA_DEDUCTIVE_LINK: P_F2|2|PROOF_STEP|1|P_F,P_F1,P_W|NO_CERTIFICADO
-- DEMUESTRA_ASSERTION: P_F2|COMPLETA|NO_DETERMINADO

-- FORMAL_NODE: P_F3
-- SOURCE: ES_46_RV6.md:733
-- FORMULA: \boxed{ P_{F3}: \qquad F = 2dt \left( 1+\frac12dt \right). }
-- FORMULA: \boxed{ \frac12 }
-- FORMULA: F
def Node_P_F3_source_1_raw : String := "\\boxed{ P_{F3}: \\qquad F = 2dt \\left( 1+\\frac12dt \\right). }"
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_F3", "formula": 1, "location": "ES_46_RV6.md:733:P_F3:formula-1", "source": "\\boxed{ P_{F3}: \\qquad F = 2dt \\left( 1+\\frac12dt \\right). }", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_F3_source_1 (ctx : FormalContext) : Prop := (ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))
def Node_P_F3_source_2_raw : String := "\\boxed{ \\frac12 }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 2, "location": "ES_46_RV6.md:733:P_F3:formula-2", "source": "\\boxed{ \\frac12 }", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F3_source_2_term (ctx : FormalContext) : ℝ := ((1 : ℝ) / (2 : ℝ))
def Node_P_F3_source_3_raw : String := "F"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_F3", "formula": 3, "location": "ES_46_RV6.md:733:P_F3:formula-3", "source": "F", "status": "FORMALIZED_TERM", "type": "Real", "role": "PROOF_STEP"}
def Node_P_F3_source_3_term (ctx : FormalContext) : ℝ := (ctx.F)
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3|1|CLAIM|-|P_F1,P_W,P_F2|NO_CERTIFICADO
theorem derive_P_F3 (ctx : FormalContext) (h_P_F1 : ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime)))))) (h_P_W : ((ctx.v_onda = ctx.c))) (h_P_F2 : ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt))))) : ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))) := by
  ring_nf at h_P_F2 ⊢
  exact h_P_F2
-- DEMUESTRA_ASSERTION: P_F3|COMPLETA|VERIFICADA

-- FORMAL_NODE: D_Lap
-- SOURCE: ES_46_RV6.md:764
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
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 1, "location": "ES_46_RV6.md:764:D_Lap:formula-1", "source": "\\boxed{ s_\\pm = a\\pm ib. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_1 (ctx : FormalContext) : Prop := (((ctx.s_PM) = ((ctx.a + ctx.ib)) ∨ (ctx.s_PM) = ((ctx.a - ctx.ib))))
def Node_D_Lap_source_2_raw : String := "\\boxed{ a=\\frac12 }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 2, "location": "ES_46_RV6.md:764:D_Lap:formula-2", "source": "\\boxed{ a=\\frac12 }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_2 (ctx : FormalContext) : Prop := (ctx.a = ((1 : ℝ) / (2 : ℝ)))
def Node_D_Lap_source_3_raw : String := "T(k,\\rho) = (k\\pm\\rho)\\lambda"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 3, "location": "ES_46_RV6.md:764:D_Lap:formula-3", "source": "T(k,\\rho) = (k\\pm\\rho)\\lambda", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_3 (ctx : FormalContext) : Prop := (((ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))
def Node_D_Lap_source_4_raw : String := "e^{\\pm ibT}=1."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 4, "location": "ES_46_RV6.md:764:D_Lap:formula-4", "source": "e^{\\pm ibT}=1.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_4 (ctx : FormalContext) : Prop := (((ctx.Pow_Real (ctx.e) (ctx.ibT)) = (1) ∨ (ctx.Pow_Real (ctx.e) (-ctx.ibT)) = (1)))
def Node_D_Lap_source_5_raw : String := "bT=2\\pi."
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 5, "location": "ES_46_RV6.md:764:D_Lap:formula-5", "source": "bT=2\\pi.", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_5 (ctx : FormalContext) : Prop := (ctx.bT = ((2 : ℝ) * Real.pi))
def Node_D_Lap_source_6_raw : String := "\\boxed{ b(k,\\rho) = \\frac{2\\pi} {(k\\pm\\rho)\\lambda}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 6, "location": "ES_46_RV6.md:764:D_Lap:formula-6", "source": "\\boxed{ b(k,\\rho) = \\frac{2\\pi} {(k\\pm\\rho)\\lambda}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_6 (ctx : FormalContext) : Prop := (((ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) + ctx.rho) * ctx.lambda))) ∨ (ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))))
def Node_D_Lap_source_7_raw : String := "\\rho=0,"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 7, "location": "ES_46_RV6.md:764:D_Lap:formula-7", "source": "\\rho=0,", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_7 (ctx : FormalContext) : Prop := (ctx.rho = 0)
def Node_D_Lap_source_8_raw : String := "\\boxed{ b_k = \\frac{2\\pi}{k\\lambda}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 8, "location": "ES_46_RV6.md:764:D_Lap:formula-8", "source": "\\boxed{ b_k = \\frac{2\\pi}{k\\lambda}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_8 (ctx : FormalContext) : Prop := (ctx.b_k = (((2 : ℝ) * Real.pi) / ((ctx.k : ℝ) * ctx.lambda)))
def Node_D_Lap_source_9_raw : String := "\\boxed{ Z_{\\rm VED\\to Lap} = \\left\\{ \\frac12 \\pm i\\frac{2\\pi}{k\\lambda} : k\\in\\mathbb N^+ \\right\\}. }"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 9, "location": "ES_46_RV6.md:764:D_Lap:formula-9", "source": "\\boxed{ Z_{\\rm VED\\to Lap} = \\left\\{ \\frac12 \\pm i\\frac{2\\pi}{k\\lambda} : k\\in\\mathbb N^+ \\right\\}. }", "status": "FORMALIZED_PROP", "type": "Prop", "role": "DECLARATION"}
def Node_D_Lap_source_9 (ctx : FormalContext) : Prop := (ctx.Z_VED_to_Lap = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))) ∨ x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))))}))
def Node_D_Lap_source_10_raw : String := "U_{\\rm Lap}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 10, "location": "ES_46_RV6.md:764:D_Lap:formula-10", "source": "U_{\\rm Lap}", "status": "FORMALIZED_TERM", "type": "Real", "role": "STATEMENT"}
def Node_D_Lap_source_10_term (ctx : FormalContext) : ℝ := (ctx.U_Lap)
def Node_D_Lap_source_11_raw : String := "t"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 11, "location": "ES_46_RV6.md:764:D_Lap:formula-11", "source": "t", "status": "FORMALIZED_TERM", "type": "Real", "role": "STATEMENT"}
def Node_D_Lap_source_11_term (ctx : FormalContext) : ℝ := (ctx.t)
def Node_D_Lap_source_12_raw : String := "c=1"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "D_Lap", "formula": 12, "location": "ES_46_RV6.md:764:D_Lap:formula-12", "source": "c=1", "status": "FORMALIZED_PROP", "type": "Prop", "role": "STATEMENT"}
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
-- SOURCE: ES_46_RV6.md:888
-- FORMULA: P_{F3}: \quad F = 2dt \left( 1+\frac12dt \right).
def Node_P_F3_2_source_1_raw : String := "P_{F3}: \\quad F = 2dt \\left( 1+\\frac12dt \\right)."
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_F3_2", "formula": 1, "location": "ES_46_RV6.md:888:P_F3_2:formula-1", "source": "P_{F3}: \\quad F = 2dt \\left( 1+\\frac12dt \\right).", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_F3_2_source_1 (ctx : FormalContext) : Prop := (ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))
-- DEMUESTRA_DEDUCTIVE_LINK: P_F3_2|1|CLAIM|-|P_F3|NO_CERTIFICADO
theorem derive_P_F3_2 (ctx : FormalContext) (h_P_F3 : ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt)))))) : ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))) := by
  exact h_P_F3
-- DEMUESTRA_ASSERTION: P_F3_2|COMPLETA|VERIFICADA_ESTRUCTURAL

-- FORMAL_NODE: P_Lap_Z
-- SOURCE: ES_46_RV6.md:851
-- FORMULA: \Re(s)=\frac12.
-- FORMULA: U_{\rm VED}
-- FORMULA: k
-- FORMULA: k
def Node_P_Lap_Z_source_1_raw : String := "\\Re(s)=\\frac12."
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_Lap_Z", "formula": 1, "location": "ES_46_RV6.md:851:P_Lap_Z:formula-1", "source": "\\Re(s)=\\frac12.", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
def Node_P_Lap_Z_source_1 (ctx : FormalContext) : Prop := (ctx.Z_VED_to_Lap ⊆ ({s | (Complex.re s) = ((1 : ℝ) / (2 : ℝ))}))
def Node_P_Lap_Z_source_2_raw : String := "U_{\\rm VED}"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Lap_Z", "formula": 2, "location": "ES_46_RV6.md:851:P_Lap_Z:formula-2", "source": "U_{\\rm VED}", "status": "FORMALIZED_TERM", "type": "Set[Real]", "role": "PROOF_STEP"}
def Node_P_Lap_Z_source_2_term (ctx : FormalContext) : Set (ℝ) := (ctx.U_VED)
def Node_P_Lap_Z_source_3_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Lap_Z", "formula": 3, "location": "ES_46_RV6.md:851:P_Lap_Z:formula-3", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "PROOF_STEP"}
def Node_P_Lap_Z_source_3_term (ctx : FormalContext) : ℕ := (ctx.k)
def Node_P_Lap_Z_source_4_raw : String := "k"
-- DEMUESTRA_SOURCE_FORMULA: {"node": "P_Lap_Z", "formula": 4, "location": "ES_46_RV6.md:851:P_Lap_Z:formula-4", "source": "k", "status": "FORMALIZED_TERM", "type": "Nat", "role": "PROOF_STEP"}
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
-- SOURCE: ES_46_RV6.md:899
-- FORMULA: P_{\rm Lap}(Z): \quad Z_{\rm VED\to Lap} \subset \{s:\Re(s)=1/2\}.
def Node_P_Lap_Z_2_source_1_raw : String := "P_{\\rm Lap}(Z): \\quad Z_{\\rm VED\\to Lap} \\subset \\{s:\\Re(s)=1/2\\}."
-- DEMUESTRA_SOURCE_CLAIM: {"node": "P_Lap_Z_2", "formula": 1, "location": "ES_46_RV6.md:899:P_Lap_Z_2:formula-1", "source": "P_{\\rm Lap}(Z): \\quad Z_{\\rm VED\\to Lap} \\subset \\{s:\\Re(s)=1/2\\}.", "status": "FORMALIZED_UNPROVEN", "type": "Prop", "role": "CLAIM"}
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
def DeductiveLink_P_VED_E_1 (ctx : FormalContext) : Prop := ((((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → (Node_P_VED_E_source_1 ctx)
def DeductiveLink_P_VED_E_2 (ctx : FormalContext) : Prop := (Node_P_VED_E_source_1 ctx) → ((((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → (Node_P_VED_E_source_2 ctx)
def DeductiveLink_P_VED_E_3 (ctx : FormalContext) : Prop := (Node_P_VED_E_source_2 ctx) → ((((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → (Node_P_VED_E_source_3 ctx)
def DeductiveLink_P_VED_E_4 (ctx : FormalContext) : Prop := (Node_P_VED_E_source_3 ctx) → ((((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → (Node_P_VED_E_source_4 ctx)
def DeductiveLink_P_VED_E_5 (ctx : FormalContext) : Prop := (Node_P_VED_E_source_4 ctx) → ((((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → (Node_P_VED_E_source_5 ctx)
def DeductiveLink_P_RHO_ISO_1 (ctx : FormalContext) : Prop := (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (Node_P_RHO_ISO_source_1 ctx)
def DeductiveLink_P_RHO_ISO_2 (ctx : FormalContext) : Prop := (Node_P_RHO_ISO_source_1 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (Node_P_RHO_ISO_source_2 ctx)
def DeductiveLink_P_RHO_ISO_3 (ctx : FormalContext) : Prop := (Node_P_RHO_ISO_source_2 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (Node_P_RHO_ISO_source_3 ctx)
def DeductiveLink_P_v_1 (ctx : FormalContext) : Prop := (True) → ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → (Node_P_v_source_1 ctx)
def DeductiveLink_P_v_2 (ctx : FormalContext) : Prop := (Node_P_v_source_1 ctx) → (True) → ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → (Node_P_v_source_2 ctx)
def DeductiveLink_P_ST_2_1 (ctx : FormalContext) : Prop := ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → (Node_P_ST_2_source_1 ctx)
def DeductiveLink_P_VED_I_1 (ctx : FormalContext) : Prop := ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))) → (Node_P_VED_I_source_1 ctx)
def DeductiveLink_P_VED_I_2 (ctx : FormalContext) : Prop := (Node_P_VED_I_source_1 ctx) → ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))) → (Node_P_VED_I_source_2 ctx)
def DeductiveLink_P_VED_E_2_1 (ctx : FormalContext) : Prop := ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))) → (Node_P_VED_E_2_source_1 ctx)
def DeductiveLink_P_RIM_S_1 (ctx : FormalContext) : Prop := (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → (Node_P_RIM_S_source_1 ctx)
def DeductiveLink_P_RIM_S_2 (ctx : FormalContext) : Prop := (Node_P_RIM_S_source_1 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → (Node_P_RIM_S_source_2 ctx)
def DeductiveLink_P_a_1 (ctx : FormalContext) : Prop := ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → ((ctx.Derivative_t (ctx.DerivativeSubject_s) = ctx.v)) → (Node_P_a_source_1 ctx)
def DeductiveLink_P_VED_K_E_1 (ctx : FormalContext) : Prop := ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))) → ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_cierre_no_estable)) → (Node_P_VED_K_E_source_1 ctx)
def DeductiveLink_P_VED_K_E_2 (ctx : FormalContext) : Prop := (Node_P_VED_K_E_source_1 ctx) → ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))) → ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_cierre_no_estable)) → (Node_P_VED_K_E_source_2 ctx)
def DeductiveLink_P_VED_K_E_3 (ctx : FormalContext) : Prop := (Node_P_VED_K_E_source_2 ctx) → ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))) → ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_cierre_no_estable)) → (Node_P_VED_K_E_source_3 ctx)
def DeductiveLink_P_VED_K_E_4 (ctx : FormalContext) : Prop := (Node_P_VED_K_E_source_3 ctx) → ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))) → ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_cierre_no_estable)) → (Node_P_VED_K_E_source_4 ctx)
def DeductiveLink_P_VED_K_E_5 (ctx : FormalContext) : Prop := (Node_P_VED_K_E_source_4 ctx) → ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))) → ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_cierre_no_estable)) → (Node_P_VED_K_E_source_5 ctx)
def DeductiveLink_P_VR_rho_1 (ctx : FormalContext) : Prop := (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_1 ctx)
def DeductiveLink_P_VR_rho_2 (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_1 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_2 ctx)
def DeductiveLink_P_VR_rho_3 (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_2 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_3 ctx)
def DeductiveLink_P_VR_rho_4 (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_3 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_4 ctx)
def DeductiveLink_P_VR_rho_5 (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_4 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_5 ctx)
def DeductiveLink_P_VR_rho_6 (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_5 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_6 ctx)
def DeductiveLink_P_VR_rho_7 (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_6 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_7 ctx)
def DeductiveLink_P_VR_rho_8 (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_7 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_8 ctx)
def DeductiveLink_P_VR_rho_9 (ctx : FormalContext) : Prop := (Node_P_VR_rho_source_8 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (Node_P_VR_rho_source_9 ctx)
def DeductiveLink_P_VR_E_1 (ctx : FormalContext) : Prop := ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_VR_E_source_1 ctx)
def DeductiveLink_P_VR_E_2 (ctx : FormalContext) : Prop := (Node_P_VR_E_source_1 ctx) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_VR_E_source_2 ctx)
def DeductiveLink_P_VR_E_3 (ctx : FormalContext) : Prop := (Node_P_VR_E_source_2 ctx) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_VR_E_source_3 ctx)
def DeductiveLink_P_VR_E_4 (ctx : FormalContext) : Prop := (Node_P_VR_E_source_3 ctx) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_P_VR_E_source_4 ctx)
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
def DeductiveLink_P_VED_R_C_1 (ctx : FormalContext) : Prop := ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_cierre_no_estable)) → ((((ctx.rho = 0)) → (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = ((k, 0)))})))) → (Node_P_VED_R_C_source_1 ctx)
def DeductiveLink_T_RIEMANN_1 (ctx : FormalContext) : Prop := (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_1 ctx)
def DeductiveLink_T_RIEMANN_2 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_1 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_2 ctx)
def DeductiveLink_T_RIEMANN_3 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_2 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_3 ctx)
def DeductiveLink_T_RIEMANN_4 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_3 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_4 ctx)
def DeductiveLink_T_RIEMANN_5 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_4 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_5 ctx)
def DeductiveLink_T_RIEMANN_6 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_5 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_6 ctx)
def DeductiveLink_T_RIEMANN_8 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_7 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_8 ctx)
def DeductiveLink_T_RIEMANN_9 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_8 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_9 ctx)
def DeductiveLink_T_RIEMANN_10 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_9 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_10 ctx)
def DeductiveLink_T_RIEMANN_11 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_10 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_11 ctx)
def DeductiveLink_T_RIEMANN_12 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_11 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_12 ctx)
def DeductiveLink_T_RIEMANN_13 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_12 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_13 ctx)
def DeductiveLink_T_RIEMANN_14 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_13 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_14 ctx)
def DeductiveLink_T_RIEMANN_15 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_14 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_15 ctx)
def DeductiveLink_T_RIEMANN_16 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_15 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_16 ctx)
def DeductiveLink_T_RIEMANN_17 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_16 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_17 ctx)
def DeductiveLink_T_RIEMANN_18 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_17 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_18 ctx)
def DeductiveLink_T_RIEMANN_19 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_18 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_19 ctx)
def DeductiveLink_T_RIEMANN_20 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_19 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_20 ctx)
def DeductiveLink_T_RIEMANN_21 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_20 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_21 ctx)
def DeductiveLink_T_RIEMANN_22 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_21 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_22 ctx)
def DeductiveLink_T_RIEMANN_23 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_22 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_23 ctx)
def DeductiveLink_T_RIEMANN_24 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_23 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_24 ctx)
def DeductiveLink_T_RIEMANN_25 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_24 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_25 ctx)
def DeductiveLink_T_RIEMANN_26 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_25 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_26 ctx)
def DeductiveLink_T_RIEMANN_27 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_26 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_27 ctx)
def DeductiveLink_T_RIEMANN_28 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_27 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_28 ctx)
def DeductiveLink_T_RIEMANN_29 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_28 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_29 ctx)
def DeductiveLink_T_RIEMANN_30 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_29 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_30 ctx)
def DeductiveLink_T_RIEMANN_31 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_30 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_31 ctx)
def DeductiveLink_T_RIEMANN_32 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_31 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_32 ctx)
def DeductiveLink_T_RIEMANN_33 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_32 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_33 ctx)
def DeductiveLink_T_RIEMANN_34 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_33 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_34 ctx)
def DeductiveLink_T_RIEMANN_35 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_34 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_35 ctx)
def DeductiveLink_T_RIEMANN_36 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_35 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_36 ctx)
def DeductiveLink_T_RIEMANN_37 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_36 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_37 ctx)
def DeductiveLink_T_RIEMANN_38 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_37 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_38 ctx)
def DeductiveLink_T_RIEMANN_39 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_38 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_39 ctx)
def DeductiveLink_T_RIEMANN_40 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_39 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_40 ctx)
def DeductiveLink_T_RIEMANN_41 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_40 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_41 ctx)
def DeductiveLink_T_RIEMANN_42 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_41 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_42 ctx)
def DeductiveLink_T_RIEMANN_43 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_42 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_43 ctx)
def DeductiveLink_T_RIEMANN_45 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_43 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_45 ctx)
def DeductiveLink_T_RIEMANN_46 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_45 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_46 ctx)
def DeductiveLink_T_RIEMANN_47 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_46 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_47 ctx)
def DeductiveLink_T_RIEMANN_48 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_47 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_48 ctx)
def DeductiveLink_T_RIEMANN_49 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_48 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_49 ctx)
def DeductiveLink_T_RIEMANN_50 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_49 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_50 ctx)
def DeductiveLink_T_RIEMANN_71 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_50 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_71 ctx)
def DeductiveLink_T_RIEMANN_103 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_71 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_103 ctx)
def DeductiveLink_T_RIEMANN_104 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_103 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_104 ctx)
def DeductiveLink_T_RIEMANN_121 (ctx : FormalContext) : Prop := (Node_T_RIEMANN_source_104 ctx) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → (Node_T_RIEMANN_source_121 ctx)
def DeductiveLink_P_VED_Completo_1 (ctx : FormalContext) : Prop := ((((ctx.rho = 0)) → (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = ((k, 0)))})))) → (((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) → (Node_P_VED_Completo_source_1 ctx)
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
def DeductiveLink_P_F3_2_1 (ctx : FormalContext) : Prop := ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))) → (Node_P_F3_2_source_1 ctx)
def DeductiveLink_P_Lap_Z_1 (ctx : FormalContext) : Prop := ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))) → ((((ctx.s_PM) = ((ctx.a + ctx.ib)) ∨ (ctx.s_PM) = ((ctx.a - ctx.ib)))) ∧ (ctx.a = ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.Pow_Real (ctx.e) (ctx.ibT)) = (1) ∨ (ctx.Pow_Real (ctx.e) (-ctx.ibT)) = (1))) ∧ (ctx.bT = ((2 : ℝ) * Real.pi)) ∧ (((ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) + ctx.rho) * ctx.lambda))) ∨ (ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))) ∧ (ctx.rho = 0) ∧ (ctx.b_k = (((2 : ℝ) * Real.pi) / ((ctx.k : ℝ) * ctx.lambda))) ∧ (ctx.Z_VED_to_Lap = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))) ∨ x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))))}))) → (Node_P_Lap_Z_source_1 ctx)
def DeductiveLink_P_Lap_Z_2_1 (ctx : FormalContext) : Prop := ((ctx.Z_VED_to_Lap ⊆ ({s | (Complex.re s) = ((1 : ℝ) / (2 : ℝ))}))) → (Node_P_Lap_Z_2_source_1 ctx)
def DeductiveNode_D_fInv (ctx : FormalContext) : Prop := ((ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate))) → (((∀ x_map : ℂ, x_map ∈ ctx.U_Rim_rho → (ctx.f_inv_fn_1 x_map) ∈ ctx.U_VED_rho)) ∧ ((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.f_inv_fn_1 (ctx.f_fn_1 x_all)) = x_all)) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.f_fn_1 (ctx.f_inv_fn_1 z_all)) = z_all))))
def DeductiveNode_P_COORD (ctx : FormalContext) : Prop := ((ctx.U = (((3 : ℝ) * ctx.S) + ctx.T))) → (((((ctx.dy = 0) ∧ (ctx.dz = 0)) ∧ (ctx.ds = ctx.dx)) → (ctx.U = (((3 : ℝ) * ctx.S) + ctx.T))))
def DeductiveNode_P_VED_Inv (ctx : FormalContext) : Prop := ((ctx.E = (ctx.hc / ctx.lambda)) ∧ (ctx.E = ctx.Mc ^ 2) ∧ (ctx.Mc ^ 2 = (ctx.hc / ctx.lambda)) ∧ (ctx.lambda = (ctx.h / ctx.Mc))) → ((ctx.L = (ctx.n * ctx.lambda)) ∧ (ctx.n ∈ {x : ℝ | 0 < x})) → (((((2 : ℝ) * Real.pi) * ctx.R_VED) = ctx.L) ∧ ((ctx.R_VED = (ctx.L / ((2 : ℝ) * Real.pi))) ∧ ((ctx.L / ((2 : ℝ) * Real.pi)) = ((ctx.n * ctx.lambda) / ((2 : ℝ) * Real.pi)))) ∧ (((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → ((((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED)))
def DeductiveNode_T_ISO (ctx : FormalContext) : Prop := ((ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate))) → (((∀ x_map : ℂ, x_map ∈ ctx.U_Rim_rho → (ctx.f_inv_fn_1 x_map) ∈ ctx.U_VED_rho)) ∧ ((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.f_inv_fn_1 (ctx.f_fn_1 x_all)) = x_all)) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.f_fn_1 (ctx.f_inv_fn_1 z_all)) = z_all)))) → (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate))))
def DeductiveNode_P_ST (ctx : FormalContext) : Prop := (((((ctx.dy = 0) ∧ (ctx.dz = 0)) ∧ (ctx.ds = ctx.dx)) → (ctx.U = (((3 : ℝ) * ctx.S) + ctx.T)))) → (True) → ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2)))
def DeductiveNode_P_VED_E (ctx : FormalContext) : Prop := ((((ctx.Representation_U_VED_onda = ctx.Representation_U_VED_cerrada__abierta) ∧ (ctx.Representation_U_VED_cerrada__abierta = ctx.Representation_U_VED_R_VED)) ∧ (ctx.Representation_U_VED_R_VED = ctx.Representation_U_VED_L__R_VED))) → ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable)))
def DeductiveNode_P_RHO_ISO (ctx : FormalContext) : Prop := (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → ((ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ Set.Icc 0 ((1 : ℝ) / (2 : ℝ))})) ∧ (((∀ x_map : ℝ, x_map ∈ ctx.U_VED_rho → (ctx.f_fn_1 x_map) ∈ ctx.U_Rim_rho)) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all)))))
def DeductiveNode_P_v (ctx : FormalContext) : Prop := (True) → ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → ((ctx.Derivative_t (ctx.DerivativeSubject_s) = ctx.v))
def DeductiveNode_P_ST_2 (ctx : FormalContext) : Prop := ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2)))
def DeductiveNode_P_VED_I (ctx : FormalContext) : Prop := ((ctx.k ∈ {x : ℕ | 0 < x})) → ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))) → ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_cierre_no_estable))
def DeductiveNode_P_VED_E_2 (ctx : FormalContext) : Prop := ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))) → (((ctx.rho = 0) ↔ ctx.Text_estado_estable))
def DeductiveNode_P_RIM_S (ctx : FormalContext) : Prop := (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0))))
def DeductiveNode_P_a (ctx : FormalContext) : Prop := ((ctx.dt_prime = (ctx.dt * (ctx.sqrt ((1 : ℝ) - (ctx.v ^ 2 / ctx.c ^ 2))))) ∧ (ctx.v = ctx.Derivative_t (ctx.DerivativeSubject_s)) ∧ (ctx.c = 1) ∧ (ctx.dt_prime ^ 2 = (ctx.dt ^ 2 - ctx.ds ^ 2))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → ((ctx.Derivative_t (ctx.DerivativeSubject_s) = ctx.v)) → (((ctx.Derivative_t (ctx.Derivative_t (ctx.DerivativeSubject_s)) = ctx.Derivative_t (ctx.v)) ∧ (ctx.Derivative_t (ctx.v) = ctx.Derivative_t (ctx.v))))
def DeductiveNode_P_VED_K_E (ctx : FormalContext) : Prop := ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))) → ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_cierre_no_estable)) → ((((ctx.rho = 0)) → (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = ((k, 0)))}))))
def DeductiveNode_P_VR_rho (ctx : FormalContext) : Prop := (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))))))
def DeductiveNode_P_VR_E (ctx : FormalContext) : Prop := ((((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x}))) ∧ (((ctx.n = ctx.k) ∧ (ctx.k ∈ {x : ℕ | 0 < x})) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda)))) ∧ ((ctx.L = ((ctx.k : ℝ) * ctx.lambda)) ↔ ctx.Text_cierre_exacto_en_fase)) ∧ (ctx.Text_cierre_exacto_en_fase ↔ ctx.Text_estado_estable))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → ((ctx.Text_estado_estable ↔ ((abs (ctx.a - ((1 : ℝ) / (2 : ℝ)))) = 0)))
def DeductiveNode_P_Z (ctx : FormalContext) : Prop := (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → ((((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib)))) ∧ ((ctx.zeta ctx.s) = ctx.InfiniteSum_Nat_Complex (1) (fun n : ℕ => ((1 : ℂ) / ctx.Pow_Complex ((n : ℂ)) (ctx.s) : ℂ))) ∧ (ctx.s = 1) ∧ (ctx.Z_Rim_triv = ({x | ∃ m : ℕ, (m ∈ {x : ℕ | 0 < x}) ∧ (x = ((-2 * (m : ℤ))))})) ∧ (ctx.Z_Rim_nt = ({z | ((z ∈ (Set.univ : Set ℂ)) ∧ ((ctx.zeta z) = 0)) ∧ ((0 < (Complex.re z)) ∧ ((Complex.re z) < 1))})) ∧ ((((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib)))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED))))
def DeductiveNode_P_VED_R_C (ctx : FormalContext) : Prop := ((((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_cierre_no_estable)) → ((((ctx.rho = 0)) → (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = ((k, 0)))})))) → ((ctx.rho = (ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ∧ ((((ctx.n) = (((ctx.k : ℝ) + ctx.rho)) ∨ (ctx.n) = (((ctx.k : ℝ) - ctx.rho)))) ∧ (ctx.k ∈ {x : ℕ | 0 < x}) ∧ ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))) → (((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))))
def DeductiveNode_T_RIEMANN (ctx : FormalContext) : Prop := (((∃ h : ↥(ctx.U_VED_rho) ≃ ↥(ctx.U_Rim_rho), (∀ x_iso : ↥(ctx.U_VED_rho), (h x_iso).val = ctx.f_fn_1 x_iso.val) ∧ (∀ z_iso : ↥(ctx.U_Rim_rho), (h.symm z_iso).val = ctx.f_inv_fn_1 z_iso.val) ∧ (∀ x_coordinate : ℝ, x_coordinate ∈ ctx.U_VED_rho → ctx.rho_R_fn_1 (ctx.f_fn_1 x_coordinate) = ctx.rho_VED_fn_1 x_coordinate) ∧ (∀ x_coordinate : ℂ, x_coordinate ∈ ctx.U_Rim_rho → ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 x_coordinate) = ctx.rho_R_fn_1 x_coordinate)))) → (((∀ x_all : ℝ, x_all ∈ ctx.U_VED_rho → ((ctx.rho_R_fn_1 (ctx.f_fn_1 x_all)) = (ctx.rho_VED_fn_1 x_all))) ∧ (∀ z_all : ℂ, z_all ∈ ctx.U_Rim_rho → ((ctx.rho_VED_fn_1 (ctx.f_inv_fn_1 z_all)) = (ctx.rho_R_fn_1 z_all))))) → ((∀ z : ℂ, (z ∈ ctx.U_Rim) → ((ctx.Stable_Rim_fn_1 z) ↔ ((ctx.rho_R_fn_1 z) = 0)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (((ctx.zeta z) = 0) ∧ (ctx.rho_R = ctx.rho_VED)))) → ((ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)) ∧ ((0 ≤ ctx.rho_R) ∧ (ctx.rho_R < ((1 : ℝ) / (2 : ℝ)))) ∧ (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = (abs ((Complex.re ctx.z) - ((1 : ℝ) / (2 : ℝ)))))) → (((ctx.rho_VED = ctx.rho_R) ∧ (ctx.rho_R = (abs (ctx.a - ((1 : ℝ) / (2 : ℝ))))))) → ((((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib)))) ∧ ((ctx.zeta ctx.s) = ctx.InfiniteSum_Nat_Complex (1) (fun n : ℕ => ((1 : ℂ) / ctx.Pow_Complex ((n : ℂ)) (ctx.s) : ℂ))) ∧ (ctx.s = 1) ∧ (ctx.Z_Rim_triv = ({x | ∃ m : ℕ, (m ∈ {x : ℕ | 0 < x}) ∧ (x = ((-2 * (m : ℤ))))})) ∧ (ctx.Z_Rim_nt = ({z | ((z ∈ (Set.univ : Set ℂ)) ∧ ((ctx.zeta z) = 0)) ∧ ((0 < (Complex.re z)) ∧ ((Complex.re z) < 1))})) ∧ ((((ctx.z) = ((ctx.a + ctx.ib)) ∨ (ctx.z) = ((ctx.a - ctx.ib)))) ∧ ((0 < ctx.a) ∧ (ctx.a < 1)))) → ((∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → ((Complex.re z) = ((1 : ℝ) / (2 : ℝ)))))
def DeductiveNode_P_VED_Completo (ctx : FormalContext) : Prop := ((((ctx.rho = 0)) → (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = ((k, 0)))})))) → (((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) → ((ctx.U_VED_cerrado = (ctx.mathcal_E_VED ∪ ctx.mathcal_I_VED)))
def DeductiveNode_P_VS (ctx : FormalContext) : Prop := (((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))) → ((ctx.U_VED_cerrado = (ctx.mathcal_E_VED ∪ ctx.mathcal_I_VED))) → ((ctx.tilde_N = (ctx.R_VED * ctx.R_Sch)) ∧ (ctx.R_Sch = (ctx.tilde_N / ctx.R_VED)) ∧ (ctx.R_VED = (ctx.tilde_N / ctx.R_Sch)) ∧ ((ctx.Phi_tilde_N_fn_1 ctx.R_VED = ctx.tilde_N / ctx.R_VED)) ∧ (Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))) → ((Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch))))
def DeductiveNode_P_F (ctx : FormalContext) : Prop := ((ctx.tilde_N = (ctx.R_VED * ctx.R_Sch)) ∧ (ctx.R_Sch = (ctx.tilde_N / ctx.R_VED)) ∧ (ctx.R_VED = (ctx.tilde_N / ctx.R_Sch)) ∧ ((ctx.Phi_tilde_N_fn_1 ctx.R_VED = ctx.tilde_N / ctx.R_VED)) ∧ (Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))) → ((Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → ((ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime)))))
def DeductiveNode_P_F1 (ctx : FormalContext) : Prop := ((Nonempty (↥(ctx.U_VED) ≃ₜ ↥(ctx.U_Sch)))) → ((ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))) → ((ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime)))))
def DeductiveNode_P_W (ctx : FormalContext) : Prop := ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c))
def DeductiveNode_P_F2 (ctx : FormalContext) : Prop := ((ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + (((2 : ℝ) * ctx.dt) * (1 : ℝ)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt))))
def DeductiveNode_P_F3 (ctx : FormalContext) : Prop := ((ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * ctx.Derivative_t (ctx.t_prime))))) → ((ctx.v_onda = ctx.c)) → ((ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)))) → ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt)))))
def DeductiveNode_D_Lap (ctx : FormalContext) : Prop := ((ctx.F = (((2 : ℝ) * ctx.dt) * ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))) → ((((ctx.s_PM) = ((ctx.a + ctx.ib)) ∨ (ctx.s_PM) = ((ctx.a - ctx.ib)))) ∧ (ctx.a = ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.T_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.Pow_Real (ctx.e) (ctx.ibT)) = (1) ∨ (ctx.Pow_Real (ctx.e) (-ctx.ibT)) = (1))) ∧ (ctx.bT = ((2 : ℝ) * Real.pi)) ∧ (((ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) + ctx.rho) * ctx.lambda))) ∨ (ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))) ∧ (ctx.rho = 0) ∧ (ctx.b_k = (((2 : ℝ) * Real.pi) / ((ctx.k : ℝ) * ctx.lambda))) ∧ (ctx.Z_VED_to_Lap = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))) ∨ x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (Complex.I * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))))})))
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
