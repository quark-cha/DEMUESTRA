import Mathlib
noncomputable section
example : (Finset.sum ({(0 : ℝ), (1 : ℝ)} : Finset ℝ) (fun a : ℝ => (Finset.sum ({(0 : ℝ), (1 : ℝ)} : Finset ℝ) (fun b : ℝ => ((((2 : ℝ) * a) - (1 : ℝ)) * (((2 : ℝ) * b) - (1 : ℝ)) : ℝ)) : ℝ))) = (0 : Real) := by norm_num [Finset.sum_insert, Finset.sum_singleton]
example : (Finset.sum ({(0 : ℝ), (1 : ℝ)} : Finset ℝ) (fun a : ℝ => (Finset.sum ({(0 : ℝ), (1 : ℝ)} : Finset ℝ) (fun b : ℝ => ((((2 : ℝ) * a) - (1 : ℝ)) ^ 2 * (((2 : ℝ) * b) - (1 : ℝ)) ^ 2 : ℝ)) : ℝ))) = (4 : Real) := by norm_num [Finset.sum_insert, Finset.sum_singleton]
example : (Finset.sum ({(0 : ℝ), (2 : ℝ)} : Finset ℝ) (fun a : ℝ => (a : ℝ))) = (2 : Real) := by norm_num [Finset.sum_insert, Finset.sum_singleton]
example (s : Real -> Real) (j : Real) : (s (j + (1 : ℝ))) = s (j + 1) := by rfl
example (P : Real -> Real -> Real -> Real -> Real) (x y : Real) : (Finset.sum ({(0 : ℝ), (1 : ℝ)} : Finset ℝ) (fun a : ℝ => (Finset.sum ({(0 : ℝ), (1 : ℝ)} : Finset ℝ) (fun b : ℝ => (((((2 : ℝ) * a) - (1 : ℝ)) * (((2 : ℝ) * b) - (1 : ℝ))) * (P a b x y) : ℝ)) : ℝ))) = P 0 0 x y - P 0 1 x y - P 1 0 x y + P 1 1 x y := by
  simp [Finset.sum_insert, Finset.sum_singleton]
  <;> ring
