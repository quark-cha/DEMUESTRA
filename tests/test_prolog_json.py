import json
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SWIPL = shutil.which("swipl")
if SWIPL is None:
    for candidate in (Path(r"C:\Program Files\swipl\bin\swipl.exe"),
                      Path(r"C:\Program Files\SWI-Prolog\bin\swipl.exe")):
        if candidate.is_file():
            SWIPL = str(candidate)
            break


@unittest.skipUnless(SWIPL, "SWI-Prolog no disponible")
class PrologJsonTests(unittest.TestCase):
    def evaluate(self, nodes, goal="T"):
        with tempfile.TemporaryDirectory() as temp:
            path = Path(temp) / "initial.json"
            path.write_text(json.dumps({"nodes": nodes}), encoding="utf-8")
            return subprocess.run([SWIPL, "-q", "-s", str(ROOT / "PckDemuestra/audita_json.pl"),
                                   "--", str(path), goal], capture_output=True,
                                  text=True, encoding="utf-8", timeout=30)

    def test_goal_reachable_from_declared_premises(self):
        result = self.evaluate([
            {"id": "D", "kind": "definition", "deps": []},
            {"id": "P", "kind": "proposition", "deps": ["D"]},
            {"id": "T", "kind": "theorem", "deps": ["P"]}])
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("OBJETIVO_ALCANZABLE_DESDE_PREMISAS_DECLARADAS", result.stdout)

    def test_missing_premise_does_not_close_goal(self):
        self.assertEqual(self.evaluate([{"id": "T", "kind": "theorem", "deps": ["absent"]}]).returncode, 1)

    def test_circular_rules_without_facts_do_not_prove_goal(self):
        self.assertEqual(self.evaluate([
            {"id": "T", "kind": "theorem", "deps": ["P"]},
            {"id": "P", "kind": "proposition", "deps": ["T"]}]).returncode, 1)

    def test_root_theorem_is_not_assumed_as_fact(self):
        self.assertEqual(self.evaluate([{"id": "T", "kind": "theorem", "deps": []}]).returncode, 1)

    def test_nonexistent_goal_does_not_succeed(self):
        self.assertEqual(self.evaluate([{"id": "D", "kind": "definition", "deps": []}]).returncode, 1)


if __name__ == "__main__":
    unittest.main()
