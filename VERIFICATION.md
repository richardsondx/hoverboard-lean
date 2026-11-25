# Verification

Date: Nov 25, 2026.
Lean: 4.23.0. Lake: 5.0.0. Mathlib: v4.23.0, commit 37df177a.

## 01. Diamagnetic levitation, Nat

- lean Diamagnetic_Spec.lean: exit 0, one warning, declaration uses sorry at line 143.
- lean Diamagnetic_Toy.lean: exit 0, no output.
- lean Diamagnetic_Toy_axiom_check.lean: exit 0, 8 theorems, propext and Quot.sound only, no sorryAx.
- grep sorry on the toy file: 0 lines.

## 02. Anti-gravity, Int

- lean AntiGravity_Spec.lean: exit 0, one warning, declaration uses sorry at line 107.
- lean AntiGravity_Toy.lean: exit 0, no output.
- lean AntiGravity_Toy_axiom_check.lean: exit 0, 8 theorems, propext and Quot.sound only, no sorryAx.
- grep sorry on the toy file: 0 lines.

## 03. Diamagnetic levitation, Real

- lake build in 03-diamagnetic-real: exit 0, 1399 jobs, using the reused Kerr Mathlib cache.
- lake env lean HoverboardMathlib/Diamagnetic_Real_Spec.lean: exit 0, one warning, declaration uses sorry at line 107.
- lake env lean HoverboardMathlib/Diamagnetic_Real_Toy.lean: exit 0, no output.
- lake env lean Diamagnetic_Real_Toy_axiom_check.lean: exit 0, 8 theorems, propext, Classical.choice, and Quot.sound only, no sorryAx.
- grep sorry on the toy file: 0 lines.
- Note: full import Mathlib fails in the cached build, Mathlib.olean does not exist. Only Mathlib.Data.Real.Sqrt, Mathlib.Tactic.Ring, and Mathlib.Tactic.Linarith are used.

## Text checks

- grep for em dash across the repo: no matches.
- grep for sorryAx in the three axiom check logs: no matches.
