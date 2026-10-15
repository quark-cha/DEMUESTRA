import copy
import builtins
import os
from pathlib import Path
import tempfile
import sys
import unittest
from unittest.mock import patch
import xml.etree.ElementTree as ET
from zipfile import ZipFile

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / 'vendor' / 'PUBLICAR'))
from PackPublica.autoria import resolve_authors, author_html, config_root
from PackPublica.adec_contract import validate_artifact
from PackPublica.artifact_metadata import office_authors


class AuthorContractTests(unittest.TestCase):
    def test_explicit_foreign_author_not_replaced(self):
        with patch('PackPublica.autoria.local_author', return_value={
            'name': 'Owner Example', 'orcid': '0000-0000-0000-0000'}):
            self.assertEqual(resolve_authors('**Autor:** Foreign Author'),
                             [{'name': 'Foreign Author'}])

    def test_byline_followed_by_framework(self):
        with patch('PackPublica.autoria.local_author', return_value={}):
            self.assertEqual(resolve_authors('**Example Author**\\\n**Einstein-VED --- UNIHOLOG**'),
                             [{'name': 'Example Author'}])

    def test_plain_and_bold_labels(self):
        with patch('PackPublica.autoria.local_author', return_value={}):
            for text in ('Autor: Example Author', '**Autor:** Example Author',
                         '**Author:** **Example Author**'):
                self.assertEqual(resolve_authors(text), [{'name': 'Example Author'}])

    def test_same_line_framework_is_not_part_of_author_name(self):
        with patch('PackPublica.autoria.local_author', return_value={'name': 'Example Author', 'orcid': 'example'}):
            self.assertEqual(resolve_authors('Autor: Example Author. Marco: Einstein-VED - UNIHOLOG.'),
                             [{'name': 'Example Author', 'orcid': 'example'}])

    def test_existing_json_preserved(self):
        authors = [{'name': 'Foreign Author', 'affiliation': 'University',
                    'conflict_of_interest': 'Declared conflict'}]
        self.assertEqual(resolve_authors(authors=authors), authors)

    def test_invalid_author_payload_is_not_replaced_with_owner(self):
        for value in ('', {}, False, ['Example']):
            with self.subTest(value=value), self.assertRaises(ValueError):
                resolve_authors(authors=value)

    def test_empty_author_does_not_consume_the_next_line(self):
        with patch('PackPublica.autoria.local_author', return_value={'name': 'Owner'}):
            with self.assertRaisesRegex(ValueError, 'vacia'):
                resolve_authors('Autor:\nEste texto no es un autor.')

    def test_missing_name_actionable_error(self):
        with patch('PackPublica.autoria.local_author', return_value={}):
            with self.assertRaisesRegex(ValueError, 'AUTHOR_NAME'):
                resolve_authors('No author')

    def test_config_is_private_and_shared(self):
        with tempfile.TemporaryDirectory(dir=Path(__file__).resolve().parents[3]) as directory:
            Path(directory, 'author.env').write_text('AUTHOR_NAME=Example Author\nAUTHOR_ORCID=example\n', encoding='utf-8')
            with patch.dict(os.environ, {'PUBLICAR_CONFIG_ROOT': directory}):
                self.assertEqual(config_root(), Path(directory).resolve())
                self.assertEqual(resolve_authors()[0]['name'], 'Example Author')
        self.assertIn('*.env', (Path(__file__).resolve().parents[3] / '.gitignore').read_text())

    def test_no_invented_affiliation_or_conflict(self):
        with patch('PackPublica.autoria.local_author', return_value={'name': 'Example Author'}):
            self.assertEqual(resolve_authors(), [{'name': 'Example Author'}])

    def test_html_escaped(self):
        self.assertIn('A &amp; B', author_html([{'name': 'A & B'}]))

    def test_pdf_converter_runs_without_extra_pdf_library(self):
        from PackPublica.pdf import Pdf
        original_import = builtins.__import__

        def without_pdf_library(name, *args, **kwargs):
            if name.split('.')[0] in {'fitz', 'pymupdf'}:
                raise ModuleNotFoundError(name, name=name)
            return original_import(name, *args, **kwargs)

        with tempfile.TemporaryDirectory(dir=Path(__file__).resolve().parents[3]) as directory:
            with patch('builtins.__import__', side_effect=without_pdf_library), \
                 patch('PackPublica.pdf.sync_playwright') as engine, \
                 patch('PackPublica.pdf.tempfile.tempdir', directory):
                Pdf('<html><body>Example</body></html>')._escribir(Path(directory) / 'sample.pdf')
                page = engine.return_value.__enter__.return_value.chromium.launch.return_value.new_context.return_value.new_page.return_value
                page.pdf.assert_called_once()

    def test_office_metadata_preserves_body_and_other_members(self):
        dc = 'http://purl.org/dc/elements/1.1/'
        with tempfile.TemporaryDirectory(dir=Path(__file__).resolve().parents[3]) as directory:
            for suffix, member, xml in (
                ('.docx', 'docProps/core.xml', '<core xmlns:dc="' + dc + '"><dc:creator>Old</dc:creator></core>'),
                ('.odt', 'meta.xml', '<office:document-meta xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:dc="' + dc + '"><office:meta><dc:creator>Old</dc:creator></office:meta></office:document-meta>'),
            ):
                target = Path(directory) / ('sample' + suffix)
                with ZipFile(target, 'w') as archive:
                    archive.writestr(member, xml)
                    archive.writestr('body.xml', b'Body unchanged')
                with patch('PackPublica.artifact_metadata.document_authors', return_value=[
                    {'name': 'Example Author', 'orcid': '0000-0000-0000-0000'}]):
                    office_authors(target, None)
                    office_authors(target, None)
                with ZipFile(target) as archive:
                    self.assertEqual(archive.read('body.xml'), b'Body unchanged')
                    root = ET.fromstring(archive.read(member))
                    self.assertEqual(root.find('.//{' + dc + '}creator').text, 'Example Author')
                    self.assertEqual(archive.read(member).count(b'ORCID:'), 1)

    def artifact(self):
        return {'title': 'Example', 'version': '1.0', 'authors': [{'name': 'Example'}],
                'nodes': [{'id': 'A', 'name': 'Base', 'kind': 'foundation',
                           'description': 'Declared base', 'deps': [],
                           'proof': {'status': 'declared', 'method': 'source', 'steps': ['Step']}}]}

    def test_validation_never_changes_proof_or_scope(self):
        data = self.artifact()
        before = copy.deepcopy(data)
        self.assertEqual(validate_artifact(data), 1)
        self.assertEqual(data, before)

    def test_invalid_fields(self):
        for field, value in [('kind', 'invented'), ('id', 3), ('deps', [4]),
                             ('peer_reviewed', 'true'), ('claim_scope', 'all'),
                             ('funding', 3), ('competitive_hypotheses', [{'hypothesis': 'Other'}]),
                             ('measurement_relationship', []), ('claim_scope', {}),
                             ('funder_relationship_to_claim', [] )]:
            data = self.artifact()
            data['nodes'][0][field] = value
            with self.subTest(field=field), self.assertRaises(ValueError):
                validate_artifact(data)

    def test_json_root_must_be_an_object(self):
        for value in ([], 'Example', None):
            with self.subTest(value=value), self.assertRaisesRegex(ValueError, 'objeto JSON'):
                validate_artifact(value)


if __name__ == '__main__':
    unittest.main()
