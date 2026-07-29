import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean.GCDDomain

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

structure PID (A : Type u) [CommRing A] extends IsDomain A where
  isPrincipal : ∀ (I : Ideal A), I.IsPrincipal

def PIDClosed (A : Type u) [CommRing A] : Prop :=
  ∀ (I : Ideal A), I.IsPrincipal

theorem pid_iff_gcd_domain_and_noetherian (A : Type u) [CommRing A] [IsDomain A] :
  Nonempty (PID A) ↔ (GCDClosed A ∧ IsNoetherianRing A) := by
  constructor
  · intro h; constructor; exact gcd_domain_iff_gcd_closed A |>.mpr ?_; exact inferInstance
    obtain ⟨pid⟩ := h
    intro a b
    have : (Ideal.span ({a, b} : Set A)).IsPrincipal := pid.isPrincipal (Ideal.span ({a, b} : Set A))
    rcases this with ⟨g, hg⟩
    refine ⟨g, ?_, ?_⟩
    · have ha : a ∈ Ideal.span ({a, b} : Set A) := Ideal.subset_span (by simp)
      rw [hg] at ha
      exact ha
    · have hb : b ∈ Ideal.span ({a, b} : Set A) := Ideal.subset_span (by simp)
      rw [hg] at hb
      exact hb
  · intro ⟨h1, h2⟩; refine ⟨{ isPrincipal := ?_ }⟩
    intro I
    have hI : I.FG := IsNoetherianRing.noetherian _ _ h2
    rcases hI with ⟨s, hs⟩
    have : I = Ideal.span s := hs
    subst this
    have hgcd : GCDClosed A := h1
    -- Use the fact that a GCD domain is a Schreier domain and finitely generated ideals are principal
    -- Actually, we can use the lemma that in a GCD domain, any finitely generated ideal is principal.
    apply hgcd.isPrincipal_of_fg
    exact Finset.finite_toSet s

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse