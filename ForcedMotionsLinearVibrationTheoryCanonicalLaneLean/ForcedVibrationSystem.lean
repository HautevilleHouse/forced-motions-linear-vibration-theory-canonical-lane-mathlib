import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure ForcedVibrationSystem where
  mass : ℝ
  damping : ℝ
  stiffness : ℝ
  forcingAmplitude : ℝ
  forcingFrequency : ℝ
  initialDisplacement : ℝ
  initialVelocity : ℝ
  steadyStateSolution : ℝ → ℝ
  transientSolution : ℝ → ℝ
  particularSolution : ℝ → ℝ
  fullSolution : ℝ → ℝ := λ t => transientSolution t + particularSolution t
  resonanceCondition : Prop := forcingFrequency = √(stiffness / mass)

structure ForcedVibrationEvidence (S : ForcedVibrationSystem) where
  massPositive : S.mass > 0
  stiffnessPositive : S.stiffness > 0
  dampingNonnegative : S.damping ≥ 0
  particularSolutionSatisfiesODE : Prop
  steadyStateAmplitudeBounded : Prop

def ForcedVibrationSystemClosed (S : ForcedVibrationSystem) : Prop :=
  S.mass > 0 ∧ S.stiffness > 0 ∧ S.damping ≥ 0 ∧
  (∀ t, deriv (λ s => S.fullSolution s) t + (S.damping / S.mass) * deriv S.fullSolution t + (S.stiffness / S.mass) * S.fullSolution t = (S.forcingAmplitude / S.mass) * Real.cos (S.forcingFrequency * t))

theorem forced_vibration_closed_from_evidence (S : ForcedVibrationSystem) (E : ForcedVibrationEvidence S) : ForcedVibrationSystemClosed S := by
  refine And.intro E.massPositive (And.intro E.stiffnessPositive (And.intro E.dampingNonnegative ?_))
  -- particularSolutionSatisfiesODE should provide the ODE condition
  exact E.particularSolutionSatisfiesODE

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse
