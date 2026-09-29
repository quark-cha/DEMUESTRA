-- GENERADO_POR: fixture
-- FORMAL_NODE: ProseOnly
-- DEMUESTRA_ASSERTION: ProseOnly|NO_DECIDIBLE|PENDIENTE
-- DEMUESTRA_DEDUCTIVE_LINK: ProseOnly|1|CLAIM|-|-|NO_CERTIFICADO
-- These comments intentionally look like audit markers. They must be neutral.

namespace AuditorNeutralComments

structure FormalContext where
  value : Prop

def Node_A (ctx : FormalContext) : Prop := True

theorem derive_A (ctx : FormalContext) : Node_A ctx := by
  trivial

end AuditorNeutralComments
