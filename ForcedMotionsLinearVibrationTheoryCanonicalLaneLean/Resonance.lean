import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure ResonancePackage {M : SpringMassDamperSystem}
    {H : HarmonicOscillatorPackage M} {F : ForcingFunction}
    (R : ForcedResponsePackage H F) where
  resonantFrequency : ℝ
  resonanceCondition : Prop
  amplificationFactor : ℝ
  resonantFrequencyDefined : resonantFrequency = √(M.springStiffness / M.mass - (M.dampingCoeff^2) / (2 * M.mass^2))
  resonanceConditionDefined : resonanceCondition ↔ (F.frequency = resonantFrequency)
  amplificationFactorFormula : amplificationFactor = 1 / (2 * M.dampingCoeff * √(M.mass * M.springStiffness) * √(1 - (M.dampingCoeff^2) / (4 * M.mass * M.springStiffness)))

structure ResonanceEvidence {M : SpringMassDamperSystem}
    {H : HarmonicOscillatorPackage M} {F : ForcingFunction}
    {R : ForcedResponsePackage H F} (Res : ResonancePackage R) where
  resonantFrequencyClosed : Res.resonantFrequencyDefined
  resonanceConditionClosed : Res.resonanceConditionDefined
  amplificationFactorClosed : Res.amplificationFactorFormula

def ResonanceClosed {M : SpringMassDamperSystem}
    {H : HarmonicOscillatorPackage M} {F : ForcingFunction}
    {R : ForcedResponsePackage H F} (Res : ResonancePackage R) : Prop :=
  Res.resonantFrequencyDefined ∧ Res.resonanceConditionDefined ∧ Res.amplificationFactorFormula

theorem resonance_closed_from_evidence
    {M : SpringMassDamperSystem} {H : HarmonicOscillatorPackage M}
    {F : ForcingFunction} {R : ForcedResponsePackage H F}
    (Res : ResonancePackage R) (E : ResonanceEvidence Res) : ResonanceClosed Res := by
  exact And.intro E.resonantFrequencyClosed
    (And.intro E.resonanceConditionClosed E.amplificationFactorClosed)

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse