import Init

namespace DiamagneticSpec

/-!
# Diamagnetic levitation spec (Prompt 1)

Physical hypothesis (Richardson, Nov 25, 2026):
"A diamagnetic object can stably levitate above a static magnetic array
at room temperature without active feedback."

## 1. Core mathematical objects

Physical entity -> Lean object in this file -> closest mathlib equivalent

- Height above the array -> `Nat` index `n` (discrete height steps)
- Scalar values (energy, mass, temperature) -> `R` with `Scalars R`
- Scalar values, full version -> `Real` with `LinearOrderedField Real`
- Magnetic field strength at height `n` -> `field : Nat -> R`
- Magnetic potential energy -> `potential : Nat -> R`
- Restoring force (excess energy above the rest height) -> `force : Nat -> R`
- Stable equilibrium -> `n₀` with `force n₀ = 0` and a strict global minimum
- Room temperature bound -> `tempK` with `300 ≤ tempK`
- Rider plus board mass -> `mass` with `0 < mass`
- Gravity -> `gravity` with `0 < gravity`

This file uses `import Init` only. Mathlib is not used here.
Mathlib oleans are not built in this workspace (see GAP-REPORT.md).
The abstract `Scalars` record below carries only the operations and laws
this spec uses. The full continuous version needs `Real`, derivatives,
and `EuclideanSpace`, which live in mathlib.

## 2. Physical laws as hypotheses

The laws sit inside `DiamagneticSystem` as fields. Nothing is hidden.
- `mass_pos`: mass is positive. Zero mass is excluded.
- `gravity_pos`: gravity is positive. Zero gravity is excluded.
- `roomTemp`: temperature is at least 300 K. Cold is excluded.
- `field_nonneg`: field strength is never negative.
- `potential_nonneg`: potential energy is never negative.
- `forceLaw`: force at height `n` equals potential at `n` minus
  potential at rest height 0. Force is zero exactly at rest height
  when the potential has its minimum there.

## 3. Physical constants and parameters

- `mass = 80` in the Nat instance below (80 kg, rider plus board).
- `gravity = 10` in the Nat instance below (rounded stand-in for 9.8).
- `tempK = 300` in the Nat instance below (300 K, room temperature).
- Field strength is 1 in the Nat instance below (uniform static array field).
- The magnetic susceptibility sign (negative for diamagnetic material)
  is NOT in the machine-checked structure. Nat has no negative numbers.
  It is recorded here as a gap. The full model needs signed scalars.

## 5. Audit for cheating (vacuous truth)

- No `axiom` declaration appears in this file. Check with grep.
- The structure is inhabited. `natSystem` below builds one.
- The target theorem is not trivially true. `mass_pos` and
  `gravity_pos` rule out zero mass and zero gravity. `roomTemp`
  rules out a cold system. The conclusion needs force zero AND a
  strict global minimum together. A zero potential would break
  `hShape` and `forceLaw` at once.
- The `sorry` in the target theorem is the intended gap. It is
  recorded in the check log. The toy file proves the Nat instance
  of this claim without sorry. See Diamagnetic_Toy.lean.
-/

/-- Ordered scalar fragment. Only the operations and laws this spec
uses. The intended reading is the real numbers. -/
structure Scalars (R : Type) where
  zero : R
  one : R
  add : R → R → R
  mul : R → R → R
  sub : R → R → R
  ofNat : Nat → R
  le : R → R → Prop
  lt : R → R → Prop
  le_refl : ∀ a, le a a
  le_trans : ∀ {a b c}, le a b → le b c → le a c
  add_le_add_left : ∀ {a b} (c), le a b → le (add c a) (add c b)
  zero_le_square : ∀ a, le zero (mul a a)
  lt_le : ∀ {a b}, lt a b → le a b
  lt_irrefl : ∀ a, ¬ lt a a

/-- A diamagnetic levitation system over abstract scalars. -/
structure DiamagneticSystem {R : Type} (s : Scalars R) where
  mass : R
  gravity : R
  tempK : R
  field : Nat → R
  potential : Nat → R
  force : Nat → R
  mass_pos : s.lt s.zero mass
  gravity_pos : s.lt s.zero gravity
  roomTemp : s.le (s.ofNat 300) tempK
  field_nonneg : ∀ n, s.le s.zero (field n)
  potential_nonneg : ∀ n, s.le s.zero (potential n)
  forceLaw : ∀ n, force n = s.sub (potential n) (potential 0)

/-- Nat scalars. The concrete scalar instance used by the toy. -/
def natScalars : Scalars Nat where
  zero := 0
  one := 1
  add := (· + ·)
  mul := (· * ·)
  sub := (· - ·)
  ofNat := fun n => n
  le := Nat.le
  lt := Nat.lt
  le_refl := fun _ => Nat.le_refl _
  le_trans := fun h1 h2 => Nat.le_trans h1 h2
  add_le_add_left := fun _ h => Nat.add_le_add_left h _
  zero_le_square := fun _ => Nat.zero_le _
  lt_le := fun h => Nat.le_of_lt h
  lt_irrefl := fun _ h => Nat.lt_irrefl _ h

/-- The concrete Nat system. Potential `U n = n * n + 1`.
Force `F n = n * n`. Rest height 0. Mass 80 kg. Gravity 10.
Temperature 300 K. -/
def natSystem : DiamagneticSystem natScalars where
  mass := 80
  gravity := 10
  tempK := 300
  field := fun _ => 1
  potential := fun n => n * n + 1
  force := fun n => n * n
  mass_pos := Nat.succ_pos 79
  gravity_pos := Nat.succ_pos 9
  roomTemp := Nat.le_refl _
  field_nonneg := fun _ => Nat.zero_le _
  potential_nonneg := fun _ => Nat.zero_le _
  forceLaw := fun n => Nat.add_sub_cancel (n * n) 1

/-- The system structure is inhabited. The spec is not vacuous. -/
example : Nonempty (DiamagneticSystem natScalars) := ⟨natSystem⟩

/-- 4. Target theorem (Prompt 1).
For a system whose potential has the square shape `U n = n^2 + 1`,
there is a stable equilibrium: force zero at `n₀`, a global minimum
at `n₀`, and a strict minimum away from `n₀`. -/
theorem exists_stable_levitation {R : Type} {s : Scalars R}
    (sys : DiamagneticSystem s)
    (hShape : ∀ n, sys.potential n =
      s.add (s.mul (s.ofNat n) (s.ofNat n)) s.one) :
    ∃ n₀, sys.force n₀ = s.zero ∧
      (∀ n, s.le (sys.potential n₀) (sys.potential n)) ∧
      (∀ n, n ≠ n₀ → s.lt (sys.potential n₀) (sys.potential n)) := by
  sorry

end DiamagneticSpec
