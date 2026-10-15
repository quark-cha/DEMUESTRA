import ast
import contextlib
import io
import re
import shutil
import tempfile
from types import SimpleNamespace
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "publica.py"


class PublicacionAisladaTests(unittest.TestCase):
    def load_force_functions(self, namespace):
        tree = ast.parse(SOURCE.read_text(encoding="utf-8"))
        functions = [node for node in tree.body if isinstance(node, ast.FunctionDef)
                     and node.name in {"_forzado_todos", "_proyecto_forzado", "_extraer_proyectos_forzados_cli"}]
        namespace["re"] = re
        exec(compile(ast.Module(body=functions, type_ignores=[]), str(SOURCE), "exec"), namespace)

    def execute_flow(self, pending, failures, results):
        tree = ast.parse(SOURCE.read_text(encoding="utf-8"))
        block = next(node for node in ast.walk(tree)
                     if isinstance(node, ast.If) and isinstance(node.test, ast.BinOp)
                     and isinstance(node.test.right, ast.Constant) and node.test.right.value == 64
                     and any(isinstance(child, ast.Assign) and any(
                         isinstance(t, ast.Name) and t.id == "proyectos_publicables"
                         for t in child.targets) for child in node.body))
        evaluated, uncertified, returned, uploaded, prepared = [], [], [], [], []

        def evaluate(names):
            self.assertEqual(len(names), 1)
            evaluated.extend(names)
            return results[names[0]]

        class Publisher:
            def __init__(self, ftp, **options):
                self.local_dir = options["local_dir"]

            def sync(self):
                uploaded.append(self.local_dir)

        ns = {
            "TEST": 64, "LOCAL_ONLY": False, "errores_derivados": [],
            "seleccion_aislada": False,
            "fallos_traduccion": failures, "proyectos_pendientes_ejecucion": pending,
            "_proyectos_publicables_web": lambda: list(pending),
            "preparar_demostraciones_web": lambda names, sin_evaluacion: prepared.append(
                (list(names), set(sin_evaluacion))),
            "MARKDOWNS_DEMOSTRACIONES_WEB_PREPARADOS": {},
            "_index_proyectos_web": lambda: None,
            "evaluar_formalizaciones_proyectos": evaluate,
            "evaluar_prolog_md_directo": lambda name: False,
            "evaluar_prolog_json_inicial": lambda name: False,
            "preparar_json_publico_no_certificado": uncertified.append,
            "devolver_fuentes_verificadas": lambda names: returned.extend(names),
            "PROJECT_ROOT": ROOT, "FTPClient": object, "WebPublisher": Publisher,
            "_nombre_proyecto_web": lambda name: name,
            "_proyecto_dir": lambda name: ROOT / "Proyectos" / name,
            "DEMOSTRACIONES_WEB_EXTENSIONS": {".md", ".pdf", ".json"},
            "publicar_adjuntos_proyecto": lambda ftp, name: None,
        }
        with contextlib.redirect_stdout(io.StringIO()):
            exec(compile(ast.Module(body=[block], type_ignores=[]), str(SOURCE), "exec"), ns)
        for name in pending:
            self.assertIn(ROOT / "Proyectos" / name, uploaded)
        self.assertEqual(prepared, [(pending, set(failures))])
        return ns["cerrado"], evaluated, uncertified, returned

    def test_translation_failure_does_not_degrade_success(self):
        self.assertEqual(self.execute_flow(["A", "B"], {"B": {}}, {"A": True}),
                         (False, ["A"], [], ["A"]))

    def test_success_keeps_normal_flow(self):
        self.assertEqual(self.execute_flow(["A", "B"], {}, {"A": True, "B": True}),
                         (True, ["A", "B"], [], ["A", "B"]))

    def test_unclosed_result_is_isolated(self):
        self.assertEqual(self.execute_flow(["A", "B"], {}, {"A": True, "B": False}),
                         (False, ["A", "B"], ["B"], ["A"]))

    def test_all_translation_failures_still_publish(self):
        self.assertEqual(self.execute_flow(["A", "B"], {"A": {}, "B": {}}, {}),
                         (False, [], [], []))

    def test_arbitrary_names_and_order(self):
        self.assertEqual(self.execute_flow(["Circuito_Z", "Documento_X", "Teoria_Y"],
                         {"Circuito_Z": {}}, {"Documento_X": False, "Teoria_Y": True}),
                         (False, ["Documento_X", "Teoria_Y"], ["Documento_X"], ["Teoria_Y"]))

    def test_empty_queue(self):
        self.assertEqual(self.execute_flow([], {}, {}), (True, [], [], []))

    def test_force_only_selected_project_and_reset(self):
        tree = ast.parse(SOURCE.read_text(encoding="utf-8"))
        function = next(node for node in tree.body if isinstance(node, ast.FunctionDef)
                        and node.name == "_proyectos_pendientes_web")
        forced = set()
        ns = {
            "PROJECT_ROOT": ROOT, "PROYECTOS_FORZADOS_WEB": forced,
            "_nombres_proyectos": lambda root: ["Circuito_A", "Documento_B"],
            "_proyecto_dir": lambda name: Path("Carpeta_B" if name == "Documento_B" else name),
            "_proyecto_completado_con_hash_vigente": lambda name: True,
        }
        self.load_force_functions(ns)
        exec(compile(ast.Module(body=[function], type_ignores=[]), str(SOURCE), "exec"), ns)
        with contextlib.redirect_stdout(io.StringIO()):
            self.assertEqual(ns[function.name](), [])
            forced.add("Documento_B")
            self.assertEqual(ns[function.name](), ["Documento_B"])
            forced.clear()
            self.assertEqual(ns[function.name](), [])
            forced.add("Carpeta_B")
            self.assertEqual(ns[function.name](), ["Documento_B"])
            forced.clear()
            self.assertEqual(ns[function.name](), [])

    def test_force_propagates_only_to_selected_document(self):
        tree = ast.parse(SOURCE.read_text(encoding="utf-8"))
        assignment = next(node for node in ast.walk(tree) if isinstance(node, ast.Assign)
                          and any(isinstance(t, ast.Attribute) and t.attr == "forzado"
                                  for t in node.targets))
        compiled = compile(ast.Module(body=[assignment], type_ignores=[]), str(SOURCE), "exec")
        for name, is_project, forced, expected in (
            ("Circuito_A", True, {"Documento_B"}, False),
            ("Documento_B", True, {"Documento_B"}, True),
            ("Documento_B", True, {"Carpeta_B"}, True),
            ("Documento_B", True, set(), False),
            ("README", False, {"README"}, False),
            ("README", False, {"todos"}, True),
            ("Circuito_A", True, {"todos"}, True),
        ):
            doc = SimpleNamespace(forzado=False)
            ns = {
                "md_obj": doc, "es_proyecto": is_project, "fuente": Path(name + ".md"),
                "PROYECTOS_FORZADOS_WEB": forced,
                "_proyecto_dir": lambda source: Path("Carpeta_B" if source == "Documento_B" else source),
            }
            self.load_force_functions(ns)
            exec(compiled, ns)
            self.assertEqual(doc.forzado, expected)

    def test_cli_normal_number_all_and_legacy(self):
        ns = {}
        self.load_force_functions(ns)
        parse = ns["_extraer_proyectos_forzados_cli"]
        for args, expected in (
            (["publica.py"], set()),
            (["publica.py", "forzado=46"], {"46"}),
            (["publica.py", "forzado=todos"], {"todos"}),
            (["publica.py", "forzado=123,456"], {"123", "456"}),
            (["publica.py", "--forzar-proyecto", "ES_123_Fuente"], {"ES_123_Fuente"}),
        ):
            forced, remaining = parse(args)
            self.assertEqual(forced, expected)
            self.assertEqual(remaining, ["publica.py"])
        with self.assertRaises(SystemExit):
            parse(["publica.py", "forzado="])

    def test_number_matches_exact_project_number_and_all_is_temporary(self):
        forced = set()
        ns = {"PROYECTOS_FORZADOS_WEB": forced,
              "_proyecto_dir": lambda name: Path(name.split("_Fuente")[0])}
        self.load_force_functions(ns)
        selected = ns["_proyecto_forzado"]
        self.assertFalse(selected("ES_123_Fuente"))
        forced.add("123")
        self.assertTrue(selected("ES_123_Fuente"))
        self.assertFalse(selected("ES_1234_Fuente"))
        self.assertFalse(selected("ES_456_Fuente"))
        forced.clear()
        forced.add("todos")
        self.assertTrue(selected("ES_123_Fuente"))
        self.assertTrue(selected("ES_456_Fuente"))
        forced.clear()
        self.assertFalse(selected("ES_123_Fuente"))
        self.assertFalse(ns["_forzado_todos"]())

    def test_editorial_preparation_does_not_require_or_move_formal_files(self):
        tree = ast.parse(SOURCE.read_text(encoding="utf-8"))
        function = next(node for node in tree.body if isinstance(node, ast.FunctionDef)
                        and node.name == "_mover_derivados_generados_al_proyecto")
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            project = root / "Proyectos" / "Documento"
            project.mkdir(parents=True)
            (root / "json").mkdir()
            (root / "lean").mkdir()
            (root / "json" / "Documento.json").write_text("{}", encoding="utf-8")
            historical = root / "lean" / "Documento.lean"
            historical.write_text("-- historical", encoding="utf-8")
            ns = {"PROJECT_ROOT": root, "shutil": shutil}
            exec(compile(ast.Module(body=[function], type_ignores=[]), str(SOURCE), "exec"), ns)
            with contextlib.redirect_stdout(io.StringIO()):
                moved = ns[function.name]("Documento", project, incluir_formales=False)
            self.assertEqual(set(moved), {".json"})
            self.assertTrue((project / "Documento.extracted.json").is_file())
            self.assertEqual(historical.read_text(encoding="utf-8"), "-- historical")
            self.assertFalse((project / "Documento.lean").exists())

    def test_normal_preparation_still_requires_formal_files(self):
        tree = ast.parse(SOURCE.read_text(encoding="utf-8"))
        function = next(node for node in tree.body if isinstance(node, ast.FunctionDef)
                        and node.name == "_mover_derivados_generados_al_proyecto")
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            project = root / "Proyectos" / "Documento"
            project.mkdir(parents=True)
            (root / "json").mkdir()
            (root / "json" / "Documento.json").write_text("{}", encoding="utf-8")
            ns = {"PROJECT_ROOT": root, "shutil": shutil}
            exec(compile(ast.Module(body=[function], type_ignores=[]), str(SOURCE), "exec"), ns)
            with contextlib.redirect_stdout(io.StringIO()), self.assertRaises(FileNotFoundError):
                ns[function.name]("Documento", project)


if __name__ == "__main__":
    unittest.main()
