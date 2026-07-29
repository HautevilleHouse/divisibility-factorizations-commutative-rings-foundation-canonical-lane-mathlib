import DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def divFactorProjection : Projection DivFactorEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem div_factor_projection_idempotent (x : DivFactorEndgameState) :
    divFactorProjection.toFun (divFactorProjection.toFun x) = divFactorProjection.toFun x := by
  exact divFactorProjection.idempotent x

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse