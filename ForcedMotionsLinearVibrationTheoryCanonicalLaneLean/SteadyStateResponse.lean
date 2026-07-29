import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ForcedMotionsLinearVibrationTheoryCanonicalLaneLean.ForcedOscillatorEquation

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure SteadyStateResponsePackage {A : AdmissibleClass} (eqn : ForcedOscillatorEquation A) where
  particularSolution : ℝ → ℝ
  amplitudeRatio : ℝ
  phaseLag : ℝ
  resonanceCondition : Prop
  steadyStateExists : Prop
  steadyStateExistsTerm : steadyStateExists

def SteadyStateResponseClosed {A : AdmissibleClass} {eqn : ForcedOscillatorEquation A} (pkg : SteadyStateResponsePackage eqn) : Prop :=
  pkg.steadyStateExists

theorem steady_state_response_closed (A : AdmissibleClass) (eqn : ForcedOscillatorEquation A) (pkg : SteadyStateResponsePackage eqn) :
    SteadyStateResponseClosed pkg := by
  exact pkg.steadyStateExistsTerm

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse