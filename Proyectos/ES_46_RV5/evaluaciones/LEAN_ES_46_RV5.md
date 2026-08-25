# Evaluacion Lean - ES_46 RV5

## Archivo evaluado

```text
lean/HR46_RV5.lean
```

## Estado en esta sesion

Lean 4.33.1 se instalo mediante `elan`.

La cache de Mathlib quedo incompleta durante la preparacion inicial. Al intentar compilar, Lean fallo antes de analizar `HR46_RV5.lean` porque faltaba un archivo interno precompilado:

```text
Batteries/Data/BitVec/Lemmas.olean does not exist
```

Esto debe repetirse en el entorno local de VS Code con:

```powershell
lake exe cache get
lake build
lake env lean Proyectos/ES_46_RV5/lean/HR46_RV5.lean
```

## Que demuestra el archivo Lean

El objetivo de `HR46_RV5.lean` es comprobar formalmente:

```text
z.a != 1 / 2 -> rhoR z > 0
rhoR z > 0 -> toVEDrho z > 0
toVEDrho z > 0 -> not StableVED (toVEDrho z)
StabilityPreserved IsZeroRim -> IsZeroRim z -> z.a = 1 / 2
```

## Que queda pendiente

Permanece pendiente:

```lean
StabilityPreserved IsZeroRim
```

Este es el nodo `P_CONS_E`.

No esta declarado como axioma global y no debe cerrarse usando como hipotesis `z.a = 1 / 2`.
