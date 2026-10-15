import base64
from pathlib import Path
import sys
import tempfile
import unittest

from markdown_it import MarkdownIt

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "vendor" / "PUBLICAR"))
from PackPublica.documento import Documento
from PackPublica.md import Md


class MarkdownImageTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.source = self.root / "source.md"
        self.source.write_text("# Imagenes\n", encoding="utf-8")
        self.md = Md(Documento(self.source))

    def render(self, source):
        renderer = MarkdownIt("commonmark")
        self.md._configurar_imagenes_locales(renderer)
        return renderer.render(source)

    def test_image_resolves_relative_to_markdown_not_current_directory(self):
        image = self.root / "img" / "unit.png"
        image.parent.mkdir()
        image.write_bytes(b"image-fixture")
        html = self.render("![Unidad](./img/unit.png)")
        self.assertIn("data:image/png;base64," + base64.b64encode(image.read_bytes()).decode(), html)
        self.assertIn('alt="Unidad"', html)

    def test_percent_encoded_filename(self):
        (self.root / "unit image.png").write_bytes(b"fixture")
        self.assertIn("data:image/png;base64,", self.render("![Unidad](unit%20image.png)"))

    def test_remote_and_data_urls_are_preserved(self):
        for url in ("https://example.org/unit.png", "//example.org/unit.png", "data:image/png;base64,eA=="):
            with self.subTest(url=url):
                self.assertIn(url, self.render(f"![Unidad]({url})"))

    def test_missing_local_image_is_reported(self):
        with self.assertRaisesRegex(FileNotFoundError, "missing.png"):
            self.render("![Unidad](./img/missing.png)")

    def test_inline_and_block_math_keep_their_display_modes(self):
        html = self.md.convertir_mathml("Inline $x=1$.\n\n$$\nx=2\n$$")
        self.assertIn('display="inline"', html)
        self.assertIn('display="block"', html)
        self.assertNotIn("$", html)

    def test_atlas_contains_all_sixteen_images_and_supported_math(self):
        atlas = ROOT / "Proyectos" / "ES_52" / "ES_52_Laminas_Q_V.md"
        md = Md(Documento(atlas))
        renderer = MarkdownIt("commonmark", {"html": True}).enable("table")
        md._configurar_imagenes_locales(renderer)
        html = renderer.render(md.convertir_mathml(md.texto))
        self.assertEqual(html.count("<img "), 16)
        self.assertEqual(html.count("data:image/png;base64,"), 16)
        self.assertIn('display="block"', html)
        self.assertIn("## 1. Paralelismo temporal de la medida", md.texto)
        self.assertLess(md.texto.index("./img/Q-V-medida-temporal.png"),
                        md.texto.index("./img/Q1-V1.png"))
        for condition in ("CC BY-NC-SA 4.0", "uso no comercial", "compartir igual",
                          "Código (HL3)", "guerras", "derechos humanos", "daño ambiental",
                          "explotación", "vigilancia masiva", "discriminación",
                          "no uso lucrativo sin permiso", "https://estradad.es/licencia.php"):
            self.assertIn(condition, md.texto)


if __name__ == "__main__":
    unittest.main()
