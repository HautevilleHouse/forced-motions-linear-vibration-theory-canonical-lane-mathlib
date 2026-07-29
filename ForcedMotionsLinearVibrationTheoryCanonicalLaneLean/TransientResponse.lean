import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ForcedMotionsLinearVibrationTheory.ForcedMotionEquation

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheory

structure TransientResponsePackage {F : ForcedMotionEquationPackage} (Eq : ForcedMotionEquationPackage) where
  impulseResponse : Type
  stepResponse : Type
  convolutionIntegral : Prop
  duhamelIntegral : Prop
  responseDecay : Prop
  overshoot : Prop

structure TransientResponseEvidence {F : ForcedMotionEquationPackage}
    {Eq : ForcedMotionEquationPackage} (T : TransientResponsePackage Eq) where
  convolutionIntegralClosed : T.convolutionIntegral
  duhamelIntegralClosed : T.duhamelIntegral
  responseDecayClosed : T.responseDecay
  overshootClosed : T.overshoot

def TransientResponseClosed {F : ForcedMotionEquationPackage}
    {Eq : ForcedMotionEquationPackage} (T : TransientResponsePackage Eq) : Prop :=
  T.convolutionIntegral ∧ T.duhamelIntegral ∧ T.responseDecay ∧ T.overshoot

theorem transient_response_closed_from_evidence {F : ForcedMotionEquationPackage}
    {Eq : ForcedMotionEquationPackage} (T : TransientResponsePackage Eq)
    (E : TransientResponseEvidence T) : TransientResponseClosed T := by
  exact And.intro E.convolutionIntegralClosed
    (And.intro E.duhamelIntegralClosed
      (And.intro E.responseDecayClosed E.overshootClosed))

end ForcedMotionsLinearVibrationTheory
end HautevilleHouse