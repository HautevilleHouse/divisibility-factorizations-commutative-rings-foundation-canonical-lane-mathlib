import DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure PrimeElementStructure {R : Type u} [CommRing R] where
  carrier : Type v
  irreducibleElements : Set R
  primeElements : Set R
  associatesClasses : Type w
  factorizationUnique : Prop
  irreducibleIsPrime : Prop

structure PrimeElementStructureEvidence {R : Type u} [CommRing R] (P : PrimeElementStructure R) where
  irreducibleElementsClosed : P.irreducibleElements = Set.univ  -- placeholder
  primeElementsClosed : P.primeElements = Set.univ
  associatesClassesClosed : Nonempty P.associatesClasses
  factorizationUniqueClosed : P.factorizationUnique
  irreducibleIsPrimeClosed : P.irreducibleIsPrime

def PrimeElementStructureClosed {R : Type u} [CommRing R] (P : PrimeElementStructure R) : Prop :=
  P.factorizationUnique ∧ P.irreducibleIsPrime

theorem prime_element_structure_closed_from_evidence
    {R : Type u} [CommRing R] (P : PrimeElementStructure R) (E : PrimeElementStructureEvidence P) :
    PrimeElementStructureClosed P := by
  exact And.intro E.factorizationUniqueClosed E.irreducibleIsPrimeClosed

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse