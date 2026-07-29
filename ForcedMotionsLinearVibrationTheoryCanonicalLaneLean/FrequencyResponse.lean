import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure FrequencyResponsePackage where
  excitationFrequencies : Set ℝ
  responseAmplitudes : ℝ → ℝ
  phaseAngles : ℝ → ℝ
  nyquistPlot : ℂ → ℂ
  magnitudeRatio : ℝ → ℝ
  phaseAngle : ℝ → ℝ

structure FrequencyResponseEvidence (F : FrequencyResponsePackage) where
  amplitudeFinite : ∀ ω, F.responseAmplitudes ω < ∞
  phaseContinuous : ∀ ω, ContinuousAt F.phaseAngles ω
  magnitudeRatioBounded : ∀ ω, F.magnitudeRatio ω ≤ 1

def FrequencyResponseClosed (F : FrequencyResponsePackage) : Prop :=
  (∀ ω, F.responseAmplitudes ω < ∞) ∧
  (∀ ω, ContinuousAt F.phaseAngles ω) ∧
  (∀ ω, F.magnitudeRatio ω ≤ 1)

theorem frequency_response_closed_from_evidence (F : FrequencyResponsePackage) (E : FrequencyResponseEvidence F) : FrequencyResponseClosed F := by
  exact And.intro E.amplitudeFinite (And.intro E.phaseContinuous E.magnitudeRatioBounded)

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse
