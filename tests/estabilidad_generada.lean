import Mathlib.Topology.MetricSpace.HausdorffDistance
import Mathlib.Topology.Instances.Nat

noncomputable section

def distanceToPositiveIntegers (n : Real) : Real :=
  Metric.infDist n ((fun k : Nat => (k : Real)) '' {k : Nat | 0 < k})

def stableClosure (n : Real) : Prop := distanceToPositiveIntegers n = 0

example (n : Real) : stableClosure n ↔ ∃ k : Nat, 0 < k ∧ n = (k : Real) := by
  have closed : IsClosed ((fun k : Nat => (k : Real)) '' {k : Nat | 0 < k}) :=
    Nat.isClosedEmbedding_coe_real.isClosedMap _ (isClosed_discrete _)
  have nonempty : ((fun k : Nat => (k : Real)) '' {k : Nat | 0 < k}).Nonempty :=
    ⟨1, 1, Nat.zero_lt_one, by simp⟩
  unfold stableClosure distanceToPositiveIntegers
  rw [← closed.mem_iff_infDist_zero nonempty]
  constructor
  · rintro ⟨k, hk, hkn⟩
    exact ⟨k, hk, hkn.symm⟩
  · rintro ⟨k, hk, hnk⟩
    exact ⟨k, hk, hnk.symm⟩

example (k : Nat) (hk : 0 < k) : stableClosure (k : Real) := by
  apply Metric.infDist_zero_of_mem
  exact Set.mem_image_of_mem (fun j : Nat => (j : Real)) hk

example (k : Nat) (hk : 0 < k) (wavelength : Real) (h : wavelength ≠ 0) :
    stableClosure (((k : Real) * wavelength) / wavelength) := by
  rw [mul_div_cancel_right₀ _ h]
  apply Metric.infDist_zero_of_mem
  exact Set.mem_image_of_mem (fun j : Nat => (j : Real)) hk
