import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ForcedMotionsLinearVibrationTheory.ForcedMotionEquation

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheory

structure VibrationAbsorberPackage {F : ForcedMotionEquationPackage} (Eq : ForcedMotionEquationPackage) where
  absorberMass : Type
  absorberStiffness : Type
  absorberDamping : Type
  tuningCondition : Prop
  optimalDamping : Prop
  responseReduction : Prop

structure VibrationAbsorberEvidence {F : ForcedMotionEquationPackage}
    {Eq : ForcedMotionEquationPackage} (V : VibrationAbsorberPackage Eq) where
  tuningConditionClosed : V.tuningCondition
  optimalDampingClosed : V.optimalDamping
  responseReductionClosed : V.responseReduction

def VibrationAbsorberClosed {F : ForcedMotionEquationPackage}
    {Eq : ForcedMotionEquationPackage} (V : VibrationAbsorberPackage Eq) : Prop :=
  V.tuningCondition ∧ V.optimalDamping ∧ V.responseReduction

theorem vibration_absorber_closed_from_evidence {F : ForcedMotionEquationPackage}
    {Eq : ForcedMotionEquationPackage} (V : VibrationAbsorberPackage Eq)
    (E : VibrationAbsorberEvidence V) : VibrationAbsorberClosed V := by
  exact And.intro E.tuningConditionClosed
    (And.intro E.optimalDampingClosed E.responseReductionClosed)

end ForcedMotionsLinearVibrationTheory
end HautevilleHouse