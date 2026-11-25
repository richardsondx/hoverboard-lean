import Mathlib.Data.Real.Sqrt
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import HoverboardMathlib.Diamagnetic_Real_Spec

namespace DiamagneticRealToy

/-- The Real potential. `U x = x ^ 2 + 1`. -/
def U (x : ℝ) : ℝ := x ^ 2 + 1

/-- The potential at rest height is 1. -/
theorem U_at_zero : U 0 = 1 := by
  unfold U
  simp only [ne_eq, OfNat.ofNat_ne_zero, not_false_eq_true, zero_pow, zero_add]

/-- The potential has a global minimum at 0. -/
theorem U_min (x : ℝ) : U 0 ≤ U x := by
  unfold U
  simp only [ne_eq, OfNat.ofNat_ne_zero, not_false_eq_true, zero_pow, zero_add]
  have h : (0:ℝ) ≤ x ^ 2 := sq_nonneg x
  linarith

/-- The minimum at 0 is strict away from 0. -/
theorem U_strict (x : ℝ) (hx : x ≠ 0) : U 0 < U x := by
  unfold U
  simp only [ne_eq, OfNat.ofNat_ne_zero, not_false_eq_true, zero_pow, zero_add]
  have h : (0:ℝ) < x ^ 2 := sq_pos_of_ne_zero hx
  linarith

/-- The gap above the minimum equals `x ^ 2`. -/
theorem U_gap (x : ℝ) : U x - U 0 = x ^ 2 := by
  unfold U
  simp only [ne_eq, OfNat.ofNat_ne_zero, not_false_eq_true, zero_pow, zero_add]
  ring

/-- The curvature is positive: the gap grows with distance. -/
theorem U_gap_pos (x : ℝ) (hx : x ≠ 0) : 0 < U x - U 0 := by
  rw [U_gap]
  exact sq_pos_of_ne_zero hx

/-- Link to the spec: the force in `realSystem` is zero at 0. -/
theorem realSystem_force_zero : DiamagneticRealSpec.realSystem.force 0 = 0 := by
  change (0:ℝ) ^ 2 = 0
  simp

/-- Link to the spec: the potential in `realSystem` has its minimum at 0. -/
theorem realSystem_min (x : ℝ) :
    DiamagneticRealSpec.realSystem.potential 0 ≤
      DiamagneticRealSpec.realSystem.potential x :=
  U_min x

/-- Link to the spec: the minimum in `realSystem` is strict away from 0. -/
theorem realSystem_strict (x : ℝ) (hx : x ≠ 0) :
    DiamagneticRealSpec.realSystem.potential 0 <
      DiamagneticRealSpec.realSystem.potential x :=
  U_strict x hx

end DiamagneticRealToy
