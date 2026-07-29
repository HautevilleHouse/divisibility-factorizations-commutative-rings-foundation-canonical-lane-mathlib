import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure DivisibilityPreorder (R : Type u) [CommRing R] where
  divides : R → R → Prop
  divides_refl : ∀ a : R, divides a a
  divides_trans : ∀ a b c : R, divides a b → divides b c → divides a c
  divides_iff_exists_mul : ∀ a b : R, divides a b ↔ ∃ c : R, b = a * c

structure DivisibilityPreorderEvidence {R : Type u} [CommRing R] (D : DivisibilityPreorder R) where
  divides_refl_closed : D.divides_refl
  divides_trans_closed : D.divides_trans
  divides_iff_exists_mul_closed : D.divides_iff_exists_mul

def DivisibilityPreorderClosed {R : Type u} [CommRing R] (D : DivisibilityPreorder R) : Prop :=
  D.divides_refl ∧ D.divides_trans ∧ D.divides_iff_exists_mul

theorem divisibility_preorder_closed_from_evidence
    {R : Type u} [CommRing R] (D : DivisibilityPreorder R) (E : DivisibilityPreorderEvidence D) :
    DivisibilityPreorderClosed D := by
  exact And.intro E.divides_refl_closed (And.intro E.divides_trans_closed E.divides_iff_exists_mul_closed)

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse
