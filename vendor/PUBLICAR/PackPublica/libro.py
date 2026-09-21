from pathlib import Path
import json
import re
import urllib.request
import urllib.error
import logging

from .documento import Documento
from .md import Md


class _FiltroBibtexOnline(logging.Filter):
    """Oculta sólo el aviso repetitivo de bibtexparser para entradas @online."""
    MENSAJE = "Entry type online not standard. Not considered."

    def filter(self, record: logging.LogRecord) -> bool:
        return self.MENSAJE not in record.getMessage()


def _silenciar_aviso_online_bibtex():
    """
    Bibtexparser 1.x puede emitir una línea por cada @online.
    Se filtra sólo ese mensaje concreto; los demás warnings y errores siguen visibles.
    """
    filtro = _FiltroBibtexOnline()
    for nombre in (
        "bibtexparser",
        "bibtexparser.bparser",
        "bibtexparser.bibdatabase",
        "bibtexparser.customization",
    ):
        logger = logging.getLogger(nombre)
        # Evitar añadir el mismo filtro repetidamente.
        if not any(isinstance(f, _FiltroBibtexOnline) for f in logger.filters):
            logger.addFilter(filtro)



class Libro(Documento):
    """
    Representa un libro completo, construido a partir de múltiples archivos:
    - .config: metadatos (título, autor, etc.)
    - .ini: contenido adicional en Markdown (prefacio, etc.)
    - .md: capítulos principales
    - .glo: glosario
    - .bib: bibliografía (se procesa con bibtexparser)
    - .sdi: índice alfabético
    """

    def _procesar_bibliografia(self, base: Path) -> str:
        """
        Procesa el archivo .bib y devuelve el texto Markdown formateado.
        Si no existe, devuelve cadena vacía.
        Si hay error o no está instalado bibtexparser, usa bloque de código.
        """
        bib = base.with_suffix(".bib")
        if not bib.exists():
            return ""

        # Intentar importar bibtexparser
        try:
            import bibtexparser
            from bibtexparser.bparser import BibTexParser
            from bibtexparser.customization import convert_to_unicode
            _silenciar_aviso_online_bibtex()
        except ImportError:
            print("⚠️  bibtexparser no instalado. Se usará el bloque de código BibTeX.")
            return f"## Bibliografía\n\n```bibtex\n{bib.read_text(encoding='utf-8', errors='replace')}\n```\n"

        try:
            with open(bib, 'r', encoding='utf-8') as bibfile:
                parser = BibTexParser(common_strings=True)
                parser.customization = convert_to_unicode
                bib_database = bibtexparser.load(bibfile, parser=parser)

            referencias = []
            for entry in bib_database.entries:
                # Extraer campos comunes
                author = entry.get('author', 'Autor desconocido')
                title = entry.get('title', 'Sin título')
                year = entry.get('year', 's.f.')
                journal = entry.get('journal', '')
                volume = entry.get('volume', '')
                number = entry.get('number', '')
                pages = entry.get('pages', '')
                doi = entry.get('doi', '')
                publisher = entry.get('publisher', '')
                booktitle = entry.get('booktitle', '')

                # Construir la referencia paso a paso
                ref_parts = []
                ref_parts.append(f"**{author}** ({year}).")
                ref_parts.append(f"*{title}*.")

                if journal:
                    ref_parts.append(f"*{journal}*")
                    if volume:
                        ref_parts.append(f"**{volume}**")
                        if number:
                            ref_parts.append(f"({number})")
                    if pages:
                        ref_parts.append(f"pp. {pages}.")
                elif booktitle:  # capítulo de libro
                    ref_parts.append(f"In *{booktitle}*.")
                    if publisher:
                        ref_parts.append(publisher)
                elif publisher:  # libro
                    ref_parts.append(publisher)

                if doi:
                    ref_parts.append(f"DOI: [{doi}](https://doi.org/{doi})")

                ref_text = ' '.join(ref_parts)
                referencias.append(f"- {ref_text}")

            if referencias:
                return "## Bibliografía\n\n" + "\n".join(referencias)
            else:
                # Fallback a bloque de código si no se generaron referencias
                return f"## Bibliografía\n\n```bibtex\n{bib.read_text(encoding='utf-8', errors='replace')}\n```\n"

        except Exception as e:
            print(f"⚠️  Error al procesar el .bib: {e}. Usando bloque de código.")
            return f"## Bibliografía\n\n```bibtex\n{bib.read_text(encoding='utf-8', errors='replace')}\n```\n"

    def obtener_contenido_completo(self) -> str:
        if self._contenido_completo is not None:
            return self._contenido_completo

        base = self.md.with_suffix("")
        partes = []

        # ============================================================
        # 0. LICENCIA DESCARGADA DESDE LA WEB
        # ============================================================
        try:
            _, idioma_libro = self._obtener_base_y_idioma()
            idioma_codigo = idioma_libro.lower()

            url_licencia = (
                f"https://estradad.es/licencia.php"
                f"?idioma={idioma_libro.lower()}&formato=md"
            )

            req = urllib.request.Request(
                url_licencia,
                headers={'User-Agent': 'Mozilla/5.0'}
            )
            with urllib.request.urlopen(req, timeout=10) as response:
                licencia_texto = response.read().decode('utf-8')

            licencia_bloque = f"""
<div style="background: #f8f9fa; padding: 1.5rem 2rem; border-left: 5px solid #005a9c; margin-bottom: 2rem; border-radius: 4px; font-size: 0.95em;">
    <h3 style="margin-top: 0; color: #005a9c;">📜 LICENSE</h3>
    <pre style="white-space: pre-wrap; font-family: inherit; margin: 0; line-height: 1.6;">
{licencia_texto}
    </pre>
</div>
"""
            partes.append(licencia_bloque)
            if idioma_codigo == "es":
                print("✅ Licencia cargada")
            else:
                print(f"✅ Licencia cargada para idioma: {idioma_libro}")
        except Exception as e:
            print(f"⚠️ No se pudo cargar la licencia: {e}")
            partes.append("> *Licencia no disponible en este momento.*\n")

        # ============================================================
        # A1: .config -> Markdown
        # ============================================================
        config = base.with_suffix(".config")
        if config.exists():
            datos = json.loads(config.read_text(encoding="utf-8"))
            md = ["# " + datos.get("titulo_principal", self.nombre), ""]
            if datos.get("subtitulo"):
                md += [f"## {datos['subtitulo']}", ""]
            for k, v in datos.items():
                if k in ("titulo_principal", "subtitulo"):
                    continue
                md.append(f"**{k.replace('_',' ').title()}**: {v}")
            partes.append("\n".join(md))

        # ============================================================
        # A2: .ini (ya Markdown)
        # ============================================================
        ini = base.with_suffix(".ini")
        if ini.exists():
            partes.append(ini.read_text(encoding="utf-8", errors="replace"))

        # ============================================================
        # B: Marcador para generar índice (se reemplazará después)
        # ============================================================
        partes.append("\n<!-- GENERAR_INDICE -->\n")

        # ============================================================
        # C: Contenido principal (el .md)
        # ============================================================
        partes.append(self.md.read_text(encoding="utf-8", errors="replace"))

        # ============================================================
        # D: Glosario
        # ============================================================
        glo_text = self._procesar_glosario(base)
        if glo_text:
            partes.append(glo_text)
                          
        # ============================================================
        # E: BIBLIOGRAFÍA FORMATEADA
        # ============================================================
        bib_text = self._procesar_bibliografia(base)
        if bib_text:
            partes.append(bib_text)

        # ============================================================
        # F: Índice alfabético (desde .sdi)
        # ============================================================
        sdi = base.with_suffix(".sdi")
        #if sdi.exists():
        if False:
            partes.append(self._generar_indice_markdown(
                sdi.read_text(encoding="utf-8", errors="replace")
            ))
        else:
            partes.append("\n<!-- ÍNDICE ALFABÉTICO MANUAL -->\n")
        
        self._contenido_completo = "\n\n".join(partes)
        return self._contenido_completo

    def _generar_indice_markdown(self, texto: str) -> str:
        """Convierte un archivo .sdi en un índice alfabético en Markdown."""
        out = [
            "<div style=\"page-break-after: always;\"></div>",
            "",
            "## Índice alfabético",
            ""
        ]
        letra = None
        for linea in texto.splitlines():
            if not linea.strip():
                continue
            termino = linea.split(";", 1)[0].strip()
            if not termino:
                continue
            inicial = termino[0].upper()
            if inicial != letra:
                letra = inicial
                out.append(f"### {letra}")
                out.append("")
            out.append(f"- {termino}")
        return "\n".join(out)

    # ------------------------------------------------------------
    #  EXTRACCIÓN DE SECCIONES (versión robusta)
    # ------------------------------------------------------------
    def _extraer_secciones(self, texto: str):
        """
        Extrae secciones separadas por encabezados de nivel 1 (# ...).
        Soporta encabezados con o sin espacio después de #, y tolera espacios iniciales.
        """
        secciones = []
        cab_actual = None
        bloque_actual = []
        lineas = texto.splitlines()

        for linea in lineas:
            stripped = linea.lstrip()
            # Detectar encabezado de nivel 1: comienza con "#" seguido de espacio o carácter, y no es "##"
            if stripped.startswith("#") and not stripped.startswith("##"):
                if len(stripped) > 1 and stripped[1] != '#':
                    if cab_actual is not None:
                        secciones.append((cab_actual, "\n".join(bloque_actual).strip()))
                    cab_actual = stripped.strip()
                    bloque_actual = []
                    continue
            if cab_actual is not None:
                bloque_actual.append(linea)

        if cab_actual is not None:
            secciones.append((cab_actual, "\n".join(bloque_actual).strip()))

        return secciones

    def _procesar_glosario(self, base):
        glo = base.with_suffix(".glo")
        if not glo.exists():
            return ""

        try:
            glosario = {}
            with open(glo, 'r', encoding='utf-8') as f:
                for line in f:
                    line = line.strip()
                    if not line or line.startswith('#'):
                        continue
                    if ';' in line:
                        termino, definicion = line.split(';', 1)
                        glosario[termino.lower()] = {
                            "termino": termino.strip(),
                            "definicion": definicion.strip()
                        }

            if not glosario:
                return ""

            lines = [
                '<div style="page-break-after: always;"></div>',
                '',
                '## Glosario',
                ''
            ]
            for key in sorted(glosario.keys()):
                entry = glosario[key]
                lines.append(f"**{entry['termino']}**")
                lines.append(f": {entry['definicion']}")
                lines.append("")

            return "\n".join(lines)
        except Exception as e:
            print(f"⚠️ Error al procesar .glo: {e}")
            return ""
        

    # ------------------------------------------------------------
    #  GENERACIÓN DE UN ARTÍCULO INDIVIDUAL (CORREGIDA)
    # ------------------------------------------------------------
    def _generar_articulo_unico(self, cab, contenido, nombre, abstract_texto, page_size, lista_articulos):
        """
        Genera un artículo con el nombre y abstract dados.
        Guarda el archivo .md en disco, luego genera HTML, PDF, DOCX y ODT.
        """
        # 1. Construir el contenido final
        if abstract_texto:
            contenido_final = f"{cab}\n\n{abstract_texto}\n\n{contenido}"
        else:
            contenido_final = f"{cab}\n\n{contenido}"

        # 2. Crear la carpeta de salida para los .md (opcional, pero recomendado)
        md_dir = Path("articulos/md")
        md_dir.mkdir(parents=True, exist_ok=True)

        # 3. Guardar el archivo .md en disco
        md_path = md_dir / f"{nombre}.md"
        md_path.write_text(contenido_final, encoding='utf-8')

        # 4. Crear un objeto Documento ficticio que apunte a ese archivo real
        class Ficticio:
            def __init__(self, path):
                self.md = path
                self.nombre = path.stem

            def obtener_contenido_completo(self):
                return self.md.read_text(encoding='utf-8')

        doc_ficticio = Ficticio(md_path)
        md_obj = Md(doc_ficticio)

        # 5. Generar HTML (si falla, no continuar)
        try:
            html_obj = md_obj.html()
            html_obj.carpeta_salida = "articulos/htmls"
            html_obj.save()
        except Exception as e:
            print(f"   ❌ Error al generar HTML para {nombre}: {e}")
            return  # No continuar con los demás formatos

        # 6. Generar PDF a partir del HTML
        try:
            pdf_obj = html_obj.pdf(page_size=page_size)
            pdf_obj.carpeta_salida = "articulos/pdfs"
            pdf_obj.save()
        except Exception as e:
            print(f"   ❌ Error al generar PDF para {nombre}: {e}")

        # 7. Generar DOCX
        try:
            docx_obj = html_obj.docx()
            docx_obj.carpeta_salida = "articulos/docxs"
            docx_obj.save()
        except Exception as e:
            print(f"   ❌ Error al generar DOCX para {nombre}: {e}")

        # 8. (Opcional) Añadir el objeto Md a la lista para seguimiento
        lista_articulos.append(md_obj)
        

        lista_articulos.append(md_obj)

    # ------------------------------------------------------------
    #  OBTENER BASE DEL LIBRO (SIN PREFIJO DE IDIOMA)  - CORREGIDA
    # ------------------------------------------------------------
    def _obtener_base_y_idioma(self):
        """
        Devuelve (nombre_base_sin_prefijo, idioma_del_contenido).
        Si el archivo .md tiene prefijo (ej. EN_), lo extrae y ese es el idioma.
        Si no tiene prefijo, intenta extraer el idioma del primer encabezado
        con formato '# XX_' (ej. '# FR_40').
        Si no encuentra, devuelve 'ES' por defecto.
        """
        stem = self.md.stem
        # 1. Intentar extraer prefijo del nombre del archivo
        m = re.match(r'^([A-Z]{2})_(.+)', stem)
        if m:
            return m.group(2), m.group(1)

        # 2. No tiene prefijo en el nombre: leer el contenido y buscar el primer encabezado con formato '# XX_'
        try:
            contenido = self.md.read_text(encoding='utf-8', errors='replace')
            # Buscar primera línea que empiece con '# ' y luego dos letras mayúsculas + '_'
            for linea in contenido.splitlines():
                stripped = linea.lstrip()
                if stripped.startswith('# ') and not stripped.startswith('##'):
                    # Extraer 'XX' de '# XX_'
                    m2 = re.match(r'^#\s*([A-Z]{2})_', stripped)
                    if m2:
                        idioma = m2.group(1)
                        print(f"🔍 Idiomas detectado desde el contenido: {idioma}")
                        # El nombre base será el stem sin el prefijo que no tiene, así que usamos el stem completo
                        return stem, idioma
        except Exception as e:
            print(f"⚠️ Error al leer el contenido para detectar idioma: {e}")

        # 3. Si no se encuentra nada, español por defecto
        print("🔍 No se detectó idioma, usando 'ES' por defecto")
        return stem, "ES"

    # ------------------------------------------------------------
    #  GENERACIÓN DE ARTÍCULOS CON ABSTRACTS MULTILINGÜE (CORREGIDA)
    # ------------------------------------------------------------
    def generar_articulos_individuales(self, output_dir="articulos",
                                       abstract_lang=None,
                                       page_size="6x9"):
        """
        Genera artículos a partir del .md original.
        Solo usa abstracts de archivos .abstract generales (con _TOT_ o sin número específico).
        Indexa abstracts por número de artículo (ej. 0, 1, 2...).
        Maneja errores para que un fallo no detenga el proceso.
        
        Reglas de idioma:
        - Artículo en FR → solo abstract en FR
        - Artículo en ES → solo abstract en ES
        - Artículo en EN → solo abstract en FR (para pruebas)
        """
        # Mapeo de idiomas de abstract permitidos por idioma del artículo
        ABSTRACT_PERMITIDOS = {
            'FR': ['FR'],   # Artículo en FR → solo abstract en FR
            'ES': ['ES'],   # Artículo en ES → solo abstract en ES
            'EN': ['FR'],   # Artículo en EN → solo abstract en FR (para pruebas)
        }

        output_dir = Path(output_dir)
        output_dir.mkdir(parents=True, exist_ok=True)

        # Leer el contenido C (el .md original)
        master_contenido = self.md.read_text(encoding="utf-8", errors="replace")
        print(f"📄 Longitud del contenido C: {len(master_contenido)} caracteres")

        # --- Mostrar las primeras 20 líneas para depuración ---
        print("\n📄 Primeras 20 líneas del contenido C:")
        lineas_muestra = master_contenido.splitlines()[:20]
        for i, linea in enumerate(lineas_muestra, 1):
            print(f"   {i:2d}: {repr(linea[:80])}")
        print()

        # --- Mostrar todas las líneas que comienzan con "#" (posibles encabezados) ---
        print("🔍 Líneas que comienzan con '#' (posibles encabezados):")
        todas_lineas = master_contenido.splitlines()
        for i, linea in enumerate(todas_lineas, 1):
            if linea.lstrip().startswith("#"):
                print(f"   Línea {i}: {repr(linea[:80])}")
        print()

        # Obtener nombre base del libro sin prefijo de idioma
        base_name, idioma_libro = self._obtener_base_y_idioma()
        print(f"📖 Libro: base='{base_name}', idioma contenido='{idioma_libro}'")

        # --- Detectar archivos .abstract generales (solo los que contienen _TOT_ o no tienen número) ---
        all_abstracts = list(self.md.parent.glob("*.abstract"))
        abstract_files = []
        for f in all_abstracts:
            stem = f.stem
            if re.match(r'^[A-Z]{2}_', stem):
                if "_TOT_" in stem or not re.search(r'_\d+_', stem):
                    abstract_files.append(f)
        if not abstract_files:
            default_abstract = self.md.with_suffix(".abstract")
            if default_abstract.exists():
                abstract_files.append(default_abstract)

        print(f"📄 Archivos .abstract generales seleccionados: {[f.name for f in abstract_files]}")

        # --- Indexar abstracts por número e idioma ---
        # Estructura: abstracts_by_num[numero][idioma] = texto
        abstracts_by_num = {}
        for abs_file in abstract_files:
            stem = abs_file.stem
            lang_match = re.match(r'^([A-Z]{2})_', stem)
            lang = lang_match.group(1) if lang_match else 'default'

            contenido_abs = abs_file.read_text(encoding="utf-8", errors="replace")
            secciones_abs = self._extraer_secciones(contenido_abs)
            for cab, texto in secciones_abs:
                # Extraer número del encabezado (ej. "0" de "# ES_0:")
                m = re.match(r'^#\s*[A-Z]{2}_(\d+)', cab)
                if m:
                    num = m.group(1)
                    if num not in abstracts_by_num:
                        abstracts_by_num[num] = {}
                    abstracts_by_num[num][lang] = texto
                    print(f"      → Indexado abstract para número {num} en idioma {lang}")

        # --- Extraer secciones del .md ---
        arts = self._extraer_secciones(master_contenido)
        print(f"\n📊 Secciones encontradas en C: {len(arts)}")
        if not arts:
            print("❌ No se encontraron secciones. Verifica los encabezados '# ES_N:' o '# EN_N:'")
            return []

        print("🔹 Encabezados detectados (primeros 20):")
        for i, (cab, _) in enumerate(arts[:20]):
            print(f"   {i+1}: {cab[:80]}")
        if len(arts) > 20:
            print(f"   ... y {len(arts)-20} más")

        articulos_generados = []

        for cab, contenido in arts:
            # Extraer código base (ej. ES_33) y número
            m_base = re.match(r'^#\s*([A-Z]{2}_(\d+))', cab)
            if not m_base:
                print(f"⚠️ Encabezado sin código base: {cab[:50]}... (se omite)")
                continue
            codigo_base = m_base.group(1)  # ej. "ES_33"
            num = m_base.group(2)          # ej. "33"

            # Extraer idioma del artículo (ej. 'ES' de 'ES_33')
            idioma_articulo = codigo_base.split('_')[0]
            if not re.match(r'^[A-Z]{2}$', idioma_articulo):
                idioma_articulo = 'ES'   # fallback

            # Obtener los idiomas de abstract permitidos para este artículo
            idiomas_permitidos = ABSTRACT_PERMITIDOS.get(idioma_articulo, [idioma_articulo])
            # Normalizar a mayúsculas para comparar con las claves de abstracts_by_num
            idiomas_permitidos_mayus = [lang.upper() for lang in idiomas_permitidos]

            # Idiomas disponibles para este número
            if num in abstracts_by_num:
                idiomas_disponibles = list(abstracts_by_num[num].keys())
            else:
                idiomas_disponibles = []

            # Si el usuario forzó un idioma, respetarlo (pero solo si está permitido)
            if abstract_lang:
                if abstract_lang.upper() in idiomas_permitidos_mayus and abstract_lang.upper() in [l.upper() for l in idiomas_disponibles]:
                    idiomas_a_generar = [abstract_lang]
                else:
                    print(f"⚠️ No se encontró abstract en {abstract_lang} o no permitido para {idioma_articulo}")
                    idiomas_a_generar = []
            else:
                # Filtrar los disponibles por los permitidos
                idiomas_a_generar = [lang for lang in idiomas_disponibles if lang.upper() in idiomas_permitidos_mayus]

            # Si no hay abstracts permitidos, generar solo el contenido sin abstract
            if not idiomas_a_generar:
                print(f"📝 {codigo_base}: sin abstract permitido, generando solo contenido")
                self._generar_articulo_unico(cab, contenido, codigo_base, None, page_size, articulos_generados)
                continue

            # Generar un artículo por cada idioma de abstract permitido
            for lang in idiomas_a_generar:
                abstract_texto = abstracts_by_num[num][lang]
                # Usar sufijo en minúsculas para el nombre del archivo (ej. ES_33_es)
                nombre_completo = f"{codigo_base}_{lang.lower()}" if lang != 'default' else codigo_base
                print(f"✅ Generando {nombre_completo} (abstract en {lang})")
                self._generar_articulo_unico(cab, contenido, nombre_completo, abstract_texto, page_size, articulos_generados)

        print(f"✅ Generados {len(articulos_generados)} artículos")
        return articulos_generados

    def __str__(self):
        return f"LIBRO     {self.nombre}"