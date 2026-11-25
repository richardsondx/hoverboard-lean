# 01. Diamagnetic levitation, Nat

- Claim: a diamagnetic object can stably levitate above a static magnetic array at room temperature without active feedback.
- Status: the full claim is not proved. The toy below is proved.
- Lean: 4.23.0, Lean core only, no Mathlib.
- Spec: Diamagnetic_Spec.lean, 152 lines, lean exit 0, one sorry at the target theorem.
- Toy: Diamagnetic_Toy.lean, 93 lines, lean exit 0, no sorry, no sorryAx.
- Toy result: U(n) = n*n + 1 has a strict minimum at 0, with gap n*n.
- What a toy means: a tiny model of the minimum shape, not the real board or field.
- Check: lean Diamagnetic_Spec.lean, then lean Diamagnetic_Toy.lean, then lean Diamagnetic_Toy_axiom_check.lean.
- Gap report: GAP-REPORT.md lists what stays open.
- Map: MAP.md lists the three hoverboard paths.
