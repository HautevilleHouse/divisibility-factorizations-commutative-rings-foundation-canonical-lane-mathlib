import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure GCDStructure where
  domain : Type u
  gcd : domain → domain → domain
  gcdProperties : domain → domain → Prop
  gcdExistence : Prop
  gcdAssociativity : Prop
  gcdPropertiesClosed : gcdProperties
  gcdExistenceClosed : gcdExistence
  gcdAssociativityClosed : gcdAssociativity

def GCDStructureClosed (G : GCDStructure) : Prop :=
  G.gcdExistence ∧ G.gcdAssociativity

theorem gcd_structure_closed_from_evidence (G : GCDStructure) : GCDStructureClosed G :=
  And.intro G.gcdExistenceClosed G.gcdAssociativityClosed

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse