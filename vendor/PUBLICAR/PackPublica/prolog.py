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
            "% Antes de probarlo audita todo el grafo: ciclos, duplicados,",
            "% autorreferencias, referencias inexistentes y nodos sin definicion.",
            ":- set_prolog_flag(double_quotes, string).",
            ":- discontiguous fact/1.",
            ":- discontiguous rule/2.",
            ":- discontiguous graph_error/1.",
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
            "    depends_transitively_(Node, Dependency, [Node]).",
            "depends_transitively_(Node, Dependency, _Seen) :-",
            "    depends_on(Node, Dependency).",
            "depends_transitively_(Node, Dependency, Seen) :-",
            "    depends_on(Node, Intermediate),",
            "    \\+ memberchk(Intermediate, Seen),",
            "    depends_transitively_(Intermediate, Dependency, [Intermediate|Seen]).",
            "",
            "% Auditoria independiente de todo el grafo, no solo del objetivo.",
            "implemented_node(Node) :- fact(Node).",
            "implemented_node(Node) :- rule(Node, _).",
            "",
            "graph_error(reference_not_declared(Node, Dependency)) :-",
            "    depends_on(Node, Dependency),",
            "    \\+ declared_node(Dependency, _).",
            "graph_error(unresolved_dependency(Node, Dependency)) :-",
            "    unresolved_dependency(Node, Dependency).",
            "graph_error(node_without_fact_or_rule(Node)) :-",
            "    declared_node(Node, _),",
            "    \\+ implemented_node(Node).",
            "graph_error(self_dependency(Node)) :-",
            "    depends_on(Node, Node).",
            "graph_error(cyclic_dependency(Node)) :-",
            "    declared_node(Node, _),",
            "    depends_transitively(Node, Node).",
            "graph_error(conflicting_node_types(Node, Kinds)) :-",
            "    declared_node(Node, _),",
            "    findall(Kind, declared_node(Node, Kind), RawKinds),",
            "    sort(RawKinds, Kinds),",
            "    length(Kinds, Count),",
            "    Count > 1.",
            "node_definition(Node, fact) :- fact(Node).",
            "node_definition(Node, rule(Dependencies)) :- rule(Node, Dependencies).",
            "graph_error(conflicting_definitions(Node, Definitions)) :-",
            "    implemented_node(Node),",
            "    findall(Definition, node_definition(Node, Definition), RawDefinitions),",
            "    sort(RawDefinitions, Definitions),",
            "    length(Definitions, Count),",
            "    Count > 1.",
            "",
            "graph_warning(redundant_declaration(Node, Kind)) :-",
            "    declared_node(Node, Kind),",
            "    findall(Kind, declared_node(Node, Kind), Declarations),",
            "    length(Declarations, Count),",
            "    Count > 1,",
            "    findall(OtherKind, declared_node(Node, OtherKind), RawKinds),",
            "    sort(RawKinds, [Kind]).",
            "graph_warning(redundant_definition(Node, Definition)) :-",
            "    node_definition(Node, Definition),",
            "    findall(Definition, node_definition(Node, Definition), Definitions),",
            "    length(Definitions, Count),",
            "    Count > 1,",
            "    findall(OtherDefinition, node_definition(Node, OtherDefinition), RawDefinitions),",
            "    sort(RawDefinitions, [Definition]).",
            "",
            "goal_error(Goal, goal_not_declared(Goal)) :-",
            "    \\+ declared_node(Goal, _).",
            "",
            "audit_graph(Goal) :-",
            "    findall(Error, (graph_error(Error) ; goal_error(Goal, Error)), RawErrors),",
            "    sort(RawErrors, Errors),",
            "    findall(Warning, graph_warning(Warning), RawWarnings),",
            "    sort(RawWarnings, Warnings),",
            "    forall(member(Warning, Warnings), format('AVISO ESTRUCTURAL: ~q~n', [Warning])),",
            "    ( Errors = []",
            "    -> true",
            "    ;  format('RESULTADO PROLOG: RECHAZADO~n', []),",
            "       format('Errores estructurales del grafo:~n', []),",
            "       forall(member(Error, Errors), format('  - ~q~n', [Error])),",
            "       fail",
            "    ).",
            "",
            "unreachable_from_goal(Goal, Node) :-",
            "    declared_node(Node, _),",
            "    Node \\= Goal,",
            "    \\+ depends_transitively(Goal, Node).",
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
            "    findall(Node, (Node = Goal ; depends_transitively(Goal, Node)), RawNodes),",
            "    sort(RawNodes, Nodes),",
            "    findall(Node, unreachable_from_goal(Goal, Node), RawUnused),",
            "    sort(RawUnused, Unused),",
            "    length(Nodes, Count),",
            "    format('RESULTADO PROLOG: APROBADO~n', []),",
            "    format('Objetivo demostrado: ~w~n', [Goal]),",
            "    format('Nodos utilizados: ~d~n', [Count]),",
            "    ( Unused = []",
            "    -> format('Nodos no alcanzables: 0~n', [])",
            "    ;  length(Unused, UnusedCount),",
            "       format('AVISO: ~d nodos validos no intervienen en este objetivo: ~w~n',",
            "              [UnusedCount, Unused])",
            "    ),",
            "    format('Cadena deductiva (sintaxis Prolog):~n', []),",
            "    forall(member(Node, Nodes), write_clause(Node)).",
            "",
            "go(Goal) :-",
            "    audit_graph(Goal),",
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
