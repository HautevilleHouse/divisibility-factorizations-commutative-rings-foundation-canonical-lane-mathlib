import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure IrreducibleDecomposition where
  domain : Type u
  irreducibleElements : Set domain
  decompositionExistence : domain → Prop
  decompositionUniqueness : Prop
  irreducibleElementsClosed : irreducibleElements
  decompositionExistenceClosed : decompositionExistence
  decompositionUniquenessClosed : decompositionUniqueness

def IrreducibleDecompositionClosed (I : IrreducibleDecomposition) : Prop :=
  (∀ a : I.domain, I.decompositionExistence a) ∧ I.decompositionUniqueness

theorem irreducible_decomposition_closed_from_evidence (I : IrreducibleDecomposition) : IrreducibleDecompositionClosed I :=
  And.intro I.decompositionExistenceClosed I.decompositionUniquenessClosed

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse