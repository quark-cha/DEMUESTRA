try:
    from .formal_ast import Ast
    from .formal_semantic import FunctionType, SymbolTable
except ImportError:
    from PackPublica_formal_ast import Ast
    from PackPublica_formal_semantic import FunctionType, SymbolTable


class SymbolInferenceError(ValueError):
    pass


class SymbolInference:
    """Infiere declaraciones Lean desde el uso matematico, no desde nombres."""

    def __init__(self):
        self.table = SymbolTable()
        self.table.domains.update({
            "N": "Nat", "Nat": "Nat", "Z": "Int", "Int": "Int",
            "R": "Real", "Real": "Real", "C": "Complex", "Complex": "Complex",
        })
        self.table.functions.update({
            "Re": FunctionType(("Complex",), "Real"),
            "abs": FunctionType(("Real",), "Real"),
            "zeta": FunctionType(("Complex",), "Complex"),
        })
        self.table.values["i"] = "Complex"
        self._sets = {}
        self._set_elements = {}
        self._set_nodes = {}
        self._numeric = set()
        self._complex = set()
        self._calls = {}

    def infer(self, classified_nodes):
        formulas = [
            formula.ast
            for node in classified_nodes
            for formula in (*node.declarations, *node.claims, *node.steps)
        ]
        for ast in formulas:
            self._constraints(ast)
        for name in sorted(self._all_names(formulas)):
            if name in self.table.domains or name in self.table.functions or name in self.table.values:
                continue
            if name in self._sets:
                element = self._set_elements.get(name)
                element_type = "Complex" if element in self._complex else self._sets[name]
                self.table.values[name] = f"Set[{element_type}]"
            elif name in self._complex:
                self.table.values[name] = "Complex"
            else:
                self.table.values[name] = "Real"
        for name, entries in self._calls.items():
            arities = {len(args) for args, _ in entries}
            if len(arities) != 1:
                self.table.functions.setdefault(name, FunctionType(("...",), "Real"))
                continue
            args, result = entries[-1]
            columns = zip(*(entry_args for entry_args, _ in entries))
            argument_types = tuple(self._widest(self._node_type(arg) for arg in column) for column in columns)
            results = {item_result for _, item_result in entries if item_result}
            result_type = "Prop" if "Prop" in results else "Real"
            self.table.functions.setdefault(name, FunctionType(argument_types, result_type))
        for name, element in self._set_nodes.items():
            self.table.values[name] = f"Set[{self._node_type(element)}]"
        return self.table

    @staticmethod
    def _widest(types):
        order = ["Nat", "Int", "Real", "Complex"]
        values = list(types)
        numeric = [item for item in values if item in order]
        return order[max(order.index(item) for item in numeric)] if len(numeric) == len(values) else values[-1]

    def _constraints(self, node, expected=None):
        if node.kind == "quantifier" and len(node.children) == 3:
            variable, domain, body = node.children
            domain_name = self._name(domain)
            variable_name = self._name(variable)
            if domain_name and variable_name:
                self._sets.setdefault(domain_name, "Real")
                self._set_elements.setdefault(domain_name, variable_name)
                if self._contains_call(body, "Re", variable_name) or self._contains_call(body, "zeta", variable_name):
                    self._sets[domain_name] = "Complex"
                    self._set_elements[domain_name] = variable_name
        if node.kind == "binary" and node.value == "EQ":
            left, right = node.children
            left_name = self._name(left)
            if left_name and right.kind in {"set", "set_builder"}:
                element = right.children[0] if right.children else None
                element_name = self._name(element) if element else None
                self._sets[left_name] = "Real"
                self._set_nodes[left_name] = element
                if element_name:
                    self._set_elements[left_name] = element_name
        if node.kind == "binary" and node.value in {"IN", "NOTIN"}:
            left, right = node.children
            domain = self._domain_type(right)
            left_name = self._name(left)
            right_name = self._name(right)
            if left_name and domain:
                self.table.values[left_name] = domain
            elif left_name and right_name:
                self._sets[right_name] = "Real"
                self._set_elements[right_name] = left_name
        if node.kind in {"call", "apply"}:
            name, args = self._call(node)
            if name:
                self._calls.setdefault(name, []).append((args, expected))
            if name == "Re" and args:
                arg = self._name(args[0])
                if arg:
                    self._complex.add(arg)
            if name == "zeta" and args:
                arg = self._name(args[0])
                if arg:
                    self._complex.add(arg)
        child_expected = "Prop" if node.kind == "binary" and node.value in {"AND", "OR", "IMPLIES", "IFF"} else None
        for child in node.children:
            if isinstance(child, Ast):
                self._constraints(child, child_expected)

    def _node_type(self, node):
        if node.kind == "number":
            return "Nat"
        if node.kind == "text":
            return "Prop"
        if node.kind == "tuple":
            return "Tuple[" + ",".join(self._node_type(child) for child in node.children) + "]"
        if node.kind == "binary" and node.value in {"PLUS", "MINUS", "PM", "MUL", "DIV"}:
            return self._widest(self._node_type(child) for child in node.children)
        name = self._name(node)
        if name in self.table.values:
            return self.table.values[name]
        domain = self._domain_type(node)
        if domain:
            return f"Set[{domain}]"
        if name in self._complex:
            return "Complex"
        return "Real"

    def _all_names(self, nodes):
        result = set()
        def visit(node):
            name = self._name(node)
            if name and node.kind in {"identifier", "subscript", "decorated", "power", "limit"}:
                result.add(name)
            for child in node.children:
                if isinstance(child, Ast):
                    visit(child)
        for node in nodes:
            visit(node)
        return result

    def _domain_type(self, node):
        if node.kind == "power" and node.children[1].kind == "sign":
            node = node.children[0]
        name = self._name(node)
        return self.table.domains.get(name)

    def _call(self, node):
        if node.kind == "call":
            return node.value, node.children
        return self._name(node.children[0]), node.children[1:]

    def _contains_call(self, node, name, argument_name):
        if node.kind in {"call", "apply"}:
            call_name, args = self._call(node)
            if call_name == name and args and self._name(args[0]) == argument_name:
                return True
        return any(
            self._contains_call(child, name, argument_name)
            for child in node.children if isinstance(child, Ast)
        )

    def _name(self, node):
        if node.kind in {"identifier", "number", "sign", "constant"}:
            return str(node.value)
        if node.kind == "decorated":
            inner = self._name(node.children[0])
            return f"{node.value}_{inner}" if inner else None
        if node.kind == "subscript":
            left, right = (self._name(child) for child in node.children)
            return f"{left}_{right}" if left and right else None
        if node.kind == "tuple":
            values = [self._name(child) for child in node.children]
            return "_".join(values) if all(values) else None
        if node.kind == "power" and node.children[1].kind in {"identifier", "text"}:
            left, right = (self._name(child) for child in node.children)
            return f"{left}_{right}" if left and right else None
        if node.kind == "power" and node.children[1].kind == "unary" and node.children[1].value == "NEG":
            left = self._name(node.children[0])
            return f"{left}_inv" if left else None
        if node.kind == "limit":
            left, right = (self._name(child) for child in node.children)
            return f"{left}_to_{right}" if left and right else None
        return None
