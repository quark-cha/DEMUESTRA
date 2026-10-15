"""Experimental numerical readout by streamed paths, not physical V hardware.

Only fixed-size gate matrices come from Qiskit. No Statevector, complete
distribution or joint amplitude array is used by this proposal.
"""

import math
import secrets

from qiskit.circuit.library import HGate, PhaseGate, RXGate, RZGate

from v_relacional import ReglaVPendiente


class LimiteCalculoPropuesto(ReglaVPendiente):
    estado = 'LIMITE_PROPUESTA'


def _compilar(plan):
    if plan.orden_bits != 'q0_lsb' or any(type(v) is not int or v not in (0, 1)
                                          for v in plan.inicial):
        raise ValueError('La propuesta requiere preparacion binaria declarada y q0_lsb')
    gates = []
    masks = [0]
    factories = {'h': HGate, 'fase': PhaseGate, 'rx': RXGate, 'rz': RZGate}
    for operation in plan.operaciones:
        name, *args = operation
        changed = 0
        if name in factories:
            gate = factories[name]() if name == 'h' else factories[name](args[1])
            matrix = tuple(tuple(complex(v) for v in row) for row in gate.to_matrix())
            gates.append(('local', args[0], matrix))
            if name in ('h', 'rx'):
                changed = 1 << args[0]
        elif name in ('not', 'cnot', 'xor', 'swap', 'ccx', 'toffoli'):
            gates.append(tuple(operation))
            targets = args if name == 'swap' else (args[-1],)
            changed = sum(1 << target for target in targets)
        elif name in ('cz', 'cp'):
            factor = -1 + 0j if name == 'cz' else complex(math.cos(args[2]), math.sin(args[2]))
            gates.append(('control_fase', args[0], args[1], factor))
        elif name == 'multiplicacion_modular_controlada':
            control, work, multiplier, modulus = args
            inverse = pow(multiplier, -1, modulus)
            gates.append(('modular', control, work, inverse, modulus))
            if multiplier != 1:
                changed = sum(1 << target for target in work)
        else:
            raise ValueError(f'{name}: la propuesta solo admite bloques unitarios declarados')
        masks.append(masks[-1] | changed)
    return tuple(gates), tuple(masks)


class _Evaluador:
    def __init__(self, plan, compiled, max_visitas):
        self.gates, self.masks = compiled
        self.initial = sum(value << bit for bit, value in enumerate(plan.inicial))
        self.max_visitas = max_visitas
        self.visitas = 0
        self.max_pila = 0
        self.consultas = 0

    def amplitud(self, output):
        self.consultas += 1
        stack = [(len(self.gates), output, 1 + 0j)]
        total, correction = 0j, 0j
        while stack:
            self.max_pila = max(self.max_pila, len(stack))
            index, word, coefficient = stack.pop()
            while True:
                self.visitas += 1
                if self.visitas > self.max_visitas:
                    raise LimiteCalculoPropuesto('Limite de visitas alcanzado; no se inventa una salida')
                # Earlier diagonal gates cannot change these basis bits.
                if (word ^ self.initial) & ~self.masks[index]:
                    break
                if index == 0:
                    adjusted = coefficient - correction
                    updated = total + adjusted
                    correction = (updated - total) - adjusted
                    total = updated
                    break
                index -= 1
                name, *args = self.gates[index]
                if name == 'local':
                    target, matrix = args
                    out_bit = (word >> target) & 1
                    for in_bit in (0, 1):
                        entry = matrix[out_bit][in_bit]
                        if entry != 0:
                            previous = (word & ~(1 << target)) | (in_bit << target)
                            stack.append((index, previous, coefficient * entry))
                    break
                if name == 'not':
                    word ^= 1 << args[0]
                elif name in ('cnot', 'xor'):
                    if (word >> args[0]) & 1:
                        word ^= 1 << args[1]
                elif name in ('ccx', 'toffoli'):
                    if ((word >> args[0]) & 1) and ((word >> args[1]) & 1):
                        word ^= 1 << args[2]
                elif name == 'swap':
                    a, b = args
                    if ((word >> a) ^ (word >> b)) & 1:
                        word ^= (1 << a) | (1 << b)
                elif name == 'control_fase':
                    a, b, factor = args
                    if ((word >> a) & 1) and ((word >> b) & 1):
                        coefficient *= factor
                elif name == 'modular':
                    control, ports, inverse, modulus = args
                    if (word >> control) & 1:
                        work = sum(((word >> port) & 1) << bit for bit, port in enumerate(ports))
                        if work < modulus:
                            previous = inverse * work % modulus
                            for bit, port in enumerate(ports):
                                word = (word & ~(1 << port)) | (((previous >> bit) & 1) << port)
        return total


