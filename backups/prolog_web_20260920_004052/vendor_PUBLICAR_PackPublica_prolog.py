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
            "% Lectura: a :- b, c. significa que a es cierta si b Y c lo son.",
            "% Lectura: a :- (b ; c). significa que a es cierta si b O c lo es.",
            "% Corte: a :- b, c, !. confirma a tras b y c y descarta alternativas.",
            "% Si hay una meta despues de !, esa meta todavia debe demostrarse.",
            "% go valida el objetivo final y todas sus dependencias alcanzables.",
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
            "depends_on(Node, Dependency) :-",
            "    rule(Node, Dependencies),",
            "    member(Dependency, Dependencies).",
            "depends_transitively(Node, Dependency) :-",
            "    depends_on(Node, Dependency).",
            "depends_transitively(Node, Dependency) :-",
            "    depends_on(Node, Intermediate),",
            "    depends_transitively(Intermediate, Dependency).",
            "",
            "write_atoms([Atom]) :-",
            "    format('~w', [Atom]).",
            "write_atoms([Atom|Atoms]) :-",
            "    format('~w, ', [Atom]),",
            "    write_atoms(Atoms).",
            "",
            "write_clause(Node) :-",
            "    fact(Node), !,",
            "    format('  ~w.~n', [Node]).",
            "write_clause(Node) :-",
            "    rule(Node, Dependencies),",
            "    format('  ~w :- ', [Node]),",
            "    write_atoms(Dependencies),",
            "    format('.~n', []).",
            "",
            "write_report(Goal) :-",
            "    setof(Node, (Node = Goal ; depends_transitively(Goal, Node)), Nodes),",
            "    length(Nodes, Count),",
            "    format('RESULTADO PROLOG: APROBADO~n', []),",
            "    format('Objetivo demostrado: ~w~n', [Goal]),",
            "    format('Nodos utilizados: ~d~n', [Count]),",
            "    format('Cadena deductiva (sintaxis Prolog):~n', []),",
            "    forall(member(Node, Nodes), write_clause(Node)).",
            "",
            "go(Goal) :-",
            "    declared_node(Goal, _),",
            "    \\+ unresolved_dependency(Goal, _),",
            "    prove(Goal, _Proof, []),",
            "    write_report(Goal).",
            "",
            "go :-",
            "    goal(Goal),",
            "    go(Goal).",
            "",
            ":- initialization((go -> halt(0) ; halt(1)), main).",
        ])
        return "\n".join(lines)
