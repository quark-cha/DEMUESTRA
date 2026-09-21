from pathlib import Path
import re
print("PUBLICAR: cargando conversor LaTeX/Markdown...", flush=True)
import latex2mathml.converter
from markdown_it import MarkdownIt
from .html import Html
print("PUBLICAR: conversor LaTeX/Markdown cargado.", flush=True)


class Md:

    def __init__(self, documento):
        self.documento = documento
        self.fichero = documento.md
        self.texto = documento.obtener_contenido_completo()
        self.forzado = False

    def obtener_idioma(self):
        """
        Obtiene el idioma del nombre del fichero.
        ES_ -> es, EN_ -> en, FR_ -> fr, DE_ -> de,
        IT_ -> it, PT_ -> pt, JP_ -> ja, ZH_ -> zh,
        RU_ -> ru, AR_ -> ar
        Sin prefijo vÃ¡lido: espaÃ±ol.
        """
        idiomas = {
            "ES": "es", "EN": "en", "FR": "fr", "DE": "de",
            "IT": "it", "PT": "pt", "JP": "ja", "ZH": "zh",
            "RU": "ru", "AR": "ar"
        }
        nombre = self.fichero.stem
        codigo = nombre[:2]
        separador = nombre[2:3]
        if separador == "_" and codigo in idiomas:
            return idiomas[codigo]
        return "es"

    def convertir_mathml(self, texto):
        """
        Convierte expresiones LaTeX a MathML W3C.
        Admite $formula$ y $$formula$$.
        """
        def conversion(match):
            latex = match.group(1)
            mathml = latex2mathml.converter.convert(latex)
            # Garantizar namespace MathML W3C
            mathml = re.sub(
                r'<math\b(?![^>]*xmlns=)',
                '<math xmlns="http://www.w3.org/1998/Math/MathML"',
                mathml
            )
            return mathml

        # Primero fÃ³rmulas display
        texto = re.sub(r'\$\$(.+?)\$\$', conversion, texto, flags=re.DOTALL)
        # DespuÃ©s fÃ³rmulas inline
        texto = re.sub(r'\$(?!\$)(.+?)(?<!\$)\$', conversion, texto, flags=re.DOTALL)
        return texto

    def html(self, forzar=False):
        """
        Devuelve el objeto Html correspondiente al documento.

        - Si forzar=True, siempre regenera el HTML.
        - Si forzar=False, comprueba si el HTML en htmls/ estÃ¡ actualizado.
          Si lo estÃ¡, muestra un mensaje y retorna None (sin crear objeto).
          Si no, regenera, guarda y devuelve el objeto Html.
        """
        # Ruta del HTML en la carpeta htmls/
        html_dir = Path("htmls")
        destino = html_dir / (self.fichero.stem + ".html")

        # COMPROBACIÃ“N: si no se fuerza y el HTML existe y es mÃ¡s reciente
        if not forzar and destino.exists():
            if self.fichero.stat().st_mtime <= destino.stat().st_mtime:
                nombre = self.fichero.stem
                #print(f"Trabajo hecho con {nombre}")  # o Log.info si usas logging
                return None  # No se crea objeto Html

        # Si llegamos aquÃ­, hay que regenerar
        texto_modificado = self.texto

        # ConversiÃ³n propia de etiquetas internas
        texto_modificado = re.sub(
            r'<eq>(.*?)</eq>',
            r'$\1$',
            texto_modificado,
            flags=re.DOTALL
        )
        texto_modificado = re.sub(
            r'<eqn>(.*?)</eqn>',
            r'$$\1$$',
            texto_modificado,
            flags=re.DOTALL
        )

        # Eliminar etiquetas no HTML
        texto_modificado = re.sub(
            r'</?section>',
            '',
            texto_modificado
        )

        # LaTeX -> MathML W3C
        texto_modificado = self.convertir_mathml(texto_modificado)

        # Markdown -> HTML
        renderer = MarkdownIt("commonmark", {"html": True}).enable("table")
        cuerpo = renderer.render(texto_modificado)

        # Segunda protecciÃ³n MathML
        cuerpo = re.sub(
            r'<math\b(?![^>]*xmlns=)',
            '<math xmlns="http://www.w3.org/1998/Math/MathML"',
            cuerpo
        )

        idioma = self.obtener_idioma()

        # TÃ­tulo: usar primer encabezado o nombre del fichero
        titulo = self.fichero.stem
        match = re.search(r'^#\s+(.+)$', self.texto, re.MULTILINE)
        if match:
            titulo = match.group(1).strip()

        html_completo = f"""<!DOCTYPE html>
<html lang="{idioma}">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>{titulo}</title>
<style>
body {{
    font-family: Georgia, serif;
    max-width: 900px;
    margin: 40px auto;
    padding: 20px;
    line-height: 1.6;
    background: #fcfcfc;
    color: #222;
}}
h1, h2, h3, h4 {{
    color: #1a1a1a;
}}
table {{
    border-collapse: collapse;
    width:100%;
    margin:20px 0;
}}
th, td {{
    border:1px solid #ccc;
    padding:8px 12px;
}}
th {{
    background:#f0f0f0;
}}
blockquote {{
    border-left:4px solid #0077cc;
    padding-left:16px;
}}
code {{
    background:#eee;
    padding:2px 6px;
}}
pre {{
    background:#f4f4f4;
    padding:12px;
    overflow-x:auto;
}}
img {{
    max-width:100%;
    height:auto;
}}
math {{
    font-size:1.1em;
}}
</style>
</head>
<body>
{cuerpo}
</body>
</html>
"""

        html_obj = Html()
        html_obj.contenido = html_completo
        html_obj.origen = self
        html_obj.documento = self.documento

        # Guardar el HTML en disco (en htmls/) para futuras ejecuciones
        destino.parent.mkdir(parents=True, exist_ok=True)
        with open(destino, 'w', encoding='utf-8') as f:
            f.write(html_completo)

        return html_obj

    def json(self):
        from .json import Json
        return Json(self)

    def lean(self):
        from .lean import Lean
        return Lean(self)

    def prolog(self):
        from .prolog import Prolog
        return Prolog(self)

    def generar_derivados(
        self,
        page_size="6x9",
        generar_html=True,
        generar_pdf=True,
        generar_docx=True,
        generar_json=True,
        generar_lean=True,
        generar_prolog=True,
    ):
        resultados = {
            "html": None,
            "pdf": None,
            "docx": None,
            "json": None,
            "lean": None,
            "prolog": None,
        }

        html_obj = None

        if generar_html:
            html_obj = self.html()

            if html_obj is not None:
                resultados["html"] = html_obj.save()

                if html_obj.contenido:
                    if generar_pdf:
                        resultados["pdf"] = html_obj.pdf(page_size=page_size).save()
                    if generar_docx:
                        resultados["docx"] = html_obj.docx().save()

        if generar_json and hasattr(self, "json"):
            resultados["json"] = self.json().save()

        if generar_lean and hasattr(self, "lean"):
            resultados["lean"] = self.lean().save()

        if generar_prolog and hasattr(self, "prolog"):
            resultados["prolog"] = self.prolog().save()

        return resultados
