import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure ForcedVibrationSystem where
  mass : ℝ
  damping : ℝ
  stiffness : ℝ
  forcingAmplitude : ℝ
  forcingFrequency : ℝ
  dampingPositive : damping > 0
  stiffnessPositive : stiffness > 0
  massPositive : mass > 0

structure SteadyStateResponse where
  amplitude : ℝ
  phaseLag : ℝ
  amplitudeFinite : amplitude > 0
  phaseLagFinite : phaseLag > 0

structure ForcedMotionPackage where
  system : ForcedVibrationSystem
  response : SteadyStateResponse
  differentialEquationSatisfied : Prop
  particularSolutionConstructed : Prop

structure ForcedMotionEvidence (F : ForcedMotionPackage) where
  differentialEquationSatisfiedClosed : F.differentialEquationSatisfied
  particularSolutionConstructedClosed : F.particularSolutionConstructed

def ForcedMotionClosed (F : ForcedMotionPackage) : Prop :=
  F.differentialEquationSatisfied ∧ F.particularSolutionConstructed

theorem forced_motion_closed_from_evidence (F : ForcedMotionPackage) (E : ForcedMotionEvidence F) :
    ForcedMotionClosed F := by
  exact And.intro E.differentialEquationSatisfiedClosed E.particularSolutionConstructedClosed

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse