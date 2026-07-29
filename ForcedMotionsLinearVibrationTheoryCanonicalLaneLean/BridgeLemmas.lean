import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ForcedMotionsLinearVibrationTheoryCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ForcedMotionClosed ({
    system := A.object.system,
    response := A.object.response,
    differentialEquationSatisfied := A.object.conclusion,
    particularSolutionConstructed := A.object.conclusion
  } : ForcedMotionPackage)

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse