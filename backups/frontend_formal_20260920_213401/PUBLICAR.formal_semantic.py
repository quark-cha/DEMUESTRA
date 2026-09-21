from dataclasses import dataclass, field

try:
    from .formal_ast import Ast
except ImportError:  # Permite ejecutar las pruebas del modulo aislado.
    from PackPublica_formal_ast import Ast


class FormalSemanticError(ValueError):
    pass


@dataclass(frozen=True)
class FunctionType:
    arguments: tuple[str, ...]
    result: str


@dataclass
class SymbolTable:
    values: dict[str, str] = field(default_factory=dict)
    functions: dict[str, FunctionType] = field(default_factory=dict)
    domains: dict[str, str] = field(default_factory=dict)

    def child(self):
        return SymbolTable(dict(self.values), dict(self.functions), dict(self.domains))

    def declare_value(self, name, type_name):
        previous = self.values.get(name)
        if previous is not None and previous != type_name:
            raise FormalSemanticError(
                f"El simbolo {name} ya estaba declarado como {previous}, no como {type_name}."
            )
        self.values[name] = type_name


class SemanticAnalyzer:
    NUMERIC = {"Nat", "Int", "Real", "Complex"}
    ORDERED = {"Nat", "Int", "Real"}

    def __init__(self, symbols=None, location=None):
        self.symbols = symbols or self.default_symbols()
        self.location = location

    @staticmethod
    def default_symbols():
        table = SymbolTable()
        table.functions.update({
            "Re": FunctionType(("Complex",), "Real"),
            "abs": FunctionType(("Real",), "Real"),
        })
        table.domains.update({
            "N": "Nat", "Nat": "Nat", "Z": "Int", "Int": "Int",
            "R": "Real", "Real": "Real", "C": "Complex", "Complex": "Complex",
        })
        return table

    def analyze(self, node, expected=None, symbols=None):
        symbols = symbols or self.symbols
        inferred = self._infer(node, symbols)
        if expected is not None and not self._compatible(inferred, expected):
            self._fail(f"se esperaba {expected}, se obtuvo {inferred}")
        return inferred

    def _infer(self, node, symbols):
        if node.kind == "number":
            return "Nat"
        if node.kind == "identifier":
            if node.value in symbols.values:
                return symbols.values[node.value]
            if node.value in symbols.domains:
                return f"Set[{symbols.domains[node.value]}]"
            self._fail(f"simbolo no declarado: {node.value}")
        if node.kind == "constant":
            return "Real"
        if node.kind == "text":
            return "Prop"
        if node.kind == "assertion":
            self._infer(node.children[0], symbols)
            return "Prop"
        if node.kind == "sign":
            return "Sign"
        if node.kind == "decorated":
            symbolic = self._symbol_name(node)
            if symbolic in symbols.values:
                return symbols.values[symbolic]
            return self._infer(node.children[0], symbols)
        if node.kind == "subscript":
            base = self._symbol_name(node.children[0])
            subscript = self._symbol_name(node.children[1])
            name = f"{base}_{subscript}"
            if name not in symbols.values:
                self._fail(f"simbolo no declarado: {name}")
            return symbols.values[name]
        if node.kind == "power":
            if node.children[1].kind in {"identifier", "text"}:
                symbolic = self._symbol_name(node)
                if symbolic in symbols.values:
                    return symbols.values[symbolic]
            base = self._infer(node.children[0], symbols)
            exponent = self._infer(node.children[1], symbols)
            if base.startswith("Set[") and exponent == "Sign":
                return base
            if base not in self.NUMERIC or exponent not in {"Nat", "Int"}:
                self._fail(f"potencia incompatible: base {base}, exponente {exponent}")
            return base
        if node.kind in {"call", "apply"}:
            if node.kind == "apply":
                name = self._symbol_name(node.children[0])
                arguments = node.children[1:]
            else:
                name = node.value
                arguments = node.children
            return self._infer_call(name, arguments, symbols)
        if node.kind == "tuple":
            return "Tuple[" + ",".join(self._infer(child, symbols) for child in node.children) + "]"
        if node.kind == "interval":
            endpoint_types = [self._infer(child, symbols) for child in node.children]
            if not endpoint_types or any(item not in self.ORDERED for item in endpoint_types):
                self._fail("los extremos de un intervalo deben tener tipos ordenados")
            result = endpoint_types[0]
            for item in endpoint_types[1:]:
                result = self._promote(result, item)
            return f"Set[{result}]"
        if node.kind == "set":
            if not node.children:
                self._fail("un conjunto vacio necesita una anotacion de tipo")
            types = [self._infer(child, symbols) for child in node.children]
            result = types[0]
            for item in types[1:]:
                if not self._compatible(item, result):
                    self._fail(f"elementos de conjunto incompatibles: {result} y {item}")
                if result in self.NUMERIC and item in self.NUMERIC:
                    result = self._promote(result, item)
            return f"Set[{result}]"
        if node.kind == "set_builder":
            element = node.children[0]
            condition = node.children[1]
            child = symbols.child()
            if element.kind == "identifier" and element.value not in child.values:
                inferred = self._infer_bound_type(condition, element.value, child)
                child.declare_value(element.value, inferred)
            element_type = self._infer(element, child)
            if self._infer(condition, child) != "Prop":
                self._fail("la condicion de comprension debe ser Prop")
            return f"Set[{element_type}]"
        if node.kind == "limit":
            self._infer(node.children[0], symbols)
            self._infer(node.children[1], symbols)
            return "Prop"
            if signature is None:
                self._fail(f"funcion no declarada: {node.value}")
            if len(node.children) != len(signature.arguments):
                self._fail(
                    f"{node.value} requiere {len(signature.arguments)} argumentos, "
                    f"recibio {len(node.children)}"
                )
            for child, expected in zip(node.children, signature.arguments):
                actual = self._infer(child, symbols)
                if actual != expected:
                    self._fail(
                        f"argumento de {node.value}: se esperaba {expected}, se obtuvo {actual}"
                    )
            return signature.result
        if node.kind == "unary":
            operand = self._infer(node.children[0], symbols)
            if node.value == "NOT":
                if operand != "Prop":
                    self._fail(f"la negacion requiere Prop, se obtuvo {operand}")
                return "Prop"
            if node.value == "NEG":
                if operand not in self.NUMERIC:
                    self._fail(f"el signo negativo requiere un numero, se obtuvo {operand}")
                return operand
        if node.kind == "binary":
            return self._infer_binary(node, symbols)
        if node.kind == "quantifier":
            variable = node.children[0].value
            child = symbols.child()
            if len(node.children) == 3:
                domain_type = self._infer(node.children[1], symbols)
                if not domain_type.startswith("Set["):
                    self._fail(f"el dominio de {variable} no es un conjunto: {domain_type}")
                variable_type = domain_type[4:-1]
                body = node.children[2]
            else:
                self._fail(f"el cuantificador de {variable} necesita un dominio tipado")
            child.declare_value(variable, variable_type)
            body_type = self._infer(body, child)
            if body_type != "Prop":
                self._fail(f"el cuerpo cuantificado debe ser Prop, se obtuvo {body_type}")
            return "Prop"
        self._fail(f"nodo AST no soportado: {node.kind}")

    def _infer_call(self, name, arguments, symbols):
        signature = symbols.functions.get(name)
        if signature is None:
            self._fail(f"funcion no declarada: {name}")
        if signature.arguments == ("...",):
            for child in arguments:
                self._infer(child, symbols)
            return signature.result
        if len(arguments) != len(signature.arguments):
            self._fail(
                f"{name} requiere {len(signature.arguments)} argumentos, recibio {len(arguments)}"
            )
        for child, expected in zip(arguments, signature.arguments):
            actual = self._infer(child, symbols)
            if actual != expected and not (expected == "Real" and actual in {"Nat", "Int"}):
                self._fail(f"argumento de {name}: se esperaba {expected}, se obtuvo {actual}")
        return signature.result

    def _infer_bound_type(self, condition, variable, symbols):
        if condition.kind == "binary" and condition.value in {"IN", "NOTIN"}:
            if condition.children[0].kind == "identifier" and condition.children[0].value == variable:
                domain = self._infer(condition.children[1], symbols)
                if domain.startswith("Set["):
                    return domain[4:-1]
        if condition.kind == "binary" and condition.value == "AND":
            for child in condition.children:
                try:
                    return self._infer_bound_type(child, variable, symbols)
                except FormalSemanticError:
                    pass
        self._fail(f"no se puede inferir el tipo de {variable} en la comprension")

    def _symbol_name(self, node):
        if node.kind in {"identifier", "number", "sign", "constant"}:
            return str(node.value)
        if node.kind == "decorated":
            return f"{node.value}_{self._symbol_name(node.children[0])}"
        if node.kind == "power" and node.children[1].kind in {"identifier", "text"}:
            return f"{self._symbol_name(node.children[0])}_{self._symbol_name(node.children[1])}"
        if node.kind == "power" and node.children[1].kind == "unary" and node.children[1].value == "NEG":
            return f"{self._symbol_name(node.children[0])}_inv"
        if node.kind == "tuple":
            return "_".join(self._symbol_name(child) for child in node.children)
        if node.kind == "subscript":
            return f"{self._symbol_name(node.children[0])}_{self._symbol_name(node.children[1])}"
        if node.kind == "limit":
            return f"{self._symbol_name(node.children[0])}_to_{self._symbol_name(node.children[1])}"
        self._fail(f"nombre simbolico no valido: {node.kind}")

    def _infer_binary(self, node, symbols):
        operator = node.value
        if operator == "COLON":
            return "Declaration"
        if operator == "CONTEXT":
            left = self._infer(node.children[0], symbols)
            self._infer(node.children[1], symbols)
            if left != "Prop":
                self._fail(f"CONTEXT requiere Prop a la izquierda; obtuvo {left}")
            return "Prop"
        left = self._infer(node.children[0], symbols)
        right = self._infer(node.children[1], symbols)
        if operator in {"AND", "OR", "IMPLIES", "IFF"}:
            if left != "Prop" or right != "Prop":
                self._fail(f"{operator} requiere Prop y Prop; obtuvo {left} y {right}")
            return "Prop"
        if operator in {"EQ", "NE"}:
            if not self._compatible(left, right):
                self._fail(f"{operator} compara tipos incompatibles: {left} y {right}")
            return "Prop"
        if operator in {"LT", "LE", "GT", "GE"}:
            if left not in self.ORDERED or right not in self.ORDERED:
                self._fail(f"{operator} requiere tipos ordenados; obtuvo {left} y {right}")
            return "Prop"
        if operator in {"IN", "NOTIN"}:
            if not right.startswith("Set["):
                self._fail(f"la pertenencia requiere un conjunto a la derecha, obtuvo {right}")
            element_type = right[4:-1]
            if not self._compatible(left, element_type):
                self._fail(f"elemento {left} incompatible con conjunto de {element_type}")
            return "Prop"
        if operator in {"SUBSET", "SUBSETEQ"}:
            if not left.startswith("Set[") or not right.startswith("Set["):
                self._fail(f"{operator} requiere dos conjuntos; obtuvo {left} y {right}")
            if left != right:
                self._fail(f"conjuntos incompatibles: {left} y {right}")
            return "Prop"
        if operator == "UNION":
            if not left.startswith("Set[") or left != right:
                self._fail(f"UNION requiere conjuntos del mismo tipo; obtuvo {left} y {right}")
            return left
        if operator in {"PLUS", "MINUS", "PM", "MUL", "DIV"}:
            if left not in self.NUMERIC or right not in self.NUMERIC:
                self._fail(f"{operator} requiere operandos numericos; obtuvo {left} y {right}")
            return self._promote(left, right, division=operator == "DIV")
        self._fail(f"operador no soportado: {operator}")

    @staticmethod
    def _compatible(actual, expected):
        if actual == expected:
            return True
        numeric = {"Nat", "Int", "Real", "Complex"}
        return actual in numeric and expected in numeric

    @staticmethod
    def _promote(left, right, division=False):
        order = ["Nat", "Int", "Real", "Complex"]
        result = order[max(order.index(left), order.index(right))]
        return "Real" if division and result in {"Nat", "Int"} else result

    def _fail(self, message):
        where = f" en {self.location}" if self.location else ""
        raise FormalSemanticError(f"Error semantico{where}: {message}.")


class LeanExpressionEmitter:
    BINARY = {
        "IFF": "↔", "IMPLIES": "→", "OR": "∨", "AND": "∧",
        "EQ": "=", "NE": "≠", "LT": "<", "LE": "≤", "GT": ">", "GE": "≥",
        "IN": "∈", "NOTIN": "∉", "PLUS": "+", "MINUS": "-", "MUL": "*", "DIV": "/",
        "SUBSET": "⊂", "SUBSETEQ": "⊆", "UNION": "∪",
        "COLON": ":",
        "CONTEXT": "∧",
    }
    TYPES = {"N": "ℕ", "Nat": "ℕ", "Z": "ℤ", "Int": "ℤ", "R": "ℝ", "Real": "ℝ", "C": "ℂ", "Complex": "ℂ"}

    def emit(self, node):
        if node.kind in {"number", "identifier"}:
            return self.TYPES.get(node.value, node.value)
        if node.kind == "constant":
            return {"PI": "Real.pi", "INFINITY": "Filter.atTop"}.get(node.value, node.value)
        if node.kind == "text":
            return self._lean_name("Text_" + node.value)
        if node.kind == "assertion":
            return f"{self._lean_name('Text_' + node.value)} ({self.emit(node.children[0])})"
        if node.kind == "sign":
            return {"PLUS": "plus", "MINUS": "minus", "PM": "plusMinus"}.get(node.value, node.value)
        if node.kind == "decorated":
            return self._lean_name(f"{node.value}_{self.emit(node.children[0])}")
        if node.kind == "subscript":
            return self._lean_name(f"{self.emit(node.children[0])}_{self.emit(node.children[1])}")
        if node.kind == "power":
            return f"{self._parenthesize(node.children[0])} ^ {self._parenthesize(node.children[1])}"
        if node.kind == "apply":
            function = self.emit(node.children[0])
            args = " ".join(self._parenthesize(child) for child in node.children[1:])
            return f"{function} {args}"
        if node.kind == "tuple":
            return "(" + ", ".join(self.emit(child) for child in node.children) + ")"
        if node.kind == "interval":
            left, right = (self._parenthesize(child) for child in node.children)
            return f"Set.Icc {left} {right}"
        if node.kind == "set":
            return "{" + ", ".join(self.emit(child) for child in node.children) + "}"
        if node.kind == "set_builder":
            return "{" + self.emit(node.children[0]) + " | " + self.emit(node.children[1]) + "}"
        if node.kind == "limit":
            return f"Tendsto {self.emit(node.children[0])} Filter.atTop {self.emit(node.children[1])}"
        if node.kind == "call":
            name = {"Re": "Complex.re", "abs": "abs"}.get(node.value, node.value)
            args = " ".join(self._parenthesize(child) for child in node.children)
            return f"{name} {args}".rstrip()
        if node.kind == "unary":
            operator = "¬" if node.value == "NOT" else "-"
            return f"{operator}{self._parenthesize(node.children[0])}"
        if node.kind == "binary":
            if node.value == "CONTEXT":
                return self.emit(node.children[0])
            left = self._parenthesize(node.children[0])
            right = self._parenthesize(node.children[1])
            if node.value == "PM":
                return f"({left} + {right}) ∨ ({left} - {right})"
            operator = self.BINARY[node.value]
            return f"{left} {operator} {right}"
        if node.kind == "quantifier":
            quantifier = "∀" if node.value == "FORALL" else "∃"
            variable = self.emit(node.children[0])
            domain = node.children[1]
            body = self.emit(node.children[2])
            type_name = self.TYPES.get(domain.value, domain.value)
            return f"{quantifier} {variable} : {type_name}, {body}"
        raise FormalSemanticError(f"No se puede emitir el nodo AST {node.kind}.")

    @staticmethod
    def _lean_name(value):
        import re
        name = re.sub(r"[^A-Za-z0-9_]", "_", str(value)).strip("_")
        return name or "unnamed"

    def _parenthesize(self, node):
        value = self.emit(node)
        return f"({value})" if node.kind in {
            "binary", "quantifier", "interval", "set_builder", "limit"
        } else value
