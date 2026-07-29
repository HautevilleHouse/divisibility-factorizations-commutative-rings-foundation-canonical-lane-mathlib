import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure UFD (R : Type u) [CommRing R] where
  isGCDDomain : GCDDomain R
  irreducible_implies_prime : ∀ a : R, Irreducible a → Prime a
  factorization_exists_unique : Prop

structure UFDEvidence {R : Type u} [CommRing R] (U : UFD R) where
  isGCDDomain_closed : GCDDomainClosed U.isGCDDomain
  irreducible_implies_prime_closed : U.irreducible_implies_prime
  factorization_exists_unique_closed : U.factorization_exists_unique

def UFDClosed {R : Type u} [CommRing R] (U : UFD R) : Prop :=
  GCDDomainClosed U.isGCDDomain ∧ U.irreducible_implies_prime ∧ U.factorization_exists_unique

theorem ufd_closed_from_evidence
    {R : Type u} [CommRing R] (U : UFD R) (E : UFDEvidence U) :
    UFDClosed U := by
  exact And.intro E.isGCDDomain_closed (And.intro E.irreducible_implies_prime_closed E.factorization_exists_unique_closed)

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse
