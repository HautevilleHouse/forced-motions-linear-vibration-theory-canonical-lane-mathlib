import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure SpringMassDamperSystem where
  mass : ℝ
  springStiffness : ℝ
  dampingCoeff : ℝ
  initialDisplacement : ℝ
  initialVelocity : ℝ

structure HarmonicOscillatorPackage (M : SpringMassDamperSystem) where
  naturalFrequency : ℝ
  dampingRatio : ℝ
  criticallyDamped : Prop
  underdamped : Prop
  overdamped : Prop
  naturalFrequencyDefined : naturalFrequency = √(M.springStiffness / M.mass)
  dampingRatioDefined : dampingRatio = M.dampingCoeff / (2 * √(M.mass * M.springStiffness))
  criticallyDampedWhen : criticallyDamped ↔ dampingRatio = 1
  underdampedWhen : underdamped ↔ dampingRatio < 1
  overdampedWhen : overdamped ↔ dampingRatio > 1

structure HarmonicOscillatorEvidence {M : SpringMassDamperSystem}
    (H : HarmonicOscillatorPackage M) where
  naturalFrequencyClosed : H.naturalFrequencyDefined
  dampingRatioClosed : H.dampingRatioDefined
  criticallyDampedClosed : H.criticallyDampedWhen
  underdampedClosed : H.underdampedWhen
  overdampedClosed : H.overdampedWhen

def HarmonicOscillatorClosed {M : SpringMassDamperSystem}
    (H : HarmonicOscillatorPackage M) : Prop :=
  H.naturalFrequencyDefined ∧ H.dampingRatioDefined ∧
  H.criticallyDampedWhen ∧ H.underdampedWhen ∧ H.overdampedWhen

theorem harmonic_oscillator_closed_from_evidence
    {M : SpringMassDamperSystem} (H : HarmonicOscillatorPackage M)
    (E : HarmonicOscillatorEvidence H) : HarmonicOscillatorClosed H := by
  exact And.intro E.naturalFrequencyClosed
    (And.intro E.dampingRatioClosed
      (And.intro E.criticallyDampedClosed
        (And.intro E.underdampedClosed E.overdampedClosed)))

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse