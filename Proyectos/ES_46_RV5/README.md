# ES_46_RV5

Proyecto de auditoria formal para:

```text
Einstein-VED / UNIHOLOG - ES_46 Revision 5
```

Esta carpeta debe contener todos los materiales de evaluacion de la revision:

```text
Proyectos/ES_46_RV5/
  README.md
  MANIFEST.json
  docs/
    ES_46_RV5.md
  json/
    ES_46_RV5_ADEC.json
  lean/
    HR46_RV5.lean
  evaluaciones/
    ADEC_ES_46_RV5.md
    LEAN_ES_46_RV5.md
  logs/
    lean_compilation.log
```

## Como arrancar esta demostracion

Desde la raiz del repositorio `DEMUESTRA`, ejecuta:

```powershell
lake exe cache get
lake build
lake env lean Proyectos/ES_46_RV5/lean/HR46_RV5.lean
```

Tambien puedes ejecutarlo desde esta carpeta, con el punto de entrada local:

```powershell
python demuestra.py
```

Si la compilacion termina sin errores, Lean 4 habra verificado las formulas y derivaciones formalizadas en `HR46_RV5.lean`.

Eso es una verificacion parcial: no sustituye el documento matematico completo, ni demuestra automaticamente las hipotesis declaradas como pendientes.

## Estado actual

El archivo Lean inicial esta incluido en:

```text
lean/HR46_RV5.lean
```

Los documentos `.md` y `.json` completos de ES_46 RV5 deben importarse desde la fuente original de la teoria. Mientras no esten incorporados como archivos completos, los documentos de esta carpeta declaran explicitamente que son registros de auditoria o marcadores de importacion, no sustitutos de la teoria original.

## Punto matematico pendiente

La reduccion final se formaliza bajo la hipotesis:

```lean
StabilityPreserved IsZeroRim
```

Esta hipotesis corresponde a `P_CONS_E`.

No debe convertirse en axioma global. Debe demostrarse en una fase posterior si la teoria pretende cerrar completamente la prueba.

## Evaluacion recomendada

Para una revision mas rigurosa, este proyecto debe evaluarse por capas:

```text
1. ES_46_RV5.md:
   revision matematica humana del argumento completo.

2. ES_46_RV5_ADEC.json:
   validacion ADEC de estructura, dependencias y coherencia semantica.

3. HR46_RV5.lean:
   verificacion Lean 4 de las derivaciones formalizadas.

4. Evaluacion externa AC/ADEC:
   auditoria independiente de los puentes pendientes, especialmente P_CONS_E.
```
