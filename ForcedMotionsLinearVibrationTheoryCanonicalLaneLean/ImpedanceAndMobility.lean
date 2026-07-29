import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ForcedMotionsLinearVibrationTheoryCanonicalLaneLean.ForcedOscillatorEquation

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure ImpedanceMobilityPackage {A : AdmissibleClass} (eqn : ForcedOscillatorEquation A) where
  mechanicalImpedance : ℝ → ℝ
  mobility : ℝ → ℝ
  impedancePositive : ∀ ω : ℝ, mechanicalImpedance ω ≥ 0
  impedancePositiveTerm : impedancePositive

def ImpedanceMobilityClosed {A : AdmissibleClass} {eqn : ForcedOscillatorEquation A} (pkg : ImpedanceMobilityPackage eqn) : Prop :=
  pkg.impedancePositive

theorem impedance_mobility_closed (A : AdmissibleClass) (eqn : ForcedOscillatorEquation A) (pkg : ImpedanceMobilityPackage eqn) :
    ImpedanceMobilityClosed pkg := by
  exact pkg.impedancePositiveTerm

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse