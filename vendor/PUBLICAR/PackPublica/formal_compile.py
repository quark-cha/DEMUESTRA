from dataclasses import dataclass

try:
    from .formal_ast import Ast, FormalSyntaxError, parse_formula
except ImportError:
    from PackPublica_formal_ast import Ast, FormalSyntaxError, parse_formula


class FormalCompilationError(ValueError):
    pass


@dataclass(frozen=True)
class ParsedFormula:
    source: str
    ast: Ast
    location: str
    discourse_role: str = "UNCLASSIFIED"
    lead_text: str = ""
    is_display: bool = False


@dataclass(frozen=True)
class ParsedNode:
    node_id: str
    kind: str
    deps: tuple[str, ...]
    formulas: tuple[ParsedFormula, ...]
    prose: str
    source_file: str
    start_line: int | None
    statement_formula_count: int | None = None
    has_proof_heading: bool = False


class FormalGraphCompiler:
    """Convierte FormalGraph en una IR sintactica comun para los backends."""

    def __init__(self, graph):
        self.graph = graph

    def parse(self):
        parsed = []
        seen = set()
        for node in self.graph.ordered_nodes():
            node_id = node["id"]
            if node_id in seen:
                raise FormalCompilationError(f"Nodo duplicado durante compilacion: {node_id}")
            missing_order = [dep for dep in node.get("deps", []) if dep not in seen]
            if missing_order:
                raise FormalCompilationError(
                    f"{node_id} aparece antes que sus dependencias: {', '.join(missing_order)}"
                )
            formal = node.get("formal_source", {})
            source = formal.get("source", {})
            filename = source.get("file") or "<markdown>"
            line = source.get("start_line")
            formulas = []
            contexts = formal.get("formula_contexts", [])
            for index, formula in enumerate(formal.get("formulas", []), start=1):
                location = f"{filename}:{line or '?'}:{node_id}:formula-{index}"
                try:
                    ast = parse_formula(formula, location)
                except FormalSyntaxError as error:
                    raise FormalCompilationError(str(error)) from error
                context = contexts[index - 1] if index <= len(contexts) else {}
                formulas.append(ParsedFormula(
                    formula,
                    ast,
                    location,
                    context.get("role", "UNCLASSIFIED"),
                    context.get("lead", ""),
                    bool(context.get("display", False)),
                ))
            parsed.append(ParsedNode(
                node_id=node_id,
                kind=node.get("kind", "concept"),
                deps=tuple(node.get("deps", [])),
                formulas=tuple(formulas),
                prose=formal.get("prose", ""),
                source_file=filename,
                start_line=line,
                statement_formula_count=formal.get("statement_formula_count"),
                has_proof_heading=bool(formal.get("has_proof_heading", False)),
            ))
            seen.add(node_id)
        return tuple(parsed)
