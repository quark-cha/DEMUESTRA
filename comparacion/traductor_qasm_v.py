"""OpenQASM 2 wiring -> V source code; no simulation or outcome calculation.

Code: HL3. Author/project: Victor Estrada Diaz, ES_52, UNIHOLOG.
License declaration: https://estradad.es/licencia.php
"""

import argparse
from dataclasses import asdict, dataclass
import hashlib
import json
import math
from pathlib import Path

from qiskit import qasm2


class ErrorTraduccion(ValueError):
    pass


@dataclass(frozen=True)
class PlanV:
    unidades: int
    bits_clasicos: int
    operaciones: tuple
    medidas: tuple
    sha256_qasm: str


DIRECTAS = {'h': 'h', 'x': 'not', 'cx': 'cnot', 'ccx': 'ccx',
            'swap': 'swap', 'cz': 'cz', 'rx': 'rx', 'rz': 'rz',
            'p': 'fase', 'u1': 'fase', 'cp': 'cp', 'cu1': 'cp'}
FASES = {'s': math.pi / 2, 'sdg': -math.pi / 2,
         't': math.pi / 4, 'tdg': -math.pi / 4, 'z': math.pi}
MAX_OPERACIONES = 100000


def traducir(texto):
    """Parse gates and terminal complete measurement, without executing Q or V."""
    try:
        circuito = qasm2.loads(texto, strict=True, include_path=())
    except Exception as error:
        raise ErrorTraduccion(f'OpenQASM 2.0 no valido: {error}') from error
    if not 1 <= circuito.num_qubits <= 1000:
        raise ErrorTraduccion('Se admiten de 1 a 1000 unidades en esta version')
    operaciones, medidas = [], []
    midiendo = False

    def puerta(op, puertos, profundidad=0):
        if profundidad > 32 or len(operaciones) >= MAX_OPERACIONES:
            raise ErrorTraduccion('Limite de expansion del circuito alcanzado')
        if getattr(op, 'condition', None) is not None:
            raise ErrorTraduccion('No se admite control por una lectura intermedia')
        nombre = op.name
        if nombre in DIRECTAS:
            parametros = tuple(float(p) for p in op.params)
            if any(not math.isfinite(p) for p in parametros):
                raise ErrorTraduccion('Parametro de puerta no finito')
            operaciones.append((DIRECTAS[nombre], *puertos, *parametros))
        elif nombre in FASES:
            operaciones.append(('fase', *puertos, FASES[nombre]))
        elif nombre in ('id', 'barrier'):
            return
        elif nombre in ('reset', 'measure', 'if_else'):
            raise ErrorTraduccion(f'{nombre}: no pertenece al protocolo de lectura final unica')
        elif nombre in ('u', 'u2', 'u3', 'y', 'ry'):
            raise ErrorTraduccion(f'{nombre}: traduccion V no definida; no se inventa una equivalencia')
        elif op.definition is not None:
            definition = op.definition
            if float(definition.global_phase) != 0:
                raise ErrorTraduccion(f'{nombre}: no se elimina una fase de su definicion')
            for child in definition.data:
                if child.clbits:
                    raise ErrorTraduccion('La definicion de puerta contiene operaciones clasicas')
                mapped = tuple(puertos[definition.find_bit(q).index] for q in child.qubits)
                puerta(child.operation, mapped, profundidad + 1)
        else:
            raise ErrorTraduccion(f'{nombre}: no hay una regla ejecutable de traduccion V')

    for instruccion in circuito.data:
        op = instruccion.operation
        qs = tuple(circuito.find_bit(q).index for q in instruccion.qubits)
        if op.name == 'measure':
            midiendo = True
            medidas.append((qs[0], circuito.find_bit(instruccion.clbits[0]).index))
        elif op.name == 'barrier':
            continue
        else:
            if midiendo:
                raise ErrorTraduccion('Hay una operacion despues de medir: V exige lectura final conjunta')
            puerta(op, qs)
    if (len(medidas) != circuito.num_qubits or
            {q for q, _ in medidas} != set(range(circuito.num_qubits)) or
            len({c for _, c in medidas}) != len(medidas)):
        raise ErrorTraduccion('Se exige una medida final por unidad, sin reutilizar bits clasicos')
    return PlanV(circuito.num_qubits, circuito.num_clbits, tuple(operaciones),
                 tuple(medidas), hashlib.sha256(texto.encode('utf-8')).hexdigest())


def python_v(plan):
    return f'''# Generated V wiring, not simulated outcomes. Code: HL3.
# Author/project: Victor Estrada Diaz, ES_52. https://estradad.es/licencia.php
from v_relacional import MaquinaVTemporal

OPERACIONES = {plan.operaciones!r}
MEDIDAS = {plan.medidas!r}
BITS_CLASICOS = {plan.bits_clasicos}

def construir(realizacion):
    maquina = MaquinaVTemporal({plan.unidades}, OPERACIONES,
                              inicial=(0,) * {plan.unidades}, realizacion=realizacion)
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
'''


def cpp_v(plan):
    rows = []
    for op in plan.operaciones:
        angle_gate = op[0] in ('fase', 'rx', 'rz', 'cp')
        ports = op[1:-1] if angle_gate else op[1:]
        angle = repr(op[-1]) if angle_gate else '0.0'
        rows.append('        {"' + op[0] + '", {' + ', '.join(map(str, ports)) +
                    '}, ' + angle + ', ' + ('true' if angle_gate else 'false') + '}')
    operations = ',\n'.join(rows)
    mapping = ', '.join('{' + str(q) + ', ' + str(c) + '}' for q, c in plan.medidas)
    return '''// Generated V wiring; code: HL3. No internal outcome register.
// Victor Estrada Diaz, ES_52. https://estradad.es/licencia.php
#pragma once
#include <chrono>
#include <mutex>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>

namespace qasm_v {
struct Operacion {
    std::string nombre;
    std::vector<int> puertos;
    double angulo;
    bool tiene_angulo;
};
struct Plan {
    int unidades;
    std::vector<int> preparacion;
    std::vector<Operacion> operaciones;
};
struct Realizacion {
    virtual ~Realizacion() = default;
    virtual void preparar(const Plan&) = 0;
    virtual std::vector<int> disparar(std::chrono::steady_clock::time_point) = 0;
};
inline Plan plan() {
    return {UNIDADES, std::vector<int>(UNIDADES, 0), {
OPERACIONES
    }};
}
inline std::vector<std::pair<int, int>> medidas() { return {MEDIDAS}; }
class MaquinaV {
    Realizacion& realizacion_;
    std::mutex mutex_;
    bool consumida_ = false;
    bool leida_ = false;
    std::vector<int> salida_; // Only populated by measurement, never before.
    std::chrono::steady_clock::time_point t0_;
public:
    explicit MaquinaV(Realizacion& r) : realizacion_(r) { r.preparar(plan()); }
    MaquinaV(const MaquinaV&) = delete;
    MaquinaV& operator=(const MaquinaV&) = delete;
    std::vector<std::string> estado_observado() {
        std::lock_guard<std::mutex> guard(mutex_);
        if (!leida_) return std::vector<std::string>(UNIDADES, "@");
        std::vector<std::string> out;
        for (int bit : salida_) out.push_back(std::to_string(bit));
        return out;
    }
    std::vector<int> medir() {
        std::lock_guard<std::mutex> guard(mutex_);
        if (leida_) return salida_;
        if (consumida_) throw std::runtime_error("Disparo consumido; no se repite");
        consumida_ = true;
        t0_ = std::chrono::steady_clock::now();
        auto leidos = realizacion_.disparar(t0_);
        if (leidos.size() != UNIDADES) throw std::runtime_error("Lectura incompleta");
        for (int b : leidos)
            if (b != 0 && b != 1) throw std::runtime_error("Lectura no binaria");
        salida_ = std::move(leidos);
        leida_ = true;
        return salida_;
    }
    std::chrono::steady_clock::time_point instante_medida() {
        std::lock_guard<std::mutex> guard(mutex_);
        if (!consumida_) throw std::runtime_error("Todavia no se ha disparado");
        return t0_;
    }
};
} // namespace qasm_v
'''.replace('UNIDADES', str(plan.unidades)).replace('OPERACIONES', operations).replace('MEDIDAS', mapping)


