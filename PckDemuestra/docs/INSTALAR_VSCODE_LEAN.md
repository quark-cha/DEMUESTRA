# Instalar Lean 4 en VS Code

## 1. Instalar VS Code

Instala Visual Studio Code si no lo tienes ya.

## 2. Instalar la extension Lean 4

En VS Code, abre Extensions y busca:

```text
Lean 4
```

La extension correcta es la de Lean FRO.

## 3. Abrir el proyecto

Abre la carpeta `DEMUESTRA`, no un archivo suelto.

VS Code detectara `lean-toolchain` y usara la version de Lean declarada por el proyecto.

## 4. Descargar Mathlib

Abre una terminal dentro de VS Code y ejecuta:

```powershell
lake exe cache get
```

Esto descarga la biblioteca Mathlib ya precompilada cuando este disponible.

## 5. Compilar

Para compilar todo:

```powershell
lake build
```

Para compilar solo ES_46 Revision 5:

```powershell
lake env lean Proyectos/ES_46_RV5/lean/HR46_RV5.lean
```

## 6. Resultado esperado

El resultado limpio es que Lean acepte los teoremas del archivo sin errores.

Eso significa que Lean 4 ha comprobado que las formulas y derivaciones formalizadas son consistentes bajo las hipotesis declaradas.

No significa que `P_CONS_E` haya sido demostrado. En ES_46 RV5 significa que Lean verifica correctamente:

```text
P_CONS_E + IsZeroRim z -> z.a = 1 / 2
```

El siguiente trabajo matematico es demostrar `P_CONS_E` sin usar como hipotesis `z.a = 1 / 2`.
