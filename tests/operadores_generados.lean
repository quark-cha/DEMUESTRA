import Mathlib
example (z : Complex) : (Complex.re z) = z.re := by rfl
example (z : Complex) : (Complex.im z) = z.im := by rfl
example : (Finset.sum (Finset.Icc (1 : ℕ) (2 : ℕ)) (fun n : ℕ => (n : ℕ))) = 3 := by decide
example : (Finset.sum (Finset.Icc (1 : ℕ) (3 : ℕ)) (fun n : ℕ => (n : ℕ))) = 6 := by decide
