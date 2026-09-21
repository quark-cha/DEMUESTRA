from pathlib import Path

print("PUBLICAR: cargando motor de documentos...", flush=True)

from .libro import Libro
from .articulo import Articulo
from .md import Md
from .trace import ProgressBar

print("PUBLICAR: motor de documentos cargado.", flush=True)

class Publicar:
    def __init__(self, fichero):
        self.raiz = Path(fichero).resolve().parent
        self.documentos = []
        self.md_objects = []
        self.FORZADO = False   # atributo que se puede cambiar externamente

    def es_libro(self, md):
        if "_TOT_" in md.stem:
            return True
        for ext in (".bib", ".ini", ".sdi"):
            if md.with_suffix(ext).exists():
                return True
        return False

    def clasificar(self, md):
        if self.es_libro(md):
            return Libro(md)
        return Articulo(md)

    def explorar(self):
        self.documentos.clear()
        self.md_objects.clear()
        archivos = sorted(self.raiz.glob("*.md"))
        print(
            f"PUBLICAR: explorando {len(archivos)} documentos en {self.raiz}",
            flush=True,
        )
        progress = ProgressBar("PUBLICAR exploracion", len(archivos))
        progress.start()
        for md in archivos:
            progress.advance(md.name)
            doc = self.clasificar(md)
            self.documentos.append(doc)
            md_obj = Md(doc)
            md_obj.forzado = self.FORZADO  # asignar el valor de FORZADO al objeto Md
            self.md_objects.append(md_obj)
            progress.message(
                f"📄 Preparado: {doc.nombre} "
                f"({'Libro' if isinstance(doc, Libro) else 'Articulo'})"
            )
        progress.finish()
        return self.md_objects

    def test(self, nombre=None):
        self.documentos.clear()
        self.md_objects.clear()
        if nombre is not None:
            md = self.raiz / f"{nombre}.md"
            if not md.exists():
                raise FileNotFoundError(f"No se encuentra el archivo: {md}")
            doc = self.clasificar(md)
            self.documentos.append(doc)
            md_obj = Md(doc)
            self.md_objects.append(md_obj)
            return md_obj
        return None

