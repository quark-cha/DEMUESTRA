"""Run all three protocols without replacing V by the retired amplitude bank."""

import argparse
from datetime import datetime, timezone
import importlib
import json
from pathlib import Path

from q1_v1 import run as run_q1
from q2_v2 import compare as compare_q2
from comparar_q3_v3 import local_compare
from protocolo_q3 import make_circuit


def run(*, n=15, qubits=4, cycles=1, realizacion_factory=None):
    q1 = run_q1(realizacion_factory=realizacion_factory)
    q2 = compare_q2(n, realizacion_factory=realizacion_factory)
    device = None if realizacion_factory is None else realizacion_factory()
    rows = {'Q1_V1': q1,
            'Q2_V2': q2,
            'Q3_V3': local_compare(make_circuit(qubits, cycles), realizacion=device)}
    return {'fecha_utc': datetime.now(timezone.utc).isoformat(),
            'status': 'MEDIDO' if all(r['status'] == 'MEDIDO' for r in rows.values())
                      else 'PENDIENTE_REALIZACION',
            'protocolos': rows, 'equivalencia_demostrada': False,
            'nota': 'MEDIDO significa registro de salida, no certificacion de su dinamica. '
                    'Las referencias Q son simulaciones locales; los tiempos no prueban ventaja.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--n', type=int, default=15)
    parser.add_argument('--qubits', type=int, default=4)
    parser.add_argument('--cycles', type=int, default=1)
    parser.add_argument('--realizacion', help='Modulo local y fabrica de dispositivo: modulo:fabrica')
    parser.add_argument('--report', type=Path)
    args = parser.parse_args()
    factory = None
    if args.realizacion:
        module, separator, name = args.realizacion.partition(':')
        if not separator or not module or not name:
            parser.error('--realizacion requiere modulo:fabrica')
        if module == 'propuesta_lectura':
            parser.error('La propuesta por caminos no cumple la medida por disparo de V; '
                         'se conserva como ensayo numerico separado, no como esta maquina')
        factory = getattr(importlib.import_module(module), name)
        if not callable(factory):
            parser.error('La fabrica de realizaciones debe ser invocable')
    report = run(n=args.n, qubits=args.qubits, cycles=args.cycles, realizacion_factory=factory)
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
    for name, row in report['protocolos'].items():
        print(f"{name}: {row['status']}")
    return 0 if report['status'] == 'MEDIDO' else 2


if __name__ == '__main__':
    raise SystemExit(main())
