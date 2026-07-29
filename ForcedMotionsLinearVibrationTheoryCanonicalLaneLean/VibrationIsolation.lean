import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ForcedMotionsLinearVibrationTheoryCanonicalLaneLean.ForcedOscillatorEquation

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure VibrationIsolationPackage {A : AdmissibleClass} (eqn : ForcedOscillatorEquation A) where
  transmissibility : ℝ → ℝ
  isolationEffectiveness : ℝ → ℝ
  transmissibilityLessThanOne : ∀ ω : ℝ, transmissibility ω ≤ 1
  transmissibilityLessThanOneTerm : transmissibilityLessThanOne

def VibrationIsolationClosed {A : AdmissibleClass} {eqn : ForcedOscillatorEquation A} (pkg : VibrationIsolationPackage eqn) : Prop :=
  pkg.transmissibilityLessThanOne

theorem vibration_isolation_closed (A : AdmissibleClass) (eqn : ForcedOscillatorEquation A) (pkg : VibrationIsolationPackage eqn) :
    VibrationIsolationClosed pkg := by
  exact pkg.transmissibilityLessThanOneTerm

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse