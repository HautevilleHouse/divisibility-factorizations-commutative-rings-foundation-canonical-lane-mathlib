import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean.DivisibilityDomain

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure GCDDomain (A : Type u) [CommRing A] extends IsDomain A where
  gcd : A → A → A
  gcd_dvd_left : ∀ a b : A, gcd a b ∣ a
  gcd_dvd_right : ∀ a b : A, gcd a b ∣ b
  gcd_greatest : ∀ a b c : A, c ∣ a → c ∣ b → c ∣ gcd a b
  gcd_eq_zero_iff : ∀ a b : A, gcd a b = 0 ↔ a = 0 ∧ b = 0

def GCDClosed (A : Type u) [CommRing A] : Prop :=
  ∀ a b : A, ∃ (g : A), g ∣ a ∧ g ∣ b ∧ ∀ (c : A), c ∣ a → c ∣ b → c ∣ g

theorem gcd_domain_iff_gcd_closed (A : Type u) [CommRing A] [IsDomain A] :
  Nonempty (GCDDomain A) ↔ GCDClosed A := by
  constructor
  · intro ⟨h⟩; intro a b; exact ⟨h.gcd a b, h.gcd_dvd_left a b, h.gcd_dvd_right a b, h.gcd_greatest a b⟩
  · intro h; refine ⟨{ gcd := λ a b => (h a b).choose, gcd_dvd_left := λ a b => (h a b).choose_spec.1, gcd_dvd_right := λ a b => (h a b).choose_spec.2.1, gcd_greatest := λ a b c h1 h2 => (h a b).choose_spec.2.2 c h1 h2, gcd_eq_zero_iff := ?_ }⟩
    sorry

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse