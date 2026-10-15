"""Deferred Boolean relations and one joint readout, not a quantum certificate."""

import math
import threading
import time
from dataclasses import dataclass
from operaciones_senales import compilar_bloque


class ReglaVPendiente(RuntimeError):
    """A protocol operation has no executable relational V rule yet."""


@dataclass(frozen=True)
class PreparacionV:
    """Connections and declared preparation, not measured internal values."""

    unidades: int
    inicial: tuple
    operaciones: tuple
    orden_bits: str = 'q0_lsb'


class MaquinaRelacional:
    """Store a linear-size wiring description, never a joint amplitude table.

    Source callables implement f(t0). They are not called before measurement.
    This enforces an interface protocol, not physical secrecy against inspection.
    """

    def __init__(self, unidades, operaciones, generadores=None, *,
                 inicial=None, realizacion=None):
        if type(unidades) is not int or unidades < 1:
            raise ValueError('El numero de unidades debe ser positivo')
        self._unidades = unidades
        initial = (None,) * unidades if inicial is None else tuple(inicial)
        if len(initial) != unidades or any(v is not None and
                (type(v) is not int or v not in (0, 1)) for v in initial):
            raise ValueError('La preparacion declara 0, 1 o None por unidad')
        if realizacion is not None:
            if generadores is not None:
                raise ValueError('No se mezclan generadores binarios y lectura conjunta de senales')
            measure = 'disparar' if getattr(self, 'medida_por_disparo', False) else 'medir'
            if not all(callable(getattr(realizacion, name, None))
                       for name in ('preparar', measure)):
                raise ValueError(f'La realizacion debe implementar preparar(plan) y {measure}(t0)')
        self._inicial = initial
        self._realizacion = realizacion
        self._operaciones = tuple(operaciones)
        self._generadores = None if generadores is None else tuple(generadores)
        if self._generadores is not None:
            if len(self._generadores) != unidades or not all(callable(f) for f in self._generadores):
                raise ValueError('Se requiere una funcion f(t0) por generador')
        self._nodos = None
        self._puertos = None
        self._resultado = None
        self._t0 = None
        self._consumida = False
        self._bloques_senales = ()
        self._plan_ejecucion = ()

    def execute(self):
        if self._nodos is not None or self._consumida:
            raise RuntimeError('Solo una ejecucion por preparacion')
        nodes = [('generador', i) for i in range(self._unidades)]
        ports = list(range(self._unidades))
        blocks = []
        plan = []
        for operation in self._operaciones:
            name, *indexes = operation
            if name in ('h', 'fase', 'rx', 'rz', 'cz', 'cp', 'fourier_inversa'):
                compiled = compilar_bloque(operation, self._unidades)
                blocks.extend(compiled)
                plan.extend((b.nombre, *b.puertos) if b.angulo is None else
                            (b.nombre, *b.puertos, b.angulo) for b in compiled)
                continue
            if name == 'multiplicacion_modular_controlada':
                if len(indexes) != 4:
                    raise ValueError('Se requieren control, puertos de trabajo, multiplicador y modulo')
                control, work, multiplier, modulus = indexes
                work = tuple(work)
                if (type(control) is not int or not 0 <= control < self._unidades or
                        not work or len(set(work)) != len(work) or control in work or
                        any(type(i) is not int or not 0 <= i < self._unidades for i in work)):
                    raise ValueError('Puertos modulares invalidos')
                if (type(modulus) is not int or not 2 <= modulus <= 1 << len(work) or
                        type(multiplier) is not int or not 1 <= multiplier < modulus or
                        math.gcd(multiplier, modulus) != 1):
                    raise ValueError('Se requiere un multiplicador coprimo al modulo')
                nodes.append(('modular', ports[control], tuple(ports[i] for i in work),
                              multiplier, modulus))
                group = len(nodes) - 1
                for bit, port in enumerate(work):
                    nodes.append(('bit', group, bit))
                    ports[port] = len(nodes) - 1
                plan.append((name, control, work, multiplier, modulus))
                continue
            if name not in ('not', 'xor', 'and', 'cnot', 'swap', 'ccx', 'toffoli'):
                raise ReglaVPendiente(
                    f'{name}: falta vincular la regla del MD a los generadores relacionales; '
                    'no se sustituye por amplitudes ni por un sorteo')
            arity = 1 if name == 'not' else 3 if name in ('ccx', 'toffoli') else 2
            if len(indexes) != arity or any(type(i) is not int or not 0 <= i < self._unidades for i in indexes):
                raise ValueError('Puertos invalidos')
            if len(set(indexes)) != arity:
                raise ValueError('Los puertos deben ser distintos')
            plan.append(tuple(operation))
            if name == 'swap':
                a, b = indexes
                ports[a], ports[b] = ports[b], ports[a]
            elif name == 'not':
                index = indexes[0]
                nodes.append(('not', ports[index]))
                ports[index] = len(nodes) - 1
            elif name in ('ccx', 'toffoli'):
                a, b, target = indexes
                nodes.append(('and', ports[a], ports[b]))
                conjunction = len(nodes) - 1
                nodes.append(('xor', ports[target], conjunction))
                ports[target] = len(nodes) - 1
            else:
                a, b = indexes
                nodes.append(('xor' if name == 'cnot' else name, ports[a], ports[b]))
                ports[b] = len(nodes) - 1
        self._nodos, self._puertos = nodes, ports
        self._bloques_senales = tuple(blocks)
        self._plan_ejecucion = tuple(plan)
        if self._realizacion is not None:
            try:
                if self._realizacion.preparar(self.preparacion()) is not None:
                    raise ValueError('La preparacion no debe devolver resultados antes de t0')
            except Exception:
                self._consumida = True
                raise

    def preparacion(self):
        if self._nodos is None:
            raise RuntimeError('Prepara el circuito antes de consultar sus conexiones')
        return PreparacionV(self._unidades, self._inicial, self._plan_ejecucion)

    def operaciones_preparadas(self):
        if self._nodos is None:
            raise RuntimeError('Prepara el circuito antes de consultar sus conexiones')
        return self._plan_ejecucion

    def capture_t0(self, t0_ticks=0):
        if type(t0_ticks) not in (int, float) or not math.isfinite(t0_ticks) or t0_ticks < 0:
            raise ValueError('t0 debe ser finito y no negativo')
        if self._resultado is not None:
            if t0_ticks != self._t0:
                raise RuntimeError('La ejecucion ya termino en su t0; no hay otra medida')
            return self._resultado
        if self._consumida:
            raise RuntimeError('La medida anterior fallo; no se repite esa ejecucion')
        if self._nodos is None:
            raise RuntimeError('Prepara las relaciones antes de medir')
        if self._realizacion is not None:
            self._consumida = True
            self._t0 = t0_ticks
            measure = self._realizacion.disparar if getattr(self, 'medida_por_disparo', False) else self._realizacion.medir
            result = tuple(measure(t0_ticks))
            if len(result) != self._unidades or any(type(v) is not int or v not in (0, 1)
                                                   for v in result):
                raise ValueError('La medida conjunta debe registrar un bit por unidad')
            self._resultado = result
            return result
        if self._bloques_senales:
            raise ReglaVPendiente(
                'Los bloques deterministas estan definidos; falta su realizacion '
                'conjunta sobre los generadores y la lectura de ese sistema. '
                'No se sustituyen por transformaciones de bits ya medidos')
        if self._generadores is None:
            raise ReglaVPendiente('Falta la realizacion f(t0) de los generadores; no se inventa')
        self._consumida = True
        self._t0 = t0_ticks
        sources, self._generadores = self._generadores, None
        values = []
        for node in self._nodos:
            name, *arguments = node
            if name == 'generador':
                value = sources[arguments[0]](t0_ticks)
                if type(value) is not int or value not in (0, 1):
                    raise ValueError('La lectura de cada generador debe registrar 0 o 1')
            elif name == 'not':
                value = 1 - values[arguments[0]]
            elif name == 'xor':
                value = values[arguments[0]] ^ values[arguments[1]]
            elif name == 'modular':
                control, work, multiplier, modulus = arguments
                word = sum(values[index] << bit for bit, index in enumerate(work))
                value = multiplier * word % modulus if values[control] and word < modulus else word
            elif name == 'bit':
                value = (values[arguments[0]] >> arguments[1]) & 1
            else:
                value = values[arguments[0]] & values[arguments[1]]
            values.append(value)
        self._resultado = tuple(values[i] for i in self._puertos)
        return self._resultado

    def read(self):
        if self._resultado is None:
            raise RuntimeError('Lectura bloqueada antes de t0')
        return self._resultado

    def estado_observado(self):
        return tuple('@' for _ in range(self._unidades)) if self._resultado is None else self._resultado

    def resources(self):
        return {'generadores': self._unidades,
                'operaciones_declaradas': len(self._operaciones),
                'tabla_amplitudes': False, 'distribucion_calculada': False,
                'bloques_senales_definidos': len(self._bloques_senales),
                'realizacion_conectada': self._realizacion is not None,
                'recursos_realizacion_verificados': False,
                'alcance_recursos': 'nucleo de conexiones; no incluye la realizacion externa',
                'alcance': 'conexiones y protocolo de medida; realizacion externa no certificada'}

    def auditoria_realizacion(self):
        if not self._consumida or self._t0 is None:
            raise RuntimeError('La auditoria de medida se consulta despues de t0')
        method = getattr(self._realizacion, 'auditoria', None)
        return method() if callable(method) else {'tipo': 'REALIZACION_SIN_AUDITORIA_DECLARADA'}


