import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheory

structure ForcedMotionEquationPackage where
  massMatrix : Type
  dampingMatrix : Type
  stiffnessMatrix : Type
  forceVector : Type
  initialDisplacement : Type
  initialVelocity : Type
  massPosDef : Prop
  dampingPositive : Prop
  stiffnessPosDef : Prop
  forceContinuous : Prop
  initialConditionsConsistent : Prop

structure ForcedMotionEquationEvidence (F : ForcedMotionEquationPackage) where
  massPosDefClosed : F.massPosDef
  dampingPositiveClosed : F.dampingPositive
  stiffnessPosDefClosed : F.stiffnessPosDef
  forceContinuousClosed : F.forceContinuous
  initialConditionsConsistentClosed : F.initialConditionsConsistent

def ForcedMotionEquationClosed (F : ForcedMotionEquationPackage) : Prop :=
  F.massPosDef ∧ F.dampingPositive ∧ F.stiffnessPosDef ∧ F.forceContinuous ∧ F.initialConditionsConsistent

theorem forced_motion_equation_closed_from_evidence (F : ForcedMotionEquationPackage) (E : ForcedMotionEquationEvidence F) :
    ForcedMotionEquationClosed F := by
  exact And.intro E.massPosDefClosed
    (And.intro E.dampingPositiveClosed
      (And.intro E.stiffnessPosDefClosed
        (And.intro E.forceContinuousClosed E.initialConditionsConsistentClosed)))

end ForcedMotionsLinearVibrationTheory
end HautevilleHouse