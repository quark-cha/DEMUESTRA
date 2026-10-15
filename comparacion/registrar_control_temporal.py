"""Evaluate the constitutive time/trigger contract, not physical V dynamics."""

from datetime import datetime, timezone
import hashlib
import io
import json
from pathlib import Path
import shutil
import unittest


def registrar(root):
    comparisons = root / 'comparacion'
    project = root / 'Proyectos' / 'ES_52'
    base = 'ES_52_Maquina_V_UNIHOLOG'
    output = io.StringIO()
    suite = unittest.defaultTestLoader.discover(str(comparisons / 'tests'))
    result = unittest.TextTestRunner(stream=output, verbosity=2).run(suite)
    if not result.wasSuccessful():
        raise RuntimeError('Las pruebas fallan; no se registra el control como verificado')
    hashes = {p.name: hashlib.sha256(p.read_bytes()).hexdigest()
              for p in [comparisons / 'v_relacional.py', comparisons / 'ejecucion_v.py',
                        comparisons / 'registrar_control_temporal.py',
                        comparisons / 'tests' / 'test_t0_constitutivo.py']}
    report = {'project': base, 'branch': 'CONSTITUTIVE_TIME_TRIGGER_CONTROL',
              'generated_on': datetime.now(timezone.utc).isoformat(),
              'status': 'CONTROL_TEMPORAL_VERIFICADO',
              'passed': True, 'refuted': False, 'formal_certification': False,
              'physical_realization_verified': False,
              'source_sha256': hashlib.sha256((project / f'{base}.md').read_bytes()).hexdigest(),
              'code_sha256': hashes,
              'tests': {'successful': result.testsRun - len(result.skipped),
                        'discovered': result.testsRun, 'skipped': len(result.skipped),
                        'failures': len(result.failures), 'errors': len(result.errors)},
              'checks': {'t0_recorded_at_trigger': True, 'synthetic_t0_rejected': True,
                         'one_trigger_per_preparation': True, 'no_plan_evaluation_at_trigger': True,
                         'unknown_observed_outputs_before_trigger': True,
                         'path_model_excluded_from_V': True},
              'scope': 'Control temporal de V1, V2 y V3: preparar, disparar una vez y registrar bits.',
              'limits': ['El reloj marca la invocacion de disparar, no calibra el instante de conversion de un sensor.',
                        'Los detectores de ensayo comprueban llamadas, no realizan las puertas de V.',
                        'Falta conectar y verificar la dinamica de una realizacion V.',
                        'No se acredita equivalencia con Q ni mejora del orden temporal.']}
    md = '\n'.join([
        '# Evaluacion del control temporal de V', '',
        '**Estado: CONTROL_TEMPORAL_VERIFICADO.**', '',
        f"Pruebas ejecutadas y superadas: {report['tests']['successful']}. "
        f"Pruebas del modelo retirado omitidas: {report['tests']['skipped']}.", '',
        'En V1, V2 y V3, $t=t_0$ identifica el evento de disparo. No es una',
        'etiqueta proporcionada a un calculo de salidas. La preparacion configura',
        'las conexiones sin leer resultados. La medida llama una sola vez a',
        '`disparar(t0)` de la realizacion conectada, y registra sus bits.', '',
        'El controlador no recorre estados, caminos ni el plan de puertas durante',
        'el disparo. La validacion y el registro de los bits recibidos no son una',
        'busqueda de posibles salidas. Las llamadas repetidas devuelven el registro',
        'existente y no vuelven a disparar.', '',
        '## Alcance pendiente', '',
        'Se ha corregido el control temporal, no se ha construido ni verificado',
        'la dinamica fisica de las tres maquinas. Un detector de prueba no',
        'demuestra H, fase, Fourier ni los algoritmos completos. El reloj del',
        'programa registra la llamada; un sensor real requiere su propia calibracion.', '',
        'El ensayo por caminos es independiente y no aplicable a V. Sus 74 segundos',
        r'y su resultado $15=3\times5$ no describen el coste o los resultados de V.', '',
        'No hay evidencia de mejor orden temporal que la programacion convencional',
        'ni tiempos de hardware Q. No se altera Lean, Prolog o un certificado.', '',
        f'[Registro estructurado](TEMPORAL_{base}.json)', '',
    ])
    folder = project / 'evaluaciones'
    folder.mkdir(parents=True, exist_ok=True)
    for extension, content in [('json', json.dumps(report, ensure_ascii=False, indent=2) + '\n'),
                               ('md', md), ('log', output.getvalue())]:
        path = folder / f'TEMPORAL_{base}.{extension}'
        path.write_text(content, encoding='utf-8')
        shutil.copy2(path, project / path.name)
    print(f"Control registrado: {report['tests']['successful']} pruebas, "
          f"{report['tests']['skipped']} historicas omitidas. Sin publicar ni certificar.")
    return report


if __name__ == '__main__':
    registrar(Path(__file__).resolve().parents[1])
