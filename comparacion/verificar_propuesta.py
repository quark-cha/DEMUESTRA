"""Opt-in diagnostics of a numerical proposal, not physical quantum V evidence."""

import argparse
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path

from propuesta_lectura import PropuestaLecturaPorCaminos, amplitud_diagnostico
from protocolo_q3 import make_circuit
from q1_v1 import run as run_q1
from q2_v2 import compare, q2_distribution
import q3
from comparar_q3_v3 import local_compare
from v_relacional import V2Relacional, V3Relacional


def run(n=15):
    # Fixed thresholds are disclosed fixtures, not random physical repetitions.
    factory = lambda: PropuestaLecturaPorCaminos(lambda t: .37)
    deutsch = run_q1(realizacion_factory=factory)
    small = V2Relacional(3)
    small.execute()
    reference = q2_distribution(3, 2)
    max_error = 0.
    for control, expected in enumerate(reference):
        probability = sum(abs(amplitud_diagnostico(small.preparacion(), work + (control << 2)))**2
                          for work in range(4))
        max_error = max(max_error, abs(probability - float(expected)))
    shor = compare(n, realizacion_factory=factory)
    spec = make_circuit(3, cycles=2, seed=7)
    candidate = V3Relacional(spec)
    candidate.execute()
    q_probabilities = q3.probabilities(spec)
    rcs_error = max(abs(abs(amplitud_diagnostico(candidate.preparacion(), output))**2 - float(expected))
                    for output, expected in enumerate(q_probabilities))
    rcs_capture = local_compare(spec, realizacion=factory())
    root = Path(__file__).resolve().parent
    hashes = {name: hashlib.sha256((root / name).read_bytes()).hexdigest()
              for name in ('propuesta_lectura.py', 'verificar_propuesta.py', 'v_relacional.py',
                           'operaciones_senales.py', 'ejecucion_v.py', 'q1_v1.py', 'q2_v2.py',
                           'q3.py', 'protocolo_q3.py', 'comparar_q3_v3.py')}
    return {'fecha_utc': datetime.now(timezone.utc).isoformat(),
            'tipo': 'VERIFICACION_MODELO_NUMERICO_PROPUESTO',
            'umbral_de_ensayo': .37, 'umbral_conocido_por_el_comprobador': True,
            'Q1_V1': deutsch,
            'Q2_V2': {'distribucion_completa_N3_error_maximo': max_error, 'captura': shor},
            'Q3_V3': {'distribucion_completa_3_unidades_error_maximo': rcs_error,
                      'captura': rcs_capture},
            'contrastes_numericos_superados':
                all(r['task_matches'] for r in deutsch['results']) and
                max_error < 1e-10 and rcs_error < 1e-10 and
                shor['status'] == 'MEDIDO' and rcs_capture['status'] == 'MEDIDO',
            'maquina_fisica_construida': False, 'igualdad_orden_temporal_demostrada': False,
            'memoria_exponencial_tabular': False, 'tiempo_puede_ser_exponencial': True,
            'notas': ['La coincidencia comprueba la propuesta basada en matrices unitarias y regla de Born.',
                      'No demuestra que esas leyes se deduzcan solo del desconocimiento del resultado.',
                      'Una lectura favorable de Shor no establece su tasa de exito.',
                      'La precision es numerica finita, no aritmetica exacta.',
                      'Esta propuesta no sustituye automaticamente la arquitectura V del autor.'],
            'sha256': hashes}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--n', type=int, default=15)
    parser.add_argument('--report', type=Path, required=True)
    args = parser.parse_args()
    report = run(args.n)
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
    print('Modelo propuesto:', 'CONTRASTES SUPERADOS' if report['contrastes_numericos_superados'] else 'INCOMPLETO')
    print('No acredita construccion fisica ni igualdad de orden temporal.')
    return 0 if report['contrastes_numericos_superados'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
