# Generated V wiring, not simulated outcomes. Code: HL3.
# Author/project: Victor Estrada Diaz, ES_52. https://estradad.es/licencia.php
from v_relacional import MaquinaVTemporal

OPERACIONES = (('h', 0), ('cnot', 0, 1))
MEDIDAS = ((0, 0), (1, 1))
BITS_CLASICOS = 2

def construir(realizacion):
    maquina = MaquinaVTemporal(2, OPERACIONES,
                              inicial=(0,) * 2, realizacion=realizacion)
    maquina.execute()
    return maquina

def medir(maquina):
    # The machine registers t0 itself; no supplied time or computed answer.
    return maquina.capture_t0()

def salida_clasica(maquina):
    # Mapping already measured bits is not circuit evaluation.
    leidos = maquina.read()
    salida = [None] * BITS_CLASICOS
    for unidad, bit in MEDIDAS:
        salida[bit] = leidos[unidad]
    return tuple(salida)
