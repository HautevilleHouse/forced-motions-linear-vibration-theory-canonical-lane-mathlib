import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ForcedMotionsLinearVibrationTheoryCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

def ConstrainedForcedVibrationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_forced_vibration_endgame (A : AdmissibleClass) :
    ConstrainedForcedVibrationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse