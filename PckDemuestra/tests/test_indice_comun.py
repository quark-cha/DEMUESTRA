import json
from pathlib import Path
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
from PckDemuestra.publicacion_web import indice_comun, sincronizar_indices


class IndiceComunTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(dir=ROOT)
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.source = self.root / 'web-base/index.php'
        self.source.parent.mkdir()
        self.source.write_text('<?php echo "indice comun";', encoding='utf-8')
        self.config('web-base/index.php')

    def config(self, relative):
        (self.root / 'publicacion_web.json').write_text(json.dumps({
            'version': 1, 'indice_comun': relative,
        }), encoding='utf-8')

    def test_one_template_replaces_stale_copy_and_creates_missing_copy(self):
        directories = [self.root / 'Proyectos', self.root / 'Proyectos/ES_52',
                       self.root / 'Proyectos/ES_46_RV6']
        directories[1].mkdir(parents=True)
        (directories[1] / 'index.php').write_text('version antigua', encoding='utf-8')
        files = sincronizar_indices(self.root, directories)
        self.assertEqual(len(files), 3)
        for path in files:
            self.assertEqual(path.read_bytes(), self.source.read_bytes())

    def test_identical_copies_are_not_rewritten(self):
        files = sincronizar_indices(self.root, [self.root / 'Proyectos'])
        before = files[0].stat().st_mtime_ns
        sincronizar_indices(self.root, [self.root / 'Proyectos'])
        self.assertEqual(files[0].stat().st_mtime_ns, before)

    def test_source_escape_and_wrong_filename_rejected(self):
        for relative in ('../index.php', str(self.source), 'web-base/otra.php'):
            self.config(relative)
            with self.subTest(relative=relative), self.assertRaises(ValueError):
                indice_comun(self.root)

    def test_destination_escape_rejected_before_any_copy(self):
        with self.assertRaises(ValueError):
            sincronizar_indices(self.root, [self.root / 'Proyectos', self.root.parent])
        self.assertFalse((self.root / 'Proyectos/index.php').exists())

    def test_missing_common_template_blocks_sync(self):
        self.source.unlink()
        with self.assertRaises(FileNotFoundError):
            sincronizar_indices(self.root, [self.root / 'Proyectos'])


if __name__ == '__main__':
    unittest.main()
