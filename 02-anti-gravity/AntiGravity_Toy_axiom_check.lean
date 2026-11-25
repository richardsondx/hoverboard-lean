import Init

namespace AntiGravityToy

def toyAccel : Int := 1

def toyDensity : Int := -1

structure ToyEinstein where
  accel : Int
  density : Int
  einstein : accel = -density

def toySystem : ToyEinstein where
  accel := 1
  density := -1
  einstein := rfl

theorem repulsive_implies_negative_energy (a ρ : Int)
    (hE : a = -ρ) (hRep : 0 < a) : ρ < 0 := by
  omega

theorem repulsive_violates_wec (a ρ : Int)
    (hE : a = -ρ) (hRep : 0 < a) : ¬ 0 ≤ ρ := by
  omega

theorem repulsive_energy_gap (a ρ : Int)
    (hE : a = -ρ) : -ρ = a := by
  omega

theorem toy_point_repulsive : 0 < toyAccel := by
  unfold toyAccel
  omega

theorem toy_point_density_negative : toyDensity < 0 := by
  unfold toyDensity
  omega

theorem toy_point_violates_wec : ¬ 0 ≤ toyDensity := by
  unfold toyDensity
  omega

theorem toy_system_implies_negative (s : ToyEinstein)
    (hRep : 0 < s.accel) : s.density < 0 := by
  have hE : s.accel = -s.density := s.einstein
  omega

theorem exists_repulsive_exotic_source :
    ∃ a ρ : Int, 0 < a ∧ a = -ρ ∧ ρ < 0 :=
  ⟨1, -1, by omega, rfl, by omega⟩

end AntiGravityToy

#print axioms AntiGravityToy.repulsive_implies_negative_energy
#print axioms AntiGravityToy.repulsive_violates_wec
#print axioms AntiGravityToy.repulsive_energy_gap
#print axioms AntiGravityToy.toy_point_repulsive
#print axioms AntiGravityToy.toy_point_density_negative
#print axioms AntiGravityToy.toy_point_violates_wec
#print axioms AntiGravityToy.toy_system_implies_negative
#print axioms AntiGravityToy.exists_repulsive_exotic_source
