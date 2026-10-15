from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / 'vendor' / 'PUBLICAR'))
from PackPublica.docx import Docx
from PackPublica.base import Publicacion


class DocxPathTests(unittest.TestCase):
    def test_explicit_output_is_used_for_odt_and_returned(self):
        with tempfile.TemporaryDirectory(dir=Path(__file__).resolve().parents[3]) as directory:
            target = Path(directory) / 'custom.docx'
            with patch.object(Publicacion, 'save', return_value=target), \
                 patch('PackPublica.docx.Odt') as odt:
                result = Docx('HTML').save(target)
            self.assertEqual(result, target)
            self.assertEqual(odt.call_args.kwargs['docx_path'], target)
            odt.return_value.save.assert_called_once_with(target.with_suffix('.odt'))

    def test_default_output_keeps_odts_directory(self):
        with tempfile.TemporaryDirectory(dir=Path(__file__).resolve().parents[3]) as directory:
            target = Path(directory) / 'docxs' / 'example.docx'
            with patch.object(Publicacion, 'save', return_value=target), \
                 patch('PackPublica.docx.Odt') as odt:
                self.assertEqual(Docx('HTML').save(), target)
            odt.return_value.save.assert_called_once_with(Path(directory) / 'odts' / 'example.odt')

    def test_missing_pandoc_has_installation_guide(self):
        with tempfile.TemporaryDirectory(dir=Path(__file__).resolve().parents[3]) as directory:
            with patch('PackPublica.docx.tempfile.tempdir', directory), \
                 patch('PackPublica.docx.subprocess.run', side_effect=FileNotFoundError(2, 'Not found', 'pandoc')):
                with self.assertRaisesRegex(RuntimeError, 'winget install.*Pandoc'):
                    Docx('HTML')._escribir(Path(directory) / 'example.docx')
