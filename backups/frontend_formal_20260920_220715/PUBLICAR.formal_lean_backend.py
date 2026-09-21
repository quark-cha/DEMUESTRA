import re

try:
    from .formal_ast import Ast
    from .formal_semantic import LeanExpressionEmitter, SemanticAnalyzer
    from .formal_symbols import SymbolInference
except ImportError:
    from PackPublica_formal_ast import Ast
    from PackPublica_formal_semantic import LeanExpressionEmitter, SemanticAnalyzer
    from PackPublica_formal_symbols import SymbolInference


class LeanBackendError(ValueError):
    pass


class LeanBackend:
    TYPES = {
        "Nat": "ℕ", "Int": "ℤ", "Real": "ℝ", "Complex": "ℂ",
        "Prop": "Prop",
    }

    def __init__(self, classified_nodes, namespace):
        self.nodes = tuple(classified_nodes)
        self.namespace = self._name(namespace)
        self.symbols = SymbolInference().infer(self.nodes)
        self.emitter = LeanExpressionEmitter()

    def compile(self):
        self._validate_selected_formulas()
        lines = ["import Mathlib", "", "set_option maxHeartbeats 10000", "", f"namespace {self.namespace}", ""]
        lines.extend(self._symbol_declarations())
        lines.append("")
        known = set()
        for item in self.nodes:
            node = item.source
            lines.append(f"-- FORMAL_NODE: {node.node_id}")
            lines.append(f"-- SOURCE: {node.source_file}:{node.start_line or '?'}")
            for formula in node.formulas:
                source = " ".join(formula.source.split()).replace("-/", "- /")
                lines.append(f"-- FORMULA: {source}")
            expressions = [self.emitter.emit(f.ast) for f in (*item.declarations, *item.claims)]
            if expressions:
                body = " ∧ ".join(f"({value})" for value in expressions)
            elif node.deps:
                body = " ∧ ".join(f"Node_{self._name(dep)}" for dep in node.deps)
            else:
                body = "True"
            lines.append(f"def Node_{self._name(node.node_id)} : Prop := {body}")
            if node.deps:
                hypotheses = " ".join(
                    f"(h_{self._name(dep)} : Node_{self._name(dep)})" for dep in node.deps
                )
                lines.append(
                    f"theorem derive_{self._name(node.node_id)} {hypotheses} : "
                    f"Node_{self._name(node.node_id)} := by"
                )
                lines.append("  simp only [" + ", ".join(
                    f"Node_{self._name(value)}" for value in (*node.deps, node.node_id)
                ) + "] at *")
                lines.append("  first | assumption | rfl | simp_all | aesop")
            known.add(node.node_id)
            lines.append("")
        result = next((item for item in reversed(self.nodes) if item.claims), self.nodes[-1])
        result_name = self._name(result.source.node_id)
        lines.extend([
            f"end {self.namespace}", "",
            "-- DEMUESTRA_AUDIT_BEGIN",
            f"-- DEMUESTRA_RESULT: {self.namespace}.derive_{result_name}",
            f"-- DEMUESTRA_JSON_NODE: {result.source.node_id}",
            f"#check {self.namespace}.derive_{result_name}",
            f"#print axioms {self.namespace}.derive_{result_name}",
            "-- DEMUESTRA_AUDIT_END", "",
        ])
        return "\n".join(lines)

    def _validate_selected_formulas(self):
        errors = []
        for item in self.nodes:
            for formula in (*item.declarations, *item.claims):
                try:
                    SemanticAnalyzer(self.symbols, formula.location).analyze(formula.ast)
                except Exception as error:
                    errors.append(str(error))
        if errors:
            raise LeanBackendError("No se pueden emitir formulas sin tipo:\n- " + "\n- ".join(errors))

    def _symbol_declarations(self):
        lines = []
        for name, type_name in sorted(self.symbols.values.items()):
            if name in self.symbols.domains or name in {"i"}:
                continue
            lines.append(f"variable ({self._name(name)} : {self._type(type_name)})")
        for name, signature in sorted(self.symbols.functions.items()):
            if name in {"Re", "abs"} or signature.arguments == ("...",):
                continue
            arguments = " → ".join(self._type(value) for value in signature.arguments)
            result = self._type(signature.result)
            type_expr = f"{arguments} → {result}" if arguments else result
            lines.append(f"variable ({self._name(name)} : {type_expr})")
        return lines

    def _type(self, value):
        if value.startswith("Set["):
            return f"Set ({self._type(value[4:-1])})"
        if value.startswith("Tuple["):
            parts = value[6:-1].split(",")
            return " × ".join(self._type(part) for part in parts)
        return self.TYPES.get(value, self._name(value))

    @staticmethod
    def _name(value):
        value = str(value).replace("'", "_prime")
        name = re.sub(r"[^A-Za-z0-9_]", "_", value).strip("_")
        if not name or name[0].isdigit():
            name = "N_" + name
        return name
