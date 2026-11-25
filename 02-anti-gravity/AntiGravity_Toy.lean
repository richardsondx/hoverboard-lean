import Init

namespace AntiGravityToy

/-!
# Anti-gravity toy proof (Prompt 2)

Target: the Int instance of
`AntiGravitySpec.localized_repulsive_gravity_requires_exotic_matter`
from AntiGravity_Spec.lean. The spec states the claim for a spacetime
with a metric and a source linked by the Einstein relation. This file
proves the concrete Int instance with no gap placeholder.

## 1. Proof strategy

Constructive witness. The repulsive point uses acceleration 1 and
energy density -1. No classical choice is used. Each step is a small
lemma.
- `repulsive_implies_negative_energy`: positive acceleration forces
  negative energy density.
- `repulsive_violates_wec`: positive acceleration breaks 0 ≤ rho.
- `repulsive_energy_gap`: the gap -rho equals the acceleration.
- `exists_repulsive_exotic_source`: the pair (1, -1) shows the case.
- `toy_system_implies_negative`: the same claim for a named system.

## 2. Constructive over classical

The witness is the explicit pair (1, -1). The proof term is
`⟨1, -1, ...⟩`. No `Classical.choice` appears. No gap placeholder appears.

## 3. Modular lemmas

Each lemma below stands alone. The main theorem uses them only.

## 4. Strict Lean 4 syntax

Lean core only. No mathlib import. Tactics used: `omega`.
No library theorem is invented.

## 5. Bottlenecks

No step needed an isolated gap lemma. The full Int claim closes.
The gap that stays open is the continuous real version: real
manifolds, real metrics, real stress-energy tensors, and the
quantum energy inequalities. That needs mathlib `Real` and
differential geometry. See GAP-REPORT.md.
-/

/-- Toy acceleration at a point. Positive means upward. -/
def toyAccel : Int := 1

/-- Toy energy density at a point. Negative means exotic. -/
def toyDensity : Int := -1

/-- A toy Einstein system. The Einstein relation links the two numbers. -/
structure ToyEinstein where
  accel : Int
  density : Int
  einstein : accel = -density

/-- The concrete toy system. Acceleration 1, density -1. -/
def toySystem : ToyEinstein where
  accel := 1
  density := -1
  einstein := rfl

theorem repulsive_implies_negative_energy (a ρ : Int)
    (hE : a = -ρ) (hRep : 0 < a) : ρ < 0 := by
  omega

theorem repulsive_violates_wec (a ρ : Int)
    (hE : a = -ρ) (hRep : 0 < a) : ¬ 0 ≤ ρ := by
  omega

theorem repulsive_energy_gap (a ρ : Int)
    (hE : a = -ρ) : -ρ = a := by
  omega

theorem toy_point_repulsive : 0 < toyAccel := by
  unfold toyAccel
  omega

theorem toy_point_density_negative : toyDensity < 0 := by
  unfold toyDensity
  omega

theorem toy_point_violates_wec : ¬ 0 ≤ toyDensity := by
  unfold toyDensity
  omega

theorem toy_system_implies_negative (s : ToyEinstein)
    (hRep : 0 < s.accel) : s.density < 0 := by
  have hE : s.accel = -s.density := s.einstein
  omega

/-- The toy existence claim. Witness `(1, -1)`, given explicitly. -/
theorem exists_repulsive_exotic_source :
    ∃ a ρ : Int, 0 < a ∧ a = -ρ ∧ ρ < 0 :=
  ⟨1, -1, by omega, rfl, by omega⟩

end AntiGravityToy
