import json
import re

from .base import Publicacion
from .json import Json


class Prolog(Publicacion):
    """Genera una auditoria Prolog del grafo deductivo extraido del Markdown."""

    carpeta_salida = "prolog"
    extension = ".pl"

    def __init__(self, md_obj):
        super().__init__(md_obj.documento)
        self.origen = md_obj
        self.md = md_obj
        self.contenido = self._generar()

    @staticmethod
    def _atom(value):
        value = re.sub(r"[^A-Za-z0-9_]+", "_", str(value or "")).strip("_").lower()
        if not value:
            return "nodo_sin_id"
        if value[0].isdigit():
            value = f"n_{value}"
        return value

    def _generar(self):
        data = json.loads(Json(self.md).contenido)
        nodes = data.get("nodes", [])
        ids = {node.get("id") for node in nodes if node.get("id")}
        theorems = [node for node in nodes if node.get("kind") == "theorem"]
        goal = next(
            (node for node in reversed(theorems) if node.get("id") == "T_RIEMANN"),
            theorems[-1] if theorems else (nodes[-1] if nodes else None),
        )
        if goal is None:
            raise ValueError(f"{self.md.fichero.name} no contiene un objetivo deductivo.")

        lines = [
            "% Generado por PUBLICAR desde el grafo JSON del Markdown.",
            "% Audita dependencias logicas; no sustituye la comprobacion matematica Lean.",
            "% Requiere SWI-Prolog: https://www.swi-prolog.org/Download.html",
            "% Windows (winget): winget install SWI-Prolog.SWI-Prolog",
            "% Debian/Ubuntu: sudo apt install swi-prolog",
            "% macOS (Homebrew): brew install swi-prolog",
            "% Comprobar instalacion: swipl --version",
            f"% Ejecutar: swipl -q -s {self.md.fichero.stem}.pl",
            ":- set_prolog_flag(double_quotes, string).",
            ":- discontiguous fact/1.",
            ":- discontiguous rule/2.",
            ":- dynamic unresolved_dependency/2.",
            "",
            f"goal({self._atom(goal['id'])}).",
            "",
        ]

        for node in nodes:
            node_id = node.get("id")
            if not node_id:
                continue
            atom = self._atom(node_id)
            kind = self._atom(node.get("kind", "concept"))
            lines.append(f"declared_node({atom}, {kind}).")

        lines.append("")
        for node in nodes:
            node_id = node.get("id")
            if not node_id:
                continue
            atom = self._atom(node_id)
            deps = [dep for dep in node.get("deps", []) if dep]
            missing = [dep for dep in deps if dep not in ids]
            for dep in missing:
                lines.append(f"unresolved_dependency({atom}, {self._atom(dep)}).")
            if not deps:
                lines.append(f"fact({atom}).")
            else:
                dep_atoms = ", ".join(self._atom(dep) for dep in deps)
                lines.append(f"rule({atom}, [{dep_atoms}]).")

        lines.extend([
            "",
            "prove(Goal, fact(Goal), _) :-",
            "    fact(Goal).",
            "prove(Goal, proof(Goal, Proofs), Seen) :-",
            "    \\+ memberchk(Goal, Seen),",
            "    rule(Goal, Dependencies),",
            "    prove_all(Dependencies, Proofs, [Goal|Seen]).",
            "",
            "prove_all([], [], _).",
            "prove_all([Goal|Goals], [Proof|Proofs], Seen) :-",
            "    prove(Goal, Proof, Seen),",
            "    prove_all(Goals, Proofs, Seen).",
            "",
            "go(Goal) :-",
            "    declared_node(Goal, _),",
            "    \\+ unresolved_dependency(Goal, _),",
            "    prove(Goal, Proof, []),",
            "    write_term(Proof, [quoted(true), portray(true)]), nl.",
            "",
            "go :-",
            "    goal(Goal),",
            "    go(Goal).",
            "",
            ":- initialization((go -> halt(0) ; halt(1)), main).",
        ])
        return "\n".join(lines)
