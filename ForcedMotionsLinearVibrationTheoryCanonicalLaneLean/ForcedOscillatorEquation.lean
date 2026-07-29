import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure ForcedOscillatorEquation (A : AdmissibleClass) where
  mass : ℝ
  dampingCoeff : ℝ
  stiffness : ℝ
  forcingAmplitude : ℝ
  forcingFrequency : ℝ
  displacementField : ℝ → ℝ
  velocityField : ℝ → ℝ
  accelerationField : ℝ → ℝ
  equationSatisfied : Prop
  equationSatisfiedTerm : equationSatisfied

def ForcedOscillatorEquationClosed (A : AdmissibleClass) (eqn : ForcedOscillatorEquation A) : Prop :=
  eqn.equationSatisfied

theorem forced_oscillator_eqn_closed (A : AdmissibleClass) (eqn : ForcedOscillatorEquation A) :
    ForcedOsscillatorEquationClosed A eqn := by
  exact eqn.equationSatisfiedTerm

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse