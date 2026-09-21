import re

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
                "PUBLICAR no genero el archivo Lean porque el Markdown no ofrece "
                "una formula para todos los nodos demostrativos.\n- "
                + "\n- ".join(details)
                + "\nAccion: exprese el enunciado del nodo entre $...$ o $$...$$. "
                "Las referencias repetidas con sufijo numerico se enlazan automaticamente."
            )
        return aliases, transparent

    def _generar(self):
        before = self.md.fichero.read_bytes()
        if re.search(r"^```(?:lean|lean4)\s*$", self.md.texto, re.MULTILINE | re.IGNORECASE):
            raise LeanCompilationError(
                f"{self.md.fichero.name} contiene codigo Lean incrustado; "
                "el Markdown debe permanecer como unica fuente documental limpia."
            )
        graph, classified = self._frontend()
        self._coverage_audit(graph, classified)
        if self.md.fichero.read_bytes() != before:
            raise LeanCompilationError(
                "El Markdown cambio durante la compilacion; operacion cancelada."
            )
        try:
            candidate = LeanBackend(classified, self.md.fichero.stem).compile()
        except LeanBackendError as error:
            raise LeanCompilationError(str(error)) from error
        declared = set(re.findall(r"(?m)^-- FORMAL_NODE:\s*([A-Za-z0-9_]+)\s*$", candidate))
        expected = {node["id"] for node in graph.nodes}
        if declared != expected:
            raise LeanSemanticAuditError(
                "La salida Lean no representa exactamente los nodos del Markdown: "
                f"faltan {sorted(expected - declared)}, sobran {sorted(declared - expected)}."
            )
        if re.search(r"\b(?:sorry|admit|axiom|opaque)\b", candidate):
            raise LeanSemanticAuditError("La salida Lean contiene una construccion prohibida.")
        return candidate
