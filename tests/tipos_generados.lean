import Mathlib
example (x : Nat) : (norm ((x : ℝ))) = norm (x : Real) := by rfl
example (x : Int) : (norm ((x : ℝ))) = norm (x : Real) := by rfl
example (x : Real) : (norm (x)) = norm x := by rfl
example (x : Complex) : (norm (x)) = norm x := by rfl
example (f : Complex -> Real) : (f 0) = f (0 : Complex) := by rfl
