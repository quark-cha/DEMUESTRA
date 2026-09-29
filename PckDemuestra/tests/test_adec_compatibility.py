import unittest

from publica import _validar_nodos_adec


class AdecCompatibilityTests(unittest.TestCase):
    def test_requires_nodes(self):
        with self.assertRaisesRegex(ValueError, "atributo nodes"):
            _validar_nodos_adec({})

    def test_accepts_complete_graph(self):
        data = {
            "nodes": [
                {
                    "id": "A",
                    "kind": "foundation",
                    "name": "Base",
                    "description": "Base declarada",
                    "deps": [],
                },
                {
                    "id": "T",
                    "kind": "theorem",
                    "name": "Resultado",
                    "description": "Resultado derivado",
                    "deps": ["A"],
                    "proof": {"status": "verified", "steps": ["A implica T"]},
                },
            ]
        }
        self.assertEqual(2, _validar_nodos_adec(data))

    def test_rejects_missing_dependencies(self):
        data = {
            "nodes": [
                {
                    "id": "T",
                    "kind": "theorem",
                    "name": "Resultado",
                    "description": "Resultado derivado",
                    "deps": ["A_INEXISTENTE"],
                }
            ]
        }
        with self.assertRaisesRegex(ValueError, "dependencias inexistentes"):
            _validar_nodos_adec(data)


if __name__ == "__main__":
    unittest.main()
