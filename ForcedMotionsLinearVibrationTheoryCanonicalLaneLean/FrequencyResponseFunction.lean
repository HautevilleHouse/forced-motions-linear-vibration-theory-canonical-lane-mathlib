import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ForcedMotionsLinearVibrationTheoryCanonicalLaneLean.ForcedOscillatorEquation

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure FrequencyResponseFunctionPackage {A : AdmissibleClass} (eqn : ForcedOscillatorEquation A) where
  transferFunction : ℂ → ℂ
  magnitudeRatio : ℝ → ℝ
  phaseAngle : ℝ → ℝ
  resonanceFrequency : ℝ
  halfPowerBandwidth : ℝ
  magnitudeDefined : ∀ ω : ℝ, magnitudeRatio ω ≥ 0
  magnitudeDefinedTerm : magnitudeDefined

def FrequencyResponseFunctionClosed {A : AdmissibleClass} {eqn : ForcedOscillatorEquation A} (pkg : FrequencyResponseFunctionPackage eqn) : Prop :=
  pkg.magnitudeDefined

theorem frequency_response_function_closed (A : AdmissibleClass) (eqn : ForcedOscillatorEquation A) (pkg : FrequencyResponseFunctionPackage eqn) :
    FrequencyResponseFunctionClosed pkg := by
  exact pkg.magnitudeDefinedTerm

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse