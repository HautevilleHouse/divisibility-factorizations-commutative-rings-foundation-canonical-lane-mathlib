import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure PID (R : Type u) [CommRing R] where
  isIntegralDomain : Prop
  everyIdealPrincipal : ∀ I : Ideal R, I ≠ ⊥ → ∃ a : R, a ≠ 0 ∧ I = Ideal.span {a}

structure PIDEvidence {R : Type u} [CommRing R] (P : PID R) where
  isIntegralDomain_closed : P.isIntegralDomain
  everyIdealPrincipal_closed : P.everyIdealPrincipal

def PIDClosed {R : Type u} [CommRing R] (P : PID R) : Prop :=
  P.isIntegralDomain ∧ P.everyIdealPrincipal

theorem pid_closed_from_evidence
    {R : Type u} [CommRing R] (P : PID R) (E : PIDEvidence P) :
    PIDClosed P := by
  exact And.intro E.isIntegralDomain_closed E.everyIdealPrincipal_closed

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse
