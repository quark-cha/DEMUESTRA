import hashlib
import json
from pathlib import Path
import subprocess
from types import SimpleNamespace
import unittest

from traductor_support import load_vendor


ROOT = Path(__file__).resolve().parents[1]
PROJECT = ROOT / "Proyectos" / "ES_46_RV6"


def git_source(revision, relative):
    return subprocess.check_output([
        "git", "-c", "safe.directory=" + ROOT.as_posix(),
        "show", revision + ":" + relative,
    ], cwd=ROOT).decode("utf-8").replace("\r\n", "\n")


class Integridad46Tests(unittest.TestCase):
    def test_active_markdown_preserves_formal_inventory_and_matches_mirror(self):
        source = PROJECT / "ES_46_RV6.md"
        pack = load_vendor("_integridad_46_revision")
        inventories = []
        for text in (git_source("66ad61b", "Proyectos/ES_46_RV6/ES_46_RV6.md"),
                     source.read_text(encoding="utf-8")):
            frontend = object.__new__(pack.lean.Lean)
            frontend.md = SimpleNamespace(texto=text, fichero=source)
            graph, _ = frontend._frontend()
            inventories.append([node["id"] for node in graph.nodes])
        expected = list(inventories[0])
        expected.insert(expected.index("P_VED_I") + 1, "D_mathcal_E_VED")
        self.assertEqual(expected, inventories[1])
        self.assertEqual(source.read_bytes(),
                         (ROOT.parent / "UNIHOLOG/ES_46_RV6.md").read_bytes())

    def test_historical_approval_keeps_its_own_sources(self):
        history = PROJECT / "historial" / "5020154"
        for name in ("ES_46_RV6.md", "ES_46_RV6.lean", "LEAN_ES_46_RV6.json"):
            self.assertEqual((history / name).read_text(encoding="utf-8"),
                             git_source("5020154", "Proyectos/ES_46_RV6/" + name))
        report = json.loads((history / "LEAN_ES_46_RV6.json").read_text(encoding="utf-8"))
        self.assertTrue(report["passed"])
        self.assertEqual(report["exit_code"], 0)
        self.assertIn("hCompat : TransversalCompatibilityForZeros IsZeroRim",
                      (history / "ES_46_RV6.lean").read_text(encoding="utf-8"))

    def test_partial_certificate_matches_current_lean_source(self):
        report = json.loads((PROJECT / "CERTIFICADO_PARCIAL_LEAN_ES_46_RV6.json").read_text(encoding="utf-8"))
        source = (PROJECT / report["source_file"]).read_text(encoding="utf-8")
        # The evaluator hashes decoded text with normalized line endings.
        self.assertEqual(report["source_sha256"], hashlib.sha256(source.encode("utf-8")).hexdigest())
        self.assertEqual(report["status"], "CERTIFICADO_PARCIAL")

    def test_public_json_reports_match_evaluation_copies(self):
        for name in ("LEAN", "PROLOG", "PROLOG_MD_DIRECTO", "AUDITORIA", "CERTIFICADO_PARCIAL_LEAN"):
            filename = name + "_ES_46_RV6.json"
            self.assertEqual((PROJECT / filename).read_bytes(),
                             (PROJECT / "evaluaciones" / filename).read_bytes())


if __name__ == "__main__":
    unittest.main()
