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
    """Emite Lean autocontenido desde el grafo formal, sin plantillas por documento."""

    TYPES = {"Nat": "ℕ", "Int": "ℤ", "Real": "ℝ", "Complex": "ℂ", "Prop": "Prop"}

    def __init__(self, classified_nodes, namespace):
        self.nodes = tuple(classified_nodes)
        self.namespace = self._name(namespace)
        self.inference = SymbolInference()
        self.symbols = self.inference.infer(self.nodes)
        self.emitter = LeanExpressionEmitter(self._resolve, self.symbols)

    def compile(self):
        self._validate_selected_formulas()
        lines = ["import Mathlib", "", "set_option maxHeartbeats 100000", "", f"namespace {self.namespace}", ""]
        lines.extend(self._context_declaration())
        lines.append("")
        for item in self.nodes:
            node = item.source
            lines.append(f"-- FORMAL_NODE: {node.node_id}")
            lines.append(f"-- SOURCE: {node.source_file}:{node.start_line or '?'}")
            for formula in node.formulas:
                source = " ".join(formula.source.split()).replace("-/", "- /")
                lines.append(f"-- FORMULA: {source}")
            expressions = [
                self.emitter.emit(f.ast)
                for f in (*item.declarations, *item.claims)
                if SemanticAnalyzer(self.symbols, f.location).analyze(f.ast) == "Prop"
            ]
            if expressions:
                body = " ∧ ".join(f"({value})" for value in expressions)
            elif node.deps:
                body = " ∧ ".join(f"Node_{self._name(dep)} ctx" for dep in node.deps)
            else:
                body = "True"
            node_name = self._name(node.node_id)
            lines.append(f"def Node_{node_name} (ctx : FormalContext) : Prop := {body}")
            if node.deps:
                hypotheses = " ".join(f"(h_{self._name(dep)} : Node_{self._name(dep)} ctx)" for dep in node.deps)
                lines.append(f"theorem derive_{node_name} (ctx : FormalContext) {hypotheses} : Node_{node_name} ctx := by")
                lines.append("  first | assumption | rfl")
            lines.append("")
        theorem_results = [
            item for item in self.nodes
            if item.source.kind in {"theorem", "corollary"} and item.claims
        ]
        result = theorem_results[-1] if theorem_results else next(
            (item for item in reversed(self.nodes) if item.claims), self.nodes[-1]
        )
        result_name = self._name(result.source.node_id)
        lines.extend([
            f"end {self.namespace}", "", "-- DEMUESTRA_AUDIT_BEGIN",
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

    def _context_declaration(self):
        fields = {}
        for name, type_name in sorted(self.symbols.values.items()):
            if name not in self.symbols.domains:
                fields[self._field_name(name, None)] = self._type(type_name)
        for name, signature in sorted(self.symbols.functions.items()):
            if name in {"Re", "abs"}:
                continue
            if signature.arguments == ("...",):
                groups = {}
                for args, _ in self.inference._calls.get(name, []):
                    groups.setdefault(len(args), args)
                for arity, args in sorted(groups.items()):
                    argument_types = tuple(self.inference._node_type(arg) for arg in args)
                    fields[self._field_name(name, arity)] = self._function_type(argument_types, signature.result)
            else:
                fields[self._field_name(name, len(signature.arguments))] = self._function_type(signature.arguments, signature.result)
        for text_name in sorted(self._text_atoms()):
            fields.setdefault(self._name("Text_" + text_name), "Prop")
        fields.setdefault(self._field_name("DivergesToInfinity", 1), "ℝ → Prop")
        lines = ["structure FormalContext where"]
        lines.extend(f"  {name} : {type_expr}" for name, type_expr in sorted(fields.items()))
        return lines

    def _text_atoms(self):
        result = set()
        def visit(node):
            if node.kind in {"text", "assertion"}:
                result.add(str(node.value))
            for child in node.children:
                if isinstance(child, Ast):
                    visit(child)
        for item in self.nodes:
            for formula in (*item.declarations, *item.claims):
                visit(formula.ast)
        return result

    def _resolve(self, name, arity=None):
        return "ctx." + self._field_name(name, arity)

    def _field_name(self, name, arity):
        base = self._name(name)
        signature = self.symbols.functions.get(name)
        if arity is not None and (name in self.symbols.values or (signature and signature.arguments == ("...",))):
            return f"{base}_fn_{arity}"
        return base

    def _function_type(self, arguments, result):
        return " → ".join([*(self._type(value) for value in arguments), self._type(result)])

    def _type(self, value):
        if value.startswith("Set["):
            return f"Set ({self._type(value[4:-1])})"
        if value.startswith("Tuple["):
            return " × ".join(self._type(part) for part in value[6:-1].split(","))
        return self.TYPES.get(value, self._name(value))

    @staticmethod
    def _name(value):
        value = str(value).replace("'", "_prime")
        name = re.sub(r"[^A-Za-z0-9_]", "_", value).strip("_")
        if not name or name[0].isdigit():
            name = "N_" + name
        return name
