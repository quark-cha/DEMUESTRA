import Mathlib

set_option maxHeartbeats 100000

namespace ES_46_RV6

structure FormalContext where
  A : ℝ
  A_7 : ℝ
  D : ℝ
  D_R_VED : ℝ
  D_rho_R : ℝ
  DivergesToInfinity : ℝ → Prop
  E : ℝ
  F : ℝ
  F3 : ℝ
  G : ℝ
  G_fn_1 : ℝ → ℝ
  I : ℝ
  L : ℝ
  L_fn_2 : ℕ → ℝ → ℝ
  L_to_INFINITY : ℝ
  Lap : ℝ
  Mc : ℝ
  P : ℝ
  P_F3 : ℝ
  P_VED : ℝ
  P_VED_fn_1 : ℝ → ℝ
  P_VR : ℝ
  P_VR_fn_1 : ℝ → ℝ
  Phi : ℝ
  Phi_tilde_N : ℝ
  R_Sch : ℝ
  R_VED : ℝ
  R_VED_fn_2 : ℕ → ℝ → ℝ
  R_VED_to_INFINITY : ℝ
  R_rho : ℝ
  R_rho_fn_1 : ℝ → ℝ
  R_rho_inv : ℝ
  R_rho_inv_fn_1 : ℝ → ℝ
  Rim : ℝ
  S : ℝ
  Sch : ℝ
  Stable : ℝ
  Stable_Rim : ℝ
  Stable_Rim_fn_1 : ℂ → Prop
  T : ℝ
  T_fn_2 : ℕ → ℝ → ℝ
  Text_cierre_exacto_en_fase : Prop
  Text_cierre_no_estable : Prop
  Text_clase_estable : Prop
  Text_clase_no_estable : Prop
  Text_clasifica_su_localizaci_n_transversal : Prop
  Text_estado_estable : Prop
  Text_estado_no_estable : Prop
  Text_onda_abierta_o_libre : Prop
  U : ℝ
  U_Lap : ℝ
  U_Rim : Set (ℂ)
  U_Rim_rho : Set (ℂ)
  U_Sch : ℝ
  U_VED : ℝ
  U_VED_cerrado : ℝ
  U_VED_fn_1 : Prop → ℝ
  U_VED_fn_2 : Prop → Prop → ℝ
  U_VED_rho : Set (ℝ)
  VED : ℝ
  VED_to_Lap : ℝ
  VR : ℝ
  Z_Rim : ℝ
  Z_Rim_nt : Set (ℂ)
  Z_Rim_triv : Set (ℝ)
  Z_VED_to_Lap : Set (ℂ)
  a : ℝ
  b : ℝ
  bT : ℝ
  b_fn_2 : ℕ → ℝ → ℝ
  b_k : ℝ
  c : ℝ
  cerrado : ℝ
  cong : ℝ
  d : ℝ
  dist : ℝ
  dist_fn_2 : ℝ → Set (ℕ) → ℝ
  ds : ℝ
  dt : ℝ
  dt_fn_1 : ℝ → ℝ
  dt_prime : ℝ
  dt_prime_to_0 : ℝ
  dv : ℝ
  dx : ℝ
  dy : ℝ
  dz : ℝ
  e : ℝ
  f : ℝ
  f_fn_1 : ℝ → ℝ
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
  leftrightarrow : ℝ
  lim : ℝ
  lim_n_to_INFINITY : ℝ
  longleftrightarrow : ℝ
  longrightarrow : ℝ
  m : ℕ
  mapsto : ℝ
  mathcal_E : ℝ
  mathcal_E_VED : Set (ℕ × ℕ)
  mathcal_I : ℝ
  mathcal_I_VED : ℝ
  n : ℝ
  n_s : ℝ
  n_to_INFINITY : ℝ
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
  sum : ℝ
  t : ℝ
  t_prime : ℝ
  tilde_N : ℝ
  triv : ℝ
  v : ℝ
  v_onda : ℝ
  v_to_c : ℝ
  varepsilon : ℝ
  x : ℝ
  z : ℂ
  z_varepsilon_PM : ℝ
  zeta : ℂ → ℂ

-- FORMAL_NODE: D_U
-- SOURCE: ES_46_RV6.md:29
-- FORMULA: \boxed{ U=3S+T. }
-- FORMULA: dy=0, \qquad dz=0,
-- FORMULA: ds=dx.
-- FORMULA: x
def Node_D_U (ctx : FormalContext) : Prop := (ctx.U = (((3 : ℝ) * ctx.S) + ctx.T))

-- FORMAL_NODE: D_t_prime
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \frac{dt'}{dt}.
-- FORMULA: t'
-- FORMULA: t'
-- FORMULA: dt'
def Node_D_t_prime (ctx : FormalContext) : Prop := True

-- FORMAL_NODE: A_L
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: dt' = dt \sqrt{ 1-\frac{v^2}{c^2} }.
-- FORMULA: \boxed{ v=\frac{ds}{dt}. }
-- FORMULA: c=1.
-- FORMULA: dt'^2 = dt^2-ds^2,
-- FORMULA: v
def Node_A_L (ctx : FormalContext) : Prop := (ctx.v = (ctx.ds / ctx.dt))

-- FORMAL_NODE: D_lambda
-- SOURCE: ES_46_RV6.md:174
-- FORMULA: E=\frac{hc}{\lambda},
-- FORMULA: E=Mc^2,
-- FORMULA: Mc^2=\frac{hc}{\lambda},
-- FORMULA: \boxed{ \lambda=\frac{h}{Mc}. }
-- FORMULA: \lambda
def Node_D_lambda (ctx : FormalContext) : Prop := (ctx.lambda = (ctx.h / ctx.Mc))

-- FORMAL_NODE: D_L
-- SOURCE: ES_46_RV6.md:174
-- FORMULA: \boxed{ L=n\lambda. }
-- FORMULA: n\in\mathbb R^+.
-- FORMULA: 2\pi R_{\rm VED}=L.
-- FORMULA: \boxed{ R_{\rm VED} = \frac{L}{2\pi} = \frac{n\lambda}{2\pi}. }
-- FORMULA: \boxed{ U_{\rm VED}(\text{onda}) = U_{\rm VED}(\text{cerrada},\text{abierta}) = U_{\rm VED}(R_{\rm VED}) = U_{\rm VED}(L,R_{\rm VED}). }
-- FORMULA: L
-- FORMULA: U_{\rm VED}
-- FORMULA: D_{R_{\rm VED}}
-- FORMULA: L
-- FORMULA: 3S+T
-- FORMULA: L
def Node_D_L (ctx : FormalContext) : Prop := (ctx.L = (ctx.n * ctx.lambda))

-- FORMAL_NODE: D_k
-- SOURCE: ES_46_RV6.md:314
-- FORMULA: k\in\mathbb N^+
def Node_D_k (ctx : FormalContext) : Prop := (ctx.k ∈ {n : ℕ | 0 < n})

-- FORMAL_NODE: D_rho
-- SOURCE: ES_46_RV6.md:316
-- FORMULA: \boxed{ \rho = \operatorname{dist}(n,\mathbb N^+). }
-- FORMULA: \boxed{ 0\le\rho\le\frac12. }
-- FORMULA: \boxed{ n=k\pm\rho, \qquad k\in\mathbb N^+, \qquad 0\le\rho\le\frac12. }
-- FORMULA: \boxed{ L(k,\rho) = (k\pm\rho)\lambda, }
-- FORMULA: \boxed{ R_{\rm VED}(k,\rho) = \frac{(k\pm\rho)\lambda}{2\pi}. }
-- FORMULA: \rho=0,
-- FORMULA: n=k,
-- FORMULA: L=k\lambda.
-- FORMULA: \rho=1/2
def Node_D_rho (ctx : FormalContext) : Prop := (ctx.rho = ctx.dist_fn_2 ctx.n {n : ℕ | 0 < n}) ∧ (((ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) + ctx.rho) * ctx.lambda)) ∨ (ctx.L_fn_2 ctx.k ctx.rho) = ((((ctx.k : ℝ) - ctx.rho) * ctx.lambda)))) ∧ (((ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) + ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi))) ∨ (ctx.R_VED_fn_2 ctx.k ctx.rho) = (((((ctx.k : ℝ) - ctx.rho) * ctx.lambda) / ((2 : ℝ) * Real.pi)))))

-- FORMAL_NODE: D_Rim
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: z=a\pm ib
-- FORMULA: \zeta(s) = \sum_{n=1}^{\infty}\frac1{n^s}
-- FORMULA: \boxed{s=1.}
-- FORMULA: \boxed{ Z_{\rm Rim}^{\rm triv} = \{-2,-4,-6,\ldots\} = \{-2m:m\in\mathbb N^+\}. }
-- FORMULA: \boxed{ Z_{\rm Rim}^{\rm nt} = \{ z\in\mathbb C: \zeta(z)=0, \; 0<\Re(z)<1 \}. }
-- FORMULA: \boxed{ z=a\pm ib, \qquad 0<a<1. }
-- FORMULA: a \longleftrightarrow 1-a.
-- FORMULA: \boxed{ a=\frac12. }
-- FORMULA: \Re(s)>1
-- FORMULA: U_{\rm Rim}
def Node_D_Rim (ctx : FormalContext) : Prop := (ctx.s = 1) ∧ (ctx.Z_Rim_nt = ({z | ((z ∈ (Set.univ : Set ℂ)) ∧ (ctx.zeta z = 0)) ∧ ((0 < Complex.re z) ∧ (Complex.re z < 1))})) ∧ (ctx.a = ((1 : ℝ) / (2 : ℝ)))

-- FORMAL_NODE: D_rho_R
-- SOURCE: ES_46_RV6.md:1003
-- FORMULA: \qquad \rho_R = \left| a-\frac12 \right|. }
-- FORMULA: 0<a<1,
-- FORMULA: \boxed{ 0\le\rho_R<\frac12, }
-- FORMULA: \boxed{ a = \frac12+\varepsilon\rho_R. }
-- FORMULA: \boxed{ z_{\varepsilon,\pm} = \frac12 + \varepsilon\rho_R \pm ib. }
-- FORMULA: \boxed{ \rho_R = \left| \Re(z)-\frac12 \right|. }
-- FORMULA: \rho_R=1/2
-- FORMULA: \varepsilon=\pm1
def Node_D_rho_R (ctx : FormalContext) : Prop := (ctx.a = (((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R))) ∧ (((ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) + ctx.ib)) ∨ (ctx.z_varepsilon_PM) = (((((1 : ℝ) / (2 : ℝ)) + (ctx.varepsilon * ctx.rho_R)) - ctx.ib)))) ∧ (ctx.rho_R = abs (Complex.re ctx.z - ((1 : ℝ) / (2 : ℝ))))

-- FORMAL_NODE: D_f
-- SOURCE: ES_46_RV6.md:1072
-- FORMULA: U_{\rm VED}^{\rho} = \left\{x:\rho_{\rm VED}(x)\in[0,\tfrac12]\right\}
-- FORMULA: U_{\rm Rim}^{\rho} = \left\{z:\rho_R(z)\in[0,\tfrac12]\right\}.
-- FORMULA: \boxed{ f:U_{\rm VED}^{\rho}\longrightarrow U_{\rm Rim}^{\rho} }
-- FORMULA: \rho
-- FORMULA: a=\Re(z)
-- FORMULA: a=1/2
def Node_D_f (ctx : FormalContext) : Prop := (ctx.U_VED_rho = ({x | ctx.rho_VED_fn_1 x ∈ (Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))})) ∧ (ctx.U_Rim_rho = ({z | ctx.rho_R_fn_1 z ∈ (Set.Icc 0 ((1 : ℝ) / (2 : ℝ)))})) ∧ (ctx.a = Complex.re ctx.z) ∧ (ctx.a = ((1 : ℝ) / (2 : ℝ)))

-- FORMAL_NODE: D_fInv
-- SOURCE: ES_46_RV6.md:1100
-- FORMULA: \boxed{ f^{-1}:U_{\rm Rim}^{\rho}\longrightarrow U_{\rm VED}^{\rho}. }
-- FORMULA: \boxed{ f^{-1}(f(x))=x, \qquad f(f^{-1}(z))=z. }
def Node_D_fInv (ctx : FormalContext) : Prop := True

-- FORMAL_NODE: P_COORD
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: 3S
-- FORMULA: t'
def Node_P_COORD (ctx : FormalContext) : Prop := Node_D_U ctx
theorem derive_P_COORD (ctx : FormalContext) (h_D_U : Node_D_U ctx) : Node_P_COORD ctx := by
  first | assumption | rfl

