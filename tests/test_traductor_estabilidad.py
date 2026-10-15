from types import SimpleNamespace
import importlib
import json
import re
from collections import Counter
import unittest

from traductor_support import ROOT, load_vendor


pack = load_vendor("_demuestra_estabilidad_test")
backend_module = importlib.import_module(pack.__name__ + ".formal_lean_backend")
parse = pack.formal_ast.parse_formula


def infer(*sources):
    nodes = [SimpleNamespace(declarations=[SimpleNamespace(ast=parse(source))], claims=[], steps=[])
             for source in sources]
    return pack.formal_symbols.SymbolInference().infer(nodes)


class EstabilidadTests(unittest.TestCase):
    def test_stable_tuple_types_keep_the_real_phase_coordinate(self):
        sources = (r"E=\{(k,\rho):k\in\mathbb N^+,\rho\in[0,1/2],\rho=0\}",
                   r"E=\{(k,0):k\in\mathbb N^+\}")
        for ordered in (sources, tuple(reversed(sources))):
            symbols = infer(*ordered)
            self.assertEqual(symbols.values["E"], "Set[Tuple[Nat,Real]]")
            analyzer = pack.formal_semantic.SemanticAnalyzer(symbols)
            for formula in ordered:
                self.assertEqual(analyzer.analyze(parse(formula)), "Prop")

    def test_tuple_comprehension_binds_both_parameters(self):
        source = r"E=\{(k,\rho):k\in\mathbb N^+,\rho\in[0,1/2],\rho=0\}"
        emitter = pack.formal_semantic.LeanExpressionEmitter(
            resolver=lambda name: "ctx." + name, symbols=infer(source))
        output = emitter.emit(parse(source))
        self.assertIn("∃ k : ℕ, ∃ rho : ℝ", output)
        self.assertIn("x = ((k, rho))", output)
        self.assertNotIn("ctx.rho", output)
        self.assertEqual(emitter.bound, set())

    def test_sum_index_does_not_change_the_real_cycle_count(self):
        symbols = infer(r"n\in\mathbb R^+", r"\zeta(s)=\sum_{n=1}^{\infty}\frac{1}{n^s}")
        self.assertEqual(symbols.values["n"], "Real")

    def test_enumeration_is_not_proved_without_its_source_definition(self):
        source = ROOT / "Proyectos/ES_46_RV6/ES_46_RV6.md"
        frontend = object.__new__(pack.lean.Lean)
        frontend.md = SimpleNamespace(texto=source.read_text(encoding="utf-8-sig"), fichero=source)
        _, nodes = frontend._frontend()
        backend = backend_module.LeanBackend(nodes, "Test")
        target = "((ctx.rho = 0)) → (ctx.mathcal_E_VED = ({x | ∃ k : ℕ, (k ∈ {x : ℕ | 0 < x}) ∧ (x = ((k, 0)))}))"
        lines = []
        self.assertFalse(backend._emit_document_derivation(
            lines, "P_VED_K_E", "", target, [], [], {}))
        self.assertEqual(lines, [])

    def test_recovered_spectral_source_keeps_original_equations(self):
        source = (ROOT / "Proyectos/ES_46_RV6/ES_46_RV6.md").read_text(encoding="utf-8-sig")
        historical = (ROOT.parent / "UNIHOLOG/historico_46/ES_46_Revision3_completa_y_rigurosa.md").read_text(encoding="utf-8-sig")
        original = historical.split("# 7. Origen geométrico del factor $1/2$", 1)[1].split("# 12.", 1)[0]
        recovered = source.split("## 10.1. Origen geométrico del factor $1/2$", 1)[1].split("# 11. Construcción", 1)[0]
        original_formulas = re.findall(r"\$\$(.*?)\$\$", original, re.S)
        recovered_formulas = re.findall(r"\$\$(.*?)\$\$", recovered, re.S)
        # The author requested removing this explanatory passage, not changing its other equations.
        disputed = "s=\\frac12"
        original_formulas = [formula for formula in original_formulas if formula.strip() != disputed]
        old_quantifier = "\\boxed{\n\\Re[s_{Z,\\pm}(k)]\n=\n\\frac12\n\\qquad\n\\forall k\\in\\mathbb N^+.\n}"
        new_quantifier = "\\boxed{\n\\forall k\\in\\mathbb N^+,\\qquad\n\\Re[s_{Z,\\pm}(k)]\n=\n\\frac12.\n}"
        self.assertIn(old_quantifier, [formula.strip() for formula in original_formulas])
        original_formulas = [formula.replace(old_quantifier, new_quantifier) for formula in original_formulas]
        self.assertEqual(original_formulas, recovered_formulas)
        self.assertNotIn(r"\mathcal D x=0", recovered)
        self.assertNotIn("Este símbolo no es por sí solo", recovered)
        self.assertNotIn("El desarrollo no afirma", recovered)
        self.assertEqual(source, (ROOT.parent / "UNIHOLOG/ES_46_RV6.md").read_text(encoding="utf-8-sig"))

    def test_half_open_intervals_keep_the_open_endpoint(self):
        for source, constructor in ((r"(0,1/2]", "Ioc"), (r"[0,1/2)", "Ico")):
            node = parse(source)
            self.assertEqual(node.kind, "interval")
            self.assertEqual(node.value, constructor)
            emitted = pack.formal_semantic.LeanExpressionEmitter(symbols=infer(source)).emit(node)
            self.assertTrue(emitted.startswith("Set." + constructor + " "))
        self.assertEqual(parse("(0,1)").kind, "tuple")
        self.assertEqual(parse("[0,1]").kind, "interval")

    def test_distance_to_positive_integers_has_native_metric_meaning(self):
        source = r"\operatorname{dist}(n,\mathbb N^+)"
        symbols = infer(source)
        emitted = pack.formal_semantic.LeanExpressionEmitter(symbols=symbols).emit(parse(source))
        self.assertIn("Metric.infDist", emitted)
        self.assertIn("0 < x", emitted)
        self.assertIn("distance_element : ℕ", emitted)
        self.assertNotIn("dist_fn", emitted)
        self.assertEqual(pack.formal_semantic.SemanticAnalyzer(symbols).analyze(parse(source)), "Real")

    def test_point_distance_is_not_set_distance(self):
        source = r"\operatorname{dist}(x,y)"
        symbols = infer(source)
        emitted = pack.formal_semantic.LeanExpressionEmitter(symbols=symbols).emit(parse(source))
        self.assertTrue(emitted.startswith("dist ("))
        self.assertNotIn("Metric.infDist", emitted)

    def test_distance_rejects_proposition_arguments(self):
        symbols = infer(r"\operatorname{dist}(x,y)")
        symbols.values["y"] = "Prop"
        with self.assertRaises(pack.formal_semantic.FormalSemanticError):
            pack.formal_semantic.SemanticAnalyzer(symbols).analyze(parse(r"\operatorname{dist}(x,y)"))

    def discover(self, source):
        formula = SimpleNamespace(ast=parse(source), source=source)
        node = SimpleNamespace(declarations=[], claims=[formula], steps=[],
                               source=SimpleNamespace(kind="proposition", node_id="P_TEST"))
        backend = object.__new__(backend_module.LeanBackend)
        backend.nodes = [node]
        backend.symbols = infer(source)
        backend.text_definitions = {}
        backend._discover_text_definitions()
        return backend

    def test_equivalence_chain_preserves_stability_labels(self):
        backend = self.discover(r"\rho=0\iff n=k\iff L=k\lambda\iff\text{cierre exacto en fase}\iff\text{estado estable}")
        for label in ("cierre_exacto_en_fase", "estado_estable"):
            self.assertEqual(backend.text_definitions[label], parse(r"\rho=0"))
            self.assertEqual(backend.text_definition_sources[label]["node"], "P_TEST")

    def test_local_conditional_does_not_define_global_stability(self):
        backend = self.discover(r"q=1\Rightarrow(\rho=0\iff\text{estado estable})")
        self.assertEqual(backend.text_definitions, {})

    def test_mathematical_equalities_are_not_replaced_by_definitions(self):
        backend = self.discover(r"\rho=0\iff n=k")
        self.assertEqual(backend.text_definitions, {})

    def test_integer_closure_is_not_invented_without_stability_definition(self):
        backend = self.discover(r"\rho=0\iff n=k")
        self.assertEqual(backend._integer_closure_derivation(), [])

    def test_integer_closure_is_not_invented_without_distance_definition(self):
        backend = self.discover(r"\rho=0\iff\text{estado estable}")
        backend.emitter = pack.formal_semantic.LeanExpressionEmitter(
            lambda name, arity=0: "ctx." + name, backend.symbols,
        )
        self.assertEqual(backend._integer_closure_derivation(), [])

    def test_positive_domain_requires_explicit_source_and_real_parameter(self):
        backend = object.__new__(backend_module.LeanBackend)
        backend.value_definitions = {}
        backend.symbols = SimpleNamespace(values={"lambda": "Real"})
        declaration = r"La materia se representa en este marco como una onda de longitud de onda Compton positiva $\lambda$."
        for prose, expected in ((declaration, {"lambda"}),
                                (declaration.replace(" positiva", ""), set()),
                                ("Si " + declaration, set())):
            backend.nodes = [SimpleNamespace(source=SimpleNamespace(node_id="P", prose=prose))]
            self.assertEqual(set(backend._discover_positive_domains()), expected)
        backend.symbols.values["lambda"] = "Prop"
        backend.nodes[0].source.prose = declaration
        self.assertEqual(backend._discover_positive_domains(), {})

    def test_positive_length_is_not_invented_without_parameter_domain(self):
        backend = object.__new__(backend_module.LeanBackend)
        backend.positive_domains = {}
        self.assertEqual(backend._positive_length_derivation(
            "D_L", "(ctx.L = (ctx.n * ctx.lambda)) ∧ (ctx.n ∈ {x : ℝ | 0 < x})"), [])

    def test_es46_keeps_source_and_has_interpreted_stability(self):
        source = ROOT / "Proyectos/ES_46_RV6/ES_46_RV6.md"
        before = source.read_bytes()
        self.assertIn("Concepto primordial: estabilidad de la materia como onda cerrada", before.decode("utf-8-sig"))
        restored = before.decode("utf-8-sig")
        self.assertIn(r"\forall k\in\mathbb N^+,\qquad n=k\Rightarrow\rho=0.", restored)
        self.assertIn("No afirma que todos esos valores se realicen en la naturaleza", restored)
        self.assertIn("$n=L/\\lambda$ es el número exacto de ciclos", restored)
        self.assertIn("todo cierre estable tiene un número exacto de ciclos entero positivo", restored)
        self.assertIn("presencia de cada valor de $k$ en la naturaleza", restored)
        self.assertIn("de ciclos $n>0$ no es entero", restored)
        self.assertIn("exactamente en fase y, por el criterio de $U_{\\rm VED}$, no es estable", restored)
        self.assertIn("Como asignaciones físicas del marco Einstein–VED", restored)
        for example in ("k=2", "k=4", "k=137"):
            self.assertIn(example, restored)
        self.assertIn("## 10.2. Operador espectral desplazado", restored)
        self.assertIn(r"ds(t)=ds_0e^{\mu t}", restored)
        self.assertIn("s=\\mu+\\frac12.", restored)
        self.assertIn(r"s_{Z,\pm}(k)", restored)
        self.assertIn("8ee5d60:SRC-VED/UNIHOLOG/", restored)
        self.assertNotIn("El desarrollo no afirma", restored)
        self.assertNotIn("Este símbolo no es por sí solo", restored)
        frontend = object.__new__(pack.lean.Lean)
        frontend.md = SimpleNamespace(texto=source.read_text(encoding="utf-8-sig"), fichero=source)
        output = frontend._generar()
        self.assertIn("Operador espectral desplazado", output)
        self.assertEqual(before, source.read_bytes())
        self.assertIn("Metric.infDist", output)
        self.assertIn("def Derived_Text_estado_estable", output)
        self.assertNotIn("  Text_estado_estable : Prop", output)
        self.assertNotIn("  dist_fn_2 :", output)
        self.assertIn("-- DEMUESTRA_TEXT_DEFINITION:", output)
        self.assertNotIn("SourceAssumption", output)
        self.assertIn("theorem derive_P_VED_I ", output)
        self.assertIn("-- DEMUESTRA_ASSERTION: P_VED_I|COMPLETA|VERIFICADA", output)
        self.assertIn("theorem derive_P_VED_E ", output)
        self.assertIn("theorem derive_P_VED_K_E ", output)
        self.assertIn("mathcal_E_VED : Set (ℕ × ℝ)", output)
        self.assertIn("-- DEMUESTRA_ASSERTION: P_VED_E|COMPLETA|VERIFICADA", output)
        self.assertIn("PositiveDomain_lambda : 0 < lambda", output)
        self.assertIn("mul_right_cancel₀ h_nonzero", output)
        self.assertIn("DEMUESTRA_SOURCE_DOMAIN:", output)
        self.assertIn("theorem positive_closure_length_from_D_L ", output)
        self.assertIn("def Derived_Stable_Rim ", output)
        self.assertNotIn("  Stable_Rim_fn_1 :", output)
        self.assertIn("theorem derive_P_RIM_S ", output)
        self.assertIn("-- DEMUESTRA_ASSERTION: P_RIM_S|COMPLETA|VERIFICADA", output)
        self.assertIn("DEMUESTRA_TRANSPORT_DEFINITION:", output)
        self.assertIn("def FormalContext.rho_R_fn_1 ", output)
        self.assertNotIn("  rho_R_fn_1 :", output)
        self.assertIn("theorem critical_strip_in_transversal_universe ", output)
        self.assertIn("theorem nontrivial_zero_in_transversal_universe ", output)
        self.assertIn("theorem nontrivial_zero_stability_iff_critical_line ", output)
        self.assertIn("DEMUESTRA_COORDINATE_DEFINITION:", output)
        self.assertIn("-- DEMUESTRA_ASSERTION: P_VR_E|COMPLETA|VERIFICADA", output)
        self.assertIn("DEMUESTRA_TEXT_COORDINATE_SCOPE:", output)
        self.assertIn("def FormalContext.R_rho_fn_1 ", output)
        self.assertIn("def FormalContext.R_rho_inv_fn_1 ", output)
        self.assertNotIn("  R_rho_fn_1 :", output)
        self.assertIn("theorem transversal_map_preserves_distance ", output)
        self.assertIn("theorem transversal_maps_are_inverse ", output)
        self.assertIn("theorem derive_P_VR_rho_forward_coordinate ", output)
        self.assertIn("theorem derive_P_VR_rho_inverse_coordinate ", output)
        graph, nodes = frontend._frontend()
        prose = [json.loads(s) for s in re.findall(r"^-- DEMUESTRA_SOURCE_PROSE: (.*)$", output, re.MULTILINE)]
        self.assertEqual({item["node"]: item["source"] for item in prose},
                         {item.source.node_id: item.source.prose for item in nodes})
        pending = [json.loads(s) for s in re.findall(r"^-- DEMUESTRA_PENDING_PROOF: (.*)$", output, re.MULTILINE)]
        pending_nodes = set(re.findall(r"^-- DEMUESTRA_ASSERTION: (\w+)\|COMPLETA\|NO_DETERMINADO$", output, re.MULTILINE))
        self.assertEqual({item["node"] for item in pending}, pending_nodes)
        self.assertEqual(len(pending), 6)
        self.assertNotIn("P_VED_K_E", pending_nodes)
        transported = next(item for item in pending if item["node"] == "P_VR_rho")
        coordinate_proofs = [item for item in transported["partial_theorems"]
                            if item.get("scope") == "CORRESPONDING_POINTS_IN_DECLARED_DOMAINS"]
        self.assertEqual({item["theorem"] for item in coordinate_proofs}, {
            "derive_P_VR_rho_forward_coordinate", "derive_P_VR_rho_inverse_coordinate",
        })
        self.assertIn("ctx.rho_VED = ctx.rho_R", transported["pending_parts"])
        self.assertNotIn("P_RIM_S", {item["node"] for item in pending})
        self.assertNotIn("P_VR_E", {item["node"] for item in pending})
        self.assertTrue(all(item["verification_state"] == "VERIFICACION_FORMAL_PENDIENTE" for item in pending))
        self.assertTrue(all(item["source_present"] and not item["source_refuted"] for item in pending))
        self.assertIn("theorem stable_closure_iff_integer", output)
        self.assertIn("theorem noninteger_closure_not_stable", output)
        self.assertIn("DEMUESTRA_INTEGER_CLOSURE_SOURCE:", output)
        self.assertIn("closed.mem_iff_infDist_zero nonempty", output)

    def test_transport_is_not_invented_from_the_target_theorem_alone(self):
        source = ROOT / "Proyectos/ES_46_RV6/ES_46_RV6.md"
        frontend = object.__new__(pack.lean.Lean)
        text = source.read_text(encoding="utf-8-sig").replace(
            r"se conservan tanto por $f$ como por $f^{-1}$", "")
        frontend.md = SimpleNamespace(texto=text, fichero=source)
        output = frontend._generar()
        self.assertNotIn("def Derived_Stable_Rim ", output)
        self.assertNotIn("theorem derive_P_RIM_S_transported_stability ", output)
        self.assertIn("  Stable_Rim_fn_1 :", output)

    def test_coordinate_formula_is_not_taken_from_an_unproved_theorem(self):
        backend = object.__new__(backend_module.LeanBackend)
        backend.symbols = pack.formal_semantic.SemanticAnalyzer.default_symbols()
        backend.symbols.values["z"] = "Complex"
        backend.symbols.values["rho_R"] = "Real"
        backend.symbols.functions["rho_R"] = pack.formal_semantic.FunctionType(("Complex",), "Real")
        backend.emitter = pack.formal_semantic.LeanExpressionEmitter(
            lambda name, arity=0: "ctx." + name, backend.symbols)
        formula = SimpleNamespace(ast=parse(r"\rho_R=|\Re(z)-\frac12|"), source="coordinate")
        node = SimpleNamespace(source=SimpleNamespace(kind="definition", node_id="D", formulas=[formula]))
        backend.nodes = [node]
        self.assertEqual(backend._discover_coordinate_definitions()["rho_R"]["node"], "D")
        node.source.kind = "theorem"
        self.assertEqual(backend._discover_coordinate_definitions(), {})

    def test_point_transport_is_not_invented_without_coordinate_preservation(self):
        source = ROOT / "Proyectos/ES_46_RV6/ES_46_RV6.md"
        text = source.read_text(encoding="utf-8-sig")
        frontend = object.__new__(pack.lean.Lean)
        frontend.md = SimpleNamespace(texto=text, fichero=source)
        _, nodes = frontend._frontend()
        backend = backend_module.LeanBackend(nodes, "Test")
        lines = []
        # No coordinate-preservation dependency is available in this invocation.
        partial = backend._emit_partial_derivations(
            lines, "P_VR_rho", "", "ctx.rho_VED = ctx.rho_R", [], [], {},
        )
        self.assertFalse(any(item.get("scope") == "CORRESPONDING_POINTS_IN_DECLARED_DOMAINS"
                             for item in partial))
        self.assertNotIn("derive_P_VR_rho_inverse_coordinate", "\n".join(lines))

    def test_local_stability_coordinate_is_not_invented_when_source_binding_is_absent(self):
        source = ROOT / "Proyectos/ES_46_RV6/ES_46_RV6.md"
        original = source.read_text(encoding="utf-8-sig")
        binding = "\\rho_{\\rm VED}=0\n\\iff\n\\text{estado estable}."
        self.assertIn(binding, original)
        frontend = object.__new__(pack.lean.Lean)
        frontend.md = SimpleNamespace(texto=original.replace(binding, r"\rho_{\rm VED}\ge0."), fichero=source)
        output = frontend._generar()
        self.assertNotIn("theorem derive_P_VR_E ", output)
        self.assertIn("-- DEMUESTRA_ASSERTION: P_VR_E|COMPLETA|NO_DETERMINADO", output)

    def test_map_identity_is_not_invented_from_an_isolated_equality(self):
        source = ROOT / "Proyectos/ES_46_RV6/ES_46_RV6.md"
        frontend = object.__new__(pack.lean.Lean)
        frontend.md = SimpleNamespace(texto=re.sub(r"(?m)^por\s*$", "", source.read_text(encoding="utf-8-sig")), fichero=source)
        output = frontend._generar()
        self.assertNotIn("def FormalContext.R_rho_fn_1 ", output)
        self.assertNotIn("theorem transversal_maps_are_inverse ", output)

    def test_json_preserves_all_declarations_and_display_formulas(self):
        source = ROOT / "Proyectos/ES_46_RV6/ES_46_RV6.md"
        text = source.read_text(encoding="utf-8")
        json_module = importlib.import_module(pack.__name__ + ".json")
        graph_module = importlib.import_module(pack.__name__ + ".formal")
        frontend = object.__new__(json_module.Json)
        frontend.md = SimpleNamespace(texto=text, fichero=source)
        output = json.loads(frontend._generar())
        graph = graph_module.FormalGraph(frontend.md)
        self.assertEqual({node["id"] for node in output["nodes"]},
                         {node["id"] for node in graph.nodes})
        displays = lambda value: Counter(re.findall(r"\$\$(.*?)\$\$", value, re.DOTALL))
        represented = Counter()
        for node in output["nodes"]:
            represented.update(displays(node["description"]))
            self.assertFalse(any(key.startswith(("lean", "prolog")) for key in node))
            original = node["source"].get("restatement_of")
            if original:
                self.assertIn(original, node["deps"])
        self.assertEqual(displays(text), represented)


if __name__ == "__main__":
    unittest.main()
