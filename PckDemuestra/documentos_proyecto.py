"""Project-owned documents, managed by DEMUESTRA without mixing formal verdicts."""

import hashlib
import json
from pathlib import Path
import re
import shutil


def ruta_local(proyecto, nombre):
    root = Path(proyecto).resolve()
    relative = Path(nombre)
    target = (root / relative).resolve()
    if relative.is_absolute() or not target.is_relative_to(root) or target == root:
        raise ValueError(f'Ruta ajena al proyecto: {nombre}')
    return target


def leer_catalogo(proyecto):
    root = Path(proyecto).resolve()
    data = json.loads((root / 'documentos_proyecto.json').read_text(encoding='utf-8'))
    documents = data.get('documentos', [])
    if data.get('version') != 1 or not documents:
        raise ValueError('Catalogo de documentos no valido')
    seen = set()
    for doc in documents:
        source = ruta_local(root, doc['fuente'])
        if not source.is_file() or source.suffix != '.md' or source in seen:
            raise ValueError(f'Fuente ausente o duplicada: {source}')
        seen.add(source)
    if ruta_local(root, data['principal']) not in seen:
        raise ValueError('El documento principal no esta en el catalogo')
    url_documento_pdf(data, data['principal'])
    return data


def url_documento_pdf(catalogo, relativa):
    """Resolve PDF links for print without changing portable Markdown or HTML."""
    from urllib.parse import quote, urljoin, urlsplit

    base = catalogo.get('base_url_pdf')
    if base is None:
        return None
    if not isinstance(base, str):
        raise ValueError('base_url_pdf debe ser una URL HTTP(S) terminada en /')
    url = urlsplit(base)
    if url.scheme not in ('http', 'https') or not url.netloc or url.query or url.fragment or not base.endswith('/'):
        raise ValueError('base_url_pdf debe ser una URL HTTP(S) terminada en /')
    return urljoin(base, quote(Path(relativa).with_suffix('.pdf').as_posix(), safe='/'))


def validar_enlaces_documentales(proyecto):
    """Check reciprocal PDF links for marked, non-evaluable companion documents."""
    from markdown_it import MarkdownIt
    from urllib.parse import unquote, urlsplit

    root = Path(proyecto).resolve()
    catalog = leer_catalogo(root)
    main = ruta_local(root, catalog['principal'])
    heading = main.read_text(encoding='utf-8-sig').splitlines()[0]
    match = re.fullmatch(r'# ([A-Z]{2}_[0-9]+):.*', heading)
    if not match:
        return {'principal': catalog['principal'], 'complementarios': [], 'enlaces_comprobados': 0}
    marker = '# -' + match[1] + ':'
    companions = []
    registered = {ruta_local(root, entry['fuente']) for entry in catalog['documentos']}
    for path in sorted(root.rglob('*.md')):
        if {'bck', 'respaldos', 'archivo_local', '.git', '__pycache__'}.intersection(path.relative_to(root).parts):
            continue
        lines = path.read_text(encoding='utf-8-sig').splitlines()
        if not lines or not lines[0].startswith(marker):
            continue
        if path.resolve() not in registered:
            raise ValueError(f'Complementario no incluido en el catalogo: {path.relative_to(root)}')
        companions.append(path.resolve())

    def targets(source):
        found = set()
        for token in MarkdownIt().parse(source.read_text(encoding='utf-8-sig')):
            for child in token.children or ():
                if child.type != 'link_open':
                    continue
                url = urlsplit(child.attrGet('href') or '')
                if url.scheme or url.netloc or not url.path:
                    continue
                target = (source.parent / unquote(url.path)).resolve()
                if target.is_relative_to(root):
                    found.add(target)
        return found

    outgoing = targets(main)
    for companion in companions:
        if companion.with_suffix('.pdf') not in outgoing:
            raise ValueError(f'{main.name}: falta enlace PDF relativo a {companion.relative_to(root)}')
        if main.with_suffix('.pdf') not in targets(companion):
            raise ValueError(f'{companion.relative_to(root)}: falta enlace PDF relativo al principal')
    return {'principal': catalog['principal'],
            'complementarios': [p.relative_to(root).as_posix() for p in companions],
            'enlaces_comprobados': 2 * len(companions)}


def generar_locales(proyecto):
    """Editorial artifacts only. Do not overwrite Lean/Prolog proof evaluations."""
    from PackPublica.documento import Documento
    from PackPublica.md import Md
    from playwright.sync_api import sync_playwright

    root = Path(proyecto).resolve()
    catalog = leer_catalogo(root)
    validar_enlaces_documentales(root)
    records = []
    with sync_playwright() as engine:
        browser = engine.chromium.launch(timeout=30000)
        try:
            for entry in catalog['documentos']:
                source = ruta_local(root, entry['fuente'])
                original = source.read_bytes()
                html = Md(Documento(source)).html(forzar=True).contenido
                page = browser.new_page()
                try:
                    page.set_content(html, wait_until='networkidle')
                    base = url_documento_pdf(catalog, source.relative_to(root))
                    if base:
                        page.evaluate('''href => {
                            const base = document.createElement('base');
                            base.href = href;
                            document.head.prepend(base);
                        }''', base)
                    page.evaluate('document.fonts.ready')
                    if not page.evaluate('Array.from(document.images).every(i=>i.complete && i.naturalWidth>0)'):
                        raise RuntimeError(f'Imagen no cargada en {source.name}')
                    page.pdf(path=str(source.with_suffix('.pdf')), format='A4',
                             print_background=True, prefer_css_page_size=True)
                finally:
                    page.close()
                source.with_suffix('.html').write_text(html, encoding='utf-8')
                if source.read_bytes() != original:
                    raise RuntimeError('La generacion cambio la fuente; no se marca consistente')
                records.append({**entry, 'source_sha256': hashlib.sha256(original).hexdigest(),
                                'derivados': {suffix: {
                                    'ruta': source.with_suffix('.' + suffix).relative_to(root).as_posix(),
                                    'sha256': hashlib.sha256(source.with_suffix('.' + suffix).read_bytes()).hexdigest()
                                } for suffix in ('html', 'pdf')},
                                'certificacion': 'NO_EVALUADA_POR_GENERACION_EDITORIAL'})
        finally:
            browser.close()
    report = {'version': 1, 'alcance': 'fuentes y derivados editoriales, no demostraciones',
              'estado': 'DERIVADOS_EDITORIALES_GENERADOS', 'documentos': records}
    (root / 'CONSISTENCIA_DOCUMENTOS.json').write_text(
        json.dumps(report, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    return report


def archivos_publicables(proyecto):
    from markdown_it import MarkdownIt
    from urllib.parse import unquote, urlsplit

    root = Path(proyecto).resolve()
    catalog = leer_catalogo(root)
    validar_enlaces_documentales(root)
    report_path = root / 'CONSISTENCIA_DOCUMENTOS.json'
    if not report_path.is_file():
        raise ValueError('Ejecuta publica.py --documentos-locales antes de publicar los anexos')
    report = json.loads(report_path.read_text(encoding='utf-8'))
    records = {record['fuente']: record for record in report.get('documentos', [])}
    for entry in catalog['documentos']:
        record = records.get(entry['fuente'], {})
        source = ruta_local(root, entry['fuente'])
        if record.get('source_sha256') != hashlib.sha256(source.read_bytes()).hexdigest():
            raise ValueError('Fuente modificada: regenera los documentos locales antes de publicar')
        for suffix in ('html', 'pdf'):
            target = source.with_suffix('.' + suffix)
            expected = record.get('derivados', {}).get(suffix, {}).get('sha256')
            if not target.is_file() or expected != hashlib.sha256(target.read_bytes()).hexdigest():
                raise ValueError('Derivado ausente o modificado; no se publica como consistente')
    files = {root / 'documentos_proyecto.json'}
    for entry in catalog['documentos']:
        source = ruta_local(root, entry['fuente'])
        files.update(source.with_suffix(ext) for ext in ('.md', '.html', '.pdf'))
        for token in MarkdownIt().parse(source.read_text(encoding='utf-8')):
            for child in token.children or ():
                if child.type != 'image':
                    continue
                url = urlsplit(child.attrGet('src') or '')
                if not url.scheme and not url.netloc:
                    image = (source.parent / unquote(url.path)).resolve()
                    if not image.is_relative_to(root):
                        raise ValueError('Imagen fuera del proyecto')
                    files.add(image)
    allowed = {'.py', '.pl', '.cpp', '.hpp', '.q', '.qasm', '.bat', '.ps1', '.sh', '.txt', '.json', '.zip', '.pdf'}
    for relative in catalog.get('adjuntos', []):
        path = ruta_local(root, relative)
        if path.suffix not in allowed:
            raise ValueError(f'Tipo de adjunto no permitido: {relative}')
        files.add(path)
    if any(not path.is_file() for path in files):
        raise ValueError('Faltan documentos o adjuntos del catalogo; genera y verifica antes de publicar')
    return sorted(files)


def sincronizar_locales(proyecto, destino):
    """Copy only the verified project catalog; preserve replaced local versions."""
    root = Path(proyecto).resolve()
    target = Path(destino).resolve()
    if target == root or target.is_relative_to(root) or root.is_relative_to(target):
        raise ValueError('Origen y destino de sincronizacion deben ser independientes')
    files = archivos_publicables(root)
    catalog = leer_catalogo(root)
    copies = []
    for source in files:
        relative = source.relative_to(root)
        if relative.as_posix() == 'documentos_proyecto.json':
            relative = Path(f'documentos_proyecto_{root.name}.json')
        elif relative.as_posix() == 'CONSISTENCIA_DOCUMENTOS.json':
            relative = Path(f'CONSISTENCIA_DOCUMENTOS_{root.name}.json')
        copies.append((source, target / relative))
    for entry in catalog['documentos']:
        source = ruta_local(root, entry['fuente'])
        for suffix, folder in (('.pdf', 'pdfs'), ('.html', 'htmls')):
            copies.append((source.with_suffix(suffix), target / folder / source.with_suffix(suffix).name))
    # Validate every destination before making any copies (including symlinks).
    if any(not path.resolve().is_relative_to(target) for _, path in copies):
        raise ValueError('Destino de copia fuera del proyecto receptor')
    for source, path in copies:
        original = source.read_bytes()
        if path.is_file() and path.read_bytes() != original:
            digest = hashlib.sha256(path.read_bytes()).hexdigest()
            backup = target / 'bck' / f'sincronizacion_{root.name}' / digest / path.relative_to(target)
            if not backup.resolve().is_relative_to(target):
                raise ValueError('Respaldo fuera del proyecto receptor')
            backup.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(path, backup)
        path.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source, path)
        if path.read_bytes() != original:
            raise OSError(f'Copia local no coincidente: {path}')
    return [path for _, path in copies]
