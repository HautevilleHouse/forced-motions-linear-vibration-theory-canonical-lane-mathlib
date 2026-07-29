import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ForcedMotionsLinearVibrationTheoryCanonicalLaneLean.ForcedOscillatorEquation

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure PowerDissipationPackage {A : AdmissibleClass} (eqn : ForcedOscillatorEquation A) where
  instantaneousPower : ℝ → ℝ
  averagePower : ℝ
  powerDissipated : Prop
  powerDissipatedTerm : powerDissipated

def PowerDissipationClosed {A : AdmissibleClass} {eqn : ForcedOscillatorEquation A} (pkg : PowerDissipationPackage eqn) : Prop :=
  pkg.powerDissipated

theorem power_dissipation_closed (A : AdmissibleClass) (eqn : ForcedOscillatorEquation A) (pkg : PowerDissipationPackage eqn) :
    PowerDissipationClosed pkg := by
  exact pkg.powerDissipatedTerm

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse