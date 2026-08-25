param(
  [Parameter(Mandatory = $true)]
  [string] $Nombre
)

$ErrorActionPreference = "Stop"
$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")
Set-Location $RepoRoot

if ($Nombre -notmatch '^[A-Z][A-Za-z0-9_]*$') {
  throw "Usa un nombre de modulo Lean valido, por ejemplo ES_47_RV1."
}

$dir = Join-Path "Proyectos" $Nombre
New-Item -ItemType Directory -Force -Path $dir | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $dir "docs") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $dir "json") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $dir "lean") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $dir "evaluaciones") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $dir "logs") | Out-Null

$archivo = Join-Path $dir "Main.lean"
$leanDir = Join-Path $dir "lean"
$leanMain = Join-Path $leanDir "Main.lean"
$demuestraPy = Join-Path $dir "demuestra.py"

if (-not (Test-Path $archivo)) {
  @"
import Proyectos.$Nombre.lean.Main

namespace Proyectos.$Nombre

end Proyectos.$Nombre
"@ | Set-Content -Encoding utf8 $archivo
}

if (-not (Test-Path $leanMain)) {
  @"
import Mathlib

namespace Proyectos.$Nombre

/-!
Proyecto nuevo.

Sustituye este archivo por la formalizacion de la teoria que quieras auditar.
-/

theorem sanity_check : True := by
  trivial

end Proyectos.$Nombre
"@ | Set-Content -Encoding utf8 $leanMain
}

if (-not (Test-Path $demuestraPy)) {
  @"
#!/usr/bin/env python3
# $Nombre/demuestra.py
import sys
from pathlib import Path

# Anadir DEMUESTRA al path.
demuestra_path = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(demuestra_path))

# Imports desde PckDemuestra.
from PckDemuestra.demuestra import Demuestra

# ============================================================
# CONFIGURACION DEL PROYECTO
# ============================================================
TEST = 1 + 2
PROYECTO = Path(__file__).resolve().parent.name
INCLUIR_YA_EVALUADO = False
FINALIZAR_AL_TERMINAR = False


# ============================================================
# MAIN
# ============================================================
if __name__ == "__main__":
    app = Demuestra(demuestra_path)
    exit_code = 0

    if TEST & 1:
        print(f"TEST{TEST}: Inspeccionando proyecto...")
        proyecto_obj = app.obtener_proyecto(PROYECTO)
        lean_files = proyecto_obj.lean_files()
        print(f"Proyecto: {PROYECTO}")
        print(f"Raiz: {proyecto_obj.raiz}")
        print(f"Archivos Lean: {len(lean_files)}")
        for lean_file in lean_files:
            print(f"  - {lean_file}")

    if TEST & 2:
        print(f"TEST{TEST}: Validando proyecto con Lean 4...")
        exit_code = app.validar(nombre=PROYECTO)
        if exit_code == 0:
            print("Validacion Lean terminada sin errores.")
        else:
            print(f"Validacion Lean terminada con codigo {exit_code}.")

    if TEST & 4:
        print(f"TEST{TEST}: Validando todos los proyectos pendientes...")
        exit_code = app.validar(incluir_ya_evaluado=INCLUIR_YA_EVALUADO)

    if TEST & 8:
        print(f"TEST{TEST}: Moviendo proyecto a YaEvaluado...")
        if FINALIZAR_AL_TERMINAR:
            destino = app.finalizar_evaluacion(PROYECTO)
            print(f"Proyecto archivado en: {destino}")
        else:
            print("FINALIZAR_AL_TERMINAR=False; no se mueve el proyecto.")

    print("Proceso DEMUESTRA completado.")
    raise SystemExit(exit_code)
"@ | Set-Content -Encoding utf8 $demuestraPy
}

Write-Host "Proyecto creado en $dir"
Write-Host "PckDemuestra/scripts/VALIDAR.ps1 detectara este proyecto automaticamente dentro de Proyectos."
