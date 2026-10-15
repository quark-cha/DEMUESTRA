import ast
import contextlib
import hashlib
import io
import json
from pathlib import Path
import shutil
import tempfile
import unittest
from unittest.mock import patch

SOURCE = Path(__file__).resolve().parents[1] / "publica.py"


class RespaldoEvaluacionTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.name = "Proyecto_Prueba"
        self.audit = f"AUDITORIA_{self.name}.json"
        (self.root / self.audit).write_text('{"version":"actual"}', encoding="utf-8")
        previous = self.root / "anterior"
        previous.mkdir()
        (previous / self.audit).write_text('{"version":"previa"}', encoding="utf-8")
        for name in (".anterior_nuevo", ".anterior_descartado"):
            directory = self.root / name
            directory.mkdir()
            (directory / "evidencia.txt").write_text("conservar", encoding="utf-8")
        tree = ast.parse(SOURCE.read_text(encoding="utf-8"))
        functions = [node for node in tree.body if isinstance(node, ast.FunctionDef)
                     and node.name in {"guardar_evaluacion_anterior", "_reemplazar_directorio_con_reintentos"}]
        from datetime import datetime, timezone
        namespace = {
            "_proyecto_dir": lambda name: self.root,
            "_rutas_estado_evaluacion": lambda root, name: [Path(self.audit)],
            "_sha256_archivo": lambda path: hashlib.sha256(path.read_bytes()).hexdigest(),
            "_metricas_evaluacion": lambda root, name: {},
            "_adec_compatibilizar": lambda *args: None,
            "shutil": shutil, "json": json, "datetime": datetime, "timezone": timezone,
        }
        exec(compile(ast.Module(body=functions, type_ignores=[]), str(SOURCE), "exec"), namespace)
        self.save = namespace["guardar_evaluacion_anterior"]

    def assert_legacy_preserved(self):
        for name in (".anterior_nuevo", ".anterior_descartado"):
            self.assertEqual((self.root / name / "evidencia.txt").read_text(encoding="utf-8"), "conservar")

    def test_normal_rotation_and_stale_backups_preserved(self):
        self.assertTrue(self.save(self.name))
        self.assertEqual((self.root / "anterior" / self.audit).read_bytes(), (self.root / self.audit).read_bytes())
        self.assert_legacy_preserved()

    def test_temporary_windows_permission_error_is_retried(self):
        original = Path.replace
        failed = []

        def replace(path, target):
            if path.name.startswith(".anterior_nuevo_") and not failed:
                failed.append(True)
                raise PermissionError("WinError 5 simulado")
            return original(path, target)

        with patch.object(Path, "replace", replace), patch("time.sleep"):
            self.assertTrue(self.save(self.name))
        self.assertEqual(failed, [True])
        self.assert_legacy_preserved()

    def test_failed_promotion_restores_previous_and_keeps_new_snapshot(self):
        original = Path.replace

        def replace(path, target):
            if path.name.startswith(".anterior_nuevo_"):
                raise PermissionError("Bloqueo persistente")
            return original(path, target)

        with patch.object(Path, "replace", replace), patch("time.sleep"), self.assertRaises(RuntimeError):
            self.save(self.name)
        self.assertEqual(json.loads((self.root / "anterior" / self.audit).read_text())["version"], "previa")
        snapshots = list(self.root.glob(".anterior_nuevo_*"))
        self.assertEqual(len(snapshots), 1)
        self.assertEqual((snapshots[0] / self.audit).read_bytes(), (self.root / self.audit).read_bytes())
        self.assert_legacy_preserved()

    def test_failed_rollback_keeps_both_snapshots(self):
        original = Path.replace

        def replace(path, target):
            if path.name.startswith((".anterior_nuevo_", ".anterior_descartado_")):
                raise PermissionError("Bloqueo persistente")
            return original(path, target)

        with patch.object(Path, "replace", replace), patch("time.sleep"), self.assertRaises(RuntimeError):
            self.save(self.name)
        previous = list(self.root.glob(".anterior_descartado_*"))
        current = list(self.root.glob(".anterior_nuevo_*"))
        self.assertEqual(len(previous), 1)
        self.assertEqual(len(current), 1)
        self.assertEqual(json.loads((previous[0] / self.audit).read_text())["version"], "previa")
        self.assertEqual((current[0] / self.audit).read_bytes(), (self.root / self.audit).read_bytes())
        self.assert_legacy_preserved()

    def test_failed_cleanup_does_not_cancel_saved_snapshot(self):
        with patch.object(shutil, "rmtree", side_effect=PermissionError("Bloqueado")), contextlib.redirect_stdout(io.StringIO()):
            self.assertTrue(self.save(self.name))
        self.assertTrue(list(self.root.glob(".anterior_descartado_*")))
        self.assertEqual((self.root / "anterior" / self.audit).read_bytes(), (self.root / self.audit).read_bytes())
        self.assert_legacy_preserved()


if __name__ == "__main__":
    unittest.main()
