import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ForcedMotionsLinearVibrationTheory.ForcedMotionEquation

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheory

structure ModalAnalysisPackage {F : ForcedMotionEquationPackage} (Eq : ForcedMotionEquationPackage) where
  eigenfrequencySquared : Type
  modeShapes : Type
  orthogonalityMass : Prop
  orthogonalityStiffness : Prop
  completenessModes : Prop
  decoupledEquationsExist : Prop

structure ModalAnalysisEvidence {F : ForcedMotionEquationPackage} {Eq : ForcedMotionEquationPackage}
    (M : ModalAnalysisPackage Eq) where
  orthogonalityMassClosed : M.orthogonalityMass
  orthogonalityStiffnessClosed : M.orthogonalityStiffness
  completenessModesClosed : M.completenessModes
  decoupledEquationsExistClosed : M.decoupledEquationsExist

def ModalAnalysisClosed {F : ForcedMotionEquationPackage}
    {Eq : ForcedMotionEquationPackage} (M : ModalAnalysisPackage Eq) : Prop :=
  M.orthogonalityMass ∧ M.orthogonalityStiffness ∧ M.completenessModes ∧ M.decoupledEquationsExist

theorem modal_analysis_closed_from_evidence {F : ForcedMotionEquationPackage}
    {Eq : ForcedMotionEquationPackage} (M : ModalAnalysisPackage Eq)
    (E : ModalAnalysisEvidence M) : ModalAnalysisClosed M := by
  exact And.intro E.orthogonalityMassClosed
    (And.intro E.orthogonalityStiffnessClosed
      (And.intro E.completenessModesClosed E.decoupledEquationsExistClosed))

end ForcedMotionsLinearVibrationTheory
end HautevilleHouse