import re
from dataclasses import dataclass, field

try:
    from .formal_ast import Ast, derivative_symbol, expand_derivative
except ImportError:  # Permite ejecutar las pruebas del modulo aislado.
    from PackPublica_formal_ast import Ast, derivative_symbol, expand_derivative


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
    indexed_families: set[str] = field(default_factory=set)

    def child(self):
        return SymbolTable(dict(self.values), dict(self.functions), dict(self.domains),
                           set(self.indexed_families))

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
            "Im": FunctionType(("Complex",), "Real"),
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
        if node.kind == "derivative":
            expanded = expand_derivative(node)
            if expanded is not None:
                return self._infer(expanded, symbols)
            return "Real"
        if node.kind == "summation":
            variable, lower, upper, body = node.children
            if variable.kind != "identifier":
                self._fail("la variable de sumatoria debe ser un identificador")
            child = symbols.child()
            # A bound summation index shadows an equally named global symbol.
            if node.value == "finite_set":
                domain_type = self._infer(lower, symbols)
                if not domain_type.startswith("Set["):
                    self._fail("el dominio de la sumatoria debe ser un conjunto finito explicito")
                element_type = domain_type[4:-1]
                declared = symbols.values.get(variable.value, element_type)
                if declared in self.NUMERIC and element_type in self.NUMERIC:
                    element_type = self._promote(declared, element_type)
                child.values[variable.value] = element_type
            else:
                child.values[variable.value] = "Nat"
            for name in list(child.values):
                if name.startswith(f"{variable.value}_") or name.endswith(f"_{variable.value}"):
                    child.values.pop(name, None)
            if node.value != "finite_set":
                lower_type = self._infer(lower, child)
                self._infer(upper, child)
                if lower_type not in self.NUMERIC:
                    self._fail(f"el limite inferior de sumatoria debe ser numerico, obtuvo {lower_type}")
            body_type = self._infer(body, child)
            if body_type not in self.NUMERIC:
                self._fail(f"la sumatoria requiere cuerpo numerico, obtuvo {body_type}")
            return body_type
        if node.kind == "enumeration":
            symbol = node.children[0]
            values = node.children[1:]
            symbol_type = self._infer(symbol, symbols)
            for value in values:
                if value.kind == "identifier" and value.value == "ldots":
                    continue
                value_type = self._infer(value, symbols)
                if not self._compatible(value_type, symbol_type):
                    self._fail(f"enumeracion incompatible: {symbol_type} y {value_type}")
            return "Prop"
        if node.kind == "text":
            return "Prop"
        if node.kind == "assertion":
            subject_type = self._infer(node.children[0], symbols)
            if subject_type == "Prop":
                return "Prop"
            name = "Assertion_" + str(node.value)
            signature = symbols.functions.get(name)
            if signature is None:
                self._fail(f"predicado textual no declarado: {name}")
            if signature.arguments != (subject_type,) or signature.result != "Prop":
                self._fail(
                    f"predicado textual incompatible con sujeto {subject_type}: {name}"
                )
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
            if base in symbols.indexed_families:
                return self._infer_call(base, (node.children[1],), symbols)
            subscript = self._symbol_name(node.children[1])
            name = f"{base}_{subscript}"
            if name not in symbols.values:
                self._fail(f"simbolo no declarado: {name}")
            return symbols.values[name]
        if node.kind == "power":
            if (
                node.children[0].kind in {"subscript", "decorated"}
                and node.children[1].kind in {"identifier", "text"}
            ):
                symbolic = self._symbol_name(node)
                if symbolic in symbols.values:
                    return symbols.values[symbolic]
            base = self._infer(node.children[0], symbols)
            exponent = self._infer(node.children[1], symbols)
            if base.startswith("Set[") and exponent == "Sign":
                return base
            if base not in self.NUMERIC or exponent not in self.NUMERIC:
                self._fail(f"potencia incompatible: base {base}, exponente {exponent}")
            if exponent not in {"Nat", "Int"}:
                return self._promote(base, exponent)
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
        if node.kind == "converges":
            variable, target, expression, result = node.children
            self._infer(target, symbols)
            expression_type = self._infer(expression, symbols)
            result_type = self._infer(result, symbols)
            if not self._compatible(expression_type, result_type):
                self._fail(
                    "el limite compara tipos incompatibles: "
                    f"{expression_type} y {result_type}"
                )
            if variable.kind != "identifier":
                self._fail("la variable de limite debe ser un identificador")
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
                return "Int" if operand == "Nat" else operand
            if node.value == "PM":
                if operand not in self.NUMERIC:
                    self._fail(f"± requiere un numero, se obtuvo {operand}")
                return "Int" if operand == "Nat" else operand
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
        if name == "abs":
            if len(arguments) != 1:
                self._fail("abs requiere un argumento")
            operand = self._infer(arguments[0], symbols)
            if operand not in self.NUMERIC:
                self._fail(f"abs requiere un escalar numerico, obtuvo {operand}")
            return "Real" if operand == "Complex" else operand
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
        if (
            node.kind == "power"
            and node.children[0].kind in {"subscript", "decorated"}
            and node.children[1].kind in {"identifier", "text"}
        ):
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
            if left != "Prop":
                self._fail(f"CONTEXT requiere Prop a la izquierda; obtuvo {left}")
            return "Prop"
        left = self._infer(node.children[0], symbols)
        right = self._infer(node.children[1], symbols)
        if operator in {"AND", "OR", "IMPLIES", "IFF"}:
            if left != "Prop" or right != "Prop":
                self._fail(f"{operator} requiere Prop y Prop; obtuvo {left} y {right}")
            return "Prop"
        if operator == "CORRESPONDS":
            return "Prop"
        if operator == "MAPSTO":
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
        if operator == "CONG":
            if not left.startswith("Set[") or not right.startswith("Set["):
                self._fail(f"CONG requiere dos espacios como conjuntos; obtuvo {left} y {right}")
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
        "SUBSET": "⊆", "SUBSETEQ": "⊆", "UNION": "∪",
        "COLON": ":",
        "CONTEXT": "∧",
    }
    TYPES = {"N": "ℕ", "Nat": "ℕ", "Z": "ℤ", "Int": "ℤ", "R": "ℝ", "Real": "ℝ", "C": "ℂ", "Complex": "ℂ"}

    def __init__(self, resolver=None, symbols=None):
        self.resolver = resolver or (lambda name: name)
        self.symbols = symbols
        self.bound = set()
        self.bound_types = {}

    @staticmethod
    def correspondence_name(left_type, right_type):
        clean = lambda value: re.sub(r"[^A-Za-z0-9]+", "_", value).strip("_")
        return f"Corresponds_{clean(left_type)}_to_{clean(right_type)}"

    @staticmethod
    def transformation_name(left_type, right_type):
        clean = lambda value: re.sub(r"[^A-Za-z0-9]+", "_", value).strip("_")
        return f"Transforms_{clean(left_type)}_to_{clean(right_type)}"

    def emit(self, node):
        if node.kind == "number":
            return str(node.value)
        if node.kind == "identifier":
            if node.value in self.bound:
                return self._lean_name(node.value)
            return self.TYPES.get(node.value, self._resolve(node.value))
        if node.kind == "constant":
            return {"PI": "Real.pi", "INFINITY": "Filter.atTop"}.get(node.value, node.value)
        if node.kind == "derivative":
            expanded = expand_derivative(node)
            if expanded is not None:
                return self.emit(expanded)
            subject, variable = node.children
            variable_name = self._symbolic_name(variable)
            if not variable_name:
                raise FormalSemanticError("la variable de derivacion debe tener nombre")
            if subject.kind == "identifier":
                subject_name = str(subject.value)
                subject_type = self.symbols.values.get(subject_name, "Real") if self.symbols else "Real"
                if subject_type == "Real":
                    value = self._resolve(subject_name)
                else:
                    value = self._resolve("DerivativeSubject_" + subject_name)
            else:
                value = self.emit(subject)
            operator = self._resolve("Derivative_" + variable_name, 1)
            for _ in range(int(node.value or "1")):
                value = f"{operator} ({value})"
            return value
        if node.kind == "summation":
            variable, lower, upper, body = node.children
            variable_name = variable.value
            previous_bound = variable_name in self.bound
            previous_type = self.bound_types.get(variable_name)
            index_type = "Nat"
            if node.value == "finite_set":
                domain_type = self._emit_type(lower)[4:-1]
                declared = self.symbols.values.get(variable_name, domain_type) if self.symbols else domain_type
                index_type = SemanticAnalyzer._promote(declared, domain_type)
                index_lean_type = self.TYPES[index_type]
                elements = ", ".join(f"({self.emit(element)} : {index_lean_type})"
                                     for element in lower.children)
                domain_text = "{" + elements + "}"
            self.bound.add(variable_name)
            self.bound_types[variable_name] = index_type
            try:
                body_type = "Complex"
                if self.symbols:
                    child = self.symbols.child()
                    for bound in self.bound:
                        child.values[bound] = self.bound_types[bound]
                    for name in list(child.values):
                        if name.startswith(f"{variable_name}_") or name.endswith(f"_{variable_name}"):
                            child.values.pop(name, None)
                    body_type = SemanticAnalyzer(self.symbols).analyze(body, symbols=child)
                lean_type = "ℂ" if body_type == "Complex" else "ℝ"
                field = "InfiniteSum_Nat_Complex" if body_type == "Complex" else "InfiniteSum_Nat_Real"
                body_text = self.emit(body)
                if node.value == "finite_set":
                    result_type = self.TYPES[body_type]
                    return (
                        f"Finset.sum ({domain_text} : Finset {index_lean_type}) "
                        f"(fun {self._lean_name(variable_name)} : {index_lean_type} => ({body_text} : {result_type}))"
                    )
                lower_text = self.emit(lower)
                if not (upper.kind == "constant" and upper.value == "INFINITY"):
                    if self._emit_type(lower) != "Nat" or self._emit_type(upper) != "Nat":
                        raise FormalSemanticError("La sumatoria finita necesita limites naturales tipados.")
                    upper_text = self.emit(upper)
                    result_type = self.TYPES.get(body_type, lean_type)
                    return (
                        f"Finset.sum (Finset.Icc ({lower_text} : ℕ) ({upper_text} : ℕ)) "
                        f"(fun {self._lean_name(variable_name)} : ℕ => ({body_text} : {result_type}))"
                    )
                return (
                    f"{self._resolve(field, 2)} ({lower_text}) "
                    f"(fun {self._lean_name(variable_name)} : ℕ => ({body_text} : {lean_type}))"
                )
            finally:
                if previous_bound:
                    self.bound_types[variable_name] = previous_type
                else:
                    self.bound.discard(variable_name)
                    self.bound_types.pop(variable_name, None)
        if node.kind == "enumeration":
            symbol = node.children[0]
            values = node.children[1:]
            if (
                len(values) >= 4
                and [getattr(value, "value", None) for value in values[:3]] == ["1", "2", "3"]
                and values[-1].kind == "identifier"
                and values[-1].value == "ldots"
            ):
                return f"{self.emit(symbol)} ∈ {{x : ℕ | 1 ≤ x}}"
            alternatives = []
            for value in values:
                if value.kind == "identifier" and value.value == "ldots":
                    continue
                alternatives.append(f"{self.emit(symbol)} = {self.emit(value)}")
            return "(" + " ∨ ".join(alternatives or ["True"]) + ")"
        if node.kind == "text":
            return self._resolve(self._lean_name("Text_" + node.value))
        if node.kind == "assertion":
            if self._emit_type(node.children[0]) == "Prop":
                return self.emit(node.children[0])
            name = "Assertion_" + str(node.value)
            return f"{self._resolve(name, 1)} ({self.emit(node.children[0])})"
        if node.kind == "sign":
            return {"PLUS": "plus", "MINUS": "minus", "PM": "plusMinus"}.get(node.value, node.value)
        if node.kind == "decorated":
            name = self._symbolic_name(node)
            return self._resolve(name) if name else self._lean_name(f"{node.value}_{self.emit(node.children[0])}")
        if node.kind == "subscript":
            base = self._symbolic_name(node.children[0])
            if self.symbols and base in self.symbols.indexed_families:
                return f"{self._resolve(base, 1)} ({self.emit(node.children[1])})"
            name = self._symbolic_name(node)
            return self._resolve(name) if name else self._lean_name(f"{self.emit(node.children[0])}_{self.emit(node.children[1])}")
        if node.kind == "power":
            name = self._symbolic_name(node)
            if name and self.symbols and name in self.symbols.values and not self._uses_bound(node):
                return self._resolve(name)
            if node.children[1].kind == "sign" and node.children[1].value == "PLUS":
                domain = self._symbolic_name(node.children[0])
                positive_types = {
                    "N": "ℕ", "Nat": "ℕ", "Z": "ℤ", "Int": "ℤ",
                    "R": "ℝ", "Real": "ℝ",
                }
                if domain in positive_types:
                    lean_type = positive_types[domain]
                    return f"{{x : {lean_type} | 0 < x}}"
            if self.symbols:
                analyzer = SemanticAnalyzer(self.symbols)
                exponent_type = analyzer.analyze(node.children[1])
                result_type = analyzer.analyze(node)
                if exponent_type not in {"Nat", "Int"}:
                    if result_type == "Complex":
                        return (
                            f"{self._resolve('Pow_Complex', 2)} "
                            f"({self._as_complex(node.children[0])}) "
                            f"({self._as_complex(node.children[1])})"
                        )
                    return (
                        f"{self._resolve('Pow_Real', 2)} "
                        f"({self._as_real(node.children[0])}) "
                        f"({self._as_real(node.children[1])})"
                    )
            return f"{self._parenthesize(node.children[0])} ^ {self._parenthesize(node.children[1])}"
        if node.kind == "apply":
            symbolic = self._symbolic_name(node.children[0])
            if symbolic in {"Re", "Im", "abs"}:
                return self.emit(Ast("call", symbolic, node.children[1:]))
            function = self._resolve(symbolic, len(node.children) - 1) if symbolic else self.emit(node.children[0])
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
            element = node.children[0]
            condition = node.children[1]
            variable, variable_type = self._builder_variable(condition)
            if not variable and element.kind == "identifier":
                variable = element.value
                declared = self.symbols.values.get(variable, "Real") if self.symbols else "Real"
                variable_type = self.TYPES.get(declared, declared)
            if variable:
                self.bound.add(variable)
                reverse_types = {lean: semantic for semantic, lean in self.TYPES.items()}
                self.bound_types[variable] = reverse_types.get(variable_type, "Real")
            try:
                condition_text = self.emit(condition)
                if element.kind == "identifier" and element.value == variable:
                    return "{" + self.emit(element) + " | " + condition_text + "}"
                branches = self._arithmetic_branches(element)
                alternatives = " ∨ ".join(f"x = ({value})" for value in branches)
                return f"{{x | ∃ {self._lean_name(variable)} : {variable_type}, ({condition_text}) ∧ ({alternatives})}}"
            finally:
                if variable:
                    self.bound.discard(variable)
                    self.bound_types.pop(variable, None)
        if node.kind == "limit":
            source, target = node.children
            if target.kind == "constant" and target.value == "INFINITY":
                return f"{self._resolve('DivergesToInfinity', 1)} ({self.emit(source)})"
            return (
                f"{self._resolve('TendsTo', 2)} "
                f"({self.emit(source)}) ({self.emit(target)})"
            )
        if node.kind == "converges":
            variable, target, expression, result = node.children
            if target.kind != "constant" or target.value != "INFINITY":
                raise FormalSemanticError("solo se emiten limites de sucesiones hacia infinito")
            variable_name = variable.value
            lean_variable = self._lean_name(variable_name)
            variable_type = "Real"
            if self.symbols:
                variable_type = self.symbols.values.get(variable_name, "Real")
            lean_type = self.TYPES.get(variable_type, variable_type)
            self.bound.add(variable_name)
            self.bound_types[variable_name] = variable_type
            try:
                body = self.emit(expression)
            finally:
                self.bound.discard(variable_name)
                self.bound_types.pop(variable_name, None)
            return (
                f"Filter.Tendsto (fun {lean_variable} : {lean_type} => {body}) "
                f"Filter.atTop (nhds ({self.emit(result)}))"
            )
        if node.kind == "call":
            if node.value == "abs" and self.symbols:
                operand_type = self._emit_type(node.children[0])
                if operand_type == "Complex":
                    return f"norm {self._parenthesize(node.children[0])}"
            builtins = {"Re": "Complex.re", "Im": "Complex.im", "abs": "abs"}
            name = builtins.get(node.value, node.value)
            if node.value not in builtins:
                name = self._resolve(name, len(node.children))
            args = " ".join(self._parenthesize(child) for child in node.children)
            return f"{name} {args}".rstrip()
        if node.kind == "unary":
            if node.value == "PM":
                raise FormalSemanticError("± debe emitirse como alternativas dentro de una igualdad o comprension")
            operator = "¬" if node.value == "NOT" else "-"
            return f"{operator}{self._parenthesize(node.children[0])}"
        if node.kind == "binary":
            if node.value == "CONG":
                left = self.emit(node.children[0])
                right = self.emit(node.children[1])
                return f"Nonempty (↥({left}) ≃ₜ ↥({right}))"
            if node.value == "CONTEXT":
                # "P en U" conserva P y registra U en la traza de origen.
                return self.emit(node.children[0])
            if node.value == "CORRESPONDS":
                analyzer = SemanticAnalyzer(self.symbols)
                left_type = analyzer.analyze(node.children[0])
                right_type = analyzer.analyze(node.children[1])
                relation = self._resolve(
                    self.correspondence_name(left_type, right_type), 2
                )
                return (
                    f"{relation} {self._parenthesize(node.children[0])} "
                    f"{self._parenthesize(node.children[1])}"
                )
            if node.value == "MAPSTO":
                analyzer = SemanticAnalyzer(self.symbols)
                left_type = analyzer.analyze(node.children[0])
                right_type = analyzer.analyze(node.children[1])
                relation = self._resolve(
                    self.transformation_name(left_type, right_type), 2
                )
                return (
                    f"{relation} {self._parenthesize(node.children[0])} "
                    f"{self._parenthesize(node.children[1])}"
                )
            if node.value in {"IN", "NOTIN"}:
                domain_name = self._symbolic_name(node.children[1])
                if self.symbols and domain_name in self.symbols.domains:
                    operator = self.BINARY[node.value]
                    element_type = self.TYPES[self.symbols.domains[domain_name]]
                    return f"{self._parenthesize(node.children[0])} {operator} (Set.univ : Set {element_type})"
            if node.value in {"EQ", "NE"}:
                lefts = self._arithmetic_branches(node.children[0])
                rights = self._arithmetic_branches(node.children[1])
                if len(lefts) > 1 or len(rights) > 1:
                    operator = self.BINARY[node.value]
                    return "(" + " ∨ ".join(
                        f"({left}) {operator} ({right})" for left in lefts for right in rights
                    ) + ")"
            left = self._numeric_parenthesize(node.children[0], node)
            right = self._numeric_parenthesize(node.children[1], node)
            if node.value in {"IN", "NOTIN"}:
                left = self._membership_element(node.children[0], node.children[1])
                right = self.emit(node.children[1])
            if node.value == "PM":
                raise FormalSemanticError("± solo es valido dentro de una igualdad o comprension de conjunto")
            operator = self.BINARY[node.value]
            return f"{left} {operator} {right}"
        if node.kind == "quantifier":
            quantifier = "∀" if node.value == "FORALL" else "∃"
            variable_name = node.children[0].value
            variable = self._lean_name(variable_name)
            domain = node.children[1]
            type_name = self._quantified_type(domain)
            self.bound.add(variable_name)
            reverse_types = {lean: semantic for semantic, lean in self.TYPES.items()}
            self.bound_types[variable_name] = reverse_types.get(type_name, "Real")
            try:
                body = self.emit(node.children[2])
            finally:
                self.bound.discard(variable_name)
                self.bound_types.pop(variable_name, None)
            domain_name = self._symbolic_name(domain)
            if (
                self.symbols and domain_name in self.symbols.values
                and self.symbols.values[domain_name].startswith("Set[")
            ):
                membership = f"{variable} ∈ {self._resolve(domain_name)}"
                connective = "→" if quantifier == "∀" else "∧"
                body = f"({membership}) {connective} ({body})"
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
            "binary", "quantifier", "interval", "set_builder", "limit",
            "call", "apply",
        } else value

    def _numeric_parenthesize(self, child, parent):
        value = self._parenthesize(child)
        if not self.symbols or parent.value not in {"PLUS", "MINUS", "MUL", "DIV"}:
            return value
        child_type = self._emit_type(child)
        target = self._emit_type(parent)
        lean_target = {"Int": "ℤ", "Real": "ℝ", "Complex": "ℂ"}.get(target)
        if lean_target and child_type in {"Nat", "Int", "Real"} and child_type != target:
            return f"({value} : {lean_target})"
        return value

    def _arithmetic_branches(self, node):
        if node.kind == "unary" and node.value == "PM":
            values = self._arithmetic_branches(node.children[0])
            return [branch for value in values for branch in (value, f"-({value})")]
        if node.kind == "power" and node.children[1].kind == "unary" and node.children[1].value == "PM":
            positive = Ast("power", None, (node.children[0], node.children[1].children[0]))
            negative = Ast(
                "power",
                None,
                (node.children[0], Ast("unary", "NEG", (node.children[1].children[0],))),
            )
            return [self.emit(positive), self.emit(negative)]
        if node.kind == "binary" and node.value in {"PLUS", "MINUS", "MUL", "DIV", "PM"}:
            lefts = self._arithmetic_branches(node.children[0])
            rights = self._arithmetic_branches(node.children[1])
            operators = ["+", "-"] if node.value == "PM" else [self.BINARY[node.value]]
            if self.symbols:
                target = self._emit_type(node)
                lean_target = {"Int": "ℤ", "Real": "ℝ", "Complex": "ℂ"}.get(target)
                child_types = [self._emit_type(child) for child in node.children]
                if lean_target:
                    if child_types[0] != target and child_types[0] in {"Nat", "Int", "Real"}:
                        lefts = [f"({value} : {lean_target})" for value in lefts]
                    if child_types[1] != target and child_types[1] in {"Nat", "Int", "Real"}:
                        rights = [f"({value} : {lean_target})" for value in rights]
            return [f"({left} {operator} {right})" for left in lefts for right in rights for operator in operators]
        return [self.emit(node)]

    def _as_real(self, node):
        value = self.emit(node)
        if not self.symbols:
            return value
        node_type = self._emit_type(node)
        if node_type in {"Nat", "Int"}:
            return f"({value} : ℝ)"
        return value

    def _as_complex(self, node):
        value = self.emit(node)
        if not self.symbols:
            return value
        node_type = self._emit_type(node)
        if node_type in {"Nat", "Int", "Real"}:
            return f"({value} : ℂ)"
        return value

    def _emit_type(self, node):
        if node.kind == "identifier" and node.value in self.bound:
            return self.bound_types.get(node.value, "Real")
        if not self.symbols:
            return "Real"
        child = self.symbols.child()
        for variable in self.bound:
            variable_type = self.bound_types.get(variable, "Real")
            child.values[variable] = variable_type
            for name in list(child.values):
                if name.startswith(f"{variable}_") or name.endswith(f"_{variable}"):
                    child.values.pop(name, None)
            child.values[variable] = variable_type
        return SemanticAnalyzer(self.symbols).analyze(node, symbols=child)

    def _membership_element(self, element, domain):
        value = self.emit(element)
        if not self.symbols:
            return value
        analyzer = SemanticAnalyzer(self.symbols)
        try:
            element_type = analyzer.analyze(element)
            domain_type = analyzer.analyze(domain)
        except FormalSemanticError:
            return value
        if not domain_type.startswith("Set["):
            return value
        target = domain_type[4:-1]
        if element_type == target:
            return value
        if element_type in {"Nat", "Int", "Real"} and target == "Real":
            return f"({value} : ℝ)"
        if element_type in {"Nat", "Int", "Real"} and target == "Complex":
            return f"({value} : ℂ)"
        if element_type == "Nat" and target == "Int":
            return f"({value} : ℤ)"
        return value

    def _builder_variable(self, condition):
        if condition.kind == "binary" and condition.value in {"IN", "NOTIN"}:
            left, domain = condition.children
            if left.kind == "identifier":
                type_name = self._quantified_type(domain)
                return left.value, type_name
        if condition.kind == "binary" and condition.value == "AND":
            for child in condition.children:
                variable, type_name = self._builder_variable(child)
                if variable:
                    return variable, type_name
        return None, None

    def _symbolic_name(self, node):
        if node.kind in {"identifier", "number", "sign", "constant"}:
            return str(node.value)
        if node.kind == "decorated":
            inner = self._symbolic_name(node.children[0])
            return self._lean_name(f"{node.value}_{inner}") if inner else None
        if node.kind == "subscript":
            left, right = (self._symbolic_name(child) for child in node.children)
            return self._lean_name(f"{left}_{right}") if left and right else None
        if node.kind == "tuple":
            values = [self._symbolic_name(child) for child in node.children]
            return self._lean_name("_".join(values)) if all(values) else None
        if node.kind == "limit":
            left, right = (self._symbolic_name(child) for child in node.children)
            return self._lean_name(f"{left}_to_{right}") if left and right else None
        if (
            node.kind == "power"
            and node.children[0].kind in {"subscript", "decorated"}
            and node.children[1].kind in {"identifier", "text"}
        ):
            left, right = (self._symbolic_name(child) for child in node.children)
            return self._lean_name(f"{left}_{right}") if left and right else None
        if node.kind == "power" and node.children[1].kind == "unary" and node.children[1].value == "NEG":
            left = self._symbolic_name(node.children[0])
            return self._lean_name(f"{left}_inv") if left else None
        return None

    def _uses_bound(self, node):
        if node.kind == "identifier" and node.value in self.bound:
            return True
        return any(
            self._uses_bound(child)
            for child in node.children if isinstance(child, Ast)
        )

    def _resolve(self, name, arity=None):
        try:
            return self.resolver(name, arity)
        except TypeError:
            return self.resolver(name)

    def _quantified_type(self, domain):
        if self.symbols:
            try:
                declared = SemanticAnalyzer(self.symbols).analyze(domain)
                if declared.startswith("Set["):
                    element = declared[4:-1]
                    return self.TYPES.get(element, element)
            except FormalSemanticError:
                pass
        name = self._symbolic_name(domain)
        if self.symbols and name:
            if name in self.symbols.domains:
                return self.TYPES.get(self.symbols.domains[name], self.symbols.domains[name])
            declared = self.symbols.values.get(name, "")
            if declared.startswith("Set["):
                element = declared[4:-1]
                return self.TYPES.get(element, element)
        return self.TYPES.get(getattr(domain, "value", None), self._lean_name(name or "Unknown"))
