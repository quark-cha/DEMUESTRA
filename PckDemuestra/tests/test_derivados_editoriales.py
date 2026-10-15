from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import Mock

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "vendor" / "PUBLICAR"))
from PackPublica.md import Md
from PckDemuestra.seleccion_md import es_markdown_demostracion


class DerivadosEditorialesTests(unittest.TestCase):
    def setUp(self):
        temp = tempfile.TemporaryDirectory(dir=ROOT)
        self.addCleanup(temp.cleanup)
        self.source = Path(temp.name) / "IT_INSTRUCTIONS.md"
        self.md = object.__new__(Md)
        self.md.fichero = self.source
        self.html = Mock(contenido="contenido")
        self.md.html = Mock(return_value=self.html)

    def test_non_proof_generates_only_reading_formats(self):
        self.source.write_text("# Instrucciones\n# ES_52: No es la primera linea", encoding="utf-8")
        before = self.source.read_bytes()
        for method in ("json", "lean", "prolog"):
            setattr(self.md, method, Mock(side_effect=AssertionError("Ruta formal prohibida")))
        result = self.md.generar_derivados()
        self.html.save.assert_called_once()
        self.html.pdf.assert_called_once_with(page_size="6x9")
        self.html.docx.assert_called_once()
        self.html.docx.return_value.save.assert_called_once()
        for method in ("json", "lean", "prolog"):
            getattr(self.md, method).assert_not_called()
            self.assertIsNone(result[method])
        self.assertEqual(self.source.read_bytes(), before)

    def test_proof_keeps_formal_generation(self):
        self.source.write_text("\ufeff# IT_52: Dimostrazione", encoding="utf-8")
        self.assertTrue(es_markdown_demostracion(self.source))
        for method in ("json", "lean", "prolog"):
            setattr(self.md, method, Mock())
        self.md.generar_derivados()
        for method in ("json", "lean", "prolog"):
            getattr(self.md, method).return_value.save.assert_called_once()

    def test_direct_formal_calls_reject_editorial_source(self):
        self.source.write_text("# Instrucciones", encoding="utf-8")
        for method in ("json", "lean", "prolog"):
            with self.subTest(method=method), self.assertRaisesRegex(ValueError, "No es un archivo"):
                getattr(self.md, method)()


if __name__ == "__main__":
    unittest.main()