-- FORMAL_NODE: T_ISO
-- SOURCE: ES_46_RV6.md:1144
-- FORMULA: \boxed{ U_{\rm VED}^{\rho}\cong U_{\rm Rim}^{\rho}. }
-- FORMULA: f
-- FORMULA: f^{-1}
-- FORMULA: \rho=0
-- FORMULA: 0<\rho\le1/2
def Node_T_ISO (ctx : FormalContext) : Prop := (ctx.rho = 0) ∧ ((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))
theorem derive_T_ISO (ctx : FormalContext) (h_D_f : Node_D_f ctx) (h_D_fInv : Node_D_fInv ctx) : Node_T_ISO ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_ST
-- SOURCE: ES_46_RV6.md:1195
-- FORMULA: \qquad ds^2=dt^2-dt'^2. }
-- FORMULA: \boxed{ ds^2=(dt-dt')(dt+dt'). }
-- FORMULA: t
def Node_P_ST (ctx : FormalContext) : Prop := (ctx.ds ^ 2 = ((ctx.dt - ctx.dt_prime) * (ctx.dt + ctx.dt_prime)))
theorem derive_P_ST (ctx : FormalContext) (h_P_COORD : Node_P_COORD ctx) (h_D_t_prime : Node_D_t_prime ctx) (h_A_L : Node_A_L ctx) : Node_P_ST ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_RHO_ISO
-- SOURCE: ES_46_RV6.md:1195
-- FORMULA: \boxed{ \rho_R(f(x))=\rho_{\rm VED}(x), \qquad \rho_{\rm VED}(f^{-1}(z))=\rho_R(z). }
-- FORMULA: \rho=0 \iff \text{clase estable},
-- FORMULA: 0<\rho\le\frac12 \iff \text{clase no estable}
-- FORMULA: \rho
-- FORMULA: f
-- FORMULA: f^{-1}
def Node_P_RHO_ISO (ctx : FormalContext) : Prop := ((ctx.rho = 0) ↔ ctx.Text_clase_estable) ∧ (((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_clase_no_estable)
theorem derive_P_RHO_ISO (ctx : FormalContext) (h_T_ISO : Node_T_ISO ctx) : Node_P_RHO_ISO ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_v
-- SOURCE: ES_46_RV6.md:138
-- FORMULA: \qquad \frac{ds}{dt}=v. }
-- FORMULA: \frac{d^2s}{dt^2}=0.
-- FORMULA: v
def Node_P_v (ctx : FormalContext) : Prop := ((ctx.ds / ctx.dt) = ctx.v) ∧ ((((ctx.d ^ 2 : ℂ) * ctx.s) / (ctx.dt ^ 2 : ℂ)) = 0)
theorem derive_P_v (ctx : FormalContext) (h_D_t_prime : Node_D_t_prime ctx) (h_A_L : Node_A_L ctx) (h_P_ST : Node_P_ST ctx) : Node_P_v ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_RIM_S
-- SOURCE: ES_46_RV6.md:1474
-- FORMULA: \boxed{ \forall z\in U_{\rm Rim}, \qquad \operatorname{Stable}_{\rm Rim}(z) \iff \rho_R(z)=0. }
-- FORMULA: \boxed{ z\in Z_{\rm Rim}^{\rm nt} \Longrightarrow \operatorname{Stable}_{\rm Rim}(z) \Longrightarrow \rho_R(z)=0. }
-- FORMULA: k+\rho \longleftrightarrow k-\rho.
-- FORMULA: \rho=0.
-- FORMULA: \frac12+\rho_R \longleftrightarrow \frac12-\rho_R.
-- FORMULA: \rho_R=0.
-- FORMULA: \boxed{ R_\rho: [0,\tfrac12]_{\rm VED} \longrightarrow [0,\tfrac12]_{\rm Rim} }
-- FORMULA: \boxed{ R_\rho(\rho)=\rho_R=\rho. }
-- FORMULA: \boxed{ R_\rho^{-1}(\rho_R)=\rho_R. }
-- FORMULA: \left| R_\rho(\rho_1)-R_\rho(\rho_2) \right| = |\rho_1-\rho_2|.
-- FORMULA: \rho
-- FORMULA: f
-- FORMULA: f^{-1}
-- FORMULA: U_{\rm Rim}
-- FORMULA: \rho_R(z)\neq0
-- FORMULA: Z_{\rm Rim}^{\rm nt}
-- FORMULA: U_{\rm VED}\leftrightarrow U_{\rm Rim}
-- FORMULA: U_{\rm VED}
-- FORMULA: U_{\rm Rim}
-- FORMULA: R_\rho
def Node_P_RIM_S (ctx : FormalContext) : Prop := (∀ z : ℂ, (z ∈ ctx.U_Rim) → (ctx.Stable_Rim_fn_1 z ↔ (ctx.rho_R_fn_1 z = 0)))
theorem derive_P_RIM_S (ctx : FormalContext) (h_T_ISO : Node_T_ISO ctx) (h_P_RHO_ISO : Node_P_RHO_ISO ctx) : Node_P_RIM_S ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_a
-- SOURCE: ES_46_RV6.md:57
-- FORMULA: \qquad \frac{d^2s}{dt^2} = \frac{dv}{dt} = a. }
-- FORMULA: t
-- FORMULA: t'
-- FORMULA: R_{\rm VED}
def Node_P_a (ctx : FormalContext) : Prop := (((((ctx.d ^ 2 : ℂ) * ctx.s) / (ctx.dt ^ 2 : ℂ)) = (ctx.dv / ctx.dt)) ∧ ((ctx.dv / ctx.dt) = ctx.a))
theorem derive_P_a (ctx : FormalContext) (h_A_L : Node_A_L ctx) (h_P_ST : Node_P_ST ctx) (h_P_v : Node_P_v ctx) : Node_P_a ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_VED_Inv
-- SOURCE: ES_46_RV6.md:?
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
def Node_P_VED_Inv (ctx : FormalContext) : Prop := ((((ctx.DivergesToInfinity (ctx.n)) ↔ (ctx.DivergesToInfinity (ctx.L))) ↔ (ctx.DivergesToInfinity (ctx.R_VED))) ↔ ctx.Text_onda_abierta_o_libre)
theorem derive_P_VED_Inv (ctx : FormalContext) (h_P_a : Node_P_a ctx) (h_D_lambda : Node_D_lambda ctx) (h_D_L : Node_D_L ctx) : Node_P_VED_Inv ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_VED_E
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \qquad \rho=0 \iff n=k\in\mathbb N^+ \iff L=k\lambda \iff \text{cierre exacto en fase} \iff \text{estado estable}. }
-- FORMULA: 0<\rho\le\frac12,
def Node_P_VED_E (ctx : FormalContext) : Prop := (((((ctx.rho = 0) ↔ ((ctx.n = ctx.k) ∧ (ctx.k ∈ {n : ℕ | 0 < n}))) ↔ (ctx.L = ((ctx.k : ℝ) * ctx.lambda))) ↔ ctx.Text_cierre_exacto_en_fase) ↔ ctx.Text_estado_estable)
theorem derive_P_VED_E (ctx : FormalContext) (h_P_VED_Inv : Node_P_VED_Inv ctx) (h_D_k : Node_D_k ctx) (h_D_rho : Node_D_rho ctx) : Node_P_VED_E ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_VED_I
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \qquad 0<\rho\le\frac12 \iff \text{cierre no estable}. }
-- FORMULA: \boxed{ \rho=\frac12 }
-- FORMULA: k\in\mathbb N^+
-- FORMULA: \rho\in\left[0,\frac12\right]
-- FORMULA: n=k\pm\rho.
-- FORMULA: U_{\rm VED}
-- FORMULA: n\in\mathbb R^+
def Node_P_VED_I (ctx : FormalContext) : Prop := (((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_cierre_no_estable)
theorem derive_P_VED_I (ctx : FormalContext) (h_D_k : Node_D_k ctx) (h_D_rho : Node_D_rho ctx) (h_P_VED_E : Node_P_VED_E ctx) : Node_P_VED_I ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_VR_rho
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \qquad \rho_{\rm VED} = \rho_R = \left| a-\frac12 \right|. }
-- FORMULA: \rho_{\rm VED}=0 \iff \text{estado estable}.
-- FORMULA: \rho_{\rm VED} = \left| a-\frac12 \right|.
-- FORMULA: U_{\rm VED}
-- FORMULA: P_{\rm VED}(E)
-- FORMULA: P_{\rm VR}(\rho)
def Node_P_VR_rho (ctx : FormalContext) : Prop := ((ctx.rho_VED = 0) ↔ ctx.Text_estado_estable)
theorem derive_P_VR_rho (ctx : FormalContext) (h_P_VED_E : Node_P_VED_E ctx) : Node_P_VR_rho ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_VED_K_E
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \boxed{ \mathcal E_{\rm VED} = \{(k,0):k\in\mathbb N^+\}. }
-- FORMULA: k=1,2,3,\ldots
-- FORMULA: \rho=0
def Node_P_VED_K_E (ctx : FormalContext) : Prop := (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, (k ∈ {n : ℕ | 0 < n}) ∧ (x = ((k, 0)))}))
theorem derive_P_VED_K_E (ctx : FormalContext) (h_D_rho : Node_D_rho ctx) (h_P_VED_E : Node_P_VED_E ctx) (h_P_VED_I : Node_P_VED_I ctx) : Node_P_VED_K_E ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_VR_E
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \qquad \text{estado estable} \iff \left| a-\frac12 \right| = 0. }
-- FORMULA: \boxed{ \text{estado estable} \iff a=\frac12. }
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
-- FORMULA: U_{\rm VED}
-- FORMULA: U_{\rm Rim}
-- FORMULA: U_{\rm VED}
-- FORMULA: U_{\rm Rim}
-- FORMULA: \zeta
-- FORMULA: U_{\rm Rim}
-- FORMULA: \zeta(z)=0
-- FORMULA: U_{\rm VED}
-- FORMULA: P_{\rm VR}(\rho)
-- FORMULA: U_{\rm Rim}
-- FORMULA: \rho_R
-- FORMULA: U_{\rm VED}
def Node_P_VR_E (ctx : FormalContext) : Prop := (ctx.Text_estado_estable ↔ (ctx.a = ((1 : ℝ) / (2 : ℝ)))) ∧ ((ctx.rho = 0) ↔ ctx.Text_estado_estable) ∧ (((0 < ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ)))) ↔ ctx.Text_estado_no_estable)
theorem derive_P_VR_E (ctx : FormalContext) (h_P_VR_rho : Node_P_VR_rho ctx) : Node_P_VR_E ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_VED_K_I
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \rho=1/2
-- FORMULA: k
def Node_P_VED_K_I (ctx : FormalContext) : Prop := (ctx.rho = ((1 : ℝ) / (2 : ℝ)))
theorem derive_P_VED_K_I (ctx : FormalContext) (h_P_VED_E : Node_P_VED_E ctx) (h_P_VED_I : Node_P_VED_I ctx) (h_P_VED_K_E : Node_P_VED_K_E ctx) : Node_P_VED_K_I ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_Z
-- SOURCE: ES_46_RV6.md:851
-- FORMULA: \qquad z\in Z_{\rm Rim}^{\rm nt} \Rightarrow \left[ \zeta(z)=0 \ \text{en }U_{\rm Rim} \ \text{y } \rho_R=\rho_{\rm VED} \ \text{clasifica su localización transversal} \right]. }
def Node_P_Z (ctx : FormalContext) : Prop := ((ctx.z ∈ ctx.Z_Rim_nt) → ctx.Text_clasifica_su_localizaci_n_transversal)
theorem derive_P_Z (ctx : FormalContext) (h_P_RIM_S : Node_P_RIM_S ctx) (h_P_VR_rho : Node_P_VR_rho ctx) (h_P_VR_E : Node_P_VR_E ctx) : Node_P_Z ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_VED_R_C
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: 0\le\rho\le\frac12
-- FORMULA: k
def Node_P_VED_R_C (ctx : FormalContext) : Prop := ((0 ≤ ctx.rho) ∧ (ctx.rho ≤ ((1 : ℝ) / (2 : ℝ))))
theorem derive_P_VED_R_C (ctx : FormalContext) (h_P_VED_I : Node_P_VED_I ctx) (h_P_VED_K_E : Node_P_VED_K_E ctx) (h_P_VED_K_I : Node_P_VED_K_I ctx) : Node_P_VED_R_C ctx := by
  first | assumption | rfl

-- FORMAL_NODE: T_RIEMANN
-- SOURCE: ES_46_RV6.md:?
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
-- FORMULA: D_{\rho_R}
-- FORMULA: P_{\rm VR}(\rho)
-- FORMULA: U_{\rm VED}
-- FORMULA: P_{\rm VR}(\rho)
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
def Node_T_RIEMANN (ctx : FormalContext) : Prop := (∀ z : ℂ, (z ∈ ctx.Z_Rim_nt) → (Complex.re z = ((1 : ℝ) / (2 : ℝ))))
theorem derive_T_RIEMANN (ctx : FormalContext) (h_T_ISO : Node_T_ISO ctx) (h_P_RHO_ISO : Node_P_RHO_ISO ctx) (h_P_RIM_S : Node_P_RIM_S ctx) (h_P_Z : Node_P_Z ctx) (h_D_rho_R : Node_D_rho_R ctx) (h_P_VR_rho : Node_P_VR_rho ctx) : Node_T_RIEMANN ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_VED_Completo
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \quad U_{\rm VED}^{\rm cerrado} = \mathcal E_{\rm VED} \sqcup \mathcal I_{\rm VED}, }
-- FORMULA: \boxed{ \tilde N = R_{\rm VED}R_{\rm Sch}. }
-- FORMULA: \boxed{ R_{\rm Sch} = \frac{\tilde N}{R_{\rm VED}}, }
-- FORMULA: \boxed{ R_{\rm VED} = \frac{\tilde N}{R_{\rm Sch}}. }
-- FORMULA: \Phi_{\tilde N}: R_{\rm VED} \mapsto \frac{\tilde N}{R_{\rm VED}}
-- FORMULA: n\to\infty
-- FORMULA: U_{\rm VED}\leftrightarrow U_{\rm Sch}
-- FORMULA: A_7
def Node_P_VED_Completo (ctx : FormalContext) : Prop := (ctx.tilde_N = (ctx.R_VED * ctx.R_Sch)) ∧ (ctx.R_Sch = (ctx.tilde_N / ctx.R_VED)) ∧ (ctx.R_VED = (ctx.tilde_N / ctx.R_Sch))
theorem derive_P_VED_Completo (ctx : FormalContext) (h_P_VED_K_E : Node_P_VED_K_E ctx) (h_P_VED_K_I : Node_P_VED_K_I ctx) (h_P_VED_R_C : Node_P_VED_R_C ctx) : Node_P_VED_Completo ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_VS
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \qquad U_{\rm VED}\cong U_{\rm Sch}. }
-- FORMULA: \boxed{ G(2)=G, }
-- FORMULA: \boxed{ \lim_{n\to\infty}G(n)=0. }
-- FORMULA: n
-- FORMULA: n=2
-- FORMULA: U_{\rm Sch}
def Node_P_VS (ctx : FormalContext) : Prop := (ctx.G_fn_1 2 = ctx.G) ∧ ((ctx.lim_n_to_INFINITY * ctx.G_fn_1 ctx.n) = 0)
theorem derive_P_VS (ctx : FormalContext) (h_P_VED_K_I : Node_P_VED_K_I ctx) (h_P_VED_R_C : Node_P_VED_R_C ctx) (h_P_VED_Completo : Node_P_VED_Completo ctx) : Node_P_VS ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_ST_2
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \qquad ds^2=dt^2-dt'^2.
-- FORMULA: t
def Node_P_ST_2 (ctx : FormalContext) : Prop := (ctx.ds ^ 2 = (ctx.dt ^ 2 - ctx.dt_prime ^ 2))
theorem derive_P_ST_2 (ctx : FormalContext) (h_P_VED_R_C : Node_P_VED_R_C ctx) (h_P_VED_Completo : Node_P_VED_Completo ctx) (h_P_VS : Node_P_VS ctx) : Node_P_ST_2 ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_F
-- SOURCE: ES_46_RV6.md:601
-- FORMULA: \qquad F = (dt^2-dt'^2) + \frac{d}{dt}(dt^2-dt'^2). }
-- FORMULA: dt'
-- FORMULA: t
def Node_P_F (ctx : FormalContext) : Prop := (ctx.F = ((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((ctx.d / ctx.dt) * (ctx.dt ^ 2 - ctx.dt_prime ^ 2))))
theorem derive_P_F (ctx : FormalContext) (h_P_VED_Completo : Node_P_VED_Completo ctx) (h_P_VS : Node_P_VS ctx) (h_P_ST_2 : Node_P_ST_2 ctx) : Node_P_F ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_F1
-- SOURCE: ES_46_RV6.md:617
-- FORMULA: \qquad F = dt^2-dt'^2 + 2dt - 2dt'\frac{dt'}{dt}. }
-- FORMULA: dt'
-- FORMULA: dt'/dt
-- FORMULA: F
-- FORMULA: c
def Node_P_F1 (ctx : FormalContext) : Prop := (ctx.F = (((ctx.dt ^ 2 - ctx.dt_prime ^ 2) + ((2 : ℝ) * ctx.dt)) - (((2 : ℝ) * ctx.dt_prime) * (ctx.dt_prime / ctx.dt))))
theorem derive_P_F1 (ctx : FormalContext) (h_P_VS : Node_P_VS ctx) (h_P_ST_2 : Node_P_ST_2 ctx) (h_P_F : Node_P_F ctx) : Node_P_F1 ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_W
-- SOURCE: ES_46_RV6.md:639
-- FORMULA: \qquad v_{\rm onda}=c. }
-- FORMULA: c=1.
-- FORMULA: v=\frac{ds}{dt},
-- FORMULA: \frac{ds}{dt}=1.
-- FORMULA: ds=dt,
-- FORMULA: dt' = dt \sqrt{ 1-\frac{v^2}{c^2} }.
-- FORMULA: v\to c,
-- FORMULA: \boxed{ dt'\to0. }
-- FORMULA: dt'^2\to0,
-- FORMULA: \frac{dt'}{dt}\to0.
def Node_P_W (ctx : FormalContext) : Prop := (ctx.DivergesToInfinity (ctx.dt_prime))
theorem derive_P_W (ctx : FormalContext) (h_P_ST_2 : Node_P_ST_2 ctx) (h_P_F : Node_P_F ctx) (h_P_F1 : Node_P_F1 ctx) : Node_P_W ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_F1_2
-- SOURCE: ES_46_RV6.md:?
def Node_P_F1_2 (ctx : FormalContext) : Prop := Node_P_F ctx ∧ Node_P_F1 ctx ∧ Node_P_W ctx
theorem derive_P_F1_2 (ctx : FormalContext) (h_P_F : Node_P_F ctx) (h_P_F1 : Node_P_F1 ctx) (h_P_W : Node_P_W ctx) : Node_P_F1_2 ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_F2
-- SOURCE: ES_46_RV6.md:712
-- FORMULA: \qquad F=dt^2+2dt. }
-- FORMULA: dt^2+2dt = 2dt \left( 1+\frac12dt \right),
def Node_P_F2 (ctx : FormalContext) : Prop := (ctx.F = (ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt))) ∧ ((ctx.dt ^ 2 + ((2 : ℝ) * ctx.dt)) = ((2 : ℝ) * ctx.dt_fn_1 ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))
theorem derive_P_F2 (ctx : FormalContext) (h_P_F1 : Node_P_F1 ctx) (h_P_W : Node_P_W ctx) (h_P_F1_2 : Node_P_F1_2 ctx) : Node_P_F2 ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_F3
-- SOURCE: ES_46_RV6.md:733
-- FORMULA: \qquad F = 2dt \left( 1+\frac12dt \right). }
-- FORMULA: \boxed{ \frac12 }
-- FORMULA: F
-- FORMULA: U_{\rm Lap}
-- FORMULA: t
def Node_P_F3 (ctx : FormalContext) : Prop := (ctx.F = ((2 : ℝ) * ctx.dt_fn_1 ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))
theorem derive_P_F3 (ctx : FormalContext) (h_P_W : Node_P_W ctx) (h_P_F1_2 : Node_P_F1_2 ctx) (h_P_F2 : Node_P_F2 ctx) : Node_P_F3 ctx := by
  first | assumption | rfl

-- FORMAL_NODE: D_Lap
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \boxed{ s_\pm = a\pm ib. }
-- FORMULA: \boxed{ a=\frac12 }
-- FORMULA: T(k,\rho) = (k\pm\rho)\lambda
-- FORMULA: e^{\pm ibT}=1.
-- FORMULA: bT=2\pi.
-- FORMULA: \boxed{ b(k,\rho) = \frac{2\pi} {(k\pm\rho)\lambda}. }
-- FORMULA: \rho=0,
-- FORMULA: \boxed{ b_k = \frac{2\pi}{k\lambda}. }
-- FORMULA: \boxed{ Z_{\rm VED\to Lap} = \left\{ \frac12 \pm i\frac{2\pi}{k\lambda} : k\in\mathbb N^+ \right\}. }
-- FORMULA: P_{F3}
-- FORMULA: c=1
def Node_D_Lap (ctx : FormalContext) : Prop := (((ctx.s_PM) = ((ctx.a + ctx.ib)) ∨ (ctx.s_PM) = ((ctx.a - ctx.ib)))) ∧ (ctx.a = ((1 : ℝ) / (2 : ℝ))) ∧ (((ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) + ctx.rho) * ctx.lambda))) ∨ (ctx.b_fn_2 ctx.k ctx.rho) = ((((2 : ℝ) * Real.pi) / (((ctx.k : ℝ) - ctx.rho) * ctx.lambda))))) ∧ (ctx.b_k = (((2 : ℝ) * Real.pi) / ((ctx.k : ℝ) * ctx.lambda))) ∧ (ctx.Z_VED_to_Lap = ({x | ∃ k : ℕ, (k ∈ {n : ℕ | 0 < n}) ∧ (x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) + (ctx.i * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))) ∨ x = (((((1 : ℝ) / (2 : ℝ)) : ℂ) - (ctx.i * ((((2 : ℝ) * Real.pi) / ((k : ℝ) * ctx.lambda)) : ℂ)))))}))
theorem derive_D_Lap (ctx : FormalContext) (h_P_F3 : Node_P_F3 ctx) : Node_D_Lap ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_Lap_Z
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \Re(s)=\frac12.
-- FORMULA: U_{\rm VED}
-- FORMULA: k
-- FORMULA: k
def Node_P_Lap_Z (ctx : FormalContext) : Prop := (Complex.re ctx.s = ((1 : ℝ) / (2 : ℝ)))
theorem derive_P_Lap_Z (ctx : FormalContext) (h_P_F2 : Node_P_F2 ctx) (h_P_F3 : Node_P_F3 ctx) (h_D_Lap : Node_D_Lap ctx) : Node_P_Lap_Z ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_VED_E_2
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \quad \rho=0 \iff \text{estado estable}.
def Node_P_VED_E_2 (ctx : FormalContext) : Prop := ((ctx.rho = 0) ↔ ctx.Text_estado_estable)
theorem derive_P_VED_E_2 (ctx : FormalContext) (h_P_F3 : Node_P_F3 ctx) (h_D_Lap : Node_D_Lap ctx) (h_P_Lap_Z : Node_P_Lap_Z ctx) : Node_P_VED_E_2 ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_VED_Completo_2
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \quad (k,\rho) \text{ contempla exhaustivamente todos los cierres finitos.}
def Node_P_VED_Completo_2 (ctx : FormalContext) : Prop := Node_D_Lap ctx ∧ Node_P_Lap_Z ctx ∧ Node_P_VED_E_2 ctx
theorem derive_P_VED_Completo_2 (ctx : FormalContext) (h_D_Lap : Node_D_Lap ctx) (h_P_Lap_Z : Node_P_Lap_Z ctx) (h_P_VED_E_2 : Node_P_VED_E_2 ctx) : Node_P_VED_Completo_2 ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_VED_K_E_2
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \quad k\in\mathbb N^+ \text{ enumera todos los estados estables.}
def Node_P_VED_K_E_2 (ctx : FormalContext) : Prop := Node_P_Lap_Z ctx ∧ Node_P_VED_E_2 ctx ∧ Node_P_VED_Completo_2 ctx
theorem derive_P_VED_K_E_2 (ctx : FormalContext) (h_P_Lap_Z : Node_P_Lap_Z ctx) (h_P_VED_E_2 : Node_P_VED_E_2 ctx) (h_P_VED_Completo_2 : Node_P_VED_Completo_2 ctx) : Node_P_VED_K_E_2 ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_F3_2
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \quad F = 2dt \left( 1+\frac12dt \right).
def Node_P_F3_2 (ctx : FormalContext) : Prop := (ctx.F = ((2 : ℝ) * ctx.dt_fn_1 ((1 : ℝ) + (((1 : ℝ) / (2 : ℝ)) * ctx.dt))))
theorem derive_P_F3_2 (ctx : FormalContext) (h_P_VED_E_2 : Node_P_VED_E_2 ctx) (h_P_VED_Completo_2 : Node_P_VED_Completo_2 ctx) (h_P_VED_K_E_2 : Node_P_VED_K_E_2 ctx) : Node_P_F3_2 ctx := by
  first | assumption | rfl

