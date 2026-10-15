import contextlib
import io
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import Mock

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
from PckDemuestra.seleccion_md import (
    aviso_no_demostracion, es_markdown_demostracion, proyecto_evaluable,
)
from PckDemuestra.demuestra import Demuestra
from PckDemuestra.salida_archivos import enlace_archivo


class SeleccionMarkdownTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(dir=ROOT)
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.source = self.root / f"{self.root.name}.md"

    def test_valid_first_lines_and_bom(self):
        for title in ("# ES_52: Titulo", "# en__42: Title", "\ufeff# ES_52: Titulo\r\n"):
            with self.subTest(title=title):
                self.source.write_text(title, encoding="utf-8")
                before = self.source.read_bytes()
                self.assertTrue(es_markdown_demostracion(self.source))
                self.assertEqual(self.source.read_bytes(), before)

    def test_name_and_later_heading_are_not_enough(self):
        for title in ("# Proyecto 52", "\n# ES_52: Titulo", "<!-- nota -->\n# ES_52: Titulo",
                      "## ES_52: Titulo", "# ES_52:", "# ES_52_RV6: Titulo",
                      "# ES_52:T", " # ES_52: Titulo"):
            with self.subTest(title=title):
                self.source.write_text(title, encoding="utf-8")
                self.assertFalse(es_markdown_demostracion(self.source))

    def test_missing_file_is_not_evaluable(self):
        self.assertFalse(es_markdown_demostracion(self.source))

    def test_catalog_does_not_bypass_header(self):
        self.source.write_text("# Laminas", encoding="utf-8")
        (self.root / "documentos_proyecto.json").write_text(json.dumps({
            "version": 1, "principal": self.source.name,
            "documentos": [{"fuente": self.source.name}],
        }), encoding="utf-8")
        self.assertFalse(proyecto_evaluable(self.root))

    def test_notice(self):
        self.source.write_text("# Anexo", encoding="utf-8")
        self.assertEqual(aviso_no_demostracion(self.source),
                         f"\u2139 {enlace_archivo(self.source)} \u2014 No es un archivo para demostraci\u00f3n")

    def test_lean_not_run_and_existing_report_preserved(self):
        self.source.write_text("# Anexo", encoding="utf-8")
        report = self.root / "informe.json"
        report.write_text('{"previous": true}', encoding="utf-8")
        before = report.read_bytes()
        app = object.__new__(Demuestra)
        app._archivos_lean = Mock(side_effect=AssertionError("No se debe buscar Lean"))
        with contextlib.redirect_stdout(io.StringIO()) as output:
            self.assertEqual(app._validar_un_proyecto(self.root), 0)
        self.assertIn(aviso_no_demostracion(self.source), output.getvalue())
        app._archivos_lean.assert_not_called()
        self.assertEqual(report.read_bytes(), before)
        self.assertEqual(app._estado_ultimo_proyecto, "NO EVALUADO")


if __name__ == "__main__":
    unittest.main()
