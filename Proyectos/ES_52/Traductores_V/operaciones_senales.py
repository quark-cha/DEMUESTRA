"""Deterministic signal transformations; no state or probability register."""

import cmath
from dataclasses import dataclass
import math


@dataclass(frozen=True)
class Bloque:
    nombre: str
    puertos: tuple
    angulo: float | None = None

    def transformar_par(self, s0, s1):
        """The two-path formulas of ES_52, independent of any readout."""
        if self.nombre == 'h':
            scale = math.sqrt(.5)
            return (s0 + s1) * scale, (s0 - s1) * scale
        if self.nombre == 'fase':
            return s0, cmath.exp(1j * self.angulo) * s1
        if self.nombre == 'rx':
            c, s = math.cos(self.angulo / 2), math.sin(self.angulo / 2)
            return c*s0 - 1j*s*s1, -1j*s*s0 + c*s1
        if self.nombre == 'rz':
            return cmath.exp(-.5j*self.angulo)*s0, cmath.exp(.5j*self.angulo)*s1
        raise ValueError('Este bloque no es una transformacion de dos caminos')


def fourier_inversa(puertos):
    """Inverse Fourier wiring as H, controlled phase and SWAP: quadratic size."""
    ports = tuple(puertos)
    if not ports or len(set(ports)) != len(ports):
        raise ValueError('Los puertos de Fourier deben ser distintos y no vacios')
    forward = []
    for j in range(len(ports)-1, -1, -1):
        forward.append(Bloque('h', (ports[j],)))
        for k in range(j-1, -1, -1):
            forward.append(Bloque('cp', (ports[j], ports[k]), math.ldexp(math.pi, k-j)))
    for j in range(len(ports)//2):
        forward.append(Bloque('swap', (ports[j], ports[-j-1])))
    return tuple(Bloque(block.nombre, block.puertos,
                        None if block.angulo is None else -block.angulo)
                 for block in reversed(forward))


def compilar_bloque(operation, unidades):
    name, *arguments = operation
    if name == 'fourier_inversa':
        if any(type(i) is not int or not 0 <= i < unidades for i in arguments):
            raise ValueError('Puertos de Fourier invalidos')
        return fourier_inversa(arguments)
    angle = None
    if name in ('rx', 'rz', 'fase', 'cp'):
        if not arguments:
            raise ValueError('Falta el angulo definido por el protocolo')
        angle = arguments.pop()
        if type(angle) not in (int, float) or not math.isfinite(angle):
            raise ValueError('El angulo debe ser finito')
    arity = 2 if name in ('cz', 'cp') else 1
    if name not in ('h', 'fase', 'rx', 'rz', 'cz', 'cp'):
        raise ValueError('Bloque de senales no definido')
    if len(arguments) != arity or any(type(i) is not int or not 0 <= i < unidades for i in arguments):
        raise ValueError('Puertos invalidos')
    if len(set(arguments)) != len(arguments):
        raise ValueError('Los puertos deben ser distintos')
    return (Bloque(name, tuple(arguments), angle),)
