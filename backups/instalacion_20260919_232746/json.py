import json as json_lib
import re
import tempfile
from pathlib import Path

from .base import Publicacion


class Json(Publicacion):
    carpeta_salida = "json"
    extension = ".json"

    VALID_KINDS = {
        "foundation",
        "definition",
        "constant",
        "axiom",
        "postulate",
        "proposition",
        "lemma",
        "theorem",
        "corollary",
        "concept",
        "experiment",
        "self_validation",
        "meta_validation",
    }

    PREFIX_KIND = {
        "D": "definition",
        "A": "foundation",
        "P": "proposition",
        "T": "theorem",
    }

    PROOF_BEARING_KINDS = {
        "lemma",
        "proposition",
        "theorem",
        "corollary",
        "self_validation",
        "meta_validation",
    }

    HEADING_RE = re.compile(r"^(?P<marks>#{1,6})\s+(?P<title>.+?)\s*$", re.MULTILINE)
    DEP_RE = re.compile(r"^\s*(?:deps?|dependencias?)\s*:\s*(?P<deps>.+?)\s*$", re.IGNORECASE)
    AUTHOR_RE = re.compile(r"\*\*(?:autor|author)\s*:\*\*\s*(?P<author>.+?)(?:\s{2,}|\n|$)", re.IGNORECASE)
    FRAMEWORK_RE = re.compile(r"\*\*(?:marco|framework)\s*:\*\*\s*(?P<framework>.+?)(?:\s{2,}|\n|$)", re.IGNORECASE)
    MARKER_PATTERN = (
        r"[DAPT]_(?:\{\\rm\s+[^}]+\}|\{[^}]+\}|\\[A-Za-z]+|[A-Za-z][A-Za-z0-9']*)"
        r"(?:\([^)]*\))?"
    )
    DOLLAR_DECL_RE = re.compile(r"\$(?P<marker>" + MARKER_PATTERN + r")\$\s*(?:[—\-:])")
    BARE_DECL_RE = re.compile(r"(?<![A-Za-z\\])(?P<marker>" + MARKER_PATTERN + r")\s*:")
    MARKER_RE = re.compile(r"\$?(?P<marker>" + MARKER_PATTERN + r")\$?")

    def __init__(self, md_obj):
        super().__init__(md_obj.documento)
        self.origen = md_obj
        self.md = md_obj
        self.contenido = self._generar()

    def _title(self, text):
        match = re.search(r"^#\s+(.+)$", text, re.MULTILINE)
        if match:
            return match.group(1).strip()
        return self.md.fichero.stem

    def _clean_inline(self, value):
        value = str(value or "")
        value = re.sub(r"\s+", " ", value)
        return value.strip(" -—:\t\r\n")

    def _slug(self, value):
        value = str(value or "").strip()
        value = re.sub(r"\\([A-Za-z]+)", r"\1", value)
        value = re.sub(r"[^A-Za-z0-9]+", "_", value).strip("_")
        return value or "node"

    def _marker_id(self, marker):
        marker = str(marker or "").strip().strip("$")
        prefix, raw = marker.split("_", 1)
        raw = raw.strip()
        if raw.startswith("{") and raw.endswith("}"):
            raw = raw[1:-1].strip()
        raw = raw.replace("\\mathrm", "").replace("{", "").replace("}", "")
        raw = re.sub(r"^\\rm\s+", "", raw).strip()
        raw = raw.replace("'", "_prime")
        raw = re.sub(r"\\([A-Za-z]+)", r"\1", raw)
        raw = re.sub(r"[^A-Za-z0-9]+", "_", raw).strip("_")
        return f"{prefix}_{raw or 'X'}"

    def _heading_at(self, headings, pos):
        current = None
        for heading in headings:
            if heading.start() > pos:
                break
            current = heading.group("title").strip()
        return current

    def _find_declarations(self, text):
        headings = list(self.HEADING_RE.finditer(text))
        declarations = []
        seen_at = set()

        for regex in (self.DOLLAR_DECL_RE, self.BARE_DECL_RE):
            for match in regex.finditer(text):
                node_id = self._marker_id(match.group("marker"))
                if node_id in {"D_X", "A_X", "P_X", "T_X"}:
                    continue
                key = (node_id, match.start())
                if key in seen_at:
                    continue
                seen_at.add(key)
                declarations.append(
                    {
                        "id": node_id,
                        "prefix": node_id.split("_", 1)[0],
                        "start": match.start(),
                        "end": match.end(),
                        "heading": self._heading_at(headings, match.start()),
                    }
                )

        declarations.sort(key=lambda item: item["start"])
        unique = []
        used_ids = set()
        for item in declarations:
            base_id = item["id"]
            node_id = base_id
            suffix = 2
            while node_id in used_ids:
                node_id = f"{base_id}_{suffix}"
                suffix += 1
            item["id"] = node_id
            used_ids.add(node_id)
            unique.append(item)
        return unique

    def _explicit_deps(self, body):
        deps = []
        cleaned_lines = []
        for line in body.splitlines():
            match = self.DEP_RE.match(line)
            if not match:
                cleaned_lines.append(line)
                continue
            deps.extend(dep.strip() for dep in re.split(r"[,;]", match.group("deps")) if dep.strip())
        return deps, "\n".join(cleaned_lines).strip()

    def _referenced_ids(self, body, valid_previous_ids):
        refs = []
        for match in self.MARKER_RE.finditer(body):
            ref = self._marker_id(match.group("marker"))
            if ref in valid_previous_ids and ref not in refs:
                refs.append(ref)
        return refs

    def _fallback_deps(self, nodes, kind):
        if kind not in self.PROOF_BEARING_KINDS:
            return []

        preferred = [
            node["id"]
            for node in nodes
            if node.get("kind") in {"foundation", "definition", "axiom", "postulate", "proposition", "lemma", "theorem"}
        ]
        return preferred[-3:]

    def _measurement_relationship(self, deps):
        if len(deps) < 2:
            return None
        # ADEC v0.8.6 admite: additive, substitutive, overlapping, unclear.
        # Los deps generados son premisas conjuntas, no alternativas.
        return "additive"

    def _description_name(self, node_id, heading, body):
        body = body.strip()
        first_line = next((line.strip() for line in body.splitlines() if line.strip()), "")
        first_line = re.sub(
            r"^\$?[DAPT]_(?:\{\\rm\s+[^}]+\}|\{[^}]+\}|[A-Za-z][A-Za-z0-9']*)\$?\s*(?:[—\-:])\s*",
            "",
            first_line,
        )
        name = self._clean_inline(first_line) or self._clean_inline(heading) or node_id
        if len(name) > 140:
            name = name[:137].rstrip() + "..."
        description = body or name
        return name, description

    def _proof_steps(self, body):
        parts = []
        for chunk in re.split(r"\n\s*\n|(?<=[.!?])\s+(?=[A-ZÁÉÍÓÚÑ])", body):
            chunk = self._clean_inline(chunk)
            if not chunk or chunk in {"---", "$$", "\\boxed{"}:
                continue
            parts.append(chunk)
            if len(parts) >= 8:
                break
        return parts

    def _lean_file_for_source(self):
        source = Path(getattr(self.md, "fichero", ""))
        candidates = [
            source.with_suffix(".lean"),
            Path("lean") / f"{source.stem}.lean",
            Path("Proyectos") / source.stem / f"{source.stem}.lean",
        ]
        for candidate in candidates:
            if candidate.is_file():
                return str(candidate).replace("\\", "/")
        return None

    def _proof_from_body(self, body, lean_file=None):
        steps = self._proof_steps(body)
        if not steps:
            return None

        proof = {
            "method": "derivation",
            "status": "declared",
            "steps": steps,
        }

        return proof

    def _append_heading_theorems(self, text, nodes):
        if any(node.get("kind") == "theorem" for node in nodes):
            return nodes

        headings = list(self.HEADING_RE.finditer(text))
        candidates = [
            (index, heading)
            for index, heading in enumerate(headings)
            if heading.start() > 500 and "teorema" in heading.group("title").lower()
        ]
        if not candidates:
            return nodes

        lean_file = self._lean_file_for_source()
        used_ids = {node["id"] for node in nodes}
        for index, heading in candidates[-1:]:
            title = heading.group("title").strip()
            body_start = heading.end()
            body_end = headings[index + 1].start() if index + 1 < len(headings) else len(text)
            body = text[body_start:body_end].strip()
            node_id = "T_" + self._slug(title)
            base_id = node_id
            suffix = 2
            while node_id in used_ids:
                node_id = f"{base_id}_{suffix}"
                suffix += 1
            used_ids.add(node_id)

            deps = self._fallback_deps(nodes, "theorem")
            proof = self._proof_from_body(body or title, lean_file=lean_file)
            node = {
                "id": node_id,
                "kind": "theorem",
                "name": title,
                "description": body or title,
                "deps": deps,
                "claim_scope": "existence",
            }
            relationship = self._measurement_relationship(deps)
            if relationship:
                node["measurement_relationship"] = relationship
            if proof:
                node["proof"] = proof
            nodes.append(node)

        return nodes

    def _authors(self, text):
        match = self.AUTHOR_RE.search(text)
        if not match:
            return []

        author = self._clean_inline(match.group("author")).rstrip(".")
        if not author:
            return []

        item = {
            "name": author,
            "conflict_of_interest": "none",
        }

        framework_match = self.FRAMEWORK_RE.search(text)
        if framework_match:
            item["affiliation"] = self._clean_inline(framework_match.group("framework"))
        return [item]

    def _nodes_from_logical_markers(self, text):
        declarations = self._find_declarations(text)
        if not declarations:
            return []

        nodes = []
        lean_file = self._lean_file_for_source()
        for index, item in enumerate(declarations):
            next_start = declarations[index + 1]["start"] if index + 1 < len(declarations) else len(text)
            raw_body = text[item["end"]:next_start].strip()
            explicit_deps, body = self._explicit_deps(raw_body)
            kind = self.PREFIX_KIND.get(item["prefix"], "concept")
            name, description = self._description_name(item["id"], item.get("heading"), body)

            valid_previous_ids = {node["id"] for node in nodes}
            deps = []
            for dep in explicit_deps:
                normalized = self._marker_id(dep) if re.match(r"^[DAPT]_", dep) else dep
                if normalized in valid_previous_ids and normalized not in deps:
                    deps.append(normalized)

            for dep in self._referenced_ids(body, valid_previous_ids):
                if dep not in deps:
                    deps.append(dep)

            if not deps:
                deps = self._fallback_deps(nodes, kind)

            node = {
                "id": item["id"],
                "kind": kind if kind in self.VALID_KINDS else "concept",
                "name": name,
                "description": description,
                "deps": deps,
            }

            relationship = self._measurement_relationship(deps)
            if relationship:
                node["measurement_relationship"] = relationship

            proof = self._proof_from_body(description, lean_file=lean_file)
            if proof and node["kind"] in self.PROOF_BEARING_KINDS:
                node["proof"] = proof

            nodes.append(node)

        return self._append_heading_theorems(text, nodes)

    def _nodes_from_headings(self, text):
        headings = list(self.HEADING_RE.finditer(text))
        if not headings:
            body = text.strip()
            return [
                {
                    "id": self.md.fichero.stem,
                    "kind": "concept",
                    "name": self.md.fichero.stem,
                    "description": body or self.md.fichero.stem,
                    "deps": [],
                }
            ]

        nodes = []
        used_ids = set()
        for index, heading in enumerate(headings):
            raw_title = heading.group("title").strip()
            node_id = re.sub(r"[^A-Za-z0-9]+", "_", raw_title).strip("_").lower() or "node"
            base_id = node_id
            suffix = 2
            while node_id in used_ids:
                node_id = f"{base_id}_{suffix}"
                suffix += 1
            used_ids.add(node_id)

            body_start = heading.end()
            body_end = headings[index + 1].start() if index + 1 < len(headings) else len(text)
            body = text[body_start:body_end].strip()
            nodes.append(
                {
                    "id": node_id,
                    "kind": "concept",
                    "name": raw_title,
                    "description": body or raw_title,
                    "deps": [],
                }
            )
        return nodes

    def _generar(self):
        temp_md = None
        try:
            with tempfile.NamedTemporaryFile(
                mode="w",
                suffix=".md",
                prefix="json_temp_",
                delete=False,
                encoding="utf-8",
            ) as handle:
                handle.write(self.md.texto)
                temp_md = Path(handle.name)

            text = temp_md.read_text(encoding="utf-8", errors="replace")
            nodes = self._nodes_from_logical_markers(text) or self._nodes_from_headings(text)

            data = {
                "schema": "ADEC_nodes_input_v1",
                "title": self._title(text),
                "version": "1.0",
                "validation_mode": "article_analysis",
                "artifact_stage": "extracted_from_markdown",
                "formal_verification": {
                    "status": "pending",
                    "verified": False,
                    "note": "Pendiente de la ejecucion posterior del constructor Lean.",
                },
                "source": self.md.fichero.name,
                "authors": self._authors(text),
                "nodes": nodes,
            }
            return json_lib.dumps(data, ensure_ascii=False, indent=2)
        finally:
            if temp_md and temp_md.exists():
                temp_md.unlink()