def amplitud_diagnostico(plan, output, max_visitas=10_000_000):
    """Independent mathematical test, not a pre-t0 device readout API."""
    if type(output) is not int or not 0 <= output < (1 << plan.unidades):
        raise ValueError('Indice de salida invalido')
    return _Evaluador(plan, _compilar(plan), max_visitas).amplitud(output)


class PropuestaLecturaPorCaminos:
    """Opt-in model: one final threshold, streamed normalization, finite budget."""

    def __init__(self, fuente_umbral=None, max_visitas=80_000_000):
        if type(max_visitas) is not int or max_visitas < 1:
            raise ValueError('El limite de visitas debe ser positivo')
        if fuente_umbral is not None and not callable(fuente_umbral):
            raise ValueError('La referencia de medida debe ser invocable')
        self._source = fuente_umbral
        self._limit = max_visitas
        self._plan = None
        self._used = False
        self._audit = None

    def preparar(self, plan):
        if self._plan is not None or self._used:
            raise RuntimeError('Solo una preparacion por realizacion')
        compiled = _compilar(plan)
        self._plan, self._compiled = plan, compiled

    def medir(self, t0):
        if type(t0) not in (int, float) or not math.isfinite(t0) or t0 < 0:
            raise ValueError('t0 debe ser finito y no negativo')
        if self._used or self._plan is None:
            raise RuntimeError('Se requiere una preparacion nueva para medir')
        self._used = True
        reference = secrets.randbits(53) / (1 << 53) if self._source is None else self._source(t0)
        if type(reference) not in (int, float) or not math.isfinite(reference) or not 0 <= reference < 1:
            raise ValueError('La referencia final debe pertenecer a [0,1)')
        evaluator = _Evaluador(self._plan, self._compiled, self._limit)
        mass, correction = 0., 0.
        selected = None
        try:
            # Two streaming passes: validate normalization, then select one word.
            # Neither pass retains a probability/amplitude table.
            for output in range(1 << self._plan.unidades):
                amplitude = evaluator.amplitud(output)
                probability = amplitude.real**2 + amplitude.imag**2
                adjusted = probability - correction
                updated = mass + adjusted
                correction = (updated - mass) - adjusted
                mass = updated
            if not math.isfinite(mass) or not math.isclose(mass, 1., rel_tol=1e-9, abs_tol=1e-12):
                raise ArithmeticError('La masa calculada no esta normalizada; no se emite un bit')
            threshold = reference * mass
            cumulative, correction = 0., 0.
            for output in range(1 << self._plan.unidades):
                amplitude = evaluator.amplitud(output)
                probability = amplitude.real**2 + amplitude.imag**2
                adjusted = probability - correction
                updated = cumulative + adjusted
                correction = (updated - cumulative) - adjusted
                cumulative = updated
                if threshold < cumulative:
                    selected = output
                    break
            if selected is None:
                raise ArithmeticError('No se ha localizado un intervalo de medida')
            return tuple((selected >> bit) & 1 for bit in range(self._plan.unidades))
        finally:
            self._audit = {'tipo': 'PROPUESTA_NUMERICA_POR_CAMINOS',
                           'realizacion_fisica': False, 'tabla_amplitudes': False,
                           'tabla_probabilidades': False, 'visitas': evaluator.visitas,
                           'max_pila': evaluator.max_pila, 'consultas_salida': evaluator.consultas,
                           'masa_total': mass, 'umbral_final': reference,
                           'salida_registrada': selected is not None,
                           'limite_visitas': self._limit, 'tiempo_puede_ser_exponencial': True}

    def auditoria(self):
        if self._audit is None:
            raise RuntimeError('La auditoria se consulta despues de la medida')
        return dict(self._audit)


def crear_propuesta():
    return PropuestaLecturaPorCaminos()
