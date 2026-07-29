import ForcedMotionsLinearVibrationTheoryCanonicalLaneLean.VibrationAbsorberDesign

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure MultipleDOFSystem where
  massMatrix : Matrix (Fin n) (Fin n) ℝ
  dampingMatrix : Matrix (Fin n) (Fin n) ℝ
  stiffnessMatrix : Matrix (Fin n) (Fin n) ℝ
  forcingVector : Fin n → ℝ → ℝ
  initialDisplacementVector : Fin n → ℝ
  initialVelocityVector : Fin n → ℝ

structure ModalAnalysis where
  eigenfrequencies : Fin n → ℝ
  modeShapes : Fin n → (Fin n → ℝ)
  modalDamping : Fin n → ℝ
  modalValid : Prop

def transformToModalCoordinates (M : MultipleDOFSystem) (modes : ModalAnalysis) : (Fin n → ℝ → ℝ) := λ i t =>
  ∑ j, modes.modeShapes j i * (M.forcingVector j t)

structure MultipleDOFEvidence (M : MultipleDOFSystem) (MA : ModalAnalysis) where
  eigenfrequenciesPositive : ∀ i, MA.eigenfrequencies i > 0
  modeShapesOrthonormal : ∀ i j, ∑ k, MA.modeShapes i k * MA.modeShapes j k = if i = j then 1 else 0
  modalDampingRatio : ∀ i, MA.modalDamping i > 0

def MultipleDOFClosed (M : MultipleDOFSystem) (MA : ModalAnalysis) : Prop :=
  (∀ i, MA.eigenfrequencies i > 0) ∧ (∀ i j, ∑ k, MA.modeShapes i k * MA.modeShapes j k = if i = j then 1 else 0) ∧ (∀ i, MA.modalDamping i > 0)

theorem multiple_dof_closed_from_evidence (M : MultipleDOFSystem) (MA : ModalAnalysis)
  (E : MultipleDOFEvidence M MA) : MultipleDOFClosed M MA :=
  And.intro E.eigenfrequenciesPositive (And.intro E.modeShapesOrthonormal E.modalDampingRatio)

end HautevilleHouse
end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean