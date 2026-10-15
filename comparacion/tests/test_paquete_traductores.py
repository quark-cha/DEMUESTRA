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
        for name in ('traductor_qasm_v.py', 'v_relacional.py', 'operaciones_senales.py'):
            self.assertEqual((PACKAGE / name).read_bytes(), (ROOT / 'comparacion' / name).read_bytes())

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
