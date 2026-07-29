import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure TransientSolutionPackage {M : SpringMassDamperSystem}
    (H : HarmonicOscillatorPackage M) where
  homogeneousSolution : ℝ → ℝ
  constantsDetermined : Prop
  homogeneousSolutionForm : ∀ t, homogeneousSolution t =
    (M.initialDisplacement) * cos (√(M.springStiffness / M.mass - (M.dampingCoeff^2)/(4*M.mass^2)) * t) +
    ((M.initialVelocity + (M.dampingCoeff/(2*M.mass))*M.initialDisplacement) /
    √(M.springStiffness / M.mass - (M.dampingCoeff^2)/(4*M.mass^2))) *
    sin (√(M.springStiffness / M.mass - (M.dampingCoeff^2)/(4*M.mass^2)) * t)
  constantsDeterminedDefined : constantsDetermined ↔ (∀ t, homogeneousSolution t =
    (M.initialDisplacement) * cos (√(M.springStiffness / M.mass - (M.dampingCoeff^2)/(4*M.mass^2)) * t) +
    ((M.initialVelocity + (M.dampingCoeff/(2*M.mass))*M.initialDisplacement) /
    √(M.springStiffness / M.mass - (M.dampingCoeff^2)/(4*M.mass^2))) *
    sin (√(M.springStiffness / M.mass - (M.dampingCoeff^2)/(4*M.mass^2)) * t))

structure TransientSolutionEvidence {M : SpringMassDamperSystem}
    {H : HarmonicOscillatorPackage M} (T : TransientSolutionPackage H) where
  homogeneousSolutionClosed : T.homogeneousSolutionForm
  constantsDeterminedClosed : T.constantsDeterminedDefined

def TransientSolutionClosed {M : SpringMassDamperSystem}
    {H : HarmonicOscillatorPackage M} (T : TransientSolutionPackage H) : Prop :=
  T.homogeneousSolutionForm ∧ T.constantsDeterminedDefined

theorem transient_solution_closed_from_evidence
    {M : SpringMassDamperSystem} {H : HarmonicOscillatorPackage M}
    (T : TransientSolutionPackage H) (E : TransientSolutionEvidence T) :
    TransientSolutionClosed T := by
  exact And.intro E.homogeneousSolutionClosed E.constantsDeterminedClosed

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse