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

    def make_marked_project(self):
        (self.root / 'base.md').write_text('# ES_52: Base\n\n[Anexo](anexo.pdf)', encoding='utf-8')
        (self.root / 'anexo.md').write_text('# -ES_52: Anexo\n\n[Base](base.pdf)', encoding='utf-8')

    def test_marked_companions_require_reciprocal_pdf_links(self):
        self.make_marked_project()
        report = MODULE.validar_enlaces_documentales(self.root)
        self.assertEqual(report['enlaces_comprobados'], 2)
        self.assertEqual(report['complementarios'], ['anexo.md'])
        self.assertFalse((self.root / 'base.pdf').exists())

    def test_links_to_source_markdown_do_not_replace_pdf_navigation(self):
        self.make_marked_project()
        (self.root / 'anexo.md').write_text('# -ES_52: Anexo\n\n[Base](base.md)', encoding='utf-8')
        with self.assertRaisesRegex(ValueError, 'PDF relativo al principal'):
            MODULE.validar_enlaces_documentales(self.root)

    def test_new_marked_document_cannot_be_silently_omitted(self):
        self.make_marked_project()
        (self.root / 'nuevo.md').write_text('# -ES_52: Nuevo', encoding='utf-8')
        with self.assertRaisesRegex(ValueError, 'no incluido en el catalogo'):
            MODULE.validar_enlaces_documentales(self.root)

    def test_registered_companion_missing_from_main_is_reported(self):
        self.make_marked_project()
        (self.root / 'base.md').write_text('# ES_52: Base', encoding='utf-8')
        with self.assertRaisesRegex(ValueError, 'falta enlace PDF relativo a anexo.md'):
            MODULE.validar_enlaces_documentales(self.root)

    def test_nested_relative_links_and_encoded_spaces(self):
        self.make_marked_project()
        directory = self.root / 'Con espacios'
        directory.mkdir()
        (directory / 'otro.md').write_text('# -ES_52: Otro\n\n[Base](../base.pdf)', encoding='utf-8')
        with (self.root / 'base.md').open('a', encoding='utf-8') as stream:
            stream.write('\n[Otro](Con%20espacios/otro.pdf)')
        self.data['documentos'].append({'fuente': 'Con espacios/otro.md'})
        self.save()
        self.assertEqual(MODULE.validar_enlaces_documentales(self.root)['enlaces_comprobados'], 4)

    def test_backup_is_not_an_active_companion(self):
        self.make_marked_project()
        (self.root / 'respaldos').mkdir()
        (self.root / 'respaldos/anterior.md').write_text('# -ES_52: Anterior', encoding='utf-8')
        self.assertEqual(MODULE.validar_enlaces_documentales(self.root)['enlaces_comprobados'], 2)

    def test_pdf_base_resolves_nested_relative_links_without_rewriting_sources(self):
        self.data['base_url_pdf'] = 'https://example.org/ES_52/'
        self.assertEqual(MODULE.url_documento_pdf(self.data, 'Con espacios/otro.md'),
                         'https://example.org/ES_52/Con%20espacios/otro.pdf')
        self.assertEqual((self.root / 'base.md').read_text(encoding='utf-8'), '# Base')

    def test_invalid_pdf_base_is_rejected_before_generation(self):
        for base in ('file:///tmp/', 'https://example.org/ES_52',
                     'https://example.org/?query=1/', 7):
            with self.subTest(base=base), self.assertRaisesRegex(ValueError, 'base_url_pdf'):
                MODULE.url_documento_pdf({'base_url_pdf': base}, 'base.md')


if __name__ == '__main__':
    unittest.main()
