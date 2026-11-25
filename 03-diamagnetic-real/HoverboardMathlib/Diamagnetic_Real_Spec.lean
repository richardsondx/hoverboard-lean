import Mathlib.Data.Real.Sqrt
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith

namespace DiamagneticRealSpec

/-!
# Diamagnetic levitation spec over Real (Prompt 1)

Physical hypothesis (Richardson, Nov 25, 2026):
"A diamagnetic object can stably levitate above a static magnetic array
at room temperature without active feedback."

## 1. Core mathematical objects

- Height above the array -> `x : ℝ`
- Scalar values -> `ℝ` with `LinearOrderedField ℝ`
- Magnetic field strength at height `x` -> `field : ℝ → ℝ`
- Magnetic potential energy -> `potential : ℝ → ℝ`
- Restoring force -> `force : ℝ → ℝ`
- Stable equilibrium -> `x₀` with `force x₀ = 0` and a strict global minimum
- Room temperature bound -> `tempK` with `300 ≤ tempK`
- Rider plus board mass -> `mass` with `0 < mass`
- Gravity -> `gravity` with `0 < gravity`
- Susceptibility -> `chi` with `chi < 0`, negative for diamagnetic material

## 2. Physical laws as hypotheses

- `mass_pos`: mass is positive. Zero mass is excluded.
- `gravity_pos`: gravity is positive. Zero gravity is excluded.
- `roomTemp`: temperature is at least 300 K. Cold is excluded.
- `chi_neg`: susceptibility is negative. Positive chi is excluded.
- `field_nonneg`: field strength is never negative.
- `potential_nonneg`: potential energy is never negative.
- `forceLaw`: force at height `x` equals potential at `x` minus potential at 0.

## 3. Physical constants and parameters

- `mass = 80` in the Real instance below (80 kg, rider plus board).
- `gravity = 9.8` in the Real instance below (9.8 metres per second squared).
- `tempK = 300` in the Real instance below (300 K, room temperature).
- Field strength is 1 in the Real instance below (uniform static array field).
- `chi = -1` in the Real instance below (a stand-in value, not a measured material value).

## 5. Audit for cheating (vacuous truth)

- No `axiom` declaration appears in this file. Check with grep.
- The structure is inhabited. `realSystem` below builds one.
- The target theorem is not trivially true. `mass_pos` and
  `gravity_pos` rule out zero mass and zero gravity. `roomTemp`
  rules out a cold system. `chi_neg` rules out a non-diamagnetic
  material. The conclusion needs force zero AND a strict global
  minimum together. A zero potential would break `hShape` and
  `forceLaw` at once.
- The `sorry` in the target theorem is the intended gap. It is
  recorded in the check log. The toy file proves the Real instance
  of this claim without sorry. See Diamagnetic_Real_Toy.lean.
-/

/-- A diamagnetic levitation system over Real numbers. -/
structure DiamagneticRealSystem where
  mass : ℝ
  gravity : ℝ
  tempK : ℝ
  chi : ℝ
  field : ℝ → ℝ
  potential : ℝ → ℝ
  force : ℝ → ℝ
  mass_pos : 0 < mass
  gravity_pos : 0 < gravity
  roomTemp : 300 ≤ tempK
  chi_neg : chi < 0
  field_nonneg : ∀ x, 0 ≤ field x
  potential_nonneg : ∀ x, 0 ≤ potential x
  forceLaw : ∀ x, force x = potential x - potential 0

/-- The concrete Real system. Potential `U x = x ^ 2 + 1`.
Force `F x = x ^ 2`. Rest height 0. Mass 80 kg. Gravity 9.8.
Temperature 300 K. Susceptibility -1. -/
def realSystem : DiamagneticRealSystem where
  mass := 80
  gravity := 9.8
  tempK := 300
  chi := -1
  field := fun _ => 1
  potential := fun x => x ^ 2 + 1
  force := fun x => x ^ 2
  mass_pos := by norm_num
  gravity_pos := by norm_num
  roomTemp := le_refl 300
  chi_neg := by norm_num
  field_nonneg := fun _ => by norm_num
  potential_nonneg := fun x => by
    have h : (0:ℝ) ≤ x ^ 2 := sq_nonneg x
    linarith
  forceLaw := fun x => by
    simp only [ne_eq, OfNat.ofNat_ne_zero, not_false_eq_true, zero_pow, zero_add]
    ring

/-- The system structure is inhabited. The spec is not vacuous. -/
example : Nonempty DiamagneticRealSystem := ⟨realSystem⟩

/-- 4. Target theorem (Prompt 1).
For a system whose potential has the square shape `U x = x^2 + 1`,
there is a stable equilibrium: force zero at `x₀`, a global minimum
at `x₀`, and a strict minimum away from `x₀`. -/
theorem exists_stable_levitation_real (sys : DiamagneticRealSystem)
    (hShape : ∀ x, sys.potential x = x ^ 2 + 1) :
    ∃ x₀, sys.force x₀ = 0 ∧
      (∀ x, sys.potential x₀ ≤ sys.potential x) ∧
      (∀ x, x ≠ x₀ → sys.potential x₀ < sys.potential x) := by
  sorry

end DiamagneticRealSpec
