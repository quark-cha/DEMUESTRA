"""Register verified numerical evidence separately from Lean/physical claims."""

from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import shutil


def verificar_fuentes(data, directory):
    hashes = data.get('sha256')
    if not isinstance(hashes, dict) or not hashes:
        raise ValueError('El ensayo no identifica sus fuentes')
    for name, expected in hashes.items():
        if Path(name).name != name or Path(name).suffix != '.py':
            raise ValueError('Nombre de fuente no permitido')
        path = directory / name
        if not path.is_file() or hashlib.sha256(path.read_bytes()).hexdigest() != expected:
            raise ValueError(f'El codigo cambio desde el ensayo: {name}; debe repetirse el contraste')


def construir_informe(data, source_hash, evidence_hash):
    if data.get('tipo') != 'VERIFICACION_MODELO_NUMERICO_PROPUESTO':
        raise ValueError('Tipo de evidencia no admitido')
    if data.get('contrastes_numericos_superados') is not True:
        raise ValueError('El informe historico no registra contrastes superados')
    if data.get('maquina_fisica_construida') is not False:
        raise ValueError('Esta rama no acredita una realizacion fisica')
    capture = data['Q2_V2']['captura']['v2_attempts'][0]
    return {'project': 'ES_52_Maquina_V_UNIHOLOG',
            'tool': 'Contraste numerico Python/Qiskit', 'branch': 'NUMERICAL_PROPOSAL',
            'generated_on': datetime.now(timezone.utc).isoformat(),
            'status': 'ENSAYO_NO_APLICABLE_A_V', 'passed': None, 'refuted': False,
            'numerical_checks_passed': True,
            'applicable_to_author_V': False,
            'constraint': 'La medida debe desencadenarse, no calcularse recorriendo caminos o salidas.',
            'constraint_satisfied': False,
            'formal_certification': False, 'physical_realization_verified': False,
            'source_sha256': source_hash, 'evidence_sha256': evidence_hash,
            'evidence_file': 'NUMERICO_DATOS_ES_52_Maquina_V_UNIHOLOG.json',
            'scope': 'Ensayo numerico conservado como historial. Sus coincidencias no evaluan V: '
                     'el recorrido de caminos incumple el criterio de medida por disparo.',
            'tests': {'status': 'NO_REEJECUTADAS',
                      'reason': 'No se vuelve a ejecutar el modelo descartado para V.'},
            'results': {
                'deutsch_cases': [{'function': r['function'], 'task_matches': r['task_matches']}
                                 for r in data['Q1_V1']['results']],
                'v2_N3_max_error': data['Q2_V2']['distribucion_completa_N3_error_maximo'],
                'v2_capture': {'N': data['Q2_V2']['captura']['N'],
                               'control': capture.get('control_value'),
                               'outcome': capture.get('outcome'),
                               'seconds': capture['medida_seconds'],
                               'visits': capture['realizacion']['visitas'],
                               'stack_peak': capture['realizacion']['max_pila']},
                'v3_max_error': data['Q3_V3']['distribucion_completa_3_unidades_error_maximo']},
            'execution_order': {
                'gate_sequence_preserved': True, 'tabular_exponential_memory': False,
                'output_scan': 'hasta 2^n palabras; caminos adicionales pueden ser exponenciales',
                'time_complexity_improvement_verified': False,
                'conventional_programming_speedup_verified': False,
                'Q_hardware_timing_available': False,
                'timings_comparable_for_advantage': False},
            'limits': data['notas'] + ['La referencia 0.37 es fija y conocida por el comprobador.',
                                      'El resultado positivo no modifica los veredictos Lean o Prolog.']}


def registrar(root):
    comparisons = root / 'comparacion'
    project = root / 'Proyectos' / 'ES_52'
    base = 'ES_52_Maquina_V_UNIHOLOG'
    evidence = root / 'documentacion' / 'ES_52' / 'VERIFICACION_PROPUESTA_LECTURA_20261010.json'
    raw = evidence.read_bytes()
    data = json.loads(raw)
    verificar_fuentes(data, comparisons)
    report = construir_informe(data, hashlib.sha256((project / f'{base}.md').read_bytes()).hexdigest(),
                               hashlib.sha256(raw).hexdigest())
    values = report['results']
    capture = values['v2_capture']
    factors = (capture.get('outcome') or {}).get('factors')
    md = '\n'.join([
        '# Evaluacion numerica del proyecto 52', '',
        f"Estado: **{report['status']}**.", '',
        '**Criterio del autor:** la medida solo debe desencadenarse en $t=t_0$,',
        'sin recorrer caminos ni posibles salidas para calcular el resultado.', '',
        'La propuesta por caminos no cumple ese criterio. Se retira como candidata',
        'a ejecucion de V; sus resultados se conservan como ensayo numerico separado.',
        'Esto no refuta V ni modifica su demostracion: identifica una implementacion',
        'que no corresponde a las premisas exigidas.', '',
        '## Resultados historicos del ensayo', '',
        '- V1: los cuatro casos de Deutsch coinciden con la referencia Q local.',
        f"- V2: distribucion completa N=3, error maximo {values['v2_N3_max_error']:.3g}.",
        f"- V2: lectura N={capture['N']}, control {capture['control']}, factores {factors}.",
        f"- V2: {capture['seconds']:.3f} segundos; {capture['visits']} visitas; pila maxima {capture['stack_peak']}.",
        f"- V3: distribucion de tres unidades, error maximo {values['v3_max_error']:.3g}.", '',
        '## Orden de ejecucion', '',
        'El ensayo conserva el orden de las puertas Q y sus fases. Su memoria evita la tabla',
        'conjunta, pero la lectura recorre hasta $2^n$ palabras y muchos caminos.',
        'No se ha demostrado mejor orden temporal ni mejora respecto de un algoritmo',
        'convencional para la misma tarea. No hay tiempos de hardware Q.', '',
        '## Alcance', '', report['scope'], '',
        'La referencia de ensayo es fija, 0.37. Una lectura favorable no determina',
        'la tasa de exito. La precision es finita. Estos resultados no sustituyen',
        'ni modifican los veredictos independientes de Lean y Prolog.', '',
        f'[Evaluacion estructurada](NUMERICO_{base}.json)',
        f'[Datos completos del ensayo](NUMERICO_DATOS_{base}.json)', '',
    ])
    target = project / 'evaluaciones'
    target.mkdir(parents=True, exist_ok=True)
    outputs = {f'NUMERICO_{base}.json': json.dumps(report, ensure_ascii=False, indent=2) + '\n',
               f'NUMERICO_{base}.md': md,
               f'NUMERICO_{base}.log': 'Registro de evidencias previas, sin reejecutar el modelo.\n'
                                         'Estado: ENSAYO_NO_APLICABLE_A_V. No se refuta V.\n'}
    for name, content in outputs.items():
        (target / name).write_text(content, encoding='utf-8')
    shutil.copy2(evidence, target / report['evidence_file'])
    for name in [*outputs, report['evidence_file']]:
        shutil.copy2(target / name, project / name)
    print(f"Evaluacion registrada: {report['status']}. Sin reejecutar, publicar ni certificar.")
    return report


if __name__ == '__main__':
    registrar(Path(__file__).resolve().parents[1])
