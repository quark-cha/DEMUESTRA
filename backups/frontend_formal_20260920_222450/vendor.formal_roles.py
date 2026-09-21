from dataclasses import dataclass

try:
    from .formal_ast import Ast
    from .formal_compile import ParsedFormula, ParsedNode
except ImportError:
    from PackPublica_formal_ast import Ast
    from PackPublica_formal_compile import ParsedFormula, ParsedNode


class FormalRoleError(ValueError):
    pass


@dataclass(frozen=True)
class ClassifiedNode:
    source: ParsedNode
    declarations: tuple[ParsedFormula, ...]
    claims: tuple[ParsedFormula, ...]
    steps: tuple[ParsedFormula, ...]

    @property
    def declaration(self):
        return self.declarations[0] if self.declarations else None

    @property
    def claim(self):
        return self.claims[-1] if self.claims else None


class FormalRoleClassifier:
    DEFINITIONS = {"definition", "constant", "foundation", "axiom", "postulate"}
    PROOFS = {"proposition", "lemma", "theorem", "corollary", "self_validation", "meta_validation"}

    def classify_all(self, nodes):
        return tuple(self.classify(node) for node in nodes)

    def classify(self, node):
        formulas = tuple(node.formulas)
        if node.kind in self.DEFINITIONS:
            if not formulas:
                return ClassifiedNode(node, (), (), ())
            declarations = self._best_group(node, formulas, self._definition_score, "definicion")
            return ClassifiedNode(node, declarations, (), tuple(item for item in formulas if item not in declarations))
        if node.kind in self.PROOFS:
            if not formulas:
                return ClassifiedNode(node, (), (), ())
            claims = self._best_group(node, formulas, self._claim_score, "enunciado")
            return ClassifiedNode(node, (), claims, tuple(item for item in formulas if item not in claims))
        return ClassifiedNode(node, formulas[:1], (), formulas[1:])

    def _best_group(self, node, formulas, scorer, role):
        scored = [(scorer(item), index, item) for index, item in enumerate(formulas)]
        best_score = max(score for score, _, _ in scored)
        if best_score <= 0:
            return ()
        winners = [item for score, _, item in scored if score == best_score]
        unique = []
        seen = set()
        for item in winners:
            normalized = " ".join(item.source.split())
            if normalized not in seen:
                seen.add(normalized)
                unique.append(item)
        return tuple(unique)

    def _definition_score(self, formula):
        root = formula.ast
        score = 0
        if root.kind == "binary" and root.value in {"EQ", "IFF"}:
            score += 100
        if root.kind == "binary" and root.value in {"IN", "COLON"}:
            score += 80
        if root.kind in {"identifier", "subscript", "apply", "binary"}:
            score += 5
        if "\\boxed" in formula.source:
            score += 10
        if root.kind == "binary" and root.value == "AND":
            score += 5
        return score

    def _claim_score(self, formula):
        root = formula.ast
        score = 0
        if root.kind == "quantifier":
            score += 200
        if self._contains(root, {"IMPLIES", "IFF"}):
            score += 80
        if self._is_prop_shape(root):
            score += 40
        if root.kind == "text" or self._contains_kind(root, "text"):
            score += 40
        if "\\boxed" in formula.source:
            score += 20
        # Un resultado universal prevalece sobre ecuaciones intermedias aun si aparece antes.
        if "\\forall" in formula.source or "\\exists" in formula.source:
            score += 100
        return score

    def _is_prop_shape(self, node):
        return node.kind in {"quantifier", "limit"} or (
            node.kind == "binary" and node.value in {
                "EQ", "NE", "LT", "LE", "GT", "GE", "IN", "NOTIN",
                "SUBSET", "SUBSETEQ", "AND", "OR", "IMPLIES", "IFF", "COLON",
            }
        )

    def _contains(self, node, values):
        if node.value in values:
            return True
        return any(self._contains(child, values) for child in node.children if isinstance(child, Ast))

    def _contains_kind(self, node, kind):
        if node.kind == kind:
            return True
        return any(self._contains_kind(child, kind) for child in node.children if isinstance(child, Ast))

    @staticmethod
    def _error(node, message):
        location = f"{node.source_file}:{node.start_line or '?'}:{node.node_id}"
        return FormalRoleError(f"Error de clasificacion formal en {location}: {message}.")
