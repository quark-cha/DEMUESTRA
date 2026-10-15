import contextlib
import io
from markdown_it import MarkdownIt
from pathlib import Path
import unittest
from unittest.mock import patch
from urllib.parse import unquote, urlsplit

import publica


class FTPEnsayo:
    def __init__(self, fallo=None):
        self.directories = set()
        self.uploaded = []
        self.fallo = fallo

    def mkdir(self, directory):
        self.directories.add(directory)

    def upload(self, source, remote):
        if remote == self.fallo:
            raise OSError('fallo de transferencia de ensayo')
        if remote.rsplit('/', 1)[0] not in self.directories:
            raise AssertionError('No se preparo el directorio remoto')
        if not Path(source).is_file():
            raise AssertionError('Archivo local ausente')
        self.uploaded.append(remote)


class PublicacionMaterialesTests(unittest.TestCase):
    def setUp(self):
        self.project = publica.PROJECT_ROOT / 'Proyectos/ES_52'
        self.alias = 'ES_52_Maquina_V_UNIHOLOG'

    def plan(self):
        with patch.object(publica, '_proyecto_dir', return_value=self.project):
            return publica.plan_adjuntos_proyecto(self.alias)

    def test_real_catalog_includes_php_all_images_and_translator_subfolders(self):
        plan = self.plan()
        paths = {remote for _, remote in plan}
        prefix = '/estradad.es/teorias/pdf/DEMUESTRA/proyectos/ES_52/'
        self.assertIn(prefix + 'index.php', paths)
        self.assertEqual(next(source for source, remote in plan if remote == prefix + 'index.php'),
                         publica._index_proyectos_web())
        self.assertEqual(len([path for path in paths if path.startswith(prefix + 'img/')]), 16)
        for relative in ('Traductores_V/gestor_v.py', 'Traductores_V/MaquinasQ/par_h_cnot.q',
                         'Traductores_V/MaquinasV/par_h_cnot/v.py',
                         'Traductores_V/MaquinasV/par_h_cnot/v.pl',
                         'Traductores_V/MaquinasV/par_h_cnot/v.cpp'):
            self.assertIn(prefix + relative, paths)
        self.assertFalse(any('/proyectos/' + self.alias + '/' in path for path in paths))

    def test_remote_directories_prepared_before_upload_and_index_last(self):
        ftp = FTPEnsayo()
        with patch.object(publica, '_proyecto_dir', return_value=self.project), \
             contextlib.redirect_stdout(io.StringIO()):
            count = publica.publicar_adjuntos_proyecto(ftp, self.alias)
        self.assertEqual(count, len(self.plan()))
        self.assertEqual(count, len(ftp.uploaded))
        self.assertTrue(ftp.uploaded[-1].endswith('/ES_52/index.php'))
        self.assertTrue(ftp.uploaded[-2].endswith('/ES_52/documentos_proyecto.json'))

    def test_presentation_and_resource_index_link_published_pdfs_not_markdown(self):
        planned = {remote for _, remote in self.plan()}
        for name in ('ES_52_Presentacion_comunidad.md', 'ES_52_Indice_recursos.md'):
            content = (self.project / name).read_text(encoding='utf-8')
            pdf_count = 0
            for token in MarkdownIt().parse(content):
                for child in token.children or ():
                    if child.type != 'link_open':
                        continue
                    url = urlsplit(child.attrGet('href') or '')
                    self.assertFalse(url.path.endswith('.md'), (name, url.path))
                    if url.path.endswith('.pdf'):
                        pdf_count += 1
                        self.assertEqual(url.hostname, 'estradad.es')
                        self.assertIn('/estradad.es' + unquote(url.path), planned)
            self.assertGreater(pdf_count, 0, name)

    def test_failed_transfer_does_not_publish_new_catalog_or_index(self):
        remote = next(remote for _, remote in self.plan() if remote.endswith('/img/not.png'))
        ftp = FTPEnsayo(fallo=remote)
        with patch.object(publica, '_proyecto_dir', return_value=self.project), \
             contextlib.redirect_stdout(io.StringIO()), \
             self.assertRaisesRegex(OSError, 'No se pudo publicar'):
            publica.publicar_adjuntos_proyecto(ftp, self.alias)
        self.assertFalse(any(path.endswith('/index.php') or path.endswith('/documentos_proyecto.json')
                             for path in ftp.uploaded))


if __name__ == '__main__':
    unittest.main()
