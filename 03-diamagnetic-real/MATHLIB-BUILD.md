# Mathlib build report, run stage2-hoverboard-mathlib-2026-11-25-01

## Words

- pass: the check succeeds.
- fail: the check fails.
- check: the act of verification on the real artifact.
- cost: money the run spent.

## Result

- Reuse wins, no fresh build runs.
- The Kerr cache supplies the Mathlib oleans.
- The new project checks a real toy in 7 seconds.
- Full import Mathlib fails, and this file records that failure.
- The run uses named cached modules only.

## Evidence

- Lean version: 4.23.0, commit 50aaf682e9b74ab92880292a25c68baa1cc81c87.
- Lake version: 5.0.0, Lean version 4.23.0.
- Toolchain file: leanprover/lean4:v4.23.0.
- Mathlib source: https://github.com/leanprover-community/mathlib4
- Mathlib commit: 37df177aaa770670452312393d4e84aaad56e7b6
- Mathlib tag: v4.23.0.
- Reused project: workspace/kerr-stability-lean/kerr-mathlib/
- Reused project build: lake build exit 0, 1818 jobs, Nov 25, 2026.
- Reused project source: Kerr RUN-LOG.md in that folder.
- New project: workspace/handover-hoverboard-mathlib-2026-11-25/project/
- New project lakefile: hoverboard-mathlib, version 0.1.0.
- New project manifest: copied from the Kerr project, same Mathlib commit.
- Package links: .lake/packages holds symlinks to the Kerr packages.
- Package links list: Cli, LeanSearchClient, Qq, aesop, batteries, importGraph, mathlib, plausible, proofwidgets.
- Cached oleans: 1555 files under the Mathlib package build folder.
- Cached oleans source: targeted cache fetch in the Kerr run.
- Cached modules used: Mathlib.Data.Real.Sqrt, Mathlib.Tactic.Ring, Mathlib.Tactic.Linarith.
- Full import test: lake env lean /tmp/TestImport.lean, exit 1, Nov 25, 2026.
- Full import error: Mathlib.olean does not exist.
- Full import error path: .lake/packages/mathlib/.lake/build/lib/lean/Mathlib.olean
- Named modules test: cd project, lake env lean TestReal.lean, exit 0, Nov 25, 2026.
- Named modules test time: about 7 seconds.
- Kerr build wall time: the Kerr RUN-LOG.md does not record a wall time for the 1818 job build.
- Named modules test result: U_min and U_strict print axioms propext, Classical.choice, Quot.sound.
- Named modules test result: no sorryAx appears.
- Lake build command: cd project, lake build.
- Lake build exit: 0.
- Lake build jobs: 1399.
- Lake build time: about 10 seconds for the final run.
- Lake build log: workspace/handover-hoverboard-mathlib-2026-11-25/lake_build.log.
- Lake build result: Built HoverboardMathlib, 1399 jobs.
- Lake build note: the first empty lib build ran 3 jobs in 3 seconds.
- Lake build note: the final build ran 1399 jobs after the spec and toy joined the lib.
- Why reuse is sound: the manifest pins the same Mathlib commit as Kerr.
- Why reuse is sound: the symlinks point at the exact Kerr package folders.
- Why reuse is sound: lake env lean resolved the same LEAN_PATH in the test.
- Why reuse is sound: the toy check exit 0 proves the links load.
- Disk: 27 GB free at run start, Kerr .lake holds 2.1 GB.
- Fresh build avoided: a full source build takes far longer than the timebox allows.
- Full cache fetch avoided: the full fetch reached 6048 of 6858 modules once and still stopped short.

## Units

- U1: Mathlib build or reuse, MATHLIB-BUILD.md, check P1, pass.
- U1 time: about 12 minutes, from 16:17 to 16:29 EST.

## Gaps

- Gap: full import Mathlib stays unavailable.
- Gap status: Queued.
- Gap owner: next run, needs Richardson approval.
- Gap next step: fetch the full cache or build Mathlib from source.
- Gap unblocker: a complete Mathlib.olean file in the project cache.
