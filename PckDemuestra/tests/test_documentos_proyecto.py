import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

SPEC = importlib.util.spec_from_file_location('documentos_proyecto',
    Path(__file__).resolve().parents[1] / 'documentos_proyecto.py')
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)


class DocumentosTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(dir=Path(__file__).resolve().parents[2])
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        (self.root / 'base.md').write_text('# Base', encoding='utf-8')
        (self.root / 'anexo.md').write_text('# Anexo', encoding='utf-8')
        self.data = {'version': 1, 'principal': 'base.md',
                     'documentos': [{'fuente': 'base.md'}, {'fuente': 'anexo.md'}]}
        self.save()

    def save(self):
        (self.root / 'documentos_proyecto.json').write_text(json.dumps(self.data), encoding='utf-8')

    def test_principal_is_explicit(self):
        self.assertEqual(MODULE.leer_catalogo(self.root)['principal'], 'base.md')

    def test_no_escape_or_absolute_path(self):
        for path in ('../otro.md', str(self.root / 'base.md')):
            with self.subTest(path=path), self.assertRaises(ValueError):
                MODULE.ruta_local(self.root, path)

    def test_no_duplicate_documents(self):
        self.data['documentos'].append({'fuente': 'base.md'})
        self.save()
        with self.assertRaises(ValueError):
            MODULE.leer_catalogo(self.root)

    def test_missing_source_reported(self):
        (self.root / 'anexo.md').unlink()
        with self.assertRaises(ValueError):
            MODULE.leer_catalogo(self.root)

    def test_no_publication_without_consistency_record(self):
        with self.assertRaises(ValueError):
            MODULE.archivos_publicables(self.root)

    def test_sync_keeps_replaced_versions_and_relative_layout(self):
        target = self.root.parent / (self.root.name + '_destino')
        target.mkdir()
        self.addCleanup(__import__('shutil').rmtree, target)
        for source in (self.root / 'base.md', self.root / 'anexo.md'):
            source.with_suffix('.pdf').write_bytes(b'pdf')
            source.with_suffix('.html').write_text('html', encoding='utf-8')
        (target / 'base.md').write_text('version anterior', encoding='utf-8')
        with patch.object(MODULE, 'archivos_publicables', return_value=[self.root / 'base.md', self.root / 'anexo.md']):
            paths = MODULE.sincronizar_locales(self.root, target)
        self.assertEqual(len(paths), 6)
        self.assertEqual((target / 'base.md').read_bytes(), (self.root / 'base.md').read_bytes())
        backups = list((target / 'bck').rglob('base.md'))
        self.assertEqual(len(backups), 1)
        self.assertEqual(backups[0].read_text(encoding='utf-8'), 'version anterior')
        self.assertTrue((target / 'pdfs/base.pdf').is_file())
        self.assertTrue((target / 'htmls/anexo.html').is_file())

    def test_sync_requires_independent_directories_and_validated_files(self):
        for target in (self.root, self.root / 'copia', self.root.parent):
            with self.subTest(target=target), self.assertRaises(ValueError):
                MODULE.sincronizar_locales(self.root, target)
        with self.assertRaises(ValueError):
            MODULE.sincronizar_locales(self.root, self.root.parent / 'otro')


if __name__ == '__main__':
    unittest.main()
