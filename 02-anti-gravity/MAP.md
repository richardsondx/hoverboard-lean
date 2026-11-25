# Anti-gravity map, run stage2-hoverboard-antigravity-2026-11-25-01

## Step 6 record, First Principles ladder

- Decision: Build the anti-gravity toy over Int with a = -rho in Lean core, with no Mathlib.
- Claim: Lean core proves the Int implication. Status: verified. Source: /tmp/agtest1.lean.
- Claim: Lean core lacks Real instances. Status: verified. Source: /tmp/agtest2.lean.
- Claim: The Int toy proofs exit 0 with no sorryAx. Status: verified. Source: /tmp/agtest1.lean.
- True facts used: Lean core proves the Int implication. Lean core lacks Real instances. The Int toy proofs exit 0.
- Biggest open risk: The Int toy proves only the arithmetic implication, not the full physics.
- What would change my mind: A lean error on the toy file, or a verifier finding that the toy does not meet P3.
- Open questions: None that block U3.
- Full ladder: router-record.md.

## Piece 1: Einstein equations

- Source: Richardson pasted text Block B, Nov 25, 2026.
- Date: Nov 25, 2026.
- Status: Open. Spec only. No full proof attempted in this run.
- Physics claim: Gravity is curved spacetime. The Einstein equations link curvature to stress-energy.
- Math needed: Differential geometry, Lorentzian manifolds, tensor calculus.
- Lean target: A structure that holds a metric and a stress-energy tensor with the Einstein relation as a hypothesis.
- Lean target status: Spec in AntiGravity_Spec.lean. The full manifold version stays open.
- Why it stays open: Mathlib manifold work is large, and Lean core holds no Real manifold instances.

## Piece 2: Weak energy condition

- Source: Richardson pasted text Block B, Nov 25, 2026.
- Date: Nov 25, 2026.
- Status: Spec written in U2. Toy proof runs in U3.
- Physics claim: Every observer measures non-negative energy density.
- Math needed: The condition is an inequality on the stress-energy tensor at each point.
- Lean target: SatisfiesWeakEnergyCondition as 0 ≤ energy density.
- Lean target status: Defined in the spec. The toy proves its violation from repulsive acceleration.
- Why this piece was picked: The inequality is the exact hinge of the impossibility claim.

## Piece 3: Exotic matter

- Source: Richardson pasted text Block A and Block B, Nov 25, 2026.
- Date: Nov 25, 2026.
- Status: Open. Toy witness only. No real material exists in this run.
- Physics claim: Repulsive gravity needs negative mass or negative energy density.
- Math needed: The toy relation a = -rho turns positive acceleration into negative density.
- Lean target: A witness with acceleration 1 and energy density -1.
- Lean target status: Proved in AntiGravity_Toy.lean as an explicit pair.
- Why it stays open: A toy pair is not a physical material. No known material holds negative energy density at scale.

## Piece 4: Quantum energy inequalities

- Source: Richardson pasted text Block C, Nov 25, 2026.
- Date: Nov 25, 2026.
- Status: Open. No proof attempted in this run.
- Physics claim: Quantum fields can hold negative energy in small amounts for short times, within bounds.
- Math needed: Quantum field theory, operator algebras, energy bounds.
- Lean target: A source that satisfies quantum energy inequalities while it lifts 80 kg.
- Lean target status: sorry. It stays open in GAP-REPORT.md.
- Constructive bar: A concrete metric WarpHoverMetric and source QuantumFieldSource that lift 80 kg.
- Why it stays open: No quantum gravity loophole has a proved formalization, and the bounds need full quantum field theory.

## Piece 5: Warp metric idea

- Source: Richardson pasted text Block C, Nov 25, 2026.
- Date: Nov 25, 2026.
- Status: Open. Idea only. No construction attempted in this run.
- Physics claim: A flat board with an upward gravitational gradient above it and zero net pull below it.
- Math needed: A concrete metric tensor that satisfies the Einstein equations with a physical source.
- Lean target: WarpHoverMetric plus QuantumFieldSource, with lift for 80 kg.
- Lean target status: Not defined. It stays open in GAP-REPORT.md.
- Why it stays open: The metric needs the full Einstein equations and a quantum source, neither of which this run formalizes.

## Piece 6: Anti-gravity toy, the concrete target

- Source: Richardson pasted text Block B target theorem, Nov 25, 2026.
- Date: Nov 25, 2026.
- Status: Proof attempt Queued in U3. Spec written in U2. Toy proof runs in U3.
- Hypothesis: Local repulsive gravity needs a violation of the weak energy condition.
- Why this piece was picked: The claim is an implication, and a one point Int model proves its arithmetic core.
- Toy model: One point with acceleration a in Int and energy density rho in Int. Einstein relation a = -rho.
- Toy claims: Positive acceleration forces rho below 0. Positive acceleration breaks 0 ≤ rho. The pair (1, -1) shows the case.
- Toy limits: Int has no continuous spacetime. The toy proves the arithmetic implication only. It does not prove real gravity, real metrics, or lift of a real mass.
- Spec file: AntiGravity_Spec.lean.
- Toy file: AntiGravity_Toy.lean.
