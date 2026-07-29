import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean.EuclideanDomain

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure UFD (A : Type u) [CommRing A] extends IsDomain A where
  factorization : ∀ {x : A}, x ≠ 0 → ¬ IsUnit x → (factors : List A) × (factors.prod = x) × (∀ f ∈ factors, Irreducible f)
  uniqueness : ∀ {x : A} (f g : List A), (∀ f' ∈ f, Irreducible f') → (∀ g' ∈ g, Irreducible g') → f.prod = x → g.prod = x → Multiset.ofList f = Multiset.ofList g

def UFDClosed (A : Type u) [CommRing A] : Prop :=
  Nonempty (UFD A)

theorem euclidean_implies_ufd (A : Type u) [CommRing A] [IsDomain A] :
  EuclideanClosed A → UFDClosed A := by
  intro h; exact ⟨h.some.toPID.toUFD⟩

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse