import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ForcedMotionsLinearVibrationTheory.ForcedMotionEquation

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheory

structure HarmonicResponsePackage {F : ForcedMotionEquationPackage} (Eq : ForcedMotionEquationPackage) where
  frequencyResponseFunction : Type
  transferMatrix : Type
  resonanceCondition : Prop
  amplitudePhaseRelation : Prop
  peakAmplitude : Prop
  bandwidth : Prop

structure HarmonicResponseEvidence {F : ForcedMotionEquationPackage}
    {Eq : ForcedMotionEquationPackage} (H : HarmonicResponsePackage Eq) where
  resonanceConditionClosed : H.resonanceCondition
  amplitudePhaseRelationClosed : H.amplitudePhaseRelation
  peakAmplitudeClosed : H.peakAmplitude
  bandwidthClosed : H.bandwidth

def HarmonicResponseClosed {F : ForcedMotionEquationPackage}
    {Eq : ForcedMotionEquationPackage} (H : HarmonicResponsePackage Eq) : Prop :=
  H.resonanceCondition ∧ H.amplitudePhaseRelation ∧ H.peakAmplitude ∧ H.bandwidth

theorem harmonic_response_closed_from_evidence {F : ForcedMotionEquationPackage}
    {Eq : ForcedMotionEquationPackage} (H : HarmonicResponsePackage Eq)
    (E : HarmonicResponseEvidence H) : HarmonicResponseClosed H := by
  exact And.intro E.resonanceConditionClosed
    (And.intro E.amplitudePhaseRelationClosed
      (And.intro E.peakAmplitudeClosed E.bandwidthClosed))

end ForcedMotionsLinearVibrationTheory
end HautevilleHouse