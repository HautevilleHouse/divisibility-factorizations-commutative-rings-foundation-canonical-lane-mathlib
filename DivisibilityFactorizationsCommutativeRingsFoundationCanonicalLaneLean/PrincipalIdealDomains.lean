import DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean.GCDDomains

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure PrincipalIdealDomainPackage {R : Type u} [CommRing R] where
  isPID : Prop
  everyIdealPrincipal : Prop
  noetherian : Prop
  pidImpliesUFD : Prop

structure PrincipalIdealDomainEvidence {R : Type u} [CommRing R] (P : PrincipalIdealDomainPackage R) where
  isPIDClosed : P.isPID
  everyIdealPrincipalClosed : P.everyIdealPrincipal
  noetherianClosed : P.noetherian
  pidImpliesUFDClosed : P.pidImpliesUFD

def PrincipalIdealDomainClosed {R : Type u} [CommRing R] (P : PrincipalIdealDomainPackage R) : Prop :=
  P.isPID ∧ P.everyIdealPrincipal ∧ P.noetherian ∧ P.pidImpliesUFD

theorem principal_ideal_domain_closed_from_evidence
    {R : Type u} [CommRing R] (P : PrincipalIdealDomainPackage R) (E : PrincipalIdealDomainEvidence P) :
    PrincipalIdealDomainClosed P := by
  exact And.intro E.isPIDClosed (And.intro E.everyIdealPrincipalClosed
    (And.intro E.noetherianClosed E.pidImpliesUFDClosed))

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse