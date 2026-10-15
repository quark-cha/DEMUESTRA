import json
import re
from datetime import datetime
from pathlib import Path

from .base import Publicacion
from .formal import FormalGraph, FormalGraphError
from .formal_compile import FormalGraphCompiler, FormalCompilationError


class PrologCompilationError(ValueError):
    pass


class Prolog(Publicacion):
    """
    Genera una auditoria Prolog del grafo deductivo formal derivado del Markdown.

    Arquitectura:

        Markdown
            |
            v
        FormalGraph
            |
            v
        FormalGraphCompiler
            |
            v
        Prolog

    Prolog no lee ni modifica el JSON de ADEC.
    Prolog no modifica el Markdown.
    Prolog no depende de Lean.
    """

    carpeta_salida = "prolog"
    extension = ".pl"

    def __init__(self, md_obj):
        super().__init__(md_obj.documento)
        self.origen = md_obj
        self.md = md_obj
        self.contenido = self._generar()

    @staticmethod
    def _atom(value):
        """
        Convierte un identificador del Markdown en un atomo Prolog seguro.
        """
        value = re.sub(
            r"[^A-Za-z0-9_]+",
            "_",
            str(value or ""),
        ).strip("_").lower()

        if not value:
            return "nodo_sin_id"

        if value[0].isdigit():
            value = f"n_{value}"

        return value

    @classmethod
    def _ast_term(cls, ast):
        value = "none" if ast.value is None else json.dumps(str(ast.value), ensure_ascii=False)
        children = ", ".join(cls._ast_term(child) for child in ast.children)
        return f"ast({cls._atom(ast.kind)}, {value}, [{children}])"

    @classmethod
    def _symbol_name(cls, ast):
        if ast.kind == "identifier":
            return str(ast.value)
        if ast.kind in {"subscript", "power"} and len(ast.children) == 2:
            left = cls._symbol_name(ast.children[0])
            right = cls._symbol_name(ast.children[1])
            return f"{left}_{right}" if left and right else None
        return None

    @classmethod
    def _names_in(cls, ast):
        names = set()
        name = cls._symbol_name(ast)
        if name:
            names.add(name)
        for child in ast.children:
            names.update(cls._names_in(child))
        return names

    def _frontend(self):
        """
        Usa exactamente la capa formal comun.

        No lee JSON directamente.
        """
        try:
            graph = FormalGraph(self.md)
            parsed = FormalGraphCompiler(graph).parse()
        except (FormalGraphError, FormalCompilationError) as error:
            raise PrologCompilationError(str(error)) from error

        return graph, parsed

    @staticmethod
    def _select_goal(nodes):
        """
        Selecciona el objetivo deductivo.

        Prioridad:
            1. T_RIEMANN
            2. ultimo theorem
            3. ultimo nodo
        """
        if not nodes:
            return None

        for node in reversed(nodes):
            if node.node_id == "T_RIEMANN":
                return node

        theorems = [
            node
            for node in nodes
            if str(node.kind).lower() == "theorem"
        ]

        if theorems:
            return theorems[-1]

        return nodes[-1]

    def _generar(self):
        """
        Genera el programa Prolog exclusivamente desde la IR formal.
        """
        before = self.md.fichero.read_bytes()

        graph, nodes = self._frontend()

        if self.md.fichero.read_bytes() != before:
            raise PrologCompilationError(
                "El Markdown cambio durante la compilacion; "
                "operacion cancelada."
            )

        goal = self._select_goal(nodes)

        if goal is None:
            raise PrologCompilationError(
                f"{self.md.fichero.name} no contiene un objetivo deductivo."
            )

        ids = {node.node_id for node in nodes}

        # Comprobacion adicional:
        # FormalGraph y FormalGraphCompiler deben representar exactamente
        # los mismos nodos.
        graph_ids = {
            node["id"]
            for node in graph.nodes
            if node.get("id")
        }

        parsed_ids = {
            node.node_id
            for node in nodes
        }

        if graph_ids != parsed_ids:
            raise PrologCompilationError(
                "La representacion formal de Prolog no coincide con "
                "los nodos del Markdown: "
                f"faltan {sorted(graph_ids - parsed_ids)}, "
                f"sobran {sorted(parsed_ids - graph_ids)}."
            )

        generated_on = datetime.now().astimezone().isoformat(timespec="seconds")
        generator = Path(__file__).resolve()
        source = self.md.fichero.resolve()
        output_name = f"{self.md.fichero.stem}.pl"

        lines = [
            f"% GENERADO_POR: {generator} | FECHA_HORA_GENERACION: {generated_on}",
            f"% FUENTE_MARKDOWN: {source}",
            "% REQUISITO: SWI-Prolog (https://www.swi-prolog.org/Download.html)",
            "% INSTALAR_EN_WINDOWS: winget install SWI-Prolog.SWI-Prolog",
            "% COMPROBAR_INSTALACION: swipl --version",
            f"% EJECUTAR_EN_ESTA_CARPETA: swipl -q -s {output_name}",
            "% La ejecucion audita el grafo formal derivado del Markdown; no demuestra por si sola la verdad matematica externa de sus premisas.",
            "%",
            "% ============================================================",
            "% DEMUESTRA / PUBLICAR",
            "% Auditoria logica Prolog",
            "%",
            "% Fuente unica:",
            "%     Markdown",
            "%",
            "% Cadena:",
            "%     Markdown",
            "%       -> FormalGraph",
            "%       -> FormalGraphCompiler",
            "%       -> Prolog",
            "%",
            "% Este archivo NO se genera desde el JSON de ADEC.",
            "% Este archivo NO modifica el Markdown.",
            "% Este archivo NO modifica JSON, Lean ni otros derivados.",
            "%",
            "% Prolog verifica:",
            "%   - integridad estructural del grafo",
            "%   - dependencias declaradas",
            "%   - ausencia de ciclos",
            "%   - ausencia de autorreferencias",
            "%   - ausencia de referencias inexistentes",
            "%   - cierre del arbol de dependencias del objetivo",
            "%   - cobertura de formulas extraidas como hechos estructurados",
            "%   - referencias a conjuntos con definicion unica",
            "%   - cobertura deductiva respecto del objetivo",
            "% No valida todas las implicaciones matematicas del Markdown.",
            "%",
            "% IMPORTANTE:",
            "% Un nodo fuera de la clausura del objetivo no es",
            "% automaticamente un error. Puede pertenecer a una rama",
            "% independiente del documento.",
            "% ============================================================",
            "",
            ":- set_prolog_flag(double_quotes, string).",
            ":- discontiguous fact/1.",
            ":- discontiguous rule/2.",
            ":- discontiguous declared_node/2.",
            ":- discontiguous graph_error/1.",
            ":- discontiguous formula_count/2.",
            ":- discontiguous source_formula/3.",
            ":- discontiguous defines_set/2.",
            ":- discontiguous uses_defined_set/2.",
            ":- discontiguous inferred_definition_dependency/3.",
            ":- dynamic unresolved_dependency/2.",
            "",
            f"goal({self._atom(goal.node_id)}).",
            "",
        ]

        # ------------------------------------------------------------
        # Declaracion de todos los nodos del grafo formal
        # ------------------------------------------------------------

        for node in nodes:
            atom = self._atom(node.node_id)
            kind = self._atom(node.kind or "concept")

            lines.append(
                f"declared_node({atom}, {kind})."
            )

        lines.append("")
        for node in nodes:
            atom = self._atom(node.node_id)
            lines.append(f"formula_count({atom}, {len(node.formulas)}).")
            for index, formula in enumerate(node.formulas, start=1):
                lines.append(
                    f"source_formula({atom}, {index}, {self._ast_term(formula.ast)})."
                )

        set_owners = {}
        for node in nodes:
            for formula in node.formulas:
                ast = formula.ast
                if ast.kind != "binary" or ast.value != "EQ":
                    continue
                left, right = ast.children
                if right.kind != "set_builder":
                    continue
                name = self._symbol_name(left)
                if name:
                    set_owners.setdefault(name, set()).add(node.node_id)
        unique_sets = {
            name: next(iter(owners))
            for name, owners in set_owners.items() if len(owners) == 1
        }
        for name, owner in sorted(unique_sets.items()):
            lines.append(f"defines_set({self._atom(owner)}, {self._atom(name)}).")
        inferred_dependencies = {}
        for node in nodes:
            used = set()
            for formula in node.formulas:
                used.update(self._names_in(formula.ast))
            for name in sorted(used & unique_sets.keys()):
                lines.append(f"uses_defined_set({self._atom(node.node_id)}, {self._atom(name)}).")
                owner = unique_sets[name]
                if owner != node.node_id and owner not in node.deps:
                    inferred_dependencies.setdefault(node.node_id, set()).add(owner)
                    lines.append(
                        f"inferred_definition_dependency({self._atom(node.node_id)}, "
                        f"{self._atom(owner)}, {self._atom(name)})."
                    )

        lines.append("")

        # ------------------------------------------------------------
        # Hechos y reglas
        # ------------------------------------------------------------

        for node in nodes:
            atom = self._atom(node.node_id)

            deps = list(dict.fromkeys(
                [dep for dep in node.deps if dep]
                + sorted(inferred_dependencies.get(node.node_id, ()))
            ))

            missing = [
                dep
                for dep in deps
                if dep not in ids
            ]

            for dep in missing:
                lines.append(
                    "unresolved_dependency("
                    f"{atom}, {self._atom(dep)}"
                    ")."
                )

            if not deps:
                lines.append(
                    f"fact({atom})."
                )
            else:
                dep_atoms = ", ".join(
                    self._atom(dep)
                    for dep in deps
                )

                lines.append(
                    f"rule({atom}, [{dep_atoms}])."
                )

        # ------------------------------------------------------------
        # Motor logico
        # ------------------------------------------------------------

        lines.extend([
            "",
            "% ============================================================",
            "% MOTOR DE DEMOSTRACION",
            "% ============================================================",
            "",
            "prove(Goal, fact(Goal), _) :-",
            "    fact(Goal).",
            "",
            "prove(Goal, proof(Goal, Proofs), Seen) :-",
            "    \\+ memberchk(Goal, Seen),",
            "    rule(Goal, Dependencies),",
            "    prove_all(Dependencies, Proofs, [Goal|Seen]).",
            "",
            "prove_all([], [], _).",
            "",
            "prove_all([Goal|Goals], [Proof|Proofs], Seen) :-",
            "    prove(Goal, Proof, Seen),",
            "    prove_all(Goals, Proofs, Seen).",
            "",
        ])

        # ------------------------------------------------------------
        # Dependencias directas y transitivas
        # ------------------------------------------------------------

        lines.extend([
            "% ============================================================",
            "% RELACIONES DE DEPENDENCIA",
            "% ============================================================",
            "",
            "depends_on(Node, Dependency) :-",
            "    rule(Node, Dependencies),",
            "    member(Dependency, Dependencies).",
            "",
            "depends_transitively(Node, Dependency) :-",
            "    depends_transitively_(Node, Dependency, [Node]).",
            "",
            "depends_transitively_(Node, Dependency, _Seen) :-",
            "    depends_on(Node, Dependency).",
            "",
            "depends_transitively_(Node, Dependency, Seen) :-",
            "    depends_on(Node, Intermediate),",
            "    \\+ memberchk(Intermediate, Seen),",
            "    depends_transitively_(",
            "        Intermediate,",
            "        Dependency,",
            "        [Intermediate|Seen]",
            "    ).",
            "",
        ])

        # ------------------------------------------------------------
        # Auditoria global
        # ------------------------------------------------------------

        lines.extend([
            "% ============================================================",
            "% AUDITORIA GLOBAL DEL GRAFO",
            "% ============================================================",
            "",
            "implemented_node(Node) :-",
            "    fact(Node).",
            "",
            "implemented_node(Node) :-",
            "    rule(Node, _).",
            "",
            "graph_error(reference_not_declared(Node, Dependency)) :-",
            "    depends_on(Node, Dependency),",
            "    \\+ declared_node(Dependency, _).",
            "",
            "graph_error(unresolved_dependency(Node, Dependency)) :-",
            "    unresolved_dependency(Node, Dependency).",
            "",
            "graph_error(node_without_fact_or_rule(Node)) :-",
            "    declared_node(Node, _),",
            "    \\+ implemented_node(Node).",
            "",
            "graph_error(formula_coverage_mismatch(Node, Expected, Actual)) :-",
            "    formula_count(Node, Expected),",
            "    findall(Index, source_formula(Node, Index, _), Indices),",
            "    length(Indices, Actual),",
            "    Expected =\\= Actual.",
            "",
            "graph_error(self_dependency(Node)) :-",
            "    depends_on(Node, Node).",
            "",
            "graph_error(cyclic_dependency(Node)) :-",
            "    declared_node(Node, _),",
            "    depends_transitively(Node, Node).",
            "",
            "graph_error(conflicting_node_types(Node, Kinds)) :-",
            "    declared_node(Node, _),",
            "    findall(",
            "        Kind,",
            "        declared_node(Node, Kind),",
            "        RawKinds",
            "    ),",
            "    sort(RawKinds, Kinds),",
            "    length(Kinds, Count),",
            "    Count > 1.",
            "",
            "node_definition(Node, fact) :-",
            "    fact(Node).",
            "",
            "node_definition(Node, rule(Dependencies)) :-",
            "    rule(Node, Dependencies).",
            "",
            "graph_error(conflicting_definitions(Node, Definitions)) :-",
            "    implemented_node(Node),",
            "    findall(",
            "        Definition,",
            "        node_definition(Node, Definition),",
            "        RawDefinitions",
            "    ),",
            "    sort(RawDefinitions, Definitions),",
            "    length(Definitions, Count),",
            "    Count > 1.",
            "",
        ])

        # ------------------------------------------------------------
        # Advertencias estructurales
        # ------------------------------------------------------------

        lines.extend([
            "% ============================================================",
            "% ADVERTENCIAS ESTRUCTURALES",
            "% ============================================================",
            "",
            "graph_warning(redundant_declaration(Node, Kind)) :-",
            "    declared_node(Node, Kind),",
            "    findall(",
            "        Kind,",
            "        declared_node(Node, Kind),",
            "        Declarations",
            "    ),",
            "    length(Declarations, Count),",
            "    Count > 1,",
            "    findall(",
            "        OtherKind,",
            "        declared_node(Node, OtherKind),",
            "        RawKinds",
            "    ),",
            "    sort(RawKinds, [Kind]).",
            "",
            "graph_warning(redundant_definition(Node, Definition)) :-",
            "    node_definition(Node, Definition),",
            "    findall(",
            "        Definition,",
            "        node_definition(Node, Definition),",
            "        Definitions",
            "    ),",
            "    length(Definitions, Count),",
            "    Count > 1,",
            "    findall(",
            "        OtherDefinition,",
            "        node_definition(Node, OtherDefinition),",
            "        RawDefinitions",
            "    ),",
            "    sort(RawDefinitions, [Definition]).",
            "",
        ])

        # ------------------------------------------------------------
        # Auditoria del objetivo
        # ------------------------------------------------------------

        lines.extend([
            "% ============================================================",
            "% AUDITORIA DEL OBJETIVO",
            "% ============================================================",
            "",
            "goal_error(Goal, goal_not_declared(Goal)) :-",
            "    \\+ declared_node(Goal, _).",
            "",
            "goal_error(Goal, missing_definition_dependency(Node, Provider, Symbol)) :-",
            "    used_by_goal(Goal, Node),",
            "    uses_defined_set(Node, Symbol),",
            "    defines_set(Provider, Symbol),",
            "    Node \\= Provider,",
            "    \\+ depends_transitively(Node, Provider).",
            "",
            "audit_graph(Goal) :-",
            "    findall(",
            "        Error,",
            "        (graph_error(Error) ; goal_error(Goal, Error)),",
            "        RawErrors",
            "    ),",
            "    sort(RawErrors, Errors),",
            "",
            "    findall(",
            "        Warning,",
            "        graph_warning(Warning),",
            "        RawWarnings",
            "    ),",
            "    sort(RawWarnings, Warnings),",
            "",
            "    forall(",
            "        member(Warning, Warnings),",
            "        format(",
            "            'AVISO ESTRUCTURAL: ~q~n',",
            "            [Warning]",
            "        )",
            "    ),",
            "",
            "    (",
            "        Errors = []",
            "    ->",
            "        true",
            "    ;",
            "        format(",
            "            'RESULTADO PROLOG: ARBOL INCOMPLETO~n',",
            "            []",
            "        ),",
            "        format(",
            "            'Errores estructurales del grafo:~n',",
            "            []",
            "        ),",
            "        forall(",
            "            member(Error, Errors),",
            "            format('  - ~q~n', [Error])",
            "        ),",
            "        fail",
            "    ).",
            "",
        ])

        # ------------------------------------------------------------
        # Cobertura
        # ------------------------------------------------------------

        lines.extend([
            "% ============================================================",
            "% COBERTURA DEDUCTIVA",
            "% ============================================================",
            "",
            "% Un nodo pertenece a la prueba del objetivo si es el propio",
            "% objetivo o una dependencia transitiva del mismo.",
            "",
            "used_by_goal(Goal, Goal).",
            "",
            "used_by_goal(Goal, Node) :-",
            "    depends_transitively(Goal, Node).",
            "",
            "% Los nodos externos a la clausura del objetivo se conservan.",
            "% No se consideran automaticamente errores.",
            "",
            "outside_goal(Goal, Node) :-",
            "    declared_node(Node, _),",
            "    \\+ used_by_goal(Goal, Node).",
            "",
            "% Raiz de una rama externa:",
            "% nodo externo que no es dependencia de otro nodo externo.",
            "",
            "external_root(Goal, Node) :-",
            "    outside_goal(Goal, Node),",
            "    \\+ (",
            "        outside_goal(Goal, Other),",
            "        Other \\= Node,",
            "        depends_on(Other, Node)",
            "    ).",
            "",
        ])

        # ------------------------------------------------------------
        # Utilidades de impresion
        # ------------------------------------------------------------

        lines.extend([
            "% ============================================================",
            "% INFORME",
            "% ============================================================",
            "",
            "write_atoms([]).",
            "",
            "write_atoms([Atom]) :-",
            "    format('~w', [Atom]).",
            "",
            "write_atoms([Atom|Atoms]) :-",
            "    format('~w, ', [Atom]),",
            "    write_atoms(Atoms).",
            "",
            "write_clause(Node) :-",
            "    fact(Node),",
            "    !,",
            "    format('  ~w.~n', [Node]).",
            "",
            "write_clause(Node) :-",
            "    rule(Node, Dependencies),",
            "    format('  ~w :- ', [Node]),",
            "    write_atoms(Dependencies),",
            "    format('.~n', []).",
            "",
            "write_external_branch(Goal, Root) :-",
            "    findall(",
            "        Node,",
            "        (",
            "            Node = Root",
            "        ;",
            "            depends_transitively(Root, Node)",
            "        ),",
            "        RawNodes",
            "    ),",
            "    sort(RawNodes, Nodes),",
            "    include(outside_goal(Goal), Nodes, ExternalNodes),",
            "    format('  Rama externa desde ~w: ', [Root]),",
            "    write_atoms(ExternalNodes),",
            "    format('~n', []).",
            "",
        ])

        # ------------------------------------------------------------
        # Informe final
        # ------------------------------------------------------------

        lines.extend([
            "write_report(Goal) :-",
            "    findall(",
            "        Node,",
            "        used_by_goal(Goal, Node),",
            "        RawUsed",
            "    ),",
            "    sort(RawUsed, Used),",
            "",
            "    findall(",
            "        Node,",
            "        outside_goal(Goal, Node),",
            "        RawOutside",
            "    ),",
            "    sort(RawOutside, Outside),",
            "",
            "    findall(",
            "        Root,",
            "        external_root(Goal, Root),",
            "        RawRoots",
            "    ),",
            "    sort(RawRoots, Roots),",
            "",
            "    findall(",
            "        Node,",
            "        declared_node(Node, _),",
            "        RawAll",
            "    ),",
            "    sort(RawAll, All),",
            "",
            "    length(All, TotalCount),",
            "    length(Used, UsedCount),",
            "    length(Outside, OutsideCount),",
            "    findall((Node, Index), source_formula(Node, Index, _), FormulaFacts),",
            "    length(FormulaFacts, FormulaCount),",
            "",
            "    format(",
            "        'RESULTADO PROLOG: ARBOL COMPLETO~n',",
            "        []",
            "    ),",
            "    format(",
            "        'Objetivo alcanzable en el grafo: ~w~n',",
            "        [Goal]",
            "    ),",
            "    format(",
            "        'Nodos formales totales: ~d~n',",
            "        [TotalCount]",
            "    ),",
            "    format('Formulas extraidas como hechos: ~d~n', [FormulaCount]),",
            "    format(",
            "        'Nodos de la clausura deductiva del objetivo: ~d~n',",
            "        [UsedCount]",
            "    ),",
            "",
            "    (",
            "        Outside = []",
            "    ->",
            "        format(",
            "            'Nodos fuera de la clausura del objetivo: 0~n',",
            "            []",
            "        )",
            "    ;",
            "        format(",
            "            'Nodos fuera de la clausura del objetivo: ~d~n',",
            "            [OutsideCount]",
            "        ),",
            "        format(",
            "            'Estos nodos NO se consideran errores por si mismos.~n',",
            "            []",
            "        ),",
            "        format(",
            "            'Pueden pertenecer a comprobaciones o ramas independientes.~n',",
            "            []",
            "        ),",
            "        format(",
            "            'Nodos externos: ~w~n',",
            "            [Outside]",
            "        )",
            "    ),",
            "",
            "    (",
            "        Roots = []",
            "    ->",
            "        true",
            "    ;",
            "        format(",
            "            'Raices de ramas externas al objetivo: ~w~n',",
            "            [Roots]",
            "        )",
            "    ),",
            "",
            "    format(",
            "        'Cadena deductiva utilizada para el objetivo:~n',",
            "        []",
            "    ),",
            "    forall(",
            "        member(Node, Used),",
            "        write_clause(Node)",
            "    ).",
            "",
        ])

        # ------------------------------------------------------------
        # Ejecucion
        # ------------------------------------------------------------

        lines.extend([
            "% ============================================================",
            "% EJECUCION",
            "% ============================================================",
            "",
            "go(Goal) :-",
            "    audit_graph(Goal),",
            "    (",
            "        prove(Goal, _Proof, [])",
            "    ->",
            "        write_report(Goal)",
            "    ;",
            "        format(",
            "            'RESULTADO PROLOG: ARBOL INCOMPLETO~n',",
            "            []",
            "        ),",
            "        format(",
            "            'No se pudo cerrar el arbol del objetivo: ~w~n',",
            "            [Goal]",
            "        ),",
            "        fail",
            "    ).",
            "",
            "go :-",
            "    goal(Goal),",
            "    go(Goal).",
            "",
            ":- initialization(",
            "    (go -> halt(0) ; halt(1)),",
            "    main",
            ").",
        ])

        return "\n".join(lines)
