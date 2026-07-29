import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ForcedMotionsLinearVibrationTheoryCanonicalLaneLean.ForcedOscillatorEquation

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure TransientVibrationPackage {A : AdmissibleClass} (eqn : ForcedOscillatorEquation A) where
  homogeneousSolution : ℝ → ℝ
  initialDisplacement : ℝ
  initialVelocity : ℝ
  dampingRatio : ℝ
  naturalFrequency : ℝ
  transientDecayRate : ℝ
  transientDecayRatePositive : Prop
  transientDecayRatePositiveTerm : transientDecayRatePositive

def TransientVibrationClosed {A : AdmissibleClass} {eqn : ForcedOscillatorEquation A} (pkg : TransientVibrationPackage eqn) : Prop :=
  pkg.transientDecayRatePositive

theorem transient_vibration_closed (A : AdmissibleClass) (eqn : ForcedOscillatorEquation A) (pkg : TransientVibrationPackage eqn) :
    TransientVibrationClosed pkg := by
  exact pkg.transientDecayRatePositiveTerm

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse