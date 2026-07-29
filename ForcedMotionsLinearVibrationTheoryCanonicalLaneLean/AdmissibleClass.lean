import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure ForcedVibrationAdmittedObject where
  system : ForcedVibrationSystem
  response : SteadyStateResponse
  resonanceValid : Prop
  conclusion : resonanceValid

structure AdmissibleClass where
  object : ForcedVibrationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ForcedMotionClosed ({
    system := A.object.system,
    response := A.object.response,
    differentialEquationSatisfied := A.object.conclusion,
    particularSolutionConstructed := A.object.conclusion
  } : ForcedMotionPackage) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse