"""Refresh closure reports only; never publish, generate proofs or certificates."""

import argparse
import ast
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import re
import shutil

ROOT = Path(__file__).resolve().parents[1]


def namespace():
    path = ROOT / 'publica.py'
    tree = ast.parse(path.read_text(encoding='utf-8'))
    functions = [node for node in tree.body if isinstance(node, ast.FunctionDef)]
    ns = {'PROJECT_ROOT': ROOT, 'DIRECTORIOS_PROYECTOS': {},
          'datetime': datetime, 'timezone': timezone, 'Path': Path,
          'json': json, 're': re, 'shutil': shutil, 'hashlib': hashlib}
    exec(compile(ast.Module(body=functions, type_ignores=[]), str(path), 'exec'), ns)
    return ns


def refresh(project):
    ns = namespace()
    folder = ns['_proyecto_dir'](project).resolve()
    if folder.parent not in ((ROOT/'Proyectos').resolve(), (ROOT/'YaEvaluado').resolve()):
        raise ValueError('Project must be a direct project directory')
    backup = ROOT/'documentacion'/project/'respaldos'/datetime.now(timezone.utc).strftime('auditoria_%Y%m%d_%H%M%S_%f')
    paths = [folder/f'AUDITORIA_{project}.json', folder/f'AUDITORIA_{project}.md',
             folder/f'AUDITORIA_{project}.log', folder/f'SEMAFORO_{project}.json',
             folder/f'SEMAFORO_{project}.md',
             folder/'evaluaciones'/f'AUDITORIA_{project}.json',
             folder/'evaluaciones'/f'AUDITORIA_{project}.md',
             folder/'logs'/f'AUDITORIA_{project}.log']
    protected = [folder/f'{project}.md', folder/f'{project}.lean',
                 folder/f'LEAN_{project}.json', folder/f'CERTIFICADO_PARCIAL_LEAN_{project}.json']
    hashes = {p: hashlib.sha256(p.read_bytes()).hexdigest() for p in protected if p.is_file()}
    for path in paths:
        if path.is_file():
            destination = backup/path.relative_to(folder)
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(path, destination)
    verdict = ns['auditar_cierre_proyecto'](project)
    ns['actualizar_semaforo_evaluacion'](project)
    if any(hashlib.sha256(p.read_bytes()).hexdigest() != value for p,value in hashes.items()):
        raise RuntimeError('Protected evidence changed unexpectedly; inspect backup')
    print('Audit refreshed; scientific source, Lean source and certificates unchanged.')
    print('Previous reports preserved at:', backup)
    return verdict


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--project', required=True)
    args = parser.parse_args()
    refresh(args.project)
