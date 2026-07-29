import ForcedMotionsLinearVibrationTheoryCanonicalLaneLean.HarmonicExcitationAnalysis

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure VibrationAbsorberDesign {sys : ForcedMotionSystem} where
  absorberMass : ℝ
  absorberStiffness : ℝ
  absorberNaturalFrequency : ℝ
  operationalBandwidth : ℝ
  designValid : Prop

def tunedFrequencyRatio (absorberNatFreq : ℝ) (sysNatFreq : ℝ) : ℝ :=
  absorberNatFreq / sysNatFreq

def massRatio (abs : VibrationAbsorberDesign) (sys : ForcedMotionSystem) : ℝ :=
  abs.absorberMass / sys.mass

structure VibrationAbsorberEvidence {sys : ForcedMotionSystem}
  (D : VibrationAbsorberDesign) where
  absorberNaturalFrequencyClosed : D.absorberNaturalFrequency = Real.sqrt (D.absorberStiffness / D.absorberMass)
  tuningCondition : D.absorberNaturalFrequency = Real.sqrt (sys.stiffness / sys.mass)
  bandwidthSatisfied : D.operationalBandwidth > 0

def VibrationAbsorberClosed {sys : ForcedMotionSystem} (D : VibrationAbsorberDesign) : Prop :=
  D.absorberNaturalFrequency = Real.sqrt (D.absorberStiffness / D.absorberMass) ∧
  D.absorberNaturalFrequency = Real.sqrt (sys.stiffness / sys.mass) ∧
  D.operationalBandwidth > 0

theorem vibration_absorber_closed_from_evidence {sys : ForcedMotionSystem}
  (D : VibrationAbsorberDesign) (E : VibrationAbsorberEvidence D) : VibrationAbsorberClosed D :=
  And.intro E.absorberNaturalFrequencyClosed (And.intro E.tuningCondition E.bandwidthSatisfied)

end HautevilleHouse
end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean