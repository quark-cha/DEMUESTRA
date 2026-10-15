import io
import logging
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
from PckDemuestra.salida_archivos import enlace_archivo, FormatoConArchivos


class SalidaArchivosTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(dir=ROOT)
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)

    def archivo(self, nombre):
        archivo = self.root / nombre
        archivo.parent.mkdir(parents=True, exist_ok=True)
        archivo.write_text("contenido", encoding="utf-8")
        return archivo

    def test_all_file_types_link_to_absolute_target(self):
        for ext in ("md", "pdf", "lean", "pl", "py", "cpp", "json", "log", "html", "php"):
            archivo = self.archivo(f"carpeta con espacios/prueba.{ext}")
            with self.subTest(ext=ext):
                self.assertEqual(enlace_archivo(archivo, terminal=False),
                                 f"[{archivo.name}](<{archivo.resolve().as_posix()}>)")

    def test_terminal_link_uses_encoded_uri(self):
        archivo = self.archivo("carpeta con espacios/prueba.md")
        salida = enlace_archivo(archivo, terminal=True)
        self.assertEqual(salida, f"\x1b]8;;{archivo.as_uri()}\x1b\\prueba.md\x1b]8;;\x1b\\")
        self.assertIn("%20", salida)

    def test_duplicate_names_have_distinct_targets(self):
        a = self.archivo("a/informe.json")
        b = self.archivo("b/informe.json")
        self.assertNotEqual(enlace_archivo(a, terminal=False), enlace_archivo(b, terminal=False))

    def test_missing_file_does_not_have_fake_link(self):
        self.assertEqual(enlace_archivo(self.root / "ausente.pdf", terminal=True), "ausente.pdf")

    def test_label_brackets_are_escaped(self):
        archivo = self.archivo("informe [1].md")
        self.assertTrue(enlace_archivo(archivo, terminal=False).startswith("[informe \\[1\\].md]"))

    def test_console_format_does_not_modify_disk_log_record(self):
        archivo = self.archivo("informe.log")
        record = logging.LogRecord("Demuestra", logging.INFO, __file__, 1,
                                   "Informe: %s", (archivo,), None)
        original = logging.Formatter("%(message)s").format(record)
        with patch("sys.stderr", io.StringIO()):
            console = FormatoConArchivos("%(message)s").format(record)
        self.assertIn(enlace_archivo(archivo, terminal=False), console)
        self.assertEqual(logging.Formatter("%(message)s").format(record), original)
        self.assertNotIn("\x1b", original)


if __name__ == "__main__":
    unittest.main()
