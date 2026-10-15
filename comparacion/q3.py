"""Independent local ideal Q3 reference through native Qiskit gates."""

from qiskit import QuantumCircuit
from qiskit.quantum_info import Statevector

from protocolo_q3 import ensure_local


def probabilities(spec):
    ensure_local(spec)
    circuit = QuantumCircuit(spec['qubits'])
    for gate in spec['gates']:
        name, qs = gate['name'], gate['qubits']
        if name == 'h':
            circuit.h(qs[0])
        elif name == 'rx':
            circuit.rx(gate['angle'], qs[0])
        elif name == 'rz':
            circuit.rz(gate['angle'], qs[0])
        else:
            circuit.cz(*qs)
    return Statevector.from_instruction(circuit).probabilities()