class MaquinaVTemporal(MaquinaRelacional):
    """The measured t0 is the trigger event, not a supplied numerical label.

    The connected realization prepares/evolves its circuit and implements
    disparar(t0). This controller does not compute its output from the plan.
    """

    medida_por_disparo = True

    def __init__(self, *args, reloj=None, **kwargs):
        if kwargs.get('generadores') is not None or (len(args) > 2 and args[2] is not None):
            raise ValueError('V requiere un disparo conjunto, no evaluar generadores binarios al medir')
        if reloj is not None and not callable(reloj):
            raise ValueError('El reloj de disparo debe ser invocable')
        self._reloj = time.monotonic if reloj is None else reloj
        self._medida_lock = threading.Lock()
        super().__init__(*args, **kwargs)

    def capture_t0(self, t0_ticks=None):
        if t0_ticks is not None:
            raise ValueError('En V, t0 se registra al disparar; no se acepta una etiqueta temporal inventada')
        with self._medida_lock:
            if self._resultado is not None:
                return self._resultado
            if self._consumida:
                raise RuntimeError('El disparo anterior fallo; no se repite esa preparacion')
            if self._nodos is None:
                raise RuntimeError('Prepara V antes de desencadenar la medida')
            if self._realizacion is None:
                raise ReglaVPendiente('Falta conectar la realizacion V que responde al disparo en t=t0')
            return super().capture_t0(self._reloj())

    def instante_medida(self):
        if self._t0 is None:
            raise RuntimeError('Todavia no se ha desencadenado la medida')
        return self._t0

    def resources(self):
        result = super().resources()
        result.update({'medida_por_disparo': True, 't0_registrado': self._t0,
                       'reloj': 'monotonic' if self._reloj is time.monotonic else 'reloj_inyectado_de_ensayo',
                       'evalua_plan_al_medir': False,
                       'alcance': 'control temporal y conexiones; dinamica de la realizacion externa no verificada'})
        return result


class V1Relacional(MaquinaVTemporal):
    def __init__(self, phase_ticks=None, generadores=None, *, realizacion=None, reloj=None):
        if phase_ticks is not None:
            raise ReglaVPendiente('phase_ticks del antiguo banco no define los generadores V')
        super().__init__(2, [('h', 0), ('h', 1), ('oraculo', 0, 1), ('h', 0)],
                         generadores, inicial=(0, 1), realizacion=realizacion, reloj=reloj)

    def execute(self, oracle=None):
        if self._nodos is not None or self._consumida:
            raise RuntimeError('Solo una ejecucion por preparacion')
        if oracle is None or not callable(getattr(oracle, 'operaciones_v', None)):
            raise ReglaVPendiente('Se requiere el bloque reversible del oraculo')
        wiring = tuple(oracle.operaciones_v(0, 1))
        if any(op[0] not in ('not', 'cnot') for op in wiring):
            raise ValueError('El oraculo binario requiere conexiones NOT y CNOT')
        self._operaciones = (('h', 0), ('h', 1), *wiring, ('h', 0))
        return super().execute()


class V2Relacional(MaquinaVTemporal):
    def __init__(self, n, a=2, phase_ticks=None, generadores=None, *, realizacion=None, reloj=None):
        if type(n) is not int or n < 3 or type(a) is not int or not 1 < a < n or math.gcd(a, n) != 1:
            raise ValueError('N y base coprima invalidos')
        if phase_ticks is not None:
            raise ReglaVPendiente('phase_ticks del antiguo banco no define los generadores V')
        bits = n.bit_length()
        operations = [('h', i) for i in range(bits, 3 * bits)]
        multiplier = a
        for i in range(bits, 3 * bits):
            operations.append(('multiplicacion_modular_controlada', i,
                               tuple(range(bits)), multiplier, n))
            multiplier = multiplier * multiplier % n
        operations.append(('fourier_inversa', *range(bits, 3 * bits)))
        super().__init__(3 * bits, operations, generadores,
                         inicial=(1,) + (0,) * (3 * bits - 1), realizacion=realizacion, reloj=reloj)

    def valor_control(self):
        result = self.read()
        bits = self._unidades // 3
        return sum(value << i for i, value in enumerate(result[bits:]))


class V3Relacional(MaquinaVTemporal):
    def __init__(self, spec, phase_ticks=None, generadores=None, *, realizacion=None, reloj=None):
        from protocolo_q3 import validate
        validate(spec)
        if phase_ticks is not None:
            raise ReglaVPendiente('phase_ticks del antiguo banco no define los generadores V')
        operations = []
        for gate in spec['gates']:
            operation = (gate['name'], *gate['qubits'])
            if 'angle' in gate:
                operation += (gate['angle'],)
            operations.append(operation)
        super().__init__(spec['qubits'], operations, generadores,
                         inicial=(0,) * spec['qubits'], realizacion=realizacion, reloj=reloj)
