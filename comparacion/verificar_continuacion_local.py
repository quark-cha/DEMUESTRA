"""Read local ES_52 state and test its implementation; never publish or use Git."""

import argparse
from datetime import datetime, timezone
import hashlib
import io
import json
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
PROJECT = ROOT / 'Proyectos' / 'ES_52'
BASE = 'ES_52_Maquina_V_UNIHOLOG'
SHARED = ('traductor_qasm_v.py', 'v_relacional.py', 'operaciones_senales.py',
          'v1.py', 'v2.py', 'v3.py', 'protocolo_q3.py', 'ejecucion_v.py')


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def verificar():
    source = PROJECT / (BASE + '.md')
    original_hash = digest(source)
    copies = {name: (ROOT / 'comparacion' / name).read_bytes() ==
              (PROJECT / 'Traductores_V' / name).read_bytes() for name in SHARED}
    output = io.StringIO()
    suite = unittest.defaultTestLoader.discover(str(ROOT / 'comparacion' / 'tests'))
    result = unittest.TextTestRunner(stream=output, verbosity=2).run(suite)
    unchanged = digest(source) == original_hash
    reports = {}
    for branch in ('PROLOG_JSON', 'PROLOG_MD_DIRECTO', 'TRADUCCION', 'TEMPORAL'):
        path = PROJECT / f'{branch}_{BASE}.json'
        if not path.is_file():
            reports[branch] = {'available': False}
            continue
        data = json.loads(path.read_text(encoding='utf-8'))
        reports[branch] = {
            'available': True, 'file': str(path.relative_to(ROOT)), 'sha256': digest(path),
            'verdict': data.get('verdict', data.get('status')),
            'passed': data.get('passed'), 'scope': data.get('scope'),
            'source_matches': (data['source_sha256'] == original_hash
                               if data.get('source_sha256') else None),
        }
    success = result.wasSuccessful() and all(copies.values()) and unchanged
    return {
        'generated_on': datetime.now(timezone.utc).isoformat(),
        'status': 'COMPROBACIONES_LOCALES_SUPERADAS' if success else 'REVISAR_COMPROBACIONES_LOCALES',
        'local_only': True, 'formal_certification': False,
        'scope': 'Pruebas de conexiones, traduccion y protocolo de disparo; no certifica equivalencia Q-V.',
        'machine': 'V determinista convencional; V_ref y el ensayo por caminos no son V.',
        'source_sha256': original_hash, 'source_unchanged': unchanged,
        'synchronized_files': copies, 'existing_reports': reports,
        'tests': {'discovered': result.testsRun, 'skipped': len(result.skipped),
                  'failures': len(result.failures), 'errors': len(result.errors)},
        'pending': [
            'Conectar y verificar la realizacion conjunta de V sin amplitudes ni recorrido de caminos.',
            'Resolver el modelo tipado de probabilidad condicionada, los indices y tipos de Lean.',
            'Comparar tareas completas y recursos de Q y V con realizaciones y condiciones declaradas.',
        ],
        'test_log': output.getvalue(),
    }, success


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--informe', type=Path, help='Archivo nuevo; nunca sobrescribe un informe existente')
    args = parser.parse_args()
    if args.informe and args.informe.exists():
        parser.error('El informe ya existe. Elige otro nombre; se conserva el original.')
    report, success = verificar()
    content = json.dumps(report, ensure_ascii=False, indent=2) + '\n'
    if args.informe:
        with args.informe.open('x', encoding='utf-8') as stream:
            stream.write(content)
        print(str(args.informe.resolve()))
    else:
        print(content)
    raise SystemExit(0 if success else 1)


if __name__ == '__main__':
    main()
