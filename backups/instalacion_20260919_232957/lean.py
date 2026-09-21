import re
from pathlib import Path

from .base import Publicacion


class Lean(Publicacion):
    carpeta_salida = "lean"
    extension = ".lean"

    LEAN_BLOCK_RE = re.compile(
        r"^```(?:lean|lean4)\s*\r?\n(?P<code>.*?)^```\s*$",
        re.MULTILINE | re.DOTALL | re.IGNORECASE,
    )
    PLACEHOLDER = "Punto de entrada estable para completar la formalizacion"
    RESULT_MARKER_RE = re.compile(r"^\s*--\s*DEMUESTRA_RESULT\s*:\s*([A-Za-z0-9_'.]+)\s*$", re.MULTILINE)
    JSON_NODE_MARKER_RE = re.compile(r"^\s*--\s*DEMUESTRA_JSON_NODE\s*:\s*([A-Za-z0-9_]+)\s*$", re.MULTILINE)
    AUDIT_BLOCK_RE = re.compile(
        r"\n?-- DEMUESTRA_AUDIT_BEGIN\s*\n.*?\n-- DEMUESTRA_AUDIT_END\s*",
        re.DOTALL,
    )
    THEOREM_RE = re.compile(r"^\s*(?:theorem|lemma)\s+([A-Za-z0-9_']+)", re.MULTILINE)
    NAMESPACE_RE = re.compile(r"^\s*namespace\s+([A-Za-z0-9_'.]+)\s*$", re.MULTILINE)

    def __init__(self, md_obj):
        super().__init__(md_obj.documento)
        self.origen = md_obj
        self.md = md_obj
        self.contenido = self._generar()

    @classmethod
    def _es_formalizacion(cls, contenido):
        contenido = str(contenido or "")
        if cls.PLACEHOLDER in contenido:
            return False
        return "theorem " in contenido or "lemma " in contenido

    def _desde_markdown(self):
        bloques = [
            match.group("code").strip()
            for match in self.LEAN_BLOCK_RE.finditer(self.md.texto)
            if match.group("code").strip()
        ]
        if not bloques:
            return None

        contenido = "\n\n".join(bloques).rstrip() + "\n"
        if not self._es_formalizacion(contenido):
            raise ValueError(
                f"Los bloques Lean de {self.md.fichero.name} no contienen "
                "ningun theorem ni lemma evaluable."
            )
        return contenido

    def _formalizacion_existente(self):
        destino = Path(self.carpeta_salida) / f"{self.md.fichero.stem}{self.extension}"
        if not destino.is_file():
            return None
        contenido = destino.read_text(encoding="utf-8", errors="replace")
        return contenido if self._es_formalizacion(contenido) else None

    def _cubrir_resultado(self, contenido):
        # En texto documental, "+/-" contiene el inicio de comentario Lean
        # "/-" y deja el comentario exterior abierto. No es un operador Lean.
        contenido = contenido.replace("+/-", "+ or -")
        nodo_json_match = self.JSON_NODE_MARKER_RE.search(contenido)
        nodo_json = nodo_json_match.group(1) if nodo_json_match else None
        contenido = self.AUDIT_BLOCK_RE.sub("", contenido).rstrip() + "\n"
        marcador = self.RESULT_MARKER_RE.search(contenido)
        teoremas = self.THEOREM_RE.findall(contenido)
        resultado = marcador.group(1) if marcador else (teoremas[-1] if teoremas else None)
        if not resultado:
            raise ValueError(
                f"{self.md.fichero.name} no permite identificar un teorema resultado."
            )

        namespace = self.NAMESPACE_RE.search(contenido)
        nombre_completo = resultado
        if "." not in resultado and namespace:
            nombre_completo = f"{namespace.group(1)}.{resultado}"

        contenido = re.sub(
            r"\n?--\s*DEMUESTRA_RESULT\s*:.*?(?=\n|$)",
            "",
            contenido,
        ).rstrip()
        contenido = re.sub(
            r"\n?--\s*DEMUESTRA_JSON_NODE\s*:.*?(?=\n|$)",
            "",
            contenido,
        ).rstrip()
        marcador_nodo = (
            f"-- DEMUESTRA_JSON_NODE: {nodo_json}\n" if nodo_json else ""
        )
        return (
            contenido
            + "\n\n"
            + "-- DEMUESTRA_AUDIT_BEGIN\n"
            + f"-- DEMUESTRA_RESULT: {nombre_completo}\n"
            + marcador_nodo
            + f"#check {nombre_completo}\n"
            + f"#print axioms {nombre_completo}\n"
            + "-- DEMUESTRA_AUDIT_END\n"
        )

    def _generar(self):
        desde_markdown = self._desde_markdown()
        if desde_markdown is not None:
            return self._cubrir_resultado(desde_markdown)

        existente = self._formalizacion_existente()
        if existente is not None:
            return self._cubrir_resultado(existente)

        raise RuntimeError(
            f"No se puede generar {self.md.fichero.stem}.lean: "
            f"{self.md.fichero.name} no contiene bloques ```lean y no existe "
            "una formalizacion Lean completa previa. Se rechaza generar un esqueleto."
        )
