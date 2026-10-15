import ast
import json
from pathlib import Path
import re
import unittest


SOURCE = Path(__file__).resolve().parents[1] / "publica.py"


class ProseAuditTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        tree = ast.parse(SOURCE.read_text(encoding="utf-8"))
        function = next(node for node in tree.body
                        if isinstance(node, ast.FunctionDef) and node.name == "_leer_auditoria_lean")
        namespace = {"json": json, "re": re}
        exec(compile(ast.Module(body=[function], type_ignores=[]), str(SOURCE), "exec"), namespace)
        cls.read_audit = staticmethod(namespace[function.name])

    def test_preserves_prose_and_generator_origin_without_certifying_it(self):
        prose = {"node": "P", "source": "Un cierre no entero tiene desfase.\n", "status": "PRESERVED_NOT_FULLY_INTERPRETED"}
        pending = {"node": "P", "origin": "GENERATOR", "source_present": True,
                   "source_refuted": False, "partial_theorems": []}
        source = "\n".join([
            "-- DEMUESTRA_SOURCE_PROSE: " + json.dumps(prose),
            "-- DEMUESTRA_PENDING_PROOF: " + json.dumps(pending),
            "-- DEMUESTRA_ASSERTION: P|COMPLETA|NO_DETERMINADO",
            "-- DEMUESTRA_PROOF_COMPLETE: FALSE",
        ])
        audit = self.read_audit(source)
        self.assertEqual(audit["source_prose"], [prose])
        self.assertEqual(audit["pending_proof_details"], [pending])
        self.assertFalse(audit["proof_complete"])
        self.assertEqual(audit["assertions"][0]["proof_status"], "NO_DETERMINADO")

    def test_invalid_metadata_is_reported_not_silently_dropped(self):
        for payload in ("not json", "[]", '"text"'):
            audit = self.read_audit("-- DEMUESTRA_PENDING_PROOF: " + payload)
            self.assertEqual(audit["pending_proof_details"][0]["status"], "INVALID_AUDIT_MARKER")

    def test_indented_parameter_domain_retains_source_provenance(self):
        domain = {"node": "P_VED_E", "symbol": "lambda", "condition": "positive",
                  "scope": "WAVE_PARAMETER_DOMAIN"}
        audit = self.read_audit("  -- DEMUESTRA_SOURCE_DOMAIN: " + json.dumps(domain))
        self.assertEqual(audit["source_domains"], [domain])
        self.assertFalse(audit["proof_complete"])

    def test_transport_definition_preserves_its_source_without_global_certification(self):
        transport = {"node": "P_RHO_ISO", "method": "INVERSE_IMAGE_OF_STABLE_CLASS"}
        audit = self.read_audit("-- DEMUESTRA_TRANSPORT_DEFINITION: " + json.dumps(transport))
        self.assertEqual(audit["source_transports"], [transport])
        self.assertFalse(audit["proof_complete"])

    def test_legacy_sources_remain_readable(self):
        audit = self.read_audit("-- DEMUESTRA_ASSERTION: P|COMPLETA|VERIFICADA")
        self.assertEqual(audit["source_prose"], [])
        self.assertEqual(audit["pending_proof_details"], [])
        self.assertEqual(audit["assertions"][0]["proof_status"], "VERIFICADA")


if __name__ == "__main__":
    unittest.main()
