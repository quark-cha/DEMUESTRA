#!/usr/bin/env python3
# ES_46_RV5/demuestra.py
import sys
from pathlib import Path


demuestra_path = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(demuestra_path))

from PckDemuestra.demuestra import Demuestra


TEST = 1 + 2
PROYECTO = "ES_46_RV5"
INCLUIR_YA_EVALUADO = False
FINALIZAR_AL_TERMINAR = False
PREPARAR_CACHE_MATHLIB = False


if __name__ == "__main__":
    app = Demuestra(__file__)
    exit_code = 0

    if TEST & 1:
        print(f"TEST{TEST}: Inspeccionando proyecto...")
        app.inspeccionar(nombre=PROYECTO)

    if TEST & 2:
        print(f"TEST{TEST}: Validando proyecto con Lean 4...")
        exit_code = app.validar(
            nombre=PROYECTO,
            preparar_cache=PREPARAR_CACHE_MATHLIB,
        )

    if TEST & 4:
        print(f"TEST{TEST}: Validando todos los proyectos pendientes...")
        exit_code = app.validar(
            incluir_ya_evaluado=INCLUIR_YA_EVALUADO,
            preparar_cache=PREPARAR_CACHE_MATHLIB,
        )

    if TEST & 8:
        print(f"TEST{TEST}: Moviendo proyecto a YaEvaluado...")
        if FINALIZAR_AL_TERMINAR:
            destino = app.finalizar_evaluacion(PROYECTO)
            print(f"Proyecto archivado en: {destino}")
        else:
            print("FINALIZAR_AL_TERMINAR=False; no se mueve el proyecto.")

    if TEST & 16:
        print(f"TEST{TEST}: Preparando cache Mathlib compartida...")
        exit_code = app.preparar_cache_mathlib()

    print("Proceso DEMUESTRA completado.")
    raise SystemExit(exit_code)
