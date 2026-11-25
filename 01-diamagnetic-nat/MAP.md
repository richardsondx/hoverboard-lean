# Hoverboard map, run stage2-hoverboard-lean-2026-11-25-01

## Step 6 record, First Principles ladder

- Decision: Build the diamagnetic toy over Nat with U(n) = n*n + 1 in Lean core, with no Mathlib.
- Claim: Lean core lacks Real instances. Status: verified. Source: /tmp/leantest1.lean.
- Claim: Mathlib oleans are not built here. Status: verified. Source: /tmp/mltest.lean.
- Claim: The Nat toy proofs exit 0 with no sorryAx. Status: verified. Source: /tmp/leantest4.lean.
- True facts used: Lean core lacks Real instances. Mathlib oleans are not built here. The Nat toy proofs exit 0.
- Biggest open risk: The Nat toy proves only the minimum and curvature shape, not the full physics.
- What would change my mind: A lean error on the toy file, or a verifier finding that the toy does not meet P3.
- Open questions: None that block U3.
- Full ladder: router-record.md.

## Path 1: Room temperature superconductivity

- Source: Richardson pasted text Block A, Block B, Block C, Nov 25, 2026.
- Date: Nov 25, 2026.
- Status: Open. Spec only. No proof attempted in this run.
- Physics bottleneck: High temperature superconductivity. No complete theory explains electron pairing in unconventional superconductors.
- Math needed: Quantum many-body theory, quantum field theory, topology, non-perturbative methods.
- Lean target: exists_high_temp_superconducting_ground_state at T >= 300 K, with off-diagonal long-range order and zero resistivity.
- Lean target status: sorry. It stays open in GAP-REPORT.md.
- Constructive bar: A concrete crystal MyCrystal with critical temperature >= 300 K, critical field >= 5.0, thermodynamic stability.
- Why it stays open: The Hubbard model proof needs infinite dimensional Hilbert spaces and operator algebras that mathlib does not yet cover at this depth.

## Path 2: Anti-gravity, direct gravity control

- Source: Richardson pasted text Block A, Block B, Block C, Nov 25, 2026.
- Date: Nov 25, 2026.
- Status: Open. Spec only. No proof attempted in this run.
- Physics bottleneck: Quantum gravity. General Relativity cannot switch gravity off without exotic matter with negative mass.
- Math needed: Non-commutative geometry, string theory, loop quantum gravity, differential geometry.
- Lean target: localized_repulsive_gravity_requires_exotic_matter, a Lorentzian manifold proof that upward geodesic acceleration violates the weak energy condition.
- Lean target status: sorry. It stays open in GAP-REPORT.md.
- Constructive bar: A concrete metric WarpHoverMetric and source QuantumFieldSource that lift 80 kg and satisfy quantum energy inequalities.
- Why it stays open: The theorem as stated proves impossibility under General Relativity, so a real board needs a quantum gravity loophole that no one has found.

## Path 3: Air and acoustic levitation

- Source: Richardson pasted text Block A, Block B, Block C, Nov 25, 2026.
- Date: Nov 25, 2026.
- Status: Open. Spec only. No proof attempted in this run.
- Physics bottleneck: Extreme power density and noise control.
- Math needed: Non-linear fluid dynamics, Navier-Stokes global regularity.
- Lean target: navier_stokes_global_regularity, smooth solutions in 3D for all time.
- Lean target status: sorry. It stays open in GAP-REPORT.md.
- Constructive bar: A controller HoverController plus a Lyapunov function that proves asymptotic stability under bounded gusts.
- Why it stays open: Navier-Stokes global regularity is a Millennium Prize Problem. No proof exists.

## Piece 4: Diamagnetic levitation toy, the concrete target

- Source: Richardson pasted text Prompt 1 hypothesis, Nov 25, 2026.
- Date: Nov 25, 2026.
- Status: Proof attempt Queued in U3. Spec written in U2. Toy proof runs in U3.
- Hypothesis: A diamagnetic object can stably levitate above a static magnetic array at room temperature without active feedback.
- Why this piece was picked: Diamagnetic levitation is stable without feedback, and the toy is small enough to model in Lean core.
- Toy model: A one sided height index n in Nat. Potential U(n) = n*n + 1. Equilibrium at n = 0.
- Toy claims: U has a global minimum at 0. U is strictly larger away from 0. The gap U(n) - U(0) equals n*n. Each step away raises U by 2*n + 1.
- Toy limits: Nat has no negative side. The toy proves the minimum and curvature shape only. It does not prove real magnetic forces, real materials, or lift of a real mass.
- Spec file: Diamagnetic_Spec.lean.
- Toy file: Diamagnetic_Toy.lean.
