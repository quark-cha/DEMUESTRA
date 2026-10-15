"""Cabecera que habilita la generacion formal de un Markdown."""

from pathlib import Path
import re

PATRON_CABECERA = re.compile(r"^# [A-Za-z]{2}_+[0-9]+:[ \t]+\S.*$")


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
