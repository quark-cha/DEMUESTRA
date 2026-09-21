from pathlib import Path

class Documento:
    def __init__(self, fichero):
        self.md = Path(fichero)
        self._contenido_completo = None

    @property
    def nombre(self):
        return self.md.stem

    def obtener_contenido_completo(self):
        """Devuelve el contenido del documento. Por defecto, lee el .md."""
        if self._contenido_completo is None:
            self._contenido_completo = self.md.read_text(encoding="utf-8", errors="replace")
        return self._contenido_completo

    def __str__(self):
        return self.nombre

