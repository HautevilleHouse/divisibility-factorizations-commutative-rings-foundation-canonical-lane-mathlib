import DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean.PrincipalIdealDomains

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure EuclideanDomainPackage {R : Type u} [CommRing R] where
  isED : Prop
  euclideanFunction : R → ℕ
  divisionAlgorithm : ∀ a b, b ≠ 0 → ∃ q r, a = b*q + r ∧ (r = 0 ∨ euclideanFunction r < euclideanFunction b)
  edImpliesPID : Prop

structure EuclideanDomainEvidence {R : Type u} [CommRing R] (E : EuclideanDomainPackage R) where
  isEDClosed : E.isED
  divisionAlgorithmClosed : E.divisionAlgorithm
  edImpliesPIDClosed : E.edImpliesPID

def EuclideanDomainClosed {R : Type u} [CommRing R] (E : EuclideanDomainPackage R) : Prop :=
  E.isED ∧ E.edImpliesPID

theorem euclidean_domain_closed_from_evidence
    {R : Type u} [CommRing R] (E : EuclideanDomainPackage R) (Ev : EuclideanDomainEvidence E) :
    EuclideanDomainClosed E := by
  exact And.intro Ev.isEDClosed Ev.edImpliesPIDClosed

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse