import Init

namespace DiamagneticToy

/-!
# Diamagnetic levitation toy proof (Prompt 2)

Target: the Nat instance of `DiamagneticSpec.exists_stable_levitation`
from Diamagnetic_Spec.lean. The spec states the claim for abstract
scalars with a square-shaped potential. This file proves the concrete
Nat instance with no gap placeholder.

## 1. Proof strategy

Constructive witness. The equilibrium height is `n₀ = 0`.
No classical choice is used. Each step is a small lemma.
- `hoverPotential_min`: 0 is a global minimum.
- `hoverPotential_strict`: the minimum is strict away from 0.
- `hoverPotential_gap`: the energy gap equals `n * n`.
- `hoverPotential_step`: each step away raises the potential by `2 * n + 1`.
- `exists_stable_levitation_toy`: the four lemmas combine into one
  existence claim with the witness `0`.

## 2. Constructive over classical

The witness is the explicit number 0. The proof term is `⟨0, ...⟩`.
No `Classical.choice` appears. No gap placeholder appears.

## 3. Modular lemmas

Each lemma below stands alone. The main theorem uses them only.

## 4. Strict Lean 4 syntax

Lean core only. No mathlib import. Tactics used: `omega`, `rw`,
`unfold`, `rfl`. Lemmas used: `Nat.mul_pos`, `Nat.pos_of_ne_zero`,
`Nat.add_mul`, `Nat.one_mul`, `Nat.mul_add`, `Nat.mul_one`.
No library theorem is invented.

## 5. Bottlenecks

No step needed an isolated gap lemma. The full Nat claim closes.
The gap that stays open is the continuous real version: real heights,
real magnetic forces, the susceptibility sign, and gravity 9.8.
That needs mathlib `Real` and derivatives. See GAP-REPORT.md.
-/

/-- Potential energy at discrete height `n`. `U n = n^2 + 1`. -/
def hoverPotential (n : Nat) : Nat := n * n + 1

/-- Restoring force at height `n`. Excess energy above rest height 0. -/
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

/-- The toy existence claim. Witness `n₀ = 0`, given explicitly. -/
theorem exists_stable_levitation_toy :
    ∃ n₀, hoverForce n₀ = 0 ∧
      (∀ n, hoverPotential n₀ ≤ hoverPotential n) ∧
      (∀ n, n ≠ n₀ → hoverPotential n₀ < hoverPotential n) :=
  ⟨0, rfl, fun n => hoverPotential_min n, fun n hn => hoverPotential_strict n hn⟩

end DiamagneticToy
