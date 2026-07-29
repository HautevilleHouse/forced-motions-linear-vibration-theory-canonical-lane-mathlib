import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure ForcingFunction where
  amplitude : ℝ
  frequency : ℝ
  phase : ℝ

structure ForcedResponsePackage {M : SpringMassDamperSystem}
    (H : HarmonicOscillatorPackage M) (F : ForcingFunction) where
  particularSolution : ℝ → ℝ
  steadyStateAmplitude : ℝ
  phaseLag : ℝ
  particularSolutionCorrect : ∀ t, M.mass * derivative (derivative (particularSolution t)) +
    M.dampingCoeff * derivative (particularSolution t) +
    M.springStiffness * particularSolution t =
    F.amplitude * sin (F.frequency * t + F.phase)
  steadyStateAmplitudeFormula : steadyStateAmplitude = F.amplitude / √((M.springStiffness - M.mass * F.frequency^2)^2 + (M.dampingCoeff * F.frequency)^2)
  phaseLagFormula : phaseLag = atan2 (M.dampingCoeff * F.frequency) (M.springStiffness - M.mass * F.frequency^2)

structure ForcedResponseEvidence {M : SpringMassDamperSystem}
    {H : HarmonicOscillatorPackage M} {F : ForcingFunction}
    (R : ForcedResponsePackage H F) where
  particularSolutionClosed : R.particularSolutionCorrect
  steadyStateAmplitudeClosed : R.steadyStateAmplitudeFormula
  phaseLagClosed : R.phaseLagFormula

def ForcedResponseClosed {M : SpringMassDamperSystem}
    {H : HarmonicOscillatorPackage M} {F : ForcingFunction}
    (R : ForcedResponsePackage H F) : Prop :=
  R.particularSolutionCorrect ∧ R.steadyStateAmplitudeFormula ∧ R.phaseLagFormula

theorem forced_response_closed_from_evidence
    {M : SpringMassDamperSystem} {H : HarmonicOscillatorPackage M}
    {F : ForcingFunction} (R : ForcedResponsePackage H F)
    (E : ForcedResponseEvidence R) : ForcedResponseClosed R := by
  exact And.intro E.particularSolutionClosed
    (And.intro E.steadyStateAmplitudeClosed E.phaseLagClosed)

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse