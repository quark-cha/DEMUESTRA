import re
from types import SimpleNamespace
import unittest

from traductor_support import ROOT, load_vendor

pack = load_vendor("_revision_md_notacion")


class NotacionTests(unittest.TestCase):
    def test_conditional_separator_is_not_an_identifier_or_product(self):
        node = pack.formal_ast.parse_formula(r"P(a\mid c)")
        given = node.children[0]
        self.assertEqual(given.kind, "binary")
        self.assertEqual(given.value, "GIVEN")
        table = pack.formal_semantic.SemanticAnalyzer.default_symbols()
        table.functions["P"] = pack.formal_semantic.FunctionType(("Real",), "Real")
        with self.assertRaisesRegex(pack.formal_semantic.FormalSemanticError,
                                    "LIMITACION_DEL_TRADUCTOR"):
            pack.formal_semantic.SemanticAnalyzer(table).analyze(node)

    def test_source_and_mirror_are_identical(self):
        source = ROOT / "Proyectos/ES_52/ES_52_Maquina_V_UNIHOLOG.md"
        mirror = ROOT.parent / "UNIHOLOG/ES_52_Maquina_V_UNIHOLOG.md"
        self.assertEqual(source.read_bytes(), mirror.read_bytes())

    def test_corrections_preserve_all_formal_nodes(self):
        source = ROOT / "Proyectos/ES_52/ES_52_Maquina_V_UNIHOLOG.md"
        previous = ROOT / "documentacion/ES_52/respaldos/md_notacion_20261008/DEMUESTRA_antes.md"
        graphs = []
        for path in (previous, source):
            frontend = object.__new__(pack.lean.Lean)
            frontend.md = SimpleNamespace(texto=path.read_text(encoding="utf-8-sig"), fichero=path)
            graph, classified = frontend._frontend()
            graphs.append(graph)
            self.assertEqual(len(classified), 35)
        self.assertEqual([n["id"] for n in graphs[0].nodes], [n["id"] for n in graphs[1].nodes])
        text = source.read_text(encoding="utf-8-sig")
        self.assertNotRegex(text, r"\\(?:alphae|betae)\b")
        self.assertIn(r"\alpha e_{0}+\beta e_{1}", text)
        self.assertIn(r"P_V(a_k\mid", text)
        self.assertIn(r"\sum_{a\in\mathcal A}\sum_{\nu\in\mathcal N_a}", text)
        self.assertIn(r"{p_a},\qquad p_a>0", text)
        self.assertNotRegex(text, r"(?m)^```(?:lean|lean4)\s*$")

    def test_es46_generation_does_not_modify_authoritative_source(self):
        source = ROOT / "Proyectos/ES_46_RV6/ES_46_RV6.md"
        before = source.read_bytes()
        frontend = object.__new__(pack.lean.Lean)
        frontend.md = SimpleNamespace(texto=source.read_text(encoding="utf-8-sig"), fichero=source)
        frontend._generar()
        self.assertEqual(source.read_bytes(), before)


if __name__ == "__main__":
    unittest.main()
