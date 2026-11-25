import Init

namespace AntiGravitySpec

/-!
# Anti-gravity spec (Prompt 1)

Physical hypothesis (Richardson, Nov 25, 2026):
"Local repulsive gravity needs a violation of the weak energy
condition, unless a quantum gravity loophole exists."

## 1. Core mathematical objects

Physical entity -> Lean object in this file -> closest mathlib equivalent

- Spacetime -> `LorentzianManifold` with a dimension
- Spacetime, full version -> `Manifold` with a Lorentzian metric, in mathlib
- Metric tensor -> `MetricTensor` with geodesic acceleration at a point
- Stress-energy tensor -> `StressEnergyTensor` with energy density at a point
- Einstein equations -> `einstein` field in `EinsteinSystem`
- Weak energy condition -> `SatisfiesWeakEnergyCondition`, energy density at least 0
- Upward acceleration -> `ProducesUpwardGeodesicAcceleration`, acceleration above 0
- Exotic matter -> energy density below 0, a violation of the weak energy condition

This file uses `import Init` only. Mathlib is not used here.
Mathlib oleans are not built in this workspace (see GAP-REPORT.md).
The full continuous version needs `Real`, smooth manifolds, and
tensor fields, which live in mathlib.

## 2. Physical laws as hypotheses

The laws sit inside `EinsteinSystem` as fields. Nothing is hidden.
- `einstein`: acceleration equals minus energy density at the point.
- The sign is the toy Einstein relation. The full Einstein equations
  link curvature to the full stress-energy tensor, not to one number.
- `dim_pos`: the manifold dimension is positive. Zero dimension is excluded.

## 3. Physical constants and parameters

- Rider plus board mass is 80 kg in the constructive bar, not in the structure.
- The toy point uses acceleration 1 and energy density -1.
- The units are abstract. The toy proves the sign implication only.
- No real gravity value appears here. The toy has no 9.8 constant.

## 5. Audit for cheating (vacuous truth)

- No `axiom` declaration appears in this file. Check with grep.
- The structure is inhabited. `warpExample` below builds one.
- The target theorem is not trivially true. The Einstein relation
  links acceleration to energy density, and the conclusion needs
  a violation of the weak energy condition. A system with
  acceleration 0 would break `hHover` at once.
- The `sorry` in the target theorem is the intended gap. It is
  recorded in the check log. The toy file proves the Int instance
  of this claim without sorry. See AntiGravity_Toy.lean.
-/

/-- A Lorentzian manifold, reduced to its dimension. -/
structure LorentzianManifold where
  Dim : Nat
  dim_pos : 0 < Dim

/-- A metric tensor, reduced to geodesic acceleration at a point. -/
structure MetricTensor (M : LorentzianManifold) where
  accel : Int

/-- A stress-energy tensor, reduced to energy density at a point. -/
structure StressEnergyTensor (M : LorentzianManifold) where
  energyDensity : Int

/-- The weak energy condition at a point. -/
def SatisfiesWeakEnergyCondition {M : LorentzianManifold}
    (T : StressEnergyTensor M) : Prop :=
  0 ≤ T.energyDensity

/-- Upward geodesic acceleration at a point. -/
def ProducesUpwardGeodesicAcceleration {M : LorentzianManifold}
    (g : MetricTensor M) : Prop :=
  0 < g.accel

/-- A spacetime with a metric, a source, and the Einstein relation. -/
structure EinsteinSystem where
  M : LorentzianManifold
  g : MetricTensor M
  T : StressEnergyTensor M
  einstein : g.accel = -T.energyDensity

/-- The concrete example manifold. Dimension 4. -/
def exampleManifold : LorentzianManifold where
  Dim := 4
  dim_pos := Nat.succ_pos 3

/-- The concrete example system. Acceleration 1, energy density -1. -/
def warpExample : EinsteinSystem where
  M := exampleManifold
  g := ⟨1⟩
  T := ⟨-1⟩
  einstein := rfl

/-- The system structure is inhabited. The spec is not vacuous. -/
example : Nonempty EinsteinSystem := ⟨warpExample⟩

/-- 4. Target theorem (Prompt 1).
For a system that satisfies the Einstein relation and produces
upward geodesic acceleration, the source violates the weak
energy condition. -/
theorem localized_repulsive_gravity_requires_exotic_matter
    (sys : EinsteinSystem)
    (hHover : ProducesUpwardGeodesicAcceleration sys.g) :
    ¬ SatisfiesWeakEnergyCondition sys.T := by
  sorry

end AntiGravitySpec
