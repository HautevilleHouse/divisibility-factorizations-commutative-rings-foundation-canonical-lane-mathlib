import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure Factorization (A : Type u) [CommRing A] (x : A) where
  factors : List A
  product_eq : factors.prod = x
  irreducible_factors : ∀ f ∈ factors, Irreducible f

def FactorizationClosed (A : Type u) [CommRing A] : Prop :=
  ∀ x : A, x ≠ 0 → ¬ IsUnit x → ∃ f : Factorization A x, True

theorem factorization_closed_iff_ufd (A : Type u) [CommRing A] [IsDomain A] :
  FactorizationClosed A ↔ IsUniqueFactorizationDomain A := by
  constructor
  · intro h; exact ⟨fun x hx hx' => (h x hx hx').choose⟩
  · intro h; intro x hx hx'; exact ⟨(h.1 x hx hx').exists_factorization, trivial⟩

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse