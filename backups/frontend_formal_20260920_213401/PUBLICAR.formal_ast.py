import re
from dataclasses import dataclass


class FormalSyntaxError(ValueError):
    pass


@dataclass(frozen=True)
class Ast:
    kind: str
    value: str | None = None
    children: tuple = ()


class LatexLexer:
    """Lexer determinista para el lenguaje matematico de PUBLICAR."""

    COMMANDS = {
        "forall": "FORALL",
        "exists": "EXISTS",
        "in": "IN",
        "notin": "NOTIN",
        "land": "AND",
        "wedge": "AND",
        "lor": "OR",
        "vee": "OR",
        "neg": "NOT",
        "lnot": "NOT",
        "Rightarrow": "IMPLIES",
        "Longrightarrow": "IMPLIES",
        "implies": "IMPLIES",
        "iff": "IFF",
        "Leftrightarrow": "IFF",
        "Longleftrightarrow": "IFF",
        "le": "LE",
        "leq": "LE",
        "ge": "GE",
        "geq": "GE",
        "neq": "NE",
        "ne": "NE",
        "lt": "LT",
        "gt": "GT",
        "pm": "PM",
        "times": "MUL",
        "cdot": "MUL",
        "mathbb": "MATHBB",
        "operatorname": "OPERATOR",
        "Re": "RE",
        "frac": "FRAC",
        "tfrac": "FRAC",
        "to": "TO",
        "sqrt": "SQRT",
        "infty": "INFINITY",
        "pi": "PI",
        "mathcal": "MODIFIER",
        "tilde": "MODIFIER",
        "subset": "SUBSET",
        "subseteq": "SUBSETEQ",
        "sqcup": "UNION",
        "cup": "UNION",
        "ldots": "ELLIPSIS",
        "zeta": "IDENT_COMMAND",
        "varepsilon": "IDENT_COMMAND",
        "rho": "IDENT_COMMAND",
        "lambda": "IDENT_COMMAND",
    }

    SIMPLE = {
        "=": "EQ", "<": "LT", ">": "GT", "+": "PLUS", "-": "MINUS",
        "*": "MUL", "/": "DIV", "(": "LPAREN", ")": "RPAREN",
        "[": "LBRACK", "]": "RBRACK", "{": "LBRACE", "}": "RBRACE",
        ",": "COMMA", ":": "COLON", "|": "BAR", "^": "CARET", "_": "SUB",
    }

    SKIP_COMMANDS = {"left", "right", "quad", "qquad", "rm", "mathrm"}

    @classmethod
    def tokenize(cls, source, location=None):
        text = str(source or "")
        tokens = []
        index = 0
        while index < len(text):
            char = text[index]
            if char.isspace() or char in "$.;":
                index += 1
                continue
            if char == "\\":
                if index + 1 < len(text) and text[index + 1] in ",;! ":
                    index += 2
                    continue
                if index + 1 < len(text) and text[index + 1] in "{}":
                    brace = text[index + 1]
                    tokens.append(("SET_LBRACE" if brace == "{" else "SET_RBRACE", brace, index))
                    index += 2
                    continue
                match = re.match(r"\\([A-Za-z]+)", text[index:])
                if not match:
                    raise cls._error(text, index, location, "comando LaTeX incompleto")
                command = match.group(1)
                index += len(match.group(0))
                if command == "text" and index < len(text) and text[index] == "{":
                    end = index + 1
                    depth = 1
                    while end < len(text) and depth:
                        depth += (text[end] == "{") - (text[end] == "}")
                        end += 1
                    if depth:
                        raise cls._error(text, index, location, "texto LaTeX sin cerrar")
                    value = re.sub(r"\s+", "_", text[index + 1:end - 1].strip())
                    logical = {"y": "AND", "and": "AND", "en": "CONTEXT", "in": "CONTEXT"}
                    tokens.append((logical.get(value.lower(), "TEXT"), value or "texto", index))
                    index = end
                    continue
                if command in cls.SKIP_COMMANDS:
                    continue
                token = cls.COMMANDS.get(command)
                if token is None:
                    tokens.append(("IDENT", command, index))
                else:
                    tokens.append((token, command, index))
                continue
            if char in cls.SIMPLE:
                tokens.append((cls.SIMPLE[char], char, index))
                index += 1
                continue
            number = re.match(r"(?:[0-9]+(?:\.[0-9]+)?)", text[index:])
            if number:
                value = number.group(0)
                tokens.append(("NUMBER", value, index))
                index += len(value)
                continue
            ident = re.match(r"[A-Za-z][A-Za-z0-9']*", text[index:])
            if ident:
                value = ident.group(0)
                tokens.append(("IDENT", value, index))
                index += len(value)
                continue
            raise cls._error(text, index, location, f"simbolo no reconocido {char!r}")
        tokens.append(("EOF", "", len(text)))
        return tokens

    @staticmethod
    def _error(source, index, location, message):
        where = f" en {location}" if location else ""
        return FormalSyntaxError(
            f"Error lexico{where}: {message} en columna {index + 1}. Formula: {source.strip()}"
        )


class FormalParser:
    """Parser Pratt para proposiciones y expresiones matematicas."""

    PRECEDENCE = {
        "COLON": 5,
        "IFF": 10, "IMPLIES": 20, "OR": 30, "AND": 40,
        "UNION": 45, "CONTEXT": 45,
        "EQ": 50, "NE": 50, "LT": 50, "LE": 50, "GT": 50, "GE": 50,
        "IN": 50, "NOTIN": 50, "SUBSET": 50, "SUBSETEQ": 50,
        "PLUS": 60, "MINUS": 60, "PM": 60,
        "MUL": 70, "DIV": 70,
    }

    def __init__(self, source, location=None):
        self.source = str(source or "")
        self.location = location
        self.tokens = LatexLexer.tokenize(self.source, location)
        self.index = 0

    def parse(self):
        # Una etiqueta formal como P_{ST}: nombra la formula, no forma parte de ella.
        colon = self._declaration_label_colon()
        if colon is not None:
            self.index = colon + 1
        result = self._expr(0)
        while self._accept("COMMA"):
            if self._current()[0] in {"EOF", "RBRACE", "RBRACK", "RPAREN", "SET_RBRACE"}:
                break
            result = Ast("binary", "AND", (result, self._expr(0)))
        while self._accept("RBRACE"):
            pass
        self._expect("EOF")
        return result

    def _declaration_label_colon(self):
        if not re.match(r"^\s*(?:\\boxed\s*\{\s*)?[DAPT](?:_\s*\{[^}]+\}|_[A-Za-z0-9]+)\s*:", self.source):
            return None
        depth = 0
        for index, token in enumerate(self.tokens):
            if token[0] in {"LPAREN", "LBRACK", "LBRACE", "SET_LBRACE"}:
                depth += 1
            elif token[0] in {"RPAREN", "RBRACK", "RBRACE", "SET_RBRACE"}:
                depth -= 1
            elif token[0] == "COLON":
                return index
            if token[0] in {"EQ", "IFF", "IMPLIES"}:
                return None
        return None

    def _current(self):
        return self.tokens[self.index]

    def _accept(self, kind):
        if self._current()[0] == kind:
            token = self._current()
            self.index += 1
            return token
        return None

    def _expect(self, kind):
        token = self._accept(kind)
        if token is None:
            actual = self._current()
            raise FormalSyntaxError(
                f"Error sintactico en {self.location or 'formula'}: se esperaba {kind}, "
                f"se encontro {actual[0]} ({actual[1]!r}). Formula: {self.source.strip()}"
            )
        return token

    def _expr(self, minimum):
        left = self._postfix(self._prefix())
        while True:
            kind = self._current()[0]
            precedence = self.PRECEDENCE.get(kind, -1)
            implicit = kind in {
                "NUMBER", "IDENT", "IDENT_COMMAND", "MATHBB", "RE", "OPERATOR", "FRAC",
                "SQRT", "PI", "INFINITY", "TEXT", "LPAREN", "LBRACE", "LBRACK",
            }
            if implicit and kind == "TEXT" and minimum > self.PRECEDENCE["AND"]:
                break
            if implicit and kind == "TEXT" and minimum <= self.PRECEDENCE["AND"]:
                token = self._current()
                self.index += 1
                left = Ast("assertion", token[1], (left,))
                continue
            if implicit:
                kind = "AND" if self._current()[0] == "TEXT" and self._propish(left) else "MUL"
                precedence = self.PRECEDENCE[kind]
            if precedence < minimum:
                break
            if implicit:
                operator = ("MUL", "implicit", self._current()[2])
            else:
                operator = self._current()
                self.index += 1
            right_minimum = precedence if kind == "IMPLIES" else precedence + 1
            right = self._expr(right_minimum)
            comparison = {"EQ", "NE", "LT", "LE", "GT", "GE", "IN", "NOTIN"}
            if operator[0] in comparison and left.kind == "binary" and left.value in comparison:
                left = Ast("binary", "AND", (
                    left,
                    Ast("binary", operator[0], (left.children[1], right)),
                ))
            elif operator[0] in comparison and left.kind == "binary" and left.value == "AND":
                previous = self._last_comparison(left, comparison)
                if previous is not None:
                    left = Ast("binary", "AND", (
                        left,
                        Ast("binary", operator[0], (previous.children[1], right)),
                    ))
                else:
                    left = Ast("binary", operator[0], (left, right))
            else:
                left = Ast("binary", operator[0], (left, right))
        return left

    @classmethod
    def _last_comparison(cls, node, comparison):
        if node.kind == "binary" and node.value in comparison:
            return node
        if node.kind == "binary" and node.value == "AND":
            return cls._last_comparison(node.children[1], comparison)
        return None

    @staticmethod
    def _propish(node):
        return node.kind in {"quantifier", "text"} or (
            node.kind == "binary" and node.value in {
                "EQ", "NE", "LT", "LE", "GT", "GE", "IN", "NOTIN",
                "SUBSET", "SUBSETEQ", "AND", "OR", "IMPLIES", "IFF",
            }
        )

    def _postfix(self, node):
        while self._current()[0] in {"CARET", "SUB", "TO", "LPAREN"}:
            operator = self._current()[0]
            if operator == "LPAREN":
                if node.kind not in {"identifier", "subscript", "decorated", "power", "call", "apply"}:
                    break
                self.index += 1
                args = []
                if self._current()[0] != "RPAREN":
                    args.append(self._expr(0))
                    while self._accept("COMMA"):
                        args.append(self._expr(0))
                self._expect("RPAREN")
                node = Ast("apply", None, (node, *args))
                continue
            self.index += 1
            if operator == "TO":
                target = self._postfix(self._prefix())
                node = Ast("limit", None, (node, target))
                continue
            if self._current()[0] in {"PLUS", "MINUS", "PM"}:
                sign = self._current()[0]
                self.index += 1
                operand = Ast("sign", sign)
            else:
                if self._current()[0] in {"LBRACE", "LPAREN"}:
                    operand = self._group()
                elif self._current()[0] == "IDENT":
                    operand = Ast("identifier", self._current()[1])
                    self.index += 1
                else:
                    operand = self._prefix()
            node = Ast("power" if operator == "CARET" else "subscript", None, (node, operand))
        return node

    def _prefix(self):
        token = self._current()
        if token[0] in {"FORALL", "EXISTS"}:
            self.index += 1
            variable = self._expect("IDENT")[1]
            domain = None
            if self._accept("IN"):
                domain = self._expr(51)
            self._accept("COMMA")
            body = self._expr(0)
            children = (Ast("identifier", variable), body) if domain is None else (
                Ast("identifier", variable), domain, body
            )
            return Ast("quantifier", token[0], children)
        if token[0] == "NOT":
            self.index += 1
            return Ast("unary", "NOT", (self._expr(80),))
        if token[0] == "MINUS":
            self.index += 1
            return Ast("unary", "NEG", (self._expr(80),))
        if token[0] == "PM":
            self.index += 1
            if self._current()[0] in {"RBRACE", "RBRACK", "RPAREN", "COMMA", "EQ"}:
                return Ast("sign", "PM")
            return Ast("unary", "PM", (self._expr(80),))
        if token[0] == "FRAC":
            self.index += 1
            numerator = self._fraction_operand()
            denominator = self._fraction_operand()
            return Ast("binary", "DIV", (numerator, denominator))
        if token[0] == "SQRT":
            self.index += 1
            return Ast("call", "sqrt", (self._fraction_operand(),))
        if token[0] in {"PI", "INFINITY"}:
            self.index += 1
            return Ast("constant", token[0])
        if token[0] in {"IDENT_COMMAND", "ELLIPSIS"}:
            self.index += 1
            return Ast("identifier", token[1])
        if token[0] == "TEXT":
            self.index += 1
            return Ast("text", token[1])
        if token[0] == "MODIFIER":
            self.index += 1
            return Ast("decorated", token[1], (self._fraction_operand(),))
        if token[0] == "SET_LBRACE":
            self.index += 1
            elements = []
            if self._current()[0] != "SET_RBRACE":
                first = self._expr(self.PRECEDENCE["COLON"] + 1)
                if self._accept("COLON"):
                    condition = self._expr(0)
                    if first.kind == "binary" and first.value == "IN":
                        element = first.children[0]
                        condition = Ast("binary", "AND", (first, condition))
                    else:
                        element = first
                    while self._accept("COMMA"):
                        if self._current()[0] == "SET_RBRACE":
                            break
                        condition = Ast("binary", "AND", (condition, self._expr(0)))
                    self._expect("SET_RBRACE")
                    return Ast("set_builder", None, (element, condition))
                elements.append(first)
                while self._accept("COMMA"):
                    if self._current()[0] == "SET_RBRACE":
                        break
                    elements.append(self._expr(0))
            self._expect("SET_RBRACE")
            return Ast("set", None, tuple(elements))
        if token[0] == "IDENT" and token[1] == "boxed":
            self.index += 1
            return self._group()
        if token[0] == "IDENT" and token[1] == "text":
            self.index += 1
            if self._current()[0] != "LBRACE":
                return Ast("identifier", "text")
            self.index += 1
            words = []
            while self._current()[0] not in {"RBRACE", "EOF"}:
                words.append(self._current()[1])
                self.index += 1
            self._expect("RBRACE")
            return Ast("identifier", "text_" + "_".join(words))
        if token[0] == "RE":
            self.index += 1
            argument = self._group_or_parenthesized()
            return Ast("call", token[1], (argument,))
        if token[0] == "OPERATOR":
            self.index += 1
            return Ast("identifier", self._group_identifier())
        if token[0] == "BAR":
            self.index += 1
            value = self._expr(0)
            self._expect("BAR")
            return Ast("call", "abs", (value,))
        if token[0] == "NUMBER":
            self.index += 1
            return Ast("number", token[1])
        if token[0] in {"IDENT", "MATHBB"}:
            self.index += 1
            name = token[1]
            if token[0] == "MATHBB":
                name = self._group_identifier()
            node = Ast("identifier", name)
            if self._accept("LPAREN"):
                args = []
                if self._current()[0] != "RPAREN":
                    args.append(self._expr(0))
                    while self._accept("COMMA"):
                        args.append(self._expr(0))
                self._expect("RPAREN")
                node = Ast("call", name, tuple(args))
            return node
        if token[0] in {"LPAREN", "LBRACK", "LBRACE"}:
            return self._group()
        raise FormalSyntaxError(
            f"Error sintactico en {self.location or 'formula'}: token inesperado "
            f"{token[0]} ({token[1]!r}). Formula: {self.source.strip()}"
        )

    def _group(self):
        opening = self._current()[0]
        closing = {"LPAREN": "RPAREN", "LBRACK": "RBRACK", "LBRACE": "RBRACE"}.get(opening)
        if closing is None:
            raise FormalSyntaxError(f"Se esperaba un grupo en {self.location or 'formula'}.")
        self.index += 1
        values = [self._expr(0)]
        while self._accept("COMMA"):
            if self._current()[0] == closing:
                break
            values.append(self._expr(0))
        self._expect(closing)
        if len(values) == 1:
            return values[0]
        kind = "interval" if opening == "LBRACK" and len(values) == 2 else "tuple"
        return Ast(kind, opening, tuple(values))

    def _group_identifier(self):
        opening = self._current()[0]
        closing = {"LBRACE": "RBRACE", "LPAREN": "RPAREN"}.get(opening)
        if closing is None:
            return self._expect("IDENT")[1]
        self.index += 1
        value = self._expect("IDENT")[1]
        self._expect(closing)
        return value

    def _fraction_operand(self):
        if self._current()[0] in {"LPAREN", "LBRACE", "LBRACK"}:
            return self._group()
        token = self._current()
        if token[0] == "NUMBER" and len(token[1]) > 1 and token[1].isdigit():
            self.index += 1
            head, tail = token[1][0], token[1][1:]
            if tail:
                self.tokens.insert(self.index, ("NUMBER", tail, token[2] + 1))
            return Ast("number", head)
        return self._prefix()

    def _group_or_parenthesized(self):
        if self._current()[0] in {"LPAREN", "LBRACE", "LBRACK"}:
            return self._group()
        return self._prefix()


def parse_formula(source, location=None):
    return FormalParser(source, location).parse()