-- FORMAL_NODE: P_Lap_Z_2
-- SOURCE: ES_46_RV6.md:?
-- FORMULA: \quad Z_{\rm VED\to Lap} \subset \{s:\Re(s)=1/2\}.
-- FORMULA: U_{\rm Rim}
def Node_P_Lap_Z_2 (ctx : FormalContext) : Prop := (ctx.Z_VED_to_Lap ⊂ ({s | Complex.re s = ((1 : ℝ) / (2 : ℝ))}))
theorem derive_P_Lap_Z_2 (ctx : FormalContext) (h_P_VED_Completo_2 : Node_P_VED_Completo_2 ctx) (h_P_VED_K_E_2 : Node_P_VED_K_E_2 ctx) (h_P_F3_2 : Node_P_F3_2 ctx) : Node_P_Lap_Z_2 ctx := by
  first | assumption | rfl

end ES_46_RV6

-- DEMUESTRA_AUDIT_BEGIN
-- DEMUESTRA_RESULT: ES_46_RV6.derive_T_RIEMANN
-- DEMUESTRA_JSON_NODE: T_RIEMANN
#check ES_46_RV6.derive_T_RIEMANN
#print axioms ES_46_RV6.derive_T_RIEMANN
-- DEMUESTRA_AUDIT_END
