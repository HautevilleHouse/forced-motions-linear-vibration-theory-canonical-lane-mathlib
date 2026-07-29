import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure CompleteResponsePackage {M : SpringMassDamperSystem}
    {H : HarmonicOscillatorPackage M} {F : ForcingFunction}
    {R : ForcedResponsePackage H F} {T : TransientSolutionPackage H} where
  totalSolution : ℝ → ℝ
  totalSolutionForm : totalSolution = (fun t => T.homogeneousSolution t + R.particularSolution t)
  completeResponseClosed : Prop
  completeResponseClosedDefined : completeResponseClosed ↔
    ∀ t, M.mass * derivative (derivative (totalSolution t)) +
         M.dampingCoeff * derivative (totalSolution t) +
         M.springStiffness * totalSolution t =
         F.amplitude * sin (F.frequency * t + F.phase) ∧
         totalSolution 0 = M.initialDisplacement ∧
         derivative (totalSolution 0) = M.initialVelocity

structure CompleteResponseEvidence {M : SpringMassDamperSystem}
    {H : HarmonicOscillatorPackage M} {F : ForcingFunction}
    {R : ForcedResponsePackage H F} {T : TransientSolutionPackage H}
    (C : CompleteResponsePackage M H F R T) where
  totalSolutionFormClosed : C.totalSolutionForm
  completeResponseClosedDefinedClosed : C.completeResponseClosedDefined

def CompleteResponseClosed {M : SpringMassDamperSystem}
    {H : HarmonicOscillatorPackage M} {F : ForcingFunction}
    {R : ForcedResponsePackage H F} {T : TransientSolutionPackage H}
    (C : CompleteResponsePackage M H F R T) : Prop :=
  C.totalSolutionForm ∧ C.completeResponseClosedDefined

theorem complete_response_closed_from_evidence
    {M : SpringMassDamperSystem} {H : HarmonicOscillatorPackage M}
    {F : ForcingFunction} {R : ForcedResponsePackage H F}
    {T : TransientSolutionPackage H} (C : CompleteResponsePackage M H F R T)
    (E : CompleteResponseEvidence C) : CompleteResponseClosed C := by
  exact And.intro E.totalSolutionFormClosed E.completeResponseClosedDefinedClosed

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse