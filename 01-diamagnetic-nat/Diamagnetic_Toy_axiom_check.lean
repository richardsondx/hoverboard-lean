import Init

namespace DiamagneticToy

def hoverPotential (n : Nat) : Nat := n * n + 1

def hoverForce (n : Nat) : Nat := n * n

theorem hoverPotential_at_zero : hoverPotential 0 = 1 := rfl

theorem hoverPotential_min (n : Nat) :
    hoverPotential n ≥ hoverPotential 0 := by
  unfold hoverPotential
  omega

theorem hoverPotential_strict (n : Nat) (hn : n ≠ 0) :
    hoverPotential n > hoverPotential 0 := by
  have h : 0 < n * n :=
    Nat.mul_pos (Nat.pos_of_ne_zero hn) (Nat.pos_of_ne_zero hn)
  unfold hoverPotential
  omega

theorem hoverPotential_gap (n : Nat) :
    hoverPotential n - hoverPotential 0 = n * n := by
  unfold hoverPotential
  omega

theorem hoverPotential_step (n : Nat) :
    hoverPotential (n + 1) - hoverPotential n = 2 * n + 1 := by
  unfold hoverPotential
  rw [Nat.add_mul, Nat.one_mul, Nat.mul_add, Nat.mul_one]
  omega

theorem hoverForce_at_zero : hoverForce 0 = 0 := rfl

theorem hoverForce_law (n : Nat) :
    hoverForce n = hoverPotential n - hoverPotential 0 := by
  unfold hoverForce hoverPotential
  omega

theorem exists_stable_levitation_toy :
    ∃ n₀, hoverForce n₀ = 0 ∧
      (∀ n, hoverPotential n₀ ≤ hoverPotential n) ∧
      (∀ n, n ≠ n₀ → hoverPotential n₀ < hoverPotential n) :=
  ⟨0, rfl, fun n => hoverPotential_min n, fun n hn => hoverPotential_strict n hn⟩

end DiamagneticToy

#print axioms DiamagneticToy.hoverPotential_at_zero
#print axioms DiamagneticToy.hoverPotential_min
#print axioms DiamagneticToy.hoverPotential_strict
#print axioms DiamagneticToy.hoverPotential_gap
#print axioms DiamagneticToy.hoverPotential_step
#print axioms DiamagneticToy.hoverForce_at_zero
#print axioms DiamagneticToy.hoverForce_law
#print axioms DiamagneticToy.exists_stable_levitation_toy
