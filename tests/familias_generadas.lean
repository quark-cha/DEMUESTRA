import Mathlib.Order.Interval.Finset.Nat
import Mathlib.Data.Real.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

noncomputable section

example (a : ℕ → ℝ) :
    (Finset.sum (Finset.Icc (0 : ℕ) (3 : ℕ)) (fun j : ℕ => (a (j) : ℝ))) =
    Finset.sum (Finset.Icc 0 3) a := by rfl

example (a b : ℕ → ℝ) :
    (Finset.sum (Finset.Icc (0 : ℕ) (3 : ℕ)) (fun j : ℕ => (a (j) * b (j) : ℝ))) =
    Finset.sum (Finset.Icc 0 3) (fun j => a j * b j) := by rfl

example (a b : ℕ → ℝ) :
    (Finset.sum (Finset.Icc (0 : ℕ) (3 : ℕ)) (fun j : ℕ => (Finset.sum (Finset.Icc (0 : ℕ) (2 : ℕ)) (fun k : ℕ => (a (j) * b (k) : ℝ)) : ℝ))) =
    Finset.sum (Finset.Icc 0 3) (fun j => Finset.sum (Finset.Icc 0 2) (fun k => a j * b k)) := by rfl
