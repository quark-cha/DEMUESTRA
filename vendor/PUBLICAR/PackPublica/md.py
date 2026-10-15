from pathlib import Path
import base64
import hashlib
import mimetypes
import re
from urllib.parse import unquote, urlsplit
print("PUBLICAR: cargando conversor LaTeX/Markdown...", flush=True)
try:
    import latex2mathml.converter
except ModuleNotFoundError as error:
    if error.name != "latex2mathml":
        raise
    import sys
    raise RuntimeError(
        "PUBLICAR necesita el paquete 'latex2mathml'.\n"
        f"Instalelo en este mismo Python con:\n  \"{sys.executable}\" -m pip install latex2mathml"
    ) from error
from markdown_it import MarkdownIt
from .html import Html
from .autoria import resolve_authors, author_html
from .seleccion_md import es_markdown_demostracion
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
        def conversion(match, display="inline"):
            latex = match.group(1)
            mathml = latex2mathml.converter.convert(latex, display=display)
            # Garantizar namespace MathML W3C
            mathml = re.sub(
                r'<math\b(?![^>]*xmlns=)',
                '<math xmlns="http://www.w3.org/1998/Math/MathML"',
                mathml
            )
            return mathml

        # Primero fÃ³rmulas display
        texto = re.sub(r'\$\$(.+?)\$\$', lambda m: conversion(m, "block"), texto, flags=re.DOTALL)
        # DespuÃ©s fÃ³rmulas inline
        texto = re.sub(r'\$(?!\$)(.+?)(?<!\$)\$', conversion, texto, flags=re.DOTALL)
        return texto

    def _configurar_imagenes_locales(self, renderer):
        """Embed document-relative images so relocated HTML and PDF keep them."""
        image_rule = renderer.renderer.rules["image"]
        directory = self.fichero.resolve().parent

        def image(tokens, idx, options, env):
            token = tokens[idx]
            source = token.attrGet("src") or ""
            url = urlsplit(source)
            if source and not url.scheme and not url.netloc and url.path:
                relative = Path(unquote(url.path).replace("\\", "/"))
                if not relative.is_absolute():
                    path = (directory / relative).resolve()
                    if not path.is_file():
                        raise FileNotFoundError(f"Imagen del Markdown no encontrada: {path}")
                    mime = mimetypes.guess_type(path.name)[0]
                    if mime and mime.startswith("image/"):
                        encoded = base64.b64encode(path.read_bytes()).decode("ascii")
                        token.attrSet("src", f"data:{mime};base64,{encoded}")
            return image_rule(tokens, idx, options, env)

        renderer.renderer.rules["image"] = image

    def html(self, forzar=False):
        """
        Devuelve el objeto Html correspondiente al documento.

        - Si forzar=True, siempre regenera el HTML.
        - Si forzar=False, comprueba si el HTML en htmls/ estÃ¡ actualizado.
          Si lo estÃ¡, muestra un mensaje y retorna None (sin crear objeto).
          Si no, regenera, guarda y devuelve el objeto Html.
        """
        forzar = forzar or self.forzado
        authors_meta = author_html(resolve_authors(self.texto))
        # Ruta del HTML en la carpeta htmls/
        html_dir = Path("htmls")
        destino = html_dir / (self.fichero.stem + ".html")

        # COMPROBACIÃ“N: si no se fuerza y el HTML existe y es mÃ¡s reciente
        if not forzar and destino.exists():
            if (self.fichero.stat().st_mtime <= destino.stat().st_mtime
                    and all(line in destino.read_text(encoding="utf-8")
                            for line in authors_meta.splitlines())):
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
        self._configurar_imagenes_locales(renderer)
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
{authors_meta}
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
        self._exigir_fuente_demostracion()
        from .json import Json
        return Json(self)

    def lean(self):
        self._exigir_fuente_demostracion()
        from .lean import Lean
        return Lean(self)

    def prolog(self):
        self._exigir_fuente_demostracion()
        from .prolog import Prolog
        return Prolog(self)

    def _exigir_fuente_demostracion(self):
        if not es_markdown_demostracion(self.fichero):
            raise ValueError(f"{self.fichero.name}: No es un archivo para demostracion")

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
        md_antes = self.fichero.read_bytes()
        hash_md_antes = hashlib.sha256(md_antes).hexdigest()
        if not es_markdown_demostracion(self.fichero):
            generar_json = generar_lean = generar_prolog = False

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

        md_despues = self.fichero.read_bytes()
        hash_md_despues = hashlib.sha256(md_despues).hexdigest()
        if hash_md_despues != hash_md_antes:
            self.fichero.write_bytes(md_antes)
            raise RuntimeError(
                f"Un generador modificó indebidamente {self.fichero.name}. "
                "El Markdown fue restaurado y la publicación se ha cancelado."
            )

        return resultados
