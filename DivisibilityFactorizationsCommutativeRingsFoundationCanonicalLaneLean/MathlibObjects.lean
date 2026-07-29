import DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Algebra.Ring.Basic

namespace HautevilleHouse
namespace DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DivFactorSpace where
  carrier : Type
  ringStructure : Ring carrier

structure DivFactorAdmittedObject where
  space : DivFactorSpace
  integralDomain : Prop
  uniqueFactorization : Prop
  finalField : Type
  fieldStructure : Field finalField
  fieldOfFractions : Prop
  conclusion : fieldOfFractions

structure DivFactorEndgameState where
  object : DivFactorAdmittedObject

def DivFactorWitnessClosed (O : DivFactorAdmittedObject) : Prop :=
  O.fieldOfFractions

end DivisibilityFactorizationsCommutativeRingsFoundationCanonicalLaneLean
end HautevilleHouse