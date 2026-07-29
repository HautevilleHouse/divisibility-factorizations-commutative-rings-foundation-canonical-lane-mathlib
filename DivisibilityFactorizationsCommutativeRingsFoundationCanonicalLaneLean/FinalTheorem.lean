import DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

def ConstrainedDivisibilityFactorizationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_divisibility_factorization_endgame (A : AdmissibleClass) :
    ConstrainedDivisibilityFactorizationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse
