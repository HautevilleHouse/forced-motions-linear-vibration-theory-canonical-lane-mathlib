import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ForcedMotionsLinearVibrationTheoryCanonicalLaneLean

structure ForcedMotionSystem where
  mass : ℝ
  damping : ℝ
  stiffness : ℝ
  forcingAmplitude : ℝ
  forcingFrequency : ℝ
  initialDisplacement : ℝ
  initialVelocity : ℝ
  timeDomain : ℝ → Prop

def systemEquation (sys : ForcedMotionSystem) : ℝ → ℝ → ℝ := λ t x =>
  sys.mass * x + sys.damping * x + sys.stiffness * x - sys.forcingAmplitude * Real.cos (sys.forcingFrequency * t)

structure SteadyStateResponse where
  amplitude : ℝ
  phaseLag : ℝ
  frequency : ℝ
  responseValid : Prop

structure TransientResponse where
  homogeneousSolution : ℝ → ℝ
  decayRate : ℝ
  naturalFrequency : ℝ
  transientValid : Prop

end ForcedMotionsLinearVibrationTheoryCanonicalLaneLean
end HautevilleHouse