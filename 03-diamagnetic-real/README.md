# 03. Diamagnetic levitation, Real

- Claim: the diamagnetic spec restated over Real numbers, with gravity 9.8 and a negative susceptibility.
- Status: the full claim is not proved. The toy below is proved.
- Lean: 4.23.0, Lake 5.0.0, Mathlib v4.23.0, commit 37df177a.
- Spec: HoverboardMathlib/Diamagnetic_Real_Spec.lean, 114 lines, one sorry at the target theorem.
- Spec uses gravity 9.8 and chi -1, with chi below 0.
- Chi -1 is a stand-in, not a measured material value.
- Toy: HoverboardMathlib/Diamagnetic_Real_Toy.lean, 58 lines, no sorry, no sorryAx.
- Toy result: U(x) = x^2 + 1 over Real has a strict minimum at 0, gap x^2.
- Toy links: realSystem_force_zero, realSystem_min, and realSystem_strict apply the toy to realSystem.
- What a toy means: a tiny Real model of the minimum shape, not the real 3D field or a lab test.
- Check: lake env lean HoverboardMathlib/Diamagnetic_Real_Spec.lean, then lake env lean HoverboardMathlib/Diamagnetic_Real_Toy.lean, then lake env lean Diamagnetic_Real_Toy_axiom_check.lean.
- Note: full import Mathlib fails here, Mathlib.olean does not exist in the cached build. Only Mathlib.Data.Real.Sqrt, Mathlib.Tactic.Ring, and Mathlib.Tactic.Linarith are used.
- Gap report: GAP-REPORT.md lists what stays open.
- Build notes: MATHLIB-BUILD.md records the reused Kerr Mathlib cache.
