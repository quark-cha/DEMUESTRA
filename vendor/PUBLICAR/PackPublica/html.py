from .base import Publicacion
from .docx import Docx
from .pdf import Pdf

class Html(Publicacion):
    carpeta_salida = "htmls"
    extension = ".html"
    documento = None  # Documento Md asociado al HTML

    def docx(self):
        """Genera un objeto Docx a partir del HTML actual."""
        return Docx(self.contenido, self.documento)

    def pdf(self, page_size="6x9"):
        """Genera un objeto Pdf a partir del HTML actual."""
        return Pdf(self.contenido, self.documento, page_size=page_size)

