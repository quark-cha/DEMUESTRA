import Mathlib

/- Typed interpretation of the finite instrument and basis formulas.
   This is not a proof of physical Q-V equivalence or a project certificate. -/
namespace DemuestraFiniteModel

noncomputable section
open scoped BigOperators

section Instrument

variable {Outcome : Type} {Branch : Outcome -> Type} {Basis : Type}
variable [Fintype Outcome] [forall a, Fintype (Branch a)]
variable [Fintype Basis] [DecidableEq Basis]

def complete (K : (a : Outcome) -> Branch a -> Matrix Basis Basis Complex) : Prop :=
  (∑ a, ∑ nu, (K a nu).conjTranspose * K a nu) = 1

def visibleBranch
    (K : (a : Outcome) -> Branch a -> Matrix Basis Basis Complex)
    (rho : Matrix Basis Basis Complex) (a : Outcome) : Matrix Basis Basis Complex :=
  ∑ nu, K a nu * rho * (K a nu).conjTranspose

def visibleWeight
    (K : (a : Outcome) -> Branch a -> Matrix Basis Basis Complex)
    (rho : Matrix Basis Basis Complex) (a : Outcome) : Complex :=
  Matrix.trace (visibleBranch K rho a)

def posterior
    (K : (a : Outcome) -> Branch a -> Matrix Basis Basis Complex)
    (rho : Matrix Basis Basis Complex) (a : Outcome) : Option (Matrix Basis Basis Complex) :=
  if visibleWeight K rho a = 0 then none
  else some ((visibleWeight K rho a)⁻¹ • visibleBranch K rho a)

omit [Fintype Outcome] [DecidableEq Basis] in
theorem posterior_of_nonzero
    (K : (a : Outcome) -> Branch a -> Matrix Basis Basis Complex)
    (rho : Matrix Basis Basis Complex) (a : Outcome)
    (h : visibleWeight K rho a ≠ 0) :
    posterior K rho a = some ((visibleWeight K rho a)⁻¹ • visibleBranch K rho a) := by
  simp [posterior, h]

omit [Fintype Outcome] [DecidableEq Basis] in
theorem posterior_of_zero
    (K : (a : Outcome) -> Branch a -> Matrix Basis Basis Complex)
    (rho : Matrix Basis Basis Complex) (a : Outcome)
    (h : visibleWeight K rho a = 0) : posterior K rho a = none := by
  simp [posterior, h]

end Instrument

section StateVector

def basisVector {d : Nat} (j : Fin d) : Fin d -> Complex :=
  fun i => if i = j then 1 else 0

def expansion {d : Nat} (alpha : Fin d -> Complex) : Fin d -> Complex :=
  ∑ j, alpha j • basisVector j

theorem expansion_eq {d : Nat} (alpha : Fin d -> Complex) : expansion alpha = alpha := by
  funext i
  simp only [expansion, Finset.sum_apply, Pi.smul_apply, basisVector,
    smul_eq_mul, mul_ite, mul_one, mul_zero]
  simp

def qubitRegisterExpansion (n : Nat) (alpha : Fin (2 ^ n) -> Complex) :
    Fin (2 ^ n) -> Complex := expansion alpha

theorem qubitRegisterExpansion_eq (n : Nat) (alpha : Fin (2 ^ n) -> Complex) :
    qubitRegisterExpansion n alpha = alpha := expansion_eq alpha

end StateVector

end

end DemuestraFiniteModel
