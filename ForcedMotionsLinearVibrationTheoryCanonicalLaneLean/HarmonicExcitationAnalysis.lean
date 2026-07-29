import ForcedMotionsLinearVibrationTheoryCanonicalLaneLean.ForcedMotionBaseSystem

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure HarmonicExcitationPackage (sys : ForcedMotionSystem) where
  steadyStateAmplitude : ℝ
  phaseAngle : ℝ
  magnificationFactor : ℝ
  resonanceCondition : Prop

def magnificationFactor (sys : ForcedMotionSystem) : ℝ :=
  1 / Real.sqrt ((1 - (sys.forcingFrequency / Real.sqrt (sys.stiffness / sys.mass)) ^ 2) ^ 2 +
    (2 * sys.damping / (Real.sqrt (sys.stiffness / sys.mass) * sys.mass) * sys.forcingFrequency) ^ 2)

end HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure HarmonicExcitationEvidence {sys : ForcedMotionSystem}
  (H : HarmonicExcitationPackage sys) where
  steadyStateAmplitudeClosed : H.steadyStateAmplitude > 0
  phaseAngleClosed : H.phaseAngle ∈ Set.Ioo (-Real.pi / 2) (Real.pi / 2)
  magnificationFactorClosed : H.magnificationFactor = magnificationFactor sys
  resonanceConditionClosed : H.resonanceCondition ↔ sys.forcingFrequency = Real.sqrt (sys.stiffness / sys.mass)

def HarmonicExcitationClosed {sys : ForcedMotionSystem}
  (H : HarmonicExcitationPackage sys) : Prop :=
  H.steadyStateAmplitude > 0 ∧ H.phaseAngle ∈ Set.Ioo (-Real.pi / 2) (Real.pi / 2) ∧
  H.magnificationFactor = magnificationFactor sys ∧ (H.resonanceCondition ↔ sys.forcingFrequency = Real.sqrt (sys.stiffness / sys.mass))

theorem harmonic_excitation_closed_from_evidence {sys : ForcedMotionSystem}
  (H : HarmonicExcitationPackage sys) (E : HarmonicExcitationEvidence H) : HarmonicExcitationClosed H :=
  And.intro E.steadyStateAmplitudeClosed (And.intro E.phaseAngleClosed (And.intro E.magnificationFactorClosed E.resonanceConditionClosed))

end HautevilleHouse
end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean