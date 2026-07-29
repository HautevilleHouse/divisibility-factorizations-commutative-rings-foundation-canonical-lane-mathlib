import DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean.UniqueFactorizationDomain

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure GCDDomainPackage {R : Type u} [CommRing R] where
  gcdExists : Prop
  lcmExists : Prop
  bezoutIdentity : Prop
  gcdClosed : Prop

structure GCDDomainEvidence {R : Type u} [CommRing R] (G : GCDDomainPackage R) where
  gcdExistsClosed : G.gcdExists
  lcmExistsClosed : G.lcmExists
  bezoutIdentityClosed : G.bezoutIdentity
  gcdClosedClosed : G.gcdClosed

def GCDDomainClosed {R : Type u} [CommRing R] (G : GCDDomainPackage R) : Prop :=
  G.gcdExists ∧ G.lcmExists ∧ G.bezoutIdentity ∧ G.gcdClosed

theorem gcd_domain_closed_from_evidence
    {R : Type u} [CommRing R] (G : GCDDomainPackage R) (E : GCDDomainEvidence G) :
    GCDDomainClosed G := by
  exact And.intro E.gcdExistsClosed (And.intro E.lcmExistsClosed
    (And.intro E.bezoutIdentityClosed E.gcdClosedClosed))

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse