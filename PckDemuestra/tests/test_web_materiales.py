import json
import hashlib
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
TEMPLATE = ROOT / 'web-base/index.php'
PHP = shutil.which('php') or (r'C:\xampp\php\php.exe' if Path(r'C:\xampp\php\php.exe').is_file() else None)


@unittest.skipUnless(PHP, 'PHP no disponible')
class WebMaterialesTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(dir=ROOT)
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name) / 'ES_99'
        self.root.mkdir()
        shutil.copy2(TEMPLATE, self.root / 'index.php')
        self.archivo('ES_99.json', json.dumps({'title': 'Proyecto de prueba'}))
        self.archivo('ES_99.md', '# ES_99: Prueba')
        self.archivo('Anexos con espacios/anexo.md', '# Anexo')
        self.archivo('Anexos con espacios/anexo.pdf', 'pdf')
        self.archivo('Traductores/v.py', "print('NO EJECUTAR')")
        self.archivo('Traductores/otro/v.py', '# otro programa')
        self.archivo('privado.txt', 'NO PUBLICAR')
        self.archivo('oculto.php', '<?php echo "NO EJECUTAR";')
        self.archivo('.env', 'SECRETO')
        self.catalog = {
            'principal': 'ES_99.md',
            'documentos': [{'fuente': 'ES_99.md'},
                           {'fuente': 'Anexos con espacios/anexo.md', 'titulo': 'Anexo de prueba'}],
            'adjuntos': ['Traductores/v.py', 'Traductores/otro/v.py'],
        }
        self.guardar()

    def archivo(self, relative, contenido):
        path = self.root / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(contenido, encoding='utf-8')

    def guardar(self):
        self.archivo('documentos_proyecto.json', json.dumps(self.catalog))

    def php(self, query=None, function=None):
        code = '$_GET=json_decode($argv[1],true); ob_start(); require $argv[2];'
        if function:
            code += 'ob_end_clean(); echo json_encode(' + function + '($argv[3], ""));'
        else:
            code += 'ob_end_flush();'
        result = subprocess.run([PHP, '-r', code, json.dumps(query or {}),
                                 str(self.root / 'index.php'), str(self.root)],
                                text=True, encoding='utf-8', capture_output=True, timeout=20)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(result.stderr, '')
        return result.stdout

    def test_documents_have_only_existing_formats_and_encoded_paths(self):
        documents = json.loads(self.php(function='additional_documents'))
        self.assertEqual(len(documents), 1)
        self.assertEqual(set(documents[0]['links']), {'md', 'pdf'})
        self.assertIn('Anexos%20con%20espacios/anexo.pdf?v=', documents[0]['links']['pdf'])

    def test_coverage_separates_tool_limits_from_refutations(self):
        self.archivo('CERTIFICADO_PARCIAL_LEAN_ES_99.json', json.dumps({
            'certified_nodes': [f'P_{i}' for i in range(38)],
            'failed_translation_nodes': ['P_38', 'P_39'],
            'undetermined_nodes': ['P_39'],
        }))
        self.archivo('LEAN_ES_99.json', json.dumps({
            'verdict': 'COMPILA; FORMALIZACION AUTOMATICA INCOMPLETA; DEMOSTRACION NO CERTIFICADA',
            'refuted': False,
            'translation_error_json_nodes': ['P_38', 'P_39'],
        }))
        html = self.php()
        self.assertIn('Certificados 38/40', html)
        self.assertIn('Refutaciones: 0', html)
        self.assertIn('2 pendientes por limitaciones documentadas', html)
        self.assertNotIn('DEMOSTRACION NO CERTIFICADA', html)
        self.assertNotIn('pendientes de evaluación concluyente', html)

    def test_no_reports_does_not_invent_zero_refutations(self):
        html = self.php()
        self.assertIn('Cobertura sin evaluar', html)
        self.assertIn('Refutaciones: Sin evaluar', html)

    def test_direct_coverage_survives_lean_translation_failure(self):
        self.archivo('PROLOG_MD_DIRECTO_ES_99.json', json.dumps({
            'refuted': False, 'verdict': 'EVALUACION PENDIENTE',
            'goal_conditions_missing': ['cierre de todas las dependencias declaradas'],
            'coverage': {
                'scope': 'dependency_closure_under_declared_markdown_premises',
                'certified_nodes': ['T_A', 'T_B'], 'pending_nodes': ['T_C'],
                'declared_premises': ['D_A'],
            },
        }))
        self.archivo('TRADUCCION_ES_99.json', json.dumps({'category': 'tool_error'}))
        html = self.php()
        self.assertIn('Certificados estructurales 2/3', html)
        self.assertIn('Refutaciones: 0', html)
        self.assertIn('cierre de todas las dependencias declaradas', html)
        self.assertIn('Pendiente por limitaciones de traducción', html)
        lean_row = html.split('<strong>1. Lean</strong>')[1].split('<div class="analysis-links">')[0]
        self.assertIn('Cobertura sin evaluar', lean_row)
        self.assertNotIn('Certificados estructurales', lean_row)

    def test_translation_diagnostic_is_not_a_document_verdict(self):
        self.archivo('TRADUCCION_ES_99.json', json.dumps({
            'status': 'ERROR_HERRAMIENTA_TRADUCCION_LEAN',
            'category': 'tool_error',
            'source_sha256': hashlib.sha256((self.root / 'ES_99.md').read_bytes()).hexdigest(),
            'message': 'Los certificados anteriores son historicos y no certifican esta ejecucion.',
        }))
        html = self.php()
        self.assertIn('Evaluacion pendiente por limitacion del traductor', html)
        self.assertIn('ni altera los resultados de los otros evaluadores', html)
        self.assertNotIn('ERROR_HERRAMIENTA_TRADUCCION_LEAN', html)
        self.assertNotIn('certificados anteriores son historicos', html)

    def test_three_routes_show_independent_results_when_lean_translation_is_pending(self):
        self.archivo('PROLOG_JSON_ES_99.json', json.dumps({
            'passed': True, 'refuted': False, 'goal': 'T_OBJETIVO',
            'verdict': 'ALCANZABLE_EN_GRAFO_DECLARADO',
            'scope': 'Alcanzabilidad del objetivo desde las premisas del JSON.',
        }))
        self.archivo('PROLOG_MD_DIRECTO_ES_99.json', json.dumps({
            'passed': True, 'refuted': False, 'goal': 'T_OBJETIVO',
            'verdict': 'TEOREMA DERIVADO DESDE PREMISAS DECLARADAS',
            'scope': 'Derivacion interna del objetivo desde el Markdown.',
            'coverage': {
                'scope': 'dependency_closure_under_declared_markdown_premises',
                'certified_nodes': ['T_OBJETIVO', 'P_A'], 'pending_nodes': [],
            },
        }))
        self.archivo('TRADUCCION_ES_99.json', json.dumps({
            'status': 'ERROR_HERRAMIENTA_TRADUCCION_LEAN', 'category': 'tool_error',
            'source_sha256': hashlib.sha256((self.root / 'ES_99.md').read_bytes()).hexdigest(),
        }))
        html = self.php()
        assessment = html.split('<h3>Qué certifica y qué queda abierto</h3>')[1].split('</section>')[0]
        self.assertIn('Certificados estructurales 2/2', assessment)
        self.assertIn('TEOREMA DERIVADO DESDE PREMISAS DECLARADAS', assessment)
        self.assertIn('Objetivo: T_OBJETIVO', assessment)
        self.assertIn('ALCANZABLE_EN_GRAFO_DECLARADO', assessment)
        self.assertIn('1. Lean', html)
        self.assertIn('2. Prolog desde el JSON inicial', html)
        self.assertIn('3. Prolog directo del MD', html)
        self.assertIn('PROLOG_JSON_ES_99.json', html)
        self.assertIn('Diagnóstico de traducción', html)
        self.assertNotIn('no certificación global del teorema', html)
        self.assertIn('<div class="analysis-row status-certified"><div class="analysis-label"><strong>2.', html)
        self.assertIn('<div class="analysis-row status-certified"><div class="analysis-label"><strong>3.', html)

    def test_current_pass_overrides_old_audit_color_without_changing_scope(self):
        self.archivo('AUDITORIA_ES_99.json', json.dumps({'classifications': [{
            'evaluator': 'Prolog directo del MD', 'category': 'refuted',
            'state': 'RESULTADO_ANTERIOR',
        }]}))
        self.archivo('PROLOG_MD_DIRECTO_ES_99.json', json.dumps({
            'passed': True, 'refuted': False, 'verdict': 'RESULTADO_ACTUAL',
            'scope': 'Derivacion interna desde las premisas declaradas.',
        }))
        html = self.php()
        self.assertNotIn('RESULTADO_ANTERIOR', html)
        self.assertIn('RESULTADO_ACTUAL', html)
        self.assertIn('Derivacion interna desde las premisas declaradas.', html)
        self.assertIn('<div class="analysis-row status-certified"><div class="analysis-label"><strong>3.', html)

    def test_refutation_is_red_even_if_report_also_says_passed(self):
        self.archivo('PROLOG_MD_DIRECTO_ES_99.json', json.dumps({
            'passed': True, 'refuted': True, 'verdict': 'INCONSISTENCIA_DETECTADA',
        }))
        html = self.php()
        self.assertIn('<div class="analysis-row status-refuted"><div class="analysis-label"><strong>3.', html)

    def test_json_route_is_not_replaced_by_generated_prolog_report(self):
        self.archivo('PROLOG_JSON_ES_99.json', json.dumps({
            'passed': True, 'refuted': False, 'verdict': 'RESULTADO_JSON',
        }))
        self.archivo('PROLOG_ES_99.json', json.dumps({'verdict': 'RESULTADO_LEAN_A_PROLOG'}))
        self.archivo('ES_99.pl', 'programa derivado de Lean')
        html = self.php()
        self.assertIn('RESULTADO_JSON', html)
        self.assertNotIn('RESULTADO_LEAN_A_PROLOG', html)
        self.assertNotIn('Prolog generado (.pl)', html)

    def test_all_32_certified_nodes_remain_visible_in_summary_assessment_and_route(self):
        self.archivo('PROLOG_MD_DIRECTO_ES_99.json', json.dumps({
            'passed': True, 'refuted': False, 'goal': 'T_OBJETIVO',
            'verdict': 'TEOREMA DERIVADO DESDE PREMISAS DECLARADAS',
            'coverage': {
                'scope': 'dependency_closure_under_declared_markdown_premises',
                'certified_nodes': [f'P_{i}' for i in range(32)], 'pending_nodes': [],
            },
        }))
        html = self.php()
        summary, rest = html.split('<h3>Qué certifica y qué queda abierto</h3>')
        assessment, rest = rest.split('</section>', 1)
        route = rest.split('<strong>3. Prolog directo del MD</strong>')[1].split('<div class="analysis-links">')[0]
        for section in (summary, assessment, route):
            self.assertIn('Certificados estructurales 32/32', section)
        self.assertIn('Refutaciones: 0', html)

    def test_translation_explains_actual_problems_and_preserves_safe_detail(self):
        diagnostic = '\n'.join([
            'No se pueden emitir formulas sin tipo:',
            '- Error semantico en ES_99.md:1:D_CORRELACIONES:formula-2: falta el modelo tipado de probabilidad condicionada.',
            '- Error semantico en ES_99.md:2:D_REGISTROREF:formula-6: la variable de sumatoria debe ser un identificador.',
            '- Error semantico en ES_99.md:2:D_REGISTROREF:formula-7: la variable de sumatoria debe ser un identificador.',
            '- Error semantico en ES_99.md:3:D_SIMETRIA:formula-3: argumento de R: se esperaba Real, se obtuvo Set[Nat].',
            '<script>alert(1)</script>',
        ])
        self.archivo('TRADUCCION_ES_99.json', json.dumps({
            'status': 'ERROR_HERRAMIENTA_TRADUCCION_LEAN', 'category': 'tool_error',
            'source_sha256': hashlib.sha256((self.root / 'ES_99.md').read_bytes()).hexdigest(),
            'detail': diagnostic,
        }))
        html = self.php()
        self.assertIn('Qué falta en el traductor a Lean', html)
        self.assertIn('probabilidades condicionadas', html)
        self.assertIn('indice de estas sumatorias', html)
        self.assertIn('tipos matematicos', html)
        self.assertIn('Nodos: D_REGISTROREF.', html)
        self.assertIn('se esperaba Real, se obtuvo Set[Nat]', html)
        self.assertIn('Diagnóstico técnico completo', html)
        self.assertNotIn('<script>alert(1)</script>', html)
        self.assertIn('&lt;script&gt;', html)

    def test_undetermined_is_not_automatically_a_tool_error(self):
        self.archivo('CERTIFICADO_PARCIAL_LEAN_ES_99.json', json.dumps({
            'certified_nodes': ['P_1', 'P_1'], 'undetermined_nodes': ['P_2'],
        }))
        self.archivo('LEAN_ES_99.json', json.dumps({'refuted': True}))
        self.archivo('SEMAFORO_ES_99.json', json.dumps({'current_metrics': {'formal_refutations': 0}}))
        html = self.php()
        self.assertIn('Certificados 1/2', html)
        self.assertIn('1 pendientes de evaluación concluyente', html)
        self.assertNotIn('pendientes por limitaciones documentadas', html)
        self.assertNotIn('Refutaciones: 0', html)
        self.assertIn('Refutaciones: Detectadas; consultar informe', html)

    def test_attachments_have_distinct_named_targets_and_downloads(self):
        files = json.loads(self.php(function='additional_attachments'))
        self.assertEqual(len(files), 2)
        self.assertEqual(files[0]['name'], files[1]['name'])
        self.assertNotEqual(files[0]['view'], files[1]['view'])
        self.assertIn('?view=Traductores%2Fv.py', files[0]['view'])
        self.assertIn('&download=1', files[0]['download'])

    def test_unsafe_missing_and_duplicate_entries_are_excluded(self):
        self.catalog['adjuntos'] += ['Traductores/v.py', '../privado.txt', '/privado.txt',
                                     '.env', 'oculto.php', 'ausente.py', 'Traductores/../privado.txt', None]
        self.catalog['documentos'] += [{'fuente': '../anexo.md'}, {'fuente': None}, 'incorrecto']
        self.guardar()
        self.assertEqual(len(json.loads(self.php(function='additional_attachments'))), 2)
        self.assertEqual(len(json.loads(self.php(function='additional_documents'))), 1)

    def test_project_page_names_documents_and_programs(self):
        html = self.php()
        self.assertIn('Documentos adicionales', html)
        self.assertIn('Programas y archivos adicionales', html)
        self.assertIn('anexo.md</a>', html)
        self.assertIn('v.py</a>', html)
        self.assertNotIn('privado.txt', html)
        self.assertIn('<article class="without-image">', html)
        self.assertNotIn('<div class="image">', html)

    def test_viewer_reads_program_as_text_without_execution(self):
        self.assertEqual(self.php({'view': 'Traductores/v.py'}), "print('NO EJECUTAR')")
        self.assertEqual(self.php({'view': 'Traductores/v.py', 'download': '1'}), "print('NO EJECUTAR')")

    def test_viewer_rejects_non_catalogued_and_unsafe_paths(self):
        for path in ('privado.txt', '../privado.txt', '.env', 'oculto.php', 'Traductores/../privado.txt'):
            with self.subTest(path=path):
                self.assertIn('Archivo no disponible', self.php({'view': path}))

    def test_no_catalog_has_no_empty_material_sections(self):
        (self.root / 'documentos_proyecto.json').unlink()
        self.assertNotIn('Programas y archivos adicionales', self.php())


if __name__ == '__main__':
    unittest.main()
