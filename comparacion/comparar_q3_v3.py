"""Local Q3/V3 diagnostic or descriptive import of external sample evidence."""

import argparse
from datetime import datetime, timezone
import hashlib
import json
import math
from pathlib import Path
import time

import numpy as np

from protocolo_q3 import MAX_LOCAL_QUBITS, circuit_hash, make_circuit, validate
import q3
from v3 import V3
from ejecucion_v import ejecutar, comparar_tiempos


def local_compare(spec, *, realizacion=None):
    validate(spec)
    start = time.perf_counter()
    if spec['qubits'] <= MAX_LOCAL_QUBITS:
        q_probs = q3.probabilities(spec)
        q_seconds = time.perf_counter() - start
        uniform_distance = float(np.sum(np.abs(q_probs - 1/len(q_probs)))/2)
        q_status = 'MODELO_LOCAL'
    else:
        q_seconds, uniform_distance = None, None
        q_status = 'LIMITE_REFERENCIA_Q'
    machine = V3(spec, realizacion=realizacion)
    capture = ejecutar(machine)
    return {'qubits': spec['qubits'], 'gate_count': len(spec['gates']),
            'circuit_sha256': circuit_hash(spec), 'q3_local_seconds': q_seconds,
            'v3_capture': capture, 'status': capture['status'],
            'q3_reference_status': q_status,
            'timing': comparar_tiempos(q_seconds, capture) if q_seconds is not None else None,
            'uniform_control_distance': uniform_distance,
            'equivalence_verified': False,
            'scope': 'Q3 local simulation and V3 single-readout protocol, not Willow'}


def validate_samples(data, spec):
    if not isinstance(data, dict):
        raise ValueError('A sample dataset must be an object')
    if data.get('circuit_sha256') != circuit_hash(spec):
        raise ValueError('Sample circuit does not match the declared protocol')
    if type(data.get('shots')) is not int or data['shots'] < 1:
        raise ValueError('Invalid sample count')
    seconds = data.get('elapsed_seconds')
    if type(seconds) not in (int, float) or not math.isfinite(seconds) or seconds <= 0:
        raise ValueError('Invalid elapsed time')
    if not isinstance(data.get('backend'), str) or not data['backend'].strip():
        raise ValueError('Backend identity is required')
    if data.get('bit_order') != 'q0_lsb':
        raise ValueError('Samples must use the declared bit order')
    counts = data.get('counts')
    if not isinstance(counts, dict) or not counts:
        raise ValueError('Counts are required')
    for bits, count in counts.items():
        if len(bits) != spec['qubits'] or set(bits) - {'0', '1'} or type(count) is not int or count < 1:
            raise ValueError('Invalid bitstring or multiplicity')
    if sum(counts.values()) != data['shots']:
        raise ValueError('Counts do not sum to shots')


def compare_external(spec, q_data, v_data):
    validate(spec)
    validate_samples(q_data, spec)
    validate_samples(v_data, spec)
    if q_data['shots'] != v_data['shots']:
        raise ValueError('Both datasets must have the same number of shots')
    support = set(q_data['counts']) | set(v_data['counts'])
    distance = sum(abs(q_data['counts'].get(b, 0)-v_data['counts'].get(b, 0))
                   for b in support)/(2*q_data['shots'])
    return {'status': 'IMPORTED_DESCRIPTIVE_ONLY', 'circuit_sha256': circuit_hash(spec),
            'shots': q_data['shots'], 'empirical_histogram_distance': distance,
            'q_reported_seconds': q_data['elapsed_seconds'],
            'v_reported_seconds': v_data['elapsed_seconds'],
            'q_backend': q_data['backend'], 'v_backend': v_data['backend'],
            'quality_verified': False, 'quantum_advantage_verified': False,
            'warning': 'Finite histogram distance is not distribution equivalence; '
                       'times and backend identity are self-reported. Published quality validation remains required.'}


def provenance():
    root = Path(__file__).resolve().parents[1]
    paths = [Path(__file__), Path(__file__).with_name('q3.py'),
             Path(__file__).with_name('v3.py'), Path(__file__).with_name('protocolo_q3.py'),
             Path(__file__).with_name('q1_v1.py'),
             Path(__file__).with_name('v_relacional.py'),
             Path(__file__).with_name('operaciones_senales.py'),
             Path(__file__).with_name('ejecucion_v.py'),
             root/'Proyectos/ES_52/ES_52_Maquina_V_UNIHOLOG.md']
    return {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--qubits', type=int, nargs='+', default=[4,8,12,16])
    parser.add_argument('--cycles', type=int, default=6)
    parser.add_argument('--circuit', type=Path)
    parser.add_argument('--q-samples', type=Path)
    parser.add_argument('--v-samples', type=Path)
    parser.add_argument('--report', type=Path)
    parser.add_argument('--export-circuits', type=Path)
    args = parser.parse_args()
    if bool(args.q_samples) != bool(args.v_samples):
        parser.error('Provide both --q-samples and --v-samples')
    if args.q_samples and not args.circuit:
        parser.error('External samples require --circuit')
    specs = [validate(json.loads(args.circuit.read_text(encoding='utf-8')))] if args.circuit else [
        make_circuit(n, args.cycles) for n in args.qubits]
    if args.q_samples:
        report = compare_external(specs[0], json.loads(args.q_samples.read_text(encoding='utf-8')),
                                  json.loads(args.v_samples.read_text(encoding='utf-8')))
    else:
        results = [local_compare(spec) for spec in specs]
        report = {'status': 'MEDIDO' if all(r['status'] == 'MEDIDO' for r in results)
                            else 'PENDIENTE_REALIZACION', 'results': results,
                  'published_Willow_instance_tested': False, 'quantum_advantage_verified': False,
                  'hidden_generator_architecture_implemented': False,
                  'limits': 'Q3 local reference limited to 16 qubits; V3 stores circuit connections only'}
        for row in results:
            print(f"n={row['qubits']}: {row['status']}")
    report['utc'] = datetime.now(timezone.utc).isoformat()
    report['sha256'] = provenance()
    if args.export_circuits:
        args.export_circuits.mkdir(parents=True, exist_ok=True)
        for spec in specs:
            filename = f"q3_n{spec['qubits']}_{circuit_hash(spec)[:12]}.json"
            (args.export_circuits/filename).write_text(json.dumps(spec, indent=2)+'\n', encoding='utf-8')
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(report, indent=2)+'\n', encoding='utf-8')
    print('No published Willow advantage has been reproduced by this local test.')
    return 2 if report['status'] == 'PENDIENTE_REALIZACION' else 0


if __name__ == '__main__':
    raise SystemExit(main())
