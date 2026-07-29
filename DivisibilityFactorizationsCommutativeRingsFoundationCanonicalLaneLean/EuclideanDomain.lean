import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean.PrincipalIdealDomain

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure EuclideanDomain (A : Type u) [CommRing A] extends PID A where
  degree : A → ℕ
  degree_zero : degree 0 = 0
  degree_mul : ∀ {a b : A}, a ≠ 0 → b ≠ 0 → degree (a * b) ≤ degree a + degree b
  division_algorithm : ∀ a b : A, b ≠ 0 → ∃ q r : A, a = b * q + r ∧ (r = 0 ∨ degree r < degree b)

def EuclideanClosed (A : Type u) [CommRing A] : Prop :=
  Nonempty (EuclideanDomain A)

theorem euclidean_domain_iff_principal_and_division (A : Type u) [CommRing A] [IsDomain A] :
  EuclideanClosed A ↔ (Nonempty (PID A) ∧ ∃ (deg : A → ℕ), (deg 0 = 0) ∧ (∀ a b, a ≠ 0 → b ≠ 0 → deg (a * b) ≤ deg a + deg b) ∧ (∀ a b, b ≠ 0 → ∃ q r, a = b * q + r ∧ (r = 0 ∨ deg r < deg b))) := by
  constructor
  · intro ⟨h⟩; constructor; exact ⟨h.toPID⟩; exact ⟨h.degree, h.degree_zero, h.degree_mul, h.division_algorithm⟩
  · intro ⟨h1, deg, hdeg0, hdegmul, hdiv⟩; refine ⟨{ toPID := h1.some, degree := deg, degree_zero := hdeg0, degree_mul := hdegmul, division_algorithm := hdiv }⟩

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse