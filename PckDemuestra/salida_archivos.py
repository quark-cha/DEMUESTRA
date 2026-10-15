"""Enlaces a archivos para los mensajes de DEMUESTRA."""

import copy
import logging
from pathlib import Path
import sys


def enlace_archivo(ruta, *, terminal=None):
    archivo = Path(ruta).resolve()
    nombre = archivo.name
    if not archivo.is_file():
        return nombre
    if terminal is None:
        terminal = sys.stdout.isatty()
    if terminal:
        return f"\x1b]8;;{archivo.as_uri()}\x1b\\{nombre}\x1b]8;;\x1b\\"
    etiqueta = nombre.replace("\\", "\\\\").replace("[", "\\[").replace("]", "\\]")
    destino = archivo.as_posix().replace("<", "%3C").replace(">", "%3E")
    return f"[{etiqueta}](<{destino}>)"


class FormatoConArchivos(logging.Formatter):
    """El log en disco conserva texto normal; solo la consola lleva enlaces."""

    def format(self, record):
        copia = copy.copy(record)
        if isinstance(copia.args, tuple):
            copia.args = tuple(enlace_archivo(a, terminal=sys.stderr.isatty())
                               if isinstance(a, Path) and a.is_file() else a
                               for a in copia.args)
        return super().format(copia)
