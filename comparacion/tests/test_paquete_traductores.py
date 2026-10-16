import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
PACKAGE = ROOT / 'Proyectos/ES_52/Traductores_V'
FIXTURE = Path(__file__).with_name('realizacion_ensayo_traductor.py')


class PaqueteTests(unittest.TestCase):
    def run_cli(self, root, *args):
        return subprocess.run([sys.executable, '-B', str(root / 'gestor_v.py'), *args],
                              cwd=ROOT, capture_output=True, text=True, timeout=60)

    def test_copied_package_uses_its_own_relative_paths(self):
        with tempfile.TemporaryDirectory(dir=ROOT) as folder:
            target = Path(folder) / 'paquete con espacios'
            shutil.copytree(PACKAGE, target,
                            ignore=shutil.ignore_patterns('*.pdf', '*.html', '__pycache__', 'MaquinasV'))
            listed = self.run_cli(target, 'listar')
            self.assertEqual(listed.returncode, 0, listed.stderr)
            self.assertIn('par_h_cnot', listed.stdout)
            translated = self.run_cli(target, 'traducir', 'par_h_cnot')
            self.assertEqual(translated.returncode, 0, translated.stderr)
            self.assertTrue((target / 'MaquinasV/par_h_cnot/v.cpp').is_file())
            compiled = self.run_cli(target, 'compilar', 'par_h_cnot')
            self.assertEqual(compiled.returncode, 0, compiled.stderr)
            refused = self.run_cli(target, 'ejecutar', 'par_h_cnot')
            self.assertEqual(refused.returncode, 2)
            self.assertIn('--realizacion', refused.stderr)
            measured = self.run_cli(target, 'ejecutar', 'par_h_cnot',
                                    '--realizacion', str(FIXTURE))
            self.assertEqual(measured.returncode, 0, measured.stderr)
            self.assertIn('REALIZACION_NO_VERIFICADA', measured.stdout)
            self.assertIn('"bits": [1, 0]', measured.stdout)

    def test_packaged_sources_match_current_translator_and_controller(self):
        for name in ('traductor_qasm_v.py', 'v_relacional.py', 'operaciones_senales.py',
                     'v1.py', 'v2.py', 'v3.py', 'protocolo_q3.py', 'ejecucion_v.py'):
            self.assertEqual((PACKAGE / name).read_bytes(), (ROOT / 'comparacion' / name).read_bytes())

    def test_listing_and_python_compilation_do_not_require_qiskit(self):
        for arguments in (('listar',), ('compilar', 'par_h_cnot')):
            result = subprocess.run([sys.executable, '-I', '-S', str(PACKAGE / 'gestor_v.py'),
                                     *arguments], cwd=ROOT, capture_output=True, text=True, timeout=20)
            self.assertEqual(result.returncode, 0, result.stderr)

    def test_missing_qiskit_reports_installation_instead_of_traceback(self):
        result = subprocess.run([sys.executable, '-S', str(PACKAGE / 'gestor_v.py'),
                                 'traducir', 'par_h_cnot'], cwd=ROOT,
                                capture_output=True, text=True, timeout=20)
        self.assertEqual(result.returncode, 2)
        self.assertIn('Falta Qiskit', result.stderr)
        self.assertIn('-m pip install -r', result.stderr)
        self.assertNotIn('Traceback', result.stderr)

    def test_all_three_controllers_work_in_isolation_without_q_reference(self):
        # This detector tests the contract only; it does not implement gate dynamics.
        code = '''
import sys
sys.path.insert(0, sys.argv[1])
from v1 import V1
from v2 import V2
from v3 import V3
class Oracle:
    def operaciones_v(self, a, b):
        return (('cnot', a, b),)
class Detector:
    def __init__(self):
        self.calls = []
    def preparar(self, plan):
        self.units = plan.unidades
        self.calls.append('preparar')
    def disparar(self, t0):
        self.calls.append(('disparar', t0))
        return (0,) * self.units
spec = {'qubits': 2, 'preparation': 'zero', 'bit_order': 'q0_lsb',
        'gates': [{'name': 'h', 'qubits': [0]}, {'name': 'cz', 'qubits': [0, 1]}]}
for index in range(3):
    detector = Detector()
    machines = (lambda: V1(realizacion=detector, reloj=lambda: 7),
                lambda: V2(15, realizacion=detector, reloj=lambda: 7),
                lambda: V3(spec, realizacion=detector, reloj=lambda: 7))
    machine = machines[index]()
    machine.execute(Oracle()) if index == 0 else machine.execute()
    assert detector.calls == ['preparar']
    assert all(bit == '@' for bit in machine.estado_observado())
    result = machine.capture_t0()
    assert machine.capture_t0() == result
    assert detector.calls == ['preparar', ('disparar', 7)]
    assert not machine.resources()['tabla_amplitudes']
    assert not machine.resources()['evalua_plan_al_medir']
assert 'qiskit' not in sys.modules
assert 'propuesta_lectura' not in sys.modules
print('V1 V2 V3: contrato portatil comprobado, no equivalencia Q')
'''
        with tempfile.TemporaryDirectory(dir=ROOT) as folder:
            target = Path(folder) / 'V aislada'
            shutil.copytree(PACKAGE, target, ignore=shutil.ignore_patterns('__pycache__'))
            result = subprocess.run([sys.executable, '-I', '-S', '-c', code, str(target)],
                                    cwd=folder, capture_output=True, text=True, timeout=20)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertIn('contrato portatil comprobado', result.stdout)

    def test_ps1_from_different_working_directory(self):
        if os.name != 'nt':
            self.skipTest('Windows launcher')
        command = shutil.which('pwsh') or shutil.which('powershell')
        if not command:
            self.skipTest('PowerShell no disponible')
        result = subprocess.run([command, '-NoProfile', '-File', str(PACKAGE / 'v.ps1'), 'listar'],
                                cwd=ROOT, env={**os.environ, 'V_PYTHON': sys.executable},
                                capture_output=True, text=True, timeout=60)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('par_h_cnot', result.stdout)


if __name__ == '__main__':
    unittest.main()
