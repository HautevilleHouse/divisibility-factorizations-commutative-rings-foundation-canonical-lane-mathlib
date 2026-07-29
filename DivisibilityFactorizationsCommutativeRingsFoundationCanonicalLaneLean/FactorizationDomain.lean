import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure FactorizationDomain (R : Type u) [CommRing R] where
  isIntegralDomain : Prop
  existsFactorization : ∀ a : R, a ≠ 0 → ∃ (u : R) (irrs : List R), IsUnit u ∧ (∀ i ∈ irrs, Irreducible i) ∧ a = u * (irrs.prod)
  factorizationUnique : Prop

structure FactorizationDomainEvidence {R : Type u} [CommRing R] (F : FactorizationDomain R) where
  isIntegralDomain_closed : F.isIntegralDomain
  existsFactorization_closed : F.existsFactorization
  factorizationUnique_closed : F.factorizationUnique

def FactorizationDomainClosed {R : Type u} [CommRing R] (F : FactorizationDomain R) : Prop :=
  F.isIntegralDomain ∧ F.existsFactorization ∧ F.factorizationUnique

theorem factorization_domain_closed_from_evidence
    {R : Type u} [CommRing R] (F : FactorizationDomain R) (E : FactorizationDomainEvidence F) :
    FactorizationDomainClosed F := by
  exact And.intro E.isIntegralDomain_closed (And.intro E.existsFactorization_closed E.factorizationUnique_closed)

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse
