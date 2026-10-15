"""Seleccion de fuentes evaluables sin modificar los documentos."""

from pathlib import Path
import re
from .salida_archivos import enlace_archivo


PATRON_CABECERA = re.compile(r"^# [A-Za-z]{2}_+[0-9]+:[ \t]+\S.*$")


def aviso_no_demostracion(ruta):
    return f"\u2139 {enlace_archivo(ruta)} \u2014 No es un archivo para demostraci\u00f3n"


def es_markdown_demostracion(ruta):
    ruta = Path(ruta)
    if ruta.suffix.lower() != ".md":
        return False
    try:
        with ruta.open(encoding="utf-8-sig") as fuente:
            primera_linea = fuente.readline().rstrip("\r\n")
    except FileNotFoundError:
        return False
    return PATRON_CABECERA.fullmatch(primera_linea) is not None


def fuente_principal(proyecto):
    proyecto = Path(proyecto)
    if (proyecto / "documentos_proyecto.json").is_file():
        from .documentos_proyecto import leer_catalogo, ruta_local
        catalogo = leer_catalogo(proyecto)
        return ruta_local(proyecto, catalogo["principal"])
    esperado = proyecto / f"{proyecto.name}.md"
    if esperado.is_file():
        return esperado
    fuentes = sorted(p for p in proyecto.glob("*.md")
                     if es_markdown_demostracion(p))
    if len(fuentes) > 1:
        raise ValueError(f"Varias fuentes evaluables en {proyecto}: {fuentes}")
    return fuentes[0] if fuentes else None


def proyecto_evaluable(proyecto):
    fuente = fuente_principal(proyecto)
    return fuente is not None and es_markdown_demostracion(fuente)
