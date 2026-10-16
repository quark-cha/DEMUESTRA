"""Portable QASM-to-V toolchain. Code: HL3; Victor Estrada Diaz, ES_52."""

import argparse
import importlib.util
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parent


def ejecutable(nombre):
    configured = os.environ.get('V_' + nombre.upper())
    found = configured or (next((p for n in ('c++', 'g++', 'clang++')
                                if (p := shutil.which(n))), None)
                           if nombre == 'cxx' else shutil.which(nombre))
    if not found and nombre == 'swipl':
        candidate = Path(os.environ.get('ProgramFiles', 'C:/Program Files')) / 'swipl/bin/swipl.exe'
        if candidate.is_file():
            found = str(candidate)
    if not found:
        raise RuntimeError(f'Falta {nombre}; instala la herramienta o configura V_{nombre.upper()}')
    return found


def cargar(path, nombre):
    spec = importlib.util.spec_from_file_location(nombre, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f'No se puede cargar {path}')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def correr(args):
    subprocess.run(args, check=True, cwd=ROOT, timeout=120)


def cita_prolog(path):
    return "'" + str(Path(path).resolve()).replace('\\', '/').replace("'", "''") + "'"


def salida_de(maquina):
    path = ROOT / 'MaquinasV' / maquina
    if not path.is_dir() or not (path / 'v.json').is_file():
        raise RuntimeError('Primero traduce la maquina seleccionada')
    return path


def compilar(path, lenguaje):
    if lenguaje == 'python':
        compile((path / 'v.py').read_text(encoding='utf-8'), str(path / 'v.py'), 'exec')
    elif lenguaje == 'prolog':
        correr([ejecutable('swipl'), '-q', '-s', str(path / 'v.pl'), '-g', 'halt', '-t', 'halt(1)'])
    else:
        correr([ejecutable('cxx'), '-std=c++17', '-fsyntax-only', str(path / 'v.cpp')])
    print(f'{lenguaje}: sintaxis comprobada; no se ha ejecutado una maquina V')


def ejecutar(path, lenguaje, realization):
    if not realization.is_file():
        raise RuntimeError('La realizacion indicada no existe')
    if lenguaje == 'python':
        translated = cargar(path / 'v.py', 'programa_v')
        provider = cargar(realization, 'realizacion_v')
        factory = getattr(provider, 'crear_realizacion', None)
        if not callable(factory):
            raise RuntimeError('La realizacion Python debe definir crear_realizacion()')
        machine = translated.construir(factory())
        print(json.dumps({'estado': 'REALIZACION_NO_VERIFICADA',
                          'bits': translated.medir(machine),
                          't0': machine.instante_medida(),
                          'salida_clasica': translated.salida_clasica(machine)}))
    elif lenguaje == 'prolog':
        goal = (f"consult({cita_prolog(realization)}),use_module(library(http/json)),"
                "qasm_v:preparar,qasm_v:medir(B),qasm_v:instante_medida(T),"
                "json_write_dict(current_output,_{estado:'REALIZACION_NO_VERIFICADA',bits:B,t0:T}),nl,halt")
        correr([ejecutable('swipl'), '-q', '-s', str(path / 'v.pl'), '-g', goal, '-t', 'halt(1)'])
    else:
        # Only the provided device backend supplies the gate dynamics/readout.
        driver = path / 'ejecutar_v.cpp'
        driver.write_text('''#include "v.hpp"
#include <iostream>
#include <memory>
std::unique_ptr<qasm_v::Realizacion> crear_realizacion();
int main() {
    try {
        auto r = crear_realizacion();
        if (!r) throw std::runtime_error("Realizacion ausente");
        qasm_v::MaquinaV v(*r);
        const auto bits = v.medir();
        std::cout << "REALIZACION_NO_VERIFICADA bits:";
        for (int b : bits) std::cout << ' ' << b;
        std::cout << '\\n';
    } catch (const std::exception& e) {
        std::cerr << e.what() << '\\n'; return 1;
    }
}
''', encoding='utf-8')
        binary = path / ('ejecutar_v.exe' if os.name == 'nt' else 'ejecutar_v')
        correr([ejecutable('cxx'), '-std=c++17', '-pthread', '-I', str(path),
                str(driver), str(realization), '-o', str(binary)])
        correr([str(binary)])


def main():
    parser = argparse.ArgumentParser(description='Traductores y compiladores de V')
    parser.add_argument('accion', choices=('listar', 'traducir', 'compilar', 'ejecutar'))
    parser.add_argument('maquina', nargs='?')
    parser.add_argument('--lenguaje', choices=('python', 'prolog', 'cpp'), default='python')
    parser.add_argument('--realizacion', type=Path)
    args = parser.parse_args()
    try:
        if args.accion == 'listar':
            for entry in sorted((ROOT / 'MaquinasQ').glob('*.q')):
                print(entry.stem)
            return
        if not args.maquina or not args.maquina.isidentifier() or not args.maquina.isascii():
            raise ValueError('Indica el nombre de una maquina de MaquinasQ, sin extension')
        if args.accion == 'traducir':
            try:
                from traductor_qasm_v import generar, traducir
            except ModuleNotFoundError as error:
                if error.name != 'qiskit':
                    raise
                raise RuntimeError(
                    'Falta Qiskit para leer OpenQASM 2. Instala con el mismo Python: '
                    f'"{sys.executable}" -m pip install -r "{ROOT / "requirements.txt"}". '
                    'Qiskit se usa como analizador, no como motor de V.') from error
            source = ROOT / 'MaquinasQ' / (args.maquina + '.q')
            plan = traducir(source.read_text(encoding='utf-8-sig'))
            for output in generar(plan, ROOT / 'MaquinasV' / args.maquina, nombre='v'):
                print(output.relative_to(ROOT))
        elif args.accion == 'compilar':
            compilar(salida_de(args.maquina), args.lenguaje)
        else:
            if args.realizacion is None:
                raise RuntimeError('Ejecutar requiere --realizacion; no se inventa una salida')
            ejecutar(salida_de(args.maquina), args.lenguaje, args.realizacion.resolve())
    except (OSError, ValueError, RuntimeError, subprocess.SubprocessError) as error:
        parser.exit(2, f'Operacion detenida: {error}\n')


if __name__ == '__main__':
    main()