def prolog_v(plan):
    operations = []
    for op in plan.operaciones:
        angle_gate = op[0] in ('fase', 'rx', 'rz', 'cp')
        ports = op[1:-1] if angle_gate else op[1:]
        angle = repr(op[-1]) if angle_gate else 'ninguno'
        operations.append(f"op({op[0]},[{','.join(map(str, ports))}],{angle})")
    mapping = ','.join(f'medida({q},{c})' for q, c in plan.medidas)
    return '''% Generated V wiring; code: HL3. No premeasurement outcome values.
% Victor Estrada Diaz, ES_52. https://estradad.es/licencia.php
:- module(qasm_v, [preparar/0, medir/1, estado_observado/1, plan/1, medidas/1,
                   instante_medida/1]).
:- use_module(library(lists)).
:- dynamic estado/1.
:- multifile realizar_preparacion/1, realizar_disparo/2.
plan(plan(UNIDADES, INICIAL, [OPERACIONES])).
medidas([MEDIDAS]).

preparar :- with_mutex(qasm_v, preparar_unica).
preparar_unica :-
    (estado(_) -> throw(error(permiso(preparacion_consumida), preparar/0)); true),
    assertz(estado(consumida)),
    plan(P),
    (once(realizar_preparacion(P)) -> retractall(estado(_)), assertz(estado(preparada));
     throw(error(realizacion_pendiente, preparar/0))).

medir(Bits) :- with_mutex(qasm_v, medir_unica(Bits)).
medir_unica(Bits) :- estado(leida(_, Bits)), !.
medir_unica(Bits) :-
    (retract(estado(preparada)) -> true;
     throw(error(permiso(no_preparada_o_consumida), medir/1))),
    get_time(T0),
    assertz(estado(disparada(T0))),
    (once(realizar_disparo(T0, Leidos)) -> true;
     throw(error(realizacion_pendiente, medir/1))),
    (is_list(Leidos), length(Leidos, UNIDADES), maplist(bit, Leidos) -> true;
     throw(error(lectura_no_binaria_o_incompleta, medir/1))),
    retractall(estado(_)), assertz(estado(leida(T0, Leidos))), Bits = Leidos.
bit(B) :- integer(B), (B =:= 0 ; B =:= 1).
estado_observado(Bits) :- with_mutex(qasm_v, observar(Bits)).
observar(Bits) :- estado(leida(_, Bits)), !.
observar(Bits) :- length(Bits, UNIDADES), maplist(=('@'), Bits).
instante_medida(T0) :- with_mutex(qasm_v, instante(T0)).
instante(T0) :- estado(leida(T0, _)), !.
instante(T0) :- estado(disparada(T0)), !.
instante(_) :- throw(error(no_medida, instante_medida/1)).
'''.replace('UNIDADES', str(plan.unidades)).replace('INICIAL', '[' + ','.join(['0'] * plan.unidades) + ']') .replace('OPERACIONES', ','.join(operations)).replace('MEDIDAS', mapping)


def generar(plan, destino, nombre='circuito_v'):
    if not nombre.isidentifier() or not nombre.isascii():
        raise ErrorTraduccion('Nombre de salida no valido')
    destino = Path(destino)
    outputs = {'.py': python_v(plan), '.hpp': cpp_v(plan),
               '.cpp': f'// Code: HL3. Generated V wiring.\n#include "{nombre}.hpp"\n',
               '.pl': prolog_v(plan),
               '.json': json.dumps(asdict(plan), indent=2, ensure_ascii=True)}
    paths = [destino / (nombre + extension) for extension in outputs]
    if any(path.exists() for path in paths):
        raise FileExistsError('La salida ya existe; usa otro nombre o directorio')
    destino.mkdir(parents=True, exist_ok=True)
    for path, contents in zip(paths, outputs.values()):
        path.write_text(contents, encoding='utf-8')
    return paths


def main():
    parser = argparse.ArgumentParser(description='OpenQASM 2 -> conexiones V en Python, C++ y Prolog')
    parser.add_argument('entrada', type=Path)
    parser.add_argument('--salida', type=Path, required=True)
    parser.add_argument('--nombre', default='circuito_v')
    args = parser.parse_args()
    try:
        plan = traducir(args.entrada.read_text(encoding='utf-8-sig'))
        for path in generar(plan, args.salida, args.nombre):
            print(path)
    except (ValueError, OSError) as error:
        parser.exit(2, f'Traduccion detenida: {error}\n')


if __name__ == '__main__':
    main()
