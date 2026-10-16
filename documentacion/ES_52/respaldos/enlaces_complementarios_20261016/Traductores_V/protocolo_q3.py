"""Declared RCS-like test circuits, not Google's original Willow instances."""

import hashlib
import json
import math
import random

MAX_LOCAL_QUBITS = 16


def validate(spec):
    if not isinstance(spec, dict):
        raise ValueError('A protocol must be an object')
    if type(spec.get('qubits')) is not int or not 1 <= spec['qubits'] <= 1000:
        raise ValueError('Invalid register size')
    if spec.get('preparation') != 'zero' or spec.get('bit_order') != 'q0_lsb':
        raise ValueError('Unsupported preparation or bit order')
    gates = spec.get('gates')
    if not isinstance(gates, list) or len(gates) > 100000:
        raise ValueError('Invalid gate list')
    for gate in gates:
        if not isinstance(gate, dict):
            raise ValueError('A gate must be an object')
        name = gate.get('name')
        qs = gate.get('qubits')
        arity = 2 if name == 'cz' else 1
        if name not in ('h', 'rx', 'rz', 'cz') or not isinstance(qs, list) or len(qs) != arity:
            raise ValueError('Unsupported operation')
        if any(type(q) is not int or not 0 <= q < spec['qubits'] for q in qs) or len(set(qs)) != arity:
            raise ValueError('Invalid qubit indexes')
        if name in ('rx', 'rz'):
            angle = gate.get('angle')
            if type(angle) not in (int, float) or not math.isfinite(angle):
                raise ValueError('Invalid rotation angle')
    return spec


def ensure_local(spec):
    validate(spec)
    if spec['qubits'] > MAX_LOCAL_QUBITS:
        raise ValueError('RESOURCE_LIMIT: both local models are limited to 16 qubits')


def circuit_hash(spec):
    validate(spec)
    # Hash operational fields only; labels cannot change the circuit identity.
    data = {k: spec[k] for k in ('qubits', 'preparation', 'bit_order', 'gates')}
    return hashlib.sha256(json.dumps(data, sort_keys=True, separators=(',', ':')).encode()).hexdigest()


def make_circuit(qubits, cycles=6, seed=52046):
    if type(cycles) is not int or not 1 <= cycles <= 100:
        raise ValueError('cycles must be between one and 100')
    if type(qubits) is not int or not 1 <= qubits <= 1000:
        raise ValueError('Invalid register size')
    # Randomness selects a fixed classical design before any execution.
    rng = random.Random(seed)
    gates = [{'name': 'h', 'qubits': [q]} for q in range(qubits)]
    for cycle in range(cycles):
        for q in range(qubits):
            gates.append({'name': 'rx', 'qubits': [q], 'angle': rng.choice([-1, 1])*math.pi/2})
            gates.append({'name': 'rz', 'qubits': [q], 'angle': rng.choice([-3, -1, 1, 3])*math.pi/4})
        for q in range(cycle % 2, qubits - 1, 2):
            gates.append({'name': 'cz', 'qubits': [q, q+1]})
    return validate({'qubits': qubits, 'preparation': 'zero', 'bit_order': 'q0_lsb',
                     'gates': gates, 'family': 'local_1d_rcs_like_not_Willow', 'design_seed': seed})
