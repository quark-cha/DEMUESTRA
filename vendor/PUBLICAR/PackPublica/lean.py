import json
import re
from collections import Counter

from .base import Publicacion
from .formal import FormalGraph, FormalGraphError
from .formal_compile import FormalGraphCompiler, FormalCompilationError
from .formal_roles import FormalRoleClassifier, FormalRoleError
from .formal_lean_backend import LeanBackend, LeanBackendError


class LeanCompilationError(ValueError):
    pass


class LeanSemanticAuditError(LeanCompilationError):
    pass


class Lean(Publicacion):
    """Frontend generico Markdown -> FormalGraph -> IR formal.

    La emision se detiene antes de crear un .lean si existe un nodo
    demostrativo sin conclusion matematica. Nunca reutiliza archivos previos.
    """

    carpeta_salida = "lean"
    extension = ".lean"

    def __init__(self, md_obj):
        # Se llama de forma explicita para conservar el contrato Publicacion
        # sin acoplar el compilador a un documento concreto.
        super().__init__(md_obj.documento)
        self.origen = md_obj
        self.md = md_obj
        self.contenido = self._generar()

    @staticmethod
    def _alias_target(node_id, known):
        base = re.sub(r"_\d+$", "", node_id)
        return base if base != node_id and base in known else None

    def _frontend(self):
        try:
            graph = FormalGraph(self.md)
            parsed = FormalGraphCompiler(graph).parse()
            classified = FormalRoleClassifier().classify_all(parsed)
        except (FormalGraphError, FormalCompilationError, FormalRoleError) as error:
            raise LeanCompilationError(str(error)) from error
        return graph, classified

    def _coverage_audit(self, graph, classified):
        known = {item.source.node_id for item in classified}
        aliases = {}
        transparent = {}
        for item in classified:
            node = item.source
            if item.declarations or item.claims:
                continue
            alias = self._alias_target(node.node_id, known)
            if alias and alias in node.deps:
                aliases[node.node_id] = alias
                continue
            if node.deps:
                transparent[node.node_id] = tuple(node.deps)
                continue

        expected = {node["id"] for node in graph.nodes}
        represented = {
            item.source.node_id for item in classified
            if item.declarations or item.claims or item.source.node_id in aliases or item.source.node_id in transparent
        }
        omitted = sorted(expected - represented)
        if omitted:
            details = []
            if omitted:
                details.append("nodos sin representacion formal: " + ", ".join(omitted))
            raise LeanSemanticAuditError(
                "PUBLICAR no pudo representar todos los nodos en Lean. "
                "Esto no determina si falta contenido en el Markdown o fallo "
                "la extraccion.\n- "
                + "\n- ".join(details)
                + "\nAccion: comparar el nodo con su origen antes de proponer "
                "un cambio al Markdown."
            )
        return aliases, transparent

    @staticmethod
    def _source_formula_audit(graph, candidate):
        expected = {
            (node["id"], index): " ".join(formula.split())
            for node in graph.nodes
            for index, formula in enumerate(
                node.get("formal_source", {}).get("formulas", ()), start=1
            )
        }
        represented = {}
        marker = re.compile(
            r"(?m)^-- DEMUESTRA_SOURCE_(?:CLAIM|FORMULA):\s*(\{.*\})\s*$"
        )
        for match in marker.finditer(candidate):
            try:
                payload = json.loads(match.group(1))
            except json.JSONDecodeError as error:
                raise LeanSemanticAuditError(
                    f"Marcador de cobertura Lean ilegible: {error}"
                ) from error
            key = (payload.get("node"), payload.get("formula"))
            source = payload.get("source")
            if key in represented:
                raise LeanSemanticAuditError(
                    f"Formula duplicada en la salida Lean: {key[0]} formula-{key[1]}."
                )
            represented[key] = source

        missing = sorted(set(expected) - set(represented))
        extra = sorted(set(represented) - set(expected))
        changed = sorted(
            key for key in set(expected) & set(represented)
            if expected[key] != represented[key]
        )
        if missing or extra or changed:
            details = []
            if missing:
                details.append("faltan " + ", ".join(f"{n}:{i}" for n, i in missing))
            if extra:
                details.append("sobran " + ", ".join(f"{n}:{i}" for n, i in extra))
            if changed:
                details.append("cambiaron " + ", ".join(f"{n}:{i}" for n, i in changed))
            raise LeanSemanticAuditError(
                "La cobertura formula por formula MD -> Lean no es exacta: "
                + "; ".join(details)
            )

    @staticmethod
    def _markdown_declaration_audit(graph, text, declarations):
        """Contrasta el parser con un inventario lineal independiente del MD."""
        broad_declaration = re.compile(
            r"(?m)^[ \t]*(?:"
            r"\$(?P<dollar>[DAPT]_[^$\r\n]+)\$[ \t]*(?:[—\-:])"
            r"|(?P<bare>[DAPT]_[^:\r\n]+)[ \t]*:)"
        )

        source = Counter()
        for match in broad_declaration.finditer(text):
            marker = match.group("dollar") or match.group("bare")
            node_id = graph._marker_id(marker)
            if node_id in {"D_X", "A_X", "P_X", "T_X"}:
                continue
            line = text.count("\n", 0, match.start()) + 1
            source[(line, node_id)] += 1

        parsed = Counter(
            (text.count("\n", 0, item["start"]) + 1, item["base_id"])
            for item in declarations
        )
        missing = list((source - parsed).elements())
        extra = list((parsed - source).elements())
        if missing or extra:
            details = []
            if missing:
                details.append(
                    "declaraciones del MD omitidas: "
                    + ", ".join(f"linea {line} ({node})" for line, node in missing)
                )
            if extra:
                details.append(
                    "declaraciones sin cabecera formal: "
                    + ", ".join(f"linea {line} ({node})" for line, node in extra)
                )
            raise LeanSemanticAuditError(
                "La creacion Lean perdio cobertura de declaraciones MD -> grafo: "
                + "; ".join(details)
            )

    @staticmethod
    def _markdown_formula_audit(graph):
        text = graph.md.texto
        declarations = graph._find_declarations(text)
        if not declarations:
            raise LeanSemanticAuditError("No hay declaraciones formales que auditar.")
        Lean._markdown_declaration_audit(graph, text, declarations)
        formal_start = min(item["start"] for item in declarations)

        source_formulas = []
        displays = list(graph.DISPLAY_MATH_RE.finditer(text))
        masked = list(text)
        for match in displays:
            if match.start() >= formal_start:
                source_formulas.append(" ".join(match.group("formula").split()))
            masked[match.start():match.end()] = " " * (match.end() - match.start())
        without_display = "".join(masked)
        for match in graph.INLINE_MATH_RE.finditer(without_display):
            formula = match.group("formula").strip()
            if match.start() < formal_start:
                continue
            if re.fullmatch(graph.MARKER_PATTERN, formula):
                continue
            source_formulas.append(" ".join(formula.split()))

        assigned_formulas = [
            " ".join(formula.split())
            for node in graph.nodes
            for formula in node.get("formal_source", {}).get("formulas", ())
        ]
        source_counts = Counter(source_formulas)
        assigned_counts = Counter(assigned_formulas)
        missing = list((source_counts - assigned_counts).elements())
        extra = list((assigned_counts - source_counts).elements())
        if missing or extra:
            details = []
            if missing:
                details.append(f"{len(missing)} formulas del MD sin asignar")
            if extra:
                details.append(f"{len(extra)} formulas asignadas sin origen exacto")
            raise LeanSemanticAuditError(
                "La creacion Lean perdio cobertura MD -> grafo: " + "; ".join(details)
            )

    def _generar(self):
        before = self.md.fichero.read_bytes()
        if re.search(r"^```(?:lean|lean4)\s*$", self.md.texto, re.MULTILINE | re.IGNORECASE):
            raise LeanCompilationError(
                f"{self.md.fichero.name} contiene codigo Lean incrustado; "
                "el Markdown debe permanecer como unica fuente documental limpia."
            )
        graph, classified = self._frontend()
        self._markdown_formula_audit(graph)
        aliases, _ = self._coverage_audit(graph, classified)
        if self.md.fichero.read_bytes() != before:
            raise LeanCompilationError(
                "El Markdown cambio durante la compilacion; operacion cancelada."
            )
        try:
            candidate = LeanBackend(
                classified,
                self.md.fichero.stem,
                aliases=aliases,
                source_argument=self.md.fichero,
            ).compile()
        except LeanBackendError as error:
            raise LeanCompilationError(str(error)) from error
        declared = set(re.findall(r"(?m)^-- FORMAL_NODE:\s*([A-Za-z0-9_]+)\s*$", candidate))
        expected = {node["id"] for node in graph.nodes}
        if declared != expected:
            raise LeanSemanticAuditError(
                "La salida Lean no representa exactamente los nodos del Markdown: "
                f"faltan {sorted(expected - declared)}, sobran {sorted(declared - expected)}."
            )
        self._source_formula_audit(graph, candidate)
        if re.search(r"\b(?:sorry|admit|axiom|opaque)\b", candidate):
            raise LeanSemanticAuditError("La salida Lean contiene una construccion prohibida.")
        return candidate
