import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ForcedMotionsLinearVibrationTheoryCanonicalLaneLean.ForcedMotionsLinearVibration

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure ResonancePackage {F : ForcedVibrationSystem} where
  naturalFrequency : ℝ
  resonantFrequency : ℝ
  amplitudeAtResonance : ℝ
  phaseAtResonance : ℝ
  naturalFreqDerived : naturalFrequency = Real.sqrt (F.stiffness / F.mass)
  resonantFreqDerived : resonantFrequency = Real.sqrt (F.stiffness / F.mass - (F.damping^2) / (2 * F.mass^2))
  amplitudeAtResonancePositive : amplitudeAtResonance > 0

structure ResonanceEvidence {F : ForcedVibrationSystem} (R : ResonancePackage F) where
  naturalFreqDerivedClosed : R.naturalFreqDerived
  resonantFreqDerivedClosed : R.resonantFreqDerived
  amplitudeAtResonancePositiveClosed : R.amplitudeAtResonancePositive

def ResonanceClosed {F : ForcedVibrationSystem} (R : ResonancePackage F) : Prop :=
  R.naturalFreqDerived ∧ R.resonantFreqDerived ∧ R.amplitudeAtResonancePositive

theorem resonance_closed_from_evidence {F : ForcedVibrationSystem} (R : ResonancePackage F) (E : ResonanceEvidence R) :
    ResonanceClosed R := by
  exact And.intro E.naturalFreqDerivedClosed (And.intro E.resonantFreqDerivedClosed E.amplitudeAtResonancePositiveClosed)

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse