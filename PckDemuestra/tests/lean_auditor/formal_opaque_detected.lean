namespace AuditorFormalOpaque

structure FormalContext where
  Assertion_bad : Prop

def Node_A (ctx : FormalContext) : Prop := ctx.Assertion_bad

end AuditorFormalOpaque
