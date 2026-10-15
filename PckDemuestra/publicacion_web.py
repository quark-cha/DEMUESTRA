"""Una unica plantilla PHP para todas las fichas de DEMUESTRA."""

import hashlib
import json
from pathlib import Path
import shutil


def indice_comun(raiz):
    root = Path(raiz).resolve()
    config = json.loads((root / 'publicacion_web.json').read_text(encoding='utf-8'))
    if config.get('version') != 1 or not isinstance(config.get('indice_comun'), str):
        raise ValueError('Configuracion del indice comun no valida')
    relative = Path(config['indice_comun'])
    source = (root / relative).resolve()
    if relative.is_absolute() or not source.is_relative_to(root) or source.name != 'index.php':
        raise ValueError('El indice comun debe ser un index.php dentro de DEMUESTRA')
    if not source.is_file():
        raise FileNotFoundError(f'Falta el indice comun: {source}')
    return source


def sincronizar_indices(raiz, directorios):
    root = Path(raiz).resolve()
    source = indice_comun(root)
    targets = sorted({(Path(directory) / 'index.php').resolve() for directory in directorios})
    if any(not target.is_relative_to(root) for target in targets):
        raise ValueError('Una ficha de destino esta fuera de DEMUESTRA')
    expected = hashlib.sha256(source.read_bytes()).hexdigest()
    for target in targets:
        target.parent.mkdir(parents=True, exist_ok=True)
        if target != source and (not target.is_file() or target.read_bytes() != source.read_bytes()):
            shutil.copy2(source, target)
        if hashlib.sha256(target.read_bytes()).hexdigest() != expected:
            raise OSError(f'La ficha no coincide con el indice comun: {target}')
    return targets
