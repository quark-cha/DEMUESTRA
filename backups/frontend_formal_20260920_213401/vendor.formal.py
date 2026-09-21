import json
import re
from collections import deque

try:
    from .json import Json
except ImportError:
    from PackPublica.json import Json


class FormalGraphError(ValueError):
    pass


class FormalGraph:
    """Representacion interna comun, derivada solo del Markdown actual."""

    DISPLAY_MATH_RE = re.compile(r"\$\$(?P<formula>.*?)\$\$", re.DOTALL)
    INLINE_MATH_RE = re.compile(r"(?<!\$)\$(?!\$)(?P<formula>.*?)(?<!\$)\$(?!\$)", re.DOTALL)

    def __init__(self, md_obj):
        self.md = md_obj
        self.data = json.loads(Json(md_obj).contenido)
        self.nodes = [node for node in self.data.get("nodes", []) if node.get("id")]
        self.by_id = {node["id"]: node for node in self.nodes}
        if len(self.by_id) != len(self.nodes):
            raise FormalGraphError("El Markdown genera identificadores de nodo duplicados.")
        self._enrich()
        self.order = self._topological_order()

    @classmethod
    def _formulas(cls, text):
        text = str(text or "")
        parts = text.split("$$")
        if len(parts) > 1:
            # Json conserva a veces un nodo desde el interior de una formula y
            # su primer $$ es, por tanto, de cierre. Elegimos la paridad que
            # contiene mas sintaxis matematica en vez de asumir que siempre abre.
            even_score = sum(cls._math_score(part) for part in parts[0::2])
            odd_score = sum(cls._math_score(part) for part in parts[1::2])
            parity = 0 if even_score > odd_score else 1
            formulas = [part.strip() for part in parts[parity::2] if part.strip()]
            prose_parts = parts[1 - parity::2]
            without_display = "\n".join(prose_parts)
        else:
            formulas = []
            without_display = text
        formulas.extend(
            match.group("formula").strip()
            for match in cls.INLINE_MATH_RE.finditer(without_display)
        )
        boundary_fragments = {r"\boxed{", "{", "}"}
        return [
            formula for formula in formulas
            if formula and formula.strip() not in boundary_fragments
        ]

    @staticmethod
    def _math_score(fragment):
        fragment = str(fragment or "").strip()
        if not fragment:
            return 0
        latex = len(re.findall(r"\\[A-Za-z]+|[_^=<>+*/]|\\[{}]", fragment))
        prose = len(re.findall(r"\b[A-Za-zÀ-ÿ]{4,}\b", fragment))
        paragraphs = fragment.count("\n\n")
        return (latex * 4) - prose - (paragraphs * 4)

    def _source_span(self, node_id):
        lines = self.md.texto.splitlines()
        escaped = re.escape(node_id.split("_", 1)[0]) + r"_"
        normalized = re.sub(r"[^A-Za-z0-9]", "", node_id).lower()
        for index, line in enumerate(lines, start=1):
            candidate = re.sub(r"[^A-Za-z0-9]", "", line).lower()
            if re.search(escaped, line) and normalized in candidate:
                return {"file": self.md.fichero.name, "start_line": index}
        return {"file": self.md.fichero.name, "start_line": None}

    def _enrich(self):
        for node in self.nodes:
            node["formal_source"] = {
                "formulas": self._formulas(node.get("description", "")),
                "prose": node.get("description", ""),
                "source": self._source_span(node["id"]),
            }

    def _topological_order(self):
        missing = sorted({
            dep
            for node in self.nodes
            for dep in node.get("deps", [])
            if dep not in self.by_id
        })
        if missing:
            raise FormalGraphError(
                "Dependencias inexistentes: " + ", ".join(missing)
            )

        degree = {
            node["id"]: len(set(node.get("deps", [])))
            for node in self.nodes
        }
        dependants = {node_id: [] for node_id in self.by_id}
        for node in self.nodes:
            for dep in set(node.get("deps", [])):
                dependants[dep].append(node["id"])

        queue = deque(node["id"] for node in self.nodes if degree[node["id"]] == 0)
        order = []
        while queue:
            node_id = queue.popleft()
            order.append(node_id)
            for dependant in dependants[node_id]:
                degree[dependant] -= 1
                if degree[dependant] == 0:
                    queue.append(dependant)

        if len(order) != len(self.nodes):
            cycle_nodes = sorted(set(self.by_id) - set(order))
            raise FormalGraphError(
                "Ciclo de dependencias: " + ", ".join(cycle_nodes)
            )
        return order

    def ordered_nodes(self):
        return [self.by_id[node_id] for node_id in self.order]
