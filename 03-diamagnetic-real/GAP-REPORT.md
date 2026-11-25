# Gap report, run stage2-hoverboard-mathlib-2026-11-25-01

## Words

- gap: work that remains.
- check: the act of verification on the real artifact.
- Queued: the run lists a gap as the next job, with its own approval gate, never called done.

## Result

- Lean accepts the real toy proof.
- The real spec theorem still holds a sorry.
- Six gaps stay open.
- Each gap names what would unblock it.

## Gaps

- Gap 1: the real spec target theorem holds a sorry.
- Gap 1 status: Queued.
- Gap 1 owner: next run, needs Richardson approval.
- Gap 1 next step: prove exists_stable_levitation_real for an abstract system, not only for realSystem.
- Gap 1 unblocker: a proof that the square shape forces the minimum for every system in the structure.
- Gap 2: the link between the real toy and the real spec theorem is partial.
- Gap 2 status: Queued.
- Gap 2 owner: next run, needs Richardson approval.
- Gap 2 next step: use realSystem_min and realSystem_strict to close the target theorem for realSystem only.
- Gap 2 unblocker: a proof that applies the toy theorems to the existential statement for realSystem.
- Gap 3: the real 3D field geometry is missing.
- Gap 3 status: Queued.
- Gap 3 owner: next run, needs Richardson approval.
- Gap 3 next step: model the field as a function of a 3D position, not a single height.
- Gap 3 unblocker: a Mathlib EuclideanSpace model with a real magnetic array field.
- Gap 4: full import Mathlib stays unavailable.
- Gap 4 status: Queued.
- Gap 4 owner: next run, needs Richardson approval.
- Gap 4 next step: fetch the full cache or build Mathlib from source.
- Gap 4 unblocker: a complete Mathlib.olean file in the project cache.
- Gap 5: the susceptibility value is a stand-in, not a measured material value.
- Gap 5 status: Queued.
- Gap 5 owner: next run, needs Richardson approval.
- Gap 5 next step: pick a real diamagnetic material and use its measured chi.
- Gap 5 unblocker: a published susceptibility value for a named material at 300 K.
- Gap 6: no lab check exists.
- Gap 6 status: Queued.
- Gap 6 owner: Richardson.
- Gap 6 next step: take proved parameters into a lab only after a real model exists.
- Gap 6 unblocker: a real material or array that matches a proved model.

## Closed in this run

- Closed: Mathlib reuse checks a real toy.
- Closed: the spec now uses Real, gravity 9.8, and chi less than 0.
- Closed: the toy now applies to the spec instance, with force zero at 0.
- Closed: the axiom check file imports the toy, so it cannot drift from the toy.
