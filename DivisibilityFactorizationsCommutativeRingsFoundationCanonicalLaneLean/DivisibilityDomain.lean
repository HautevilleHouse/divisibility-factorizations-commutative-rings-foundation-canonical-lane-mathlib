import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure DivisibilityDomain (A : Type u) [CommRing A] where
  noZeroDivisors : ∀ {a b : A}, a * b = 0 → a = 0 ∨ b = 0
  integralDomain : IsDomain A := by
    exact { mul_comm := mul_comm, .. (by infer_instance : CommRing A), noZeroDivisors := noZeroDivisors }

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse