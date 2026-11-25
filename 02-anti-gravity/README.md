# 02. Anti-gravity, Int

- Claim: local repulsive gravity needs a violation of the weak energy condition, unless a quantum gravity loophole exists.
- Status: the full claim is not proved. The toy below is proved.
- Lean: 4.23.0, Lean core only, no Mathlib.
- Spec: AntiGravity_Spec.lean, 113 lines, lean exit 0, one sorry at localized_repulsive_gravity_requires_exotic_matter.
- Toy: AntiGravity_Toy.lean, 101 lines, lean exit 0, no sorry, no sorryAx.
- Toy result: if a = -rho and 0 < a, then rho < 0, witness (1, -1).
- What a toy means: a tiny Int arithmetic model of the sign claim, not a real metric or a real drive.
- Check: lean AntiGravity_Spec.lean, then lean AntiGravity_Toy.lean, then lean AntiGravity_Toy_axiom_check.lean.
- Gap report: GAP-REPORT.md lists what stays open, including the WarpHoverMetric for 80 kg.
- Map: MAP.md lists the pieces of the anti-gravity path.
