import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure DivisorTheory where
  domain : Type u
  primeElements : Set domain
  factorizationExistence : Prop
  factorizationUniqueness : Prop
  dividesRelation : domain → domain → Prop
  unitGroup : Type v
  unitGroupAction : unitGroup → domain → domain
  primeElementsClosed : primeElements
  factorizationExistenceClosed : factorizationExistence
  factorizationUniquenessClosed : factorizationUniqueness

def DivisorTheoryClosed (D : DivisorTheory) : Prop :=
  D.factorizationExistence ∧ D.factorizationUniqueness

theorem divisor_theory_closed_from_evidence (D : DivisorTheory) : DivisorTheoryClosed D :=
  And.intro D.factorizationExistenceClosed D.factorizationUniquenessClosed

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse