from pathlib import Path
import subprocess
import tempfile
import re
from .base import Publicacion
from .odt import Odt

class Docx(Publicacion):
    carpeta_salida = "docxs"
    extension = ".docx"

    def __init__(self, html_content=None, documento=None):
        super().__init__(documento)
        self.contenido = html_content

    def _procesar_enlaces(self, html):
        """
        Convierte enlaces <a> que NO contienen imágenes en texto plano:
        "texto (url)".
        """
        def reemplazar(match):
            tag = match.group(0)
            if '<img' in tag:
                return tag
            href_match = re.search(r'href=["\']([^"\']+)["\']', tag)
            if not href_match:
                return tag
            url = href_match.group(1)
            text_match = re.search(r'>([^<]*)</a>', tag)
            if not text_match:
                return tag
            texto = text_match.group(1).strip()
            if not texto:
                texto = url
            return f"{texto} ({url})"
        
        patron = r'<a\b[^>]*>.*?</a>'
        return re.sub(patron, reemplazar, html, flags=re.DOTALL)

    def _escribir(self, fichero):
        if not self.contenido:
            raise ValueError("No hay contenido HTML para generar el DOCX.")

        # --- ÚNICO CAMBIO ---
        html_clean = self._procesar_enlaces(self.contenido)

        with tempfile.NamedTemporaryFile(
            mode='w', suffix='.html', prefix='docx_',
            delete=False, encoding='utf-8'
        ) as f:
            f.write(html_clean)
            temp_html = Path(f.name)

        try:
            subprocess.run(
                ["pandoc", str(temp_html), "-o", str(fichero), "--mathml", "--wrap=preserve"],
                check=True,
                capture_output=True,
                timeout=300,
            )
            print(f"  ✅ DOCX generado con Pandoc: {fichero.resolve()}")
        except subprocess.CalledProcessError as e:
            raise RuntimeError(f"Error al generar DOCX:\n{e.stderr.decode()}")
        except subprocess.TimeoutExpired as e:
            raise TimeoutError(
                f"Pandoc superó el tiempo máximo al generar DOCX: {fichero}"
            ) from e
        finally:
            if temp_html.exists():
                temp_html.unlink()

    def save(self, fichero=None):
        # ... (tu código original, sin cambios) ...
        super().save(fichero)
        base_name = "documento"
        if self.documento and hasattr(self.documento, 'md') and hasattr(self.documento.md, 'stem'):
            base_name = self.documento.md.stem
        elif self.origen and hasattr(self.origen, 'fichero') and hasattr(self.origen.fichero, 'stem'):
            base_name = self.origen.fichero.stem
        else:
            self.logger.warning("No se pudo determinar el nombre base para ODT. Usando 'documento'.")

        docx_folder = Path(self.carpeta_salida)
        parts = list(docx_folder.parts)
        for i, part in enumerate(parts):
            if part == "docxs":
                parts[i] = "odts"
                break
        odt_folder = Path(*parts) if parts else Path("odts")
        odt_folder.mkdir(parents=True, exist_ok=True)

        docx_file = docx_folder / f"{base_name}.docx"
        if not docx_file.exists():
            posibles = list(docx_folder.glob(f"{base_name}*.docx"))
            if posibles:
                docx_file = posibles[0]
            else:
                raise FileNotFoundError(f"No se encontró el DOCX en {docx_file}")

        print(f"  🔍 DOCX encontrado: {docx_file.resolve()}")

        odt_obj = Odt(docx_path=docx_file, documento=self.documento)
        odt_obj.carpeta_salida = str(odt_folder)
        odt_file = odt_folder / f"{base_name}.odt"
        odt_obj.save(odt_file)
        print(f"  ✅ ODT generado automáticamente desde DOCX: {odt_file.resolve()}")

