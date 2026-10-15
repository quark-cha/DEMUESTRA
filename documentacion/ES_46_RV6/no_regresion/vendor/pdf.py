from pathlib import Path
import tempfile
import shutil
from .base import Publicacion
from playwright.sync_api import sync_playwright
from .base import Publicacion

class Pdf(Publicacion):
    carpeta_salida = "pdfs"
    extension = ".pdf"

    def __init__(self, html_content=None, documento=None, page_size="6x9"):
        super().__init__(documento)
        self.contenido = html_content
        self.page_size = page_size

    def _escribir(self, fichero):
        if not self.contenido:
            raise ValueError("No hay contenido HTML para generar el PDF.")

        temp_html = None
        try:
            # 1. Crear el archivo temporal
            with tempfile.NamedTemporaryFile(
                mode='w', suffix='.html', prefix='pdf_temp_',
                delete=False, encoding='utf-8'
            ) as f:
                f.write(self.contenido)
                temp_html = Path(f.name)

            # 2. Convertir page_size a opciones de Playwright
            # Ej: "6x9" -> {"width": "6in", "height": "9in"}
            if "x" in self.page_size:
                w, h = self.page_size.split("x")
                pdf_kwargs = {
                    "width": f"{w.strip()}in",
                    "height": f"{h.strip()}in",
                    "print_background": True  # Fuerza colores/fondos CSS
                }
            else:
                # Si es "A4", "Letter", etc.
                pdf_kwargs = {"format": self.page_size, "print_background": True}

            # 3. Generar el PDF con Playwright
            with sync_playwright() as p:
                # Lanza Chromium en modo headless (por defecto)
                browser = p.chromium.launch()
                # Crea un contexto con viewport personalizado (opcional)
                context = browser.new_context(viewport={"width": 1200, "height": 800})
                page = context.new_page()
                
                # ¡Cuidado! Si tu HTML tiene CSS/JS relativos, con file:// fallarán.
                # Solución: pasar el contenido directamente con set_content()
                # Es MÁS RÁPIDO y evita rutas relativas.
                page.set_content(self.contenido, wait_until="networkidle")
                
                # Alternativa si necesitas sí o sí file:// (por recursos externos):
                # page.goto(f"file://{temp_html.resolve()}")
                
                page.pdf(path=str(fichero), **pdf_kwargs)
                
                # Cierre automático al salir del with
                # browser.close() se llama implícitamente al salir del with de sync_playwright

            print(f"  ✅ PDF generado con Chromium: {fichero.resolve()}")

        except Exception as e:
            print(f"  ❌ Error generando PDF: {e}")
            raise
        finally:
            # 4. LIMPIEZA CRÍTICA: Borrar el HTML temporal para no acumular basura
            if temp_html and temp_html.exists():
                temp_html.unlink()

