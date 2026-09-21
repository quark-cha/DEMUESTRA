import json
import re
from collections import deque

from .json import Json


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
        formulas = [match.group("formula").strip() for match in cls.DISPLAY_MATH_RE.finditer(text)]
        without_display = cls.DISPLAY_MATH_RE.sub("", text)
        formulas.extend(
            match.group("formula").strip()
            for match in cls.INLINE_MATH_RE.finditer(without_display)
        )
        return [formula for formula in formulas if formula]

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
