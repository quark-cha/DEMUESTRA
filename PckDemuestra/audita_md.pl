:- use_module(library(apply)).
:- use_module(library(lists)).
:- use_module(library(pcre)).
:- use_module(library(readutil)).

:- dynamic md_node/3.
:- dynamic md_rule/3.
:- dynamic md_formula_line/3.
:- dynamic md_qed/2.
:- dynamic md_inferred_dependency/3.

:- initialization(main, main).

main(Args) :-
    catch(run(Args, Code), Error, auditor_exception(Error, Code)),
    halt(Code).

auditor_exception(Error, 40) :-
    print_message(error, Error),
    writeln('RESULTADO PROLOG MD: ERROR_PROPIO_DEL_AUDITOR').

run([File], Code) :- !,
    absolute_file_name(File, Absolute, [access(read), file_type(regular)]),
    retractall(md_node(_, _, _)),
    retractall(md_rule(_, _, _)),
    retractall(md_formula_line(_, _, _)),
    retractall(md_qed(_, _)),
    retractall(md_inferred_dependency(_, _, _)),
    read_file_to_string(Absolute, Text, []),
    split_string(Text, "\n", "\r", Lines),
    parse_lines(Lines, 1, none, false),
    emit_inventory(Absolute),
    emit_theorem_results,
    (   select_goal(Goal)
    ->  evaluate_goal(Goal, Code)
    ;   writeln('RESULTADO PROLOG MD: NO_DEMOSTRADO'),
        writeln('FALTA: no se encontro ningun teorema declarado'),
        writeln('OBLIGACION|MISSING_THEOREM_GOAL|ABIERTA|El Markdown no declara ningun nodo de teorema evaluable.'),
        Code = 2
    ).
run(_, 40) :-
    writeln('USO: swipl -q -s audita_md.pl -- archivo.md'),
    writeln('RESULTADO PROLOG MD: ERROR_PROPIO_DEL_AUDITOR').

parse_lines([], _, _, _).
parse_lines([Line|Rest], Number, Current0, InMath0) :-
    normalize_line(Line, Normalized),
    update_current(Normalized, Number, Current0, Current1),
    record_dependencies(Normalized, Number, Current1),
    record_proof_references(Normalized, Number, Current1),
    record_qed(Normalized, Number, Current1),
    record_formula(Line, Number, Current1, InMath0, InMath1),
    Next is Number + 1,
    parse_lines(Rest, Next, Current1, InMath1).

update_current(Line, Number, _, Node) :-
    declaration_node(Line, Node), !,
    ( md_node(Node, _, _) -> true ; assertz(md_node(Node, declared, Number)) ).
update_current(_, _, Current, Current).

declaration_node(Line, Node) :-
    re_matchsub(
        "^\\s*(?<node>[ADPT]_[A-Za-z0-9_]+)\\s*(?:—|-|:)",
        Line,
        Match,
        []
    ),
    normalize_node(Match.node, Node).

record_dependencies(Line, Number, Current) :-
    Current \== none,
    re_matchsub("^\\s*Deps\\s*:\\s*(?<deps>.+)$", Line, Match, []), !,
    split_string(Match.deps, ",", " \t", Parts),
    maplist(part_node, Parts, Dependencies0),
    exclude(==(none), Dependencies0, Dependencies),
    Dependencies \== [],
    retractall(md_rule(Current, _, _)),
    assertz(md_rule(Current, Dependencies, Number)).
record_dependencies(_, _, _).

record_proof_references(Line, Number, Current) :-
    Current \== none,
    \+ md_qed(Current, _),
    proof_reference_line(Line),
    line_nodes(Line, Mentioned0),
    include(declared_before(Number, Current), Mentioned0, Mentioned),
    Mentioned \== [], !,
    ( md_rule(Current, Dependencies0, RuleLine)
    -> true
    ;  Dependencies0 = [], RuleLine = Number
    ),
    append(Dependencies0, Mentioned, Combined),
    list_to_set(Combined, Dependencies),
    retractall(md_rule(Current, _, _)),
    assertz(md_rule(Current, Dependencies, RuleLine)),
    forall(
        member(Node, Mentioned),
        ( md_inferred_dependency(Current, Node, _)
        -> true
        ;  assertz(md_inferred_dependency(Current, Node, Number))
        )
    ).
record_proof_references(_, _, _).

proof_reference_line(Line) :-
    member(Prefix, ["Por ", "Desde ", "Usando ", "Aplicando ", "Combinando "]),
    sub_string(Line, 0, _, _, Prefix), !.

declared_before(Number, Current, Node) :-
    Node \== Current,
    md_node(Node, _, DeclarationLine),
    DeclarationLine < Number.

line_nodes(Line, Nodes) :-
    split_string(Line, " \t,.;:[]", "", Parts),
    findall(Node, (member(Part, Parts), part_node(Part, Node), Node \== none), Raw),
    list_to_set(Raw, Nodes).

part_node(Part, Node) :-
    re_matchsub("(?<node>[ADPT]_[A-Za-z0-9_]+)", Part, Match, []), !,
    normalize_node(Match.node, Node).
part_node(_, none).

record_qed(Line, Number, Current) :-
    Current \== none,
    sub_string(Line, _, _, _, "Q.E.D."), !,
    assertz(md_qed(Current, Number)).
record_qed(_, _, _).

record_formula(Line, Number, Current, InMath0, InMath1) :-
    normalize_space(string(Trimmed), Line),
    (   Trimmed == "$$"
    ->  toggle(InMath0, InMath1)
    ;   InMath0 == true,
        Current \== none,
        Trimmed \== ""
    ->  assertz(md_formula_line(Current, Number, Trimmed)),
        InMath1 = InMath0
    ;   InMath1 = InMath0
    ).

toggle(false, true).
toggle(true, false).

normalize_line(Input, Output) :-
    string_codes(Input, Codes),
    normalize_codes(Codes, CleanCodes),
    string_codes(Clean0, CleanCodes),
    re_replace("mathrm"/g, "", Clean0, Clean1),
    re_replace("rm\\s+"/g, "", Clean1, Clean2),
    normalize_space(string(Output), Clean2).

normalize_codes([], []).
normalize_codes([Code|Rest], Output) :-
    (   memberchk(Code, [92, 123, 125, 36])
    ->  normalize_codes(Rest, Output)
    ;   Code =:= 40
    ->  Output = [95|Tail], normalize_codes(Rest, Tail)
    ;   Code =:= 41
    ->  normalize_codes(Rest, Output)
    ;   Output = [Code|Tail], normalize_codes(Rest, Tail)
    ).

normalize_node(Value, Node) :-
    string_lower(Value, Lower),
    atom_string(Node, Lower).

premise(Node, Line) :-
    md_node(Node, _, Line),
    \+ md_rule(Node, _, _).

prove(Node, premise(Node, Line), Seen) :-
    \+ memberchk(Node, Seen),
    premise(Node, Line).
prove(Node, derivation(Node, RuleLine, Proofs), Seen) :-
    \+ memberchk(Node, Seen),
    md_rule(Node, Dependencies, RuleLine),
    prove_all(Dependencies, Proofs, [Node|Seen]).

prove_all([], [], _).
prove_all([Node|Rest], [Proof|Proofs], Seen) :-
    md_node(Node, _, _),
    prove(Node, Proof, Seen),
    prove_all(Rest, Proofs, Seen).

select_goal(Goal) :-
    findall(
        Line-Node,
        (md_node(Node, _, Line), atom_concat(t_, _, Node)),
        Theorems
    ),
    keysort(Theorems, Ordered),
    last(Ordered, _-Goal).

target_conclusion_present(Node) :-
    md_formula_line(Node, _, _).

evaluate_goal(Goal, 0) :-
    md_node(Goal, _, DeclarationLine),
    md_rule(Goal, _, RuleLine),
    md_qed(Goal, QedLine),
    target_conclusion_present(Goal),
    prove(Goal, Proof, []), !,
    format('OBJETIVO: ~w~n', [Goal]),
    format('DECLARACION_MD_LINEA: ~d~n', [DeclarationLine]),
    format('REGLA_MD_LINEA: ~d~n', [RuleLine]),
    format('QED_MD_LINEA: ~d~n', [QedLine]),
    writeln('CONCLUSION_OBJETIVO: BLOQUE_FORMAL_DECLARADO'),
    writeln('RESULTADO PROLOG MD: TEOREMA_DERIVADO_DESDE_PREMISAS_DECLARADAS'),
    writeln('ALCANCE: prueba deductiva interna del sistema declarado por el Markdown; no sustituye la verificacion semantica de cada premisa.'),
    writeln('ARBOL_DE_PRUEBA:'),
    emit_proof(Proof, 0).
evaluate_goal(Goal, 2) :-
    format('OBJETIVO: ~w~n', [Goal]),
    ( md_node(Goal, _, DeclarationLine)
    -> format('DECLARACION_MD_LINEA: ~d~n', [DeclarationLine])
    ;  true
    ),
    ( md_rule(Goal, _, RuleLine)
    -> format('REGLA_MD_LINEA: ~d~n', [RuleLine])
    ;  true
    ),
    ( md_qed(Goal, QedLine)
    -> format('QED_MD_LINEA: ~d~n', [QedLine])
    ;  true
    ),
    ( target_conclusion_present(Goal)
    -> writeln('CONCLUSION_OBJETIVO: BLOQUE_FORMAL_DECLARADO')
    ;  true
    ),
    writeln('RESULTADO PROLOG MD: NO_DEMOSTRADO'),
    emit_missing_conditions(Goal),
    ( prove(Goal, PartialProof, [])
    -> writeln('ARBOL_PARCIAL_DE_DEPENDENCIAS:'),
       emit_proof(PartialProof, 0)
    ;  true
    ).

emit_inventory(Absolute) :-
    aggregate_all(count, md_node(_, _, _), Nodes),
    aggregate_all(count, md_rule(_, _, _), Rules),
    aggregate_all(count, premise(_, _), Premises),
    aggregate_all(count, md_formula_line(_, _, _), FormulaLines),
    aggregate_all(count, md_inferred_dependency(_, _, _), Inferred),
    format('ARCHIVO_MD: ~w~n', [Absolute]),
    format('NODOS_EXTRAIDOS_MD: ~d~n', [Nodes]),
    format('REGLAS_DEPS_EXTRAIDAS_MD: ~d~n', [Rules]),
    format('PREMISAS_DECLARADAS_MD: ~d~n', [Premises]),
    format('LINEAS_FORMULA_EXTRAIDAS_MD: ~d~n', [FormulaLines]),
    format('DEPENDENCIAS_RECUPERADAS_DE_LA_PRUEBA: ~d~n', [Inferred]),
    forall(
        md_inferred_dependency(Node, Dependency, Line),
        format('DEPENDENCIA_PRUEBA|~w|~w|~d~n', [Node, Dependency, Line])
    ),
    emit_adec_nodes.

emit_adec_nodes :-
    forall(
        md_node(Node, _, Line),
        ( node_kind(Node, Kind),
          ( md_rule(Node, Dependencies, _) -> true ; Dependencies = [] ),
          atomic_list_concat(Dependencies, ',', DependencyText),
          format('ADEC_NODE|~w|~w|~d|~w~n', [Node, Kind, Line, DependencyText])
        )
    ).

node_kind(Node, definition) :- atom_concat(d_, _, Node), !.
node_kind(Node, foundation) :- atom_concat(a_, _, Node), !.
node_kind(Node, proposition) :- atom_concat(p_, _, Node), !.
node_kind(Node, theorem) :- atom_concat(t_, _, Node), !.
node_kind(_, concept).

emit_theorem_results :-
    forall(
        (md_node(Node, _, _), atom_concat(t_, _, Node)),
        emit_theorem_result(Node)
    ).

emit_theorem_result(Node) :-
    (   prove(Node, _, [])
    ->  format('TEOREMA_MD|~w|DERIVADO~n', [Node])
    ;   format('TEOREMA_MD|~w|NO_DEMOSTRADO~n', [Node])
    ).

emit_proof(premise(Node, Line), Indent) :-
    tab(Indent), format('PREMISA_MD ~w (linea ~d)~n', [Node, Line]).
emit_proof(derivation(Node, Line, Proofs), Indent) :-
    tab(Indent), format('TEOREMA ~w por Deps (linea ~d)~n', [Node, Line]),
    Next is Indent + 2,
    forall(member(Proof, Proofs), emit_proof(Proof, Next)).

emit_missing_conditions(Goal) :-
    ( md_node(Goal, _, _) -> true ; writeln('FALTA: declaracion del objetivo') ),
    ( md_rule(Goal, _, _) -> true ; writeln('FALTA: regla Deps del objetivo') ),
    ( md_qed(Goal, _) -> true ; writeln('FALTA: Q.E.D. asociado al objetivo') ),
    ( target_conclusion_present(Goal) -> true ; writeln('FALTA: conclusion formal esperada en el bloque matematico') ),
    ( prove(Goal, _, [])
    -> true
    ;  writeln('FALTA: cierre de todas las dependencias declaradas'),
       upcase_atom(Goal, UpperGoal),
       format('OBLIGACION|DEPENDENCY_CLOSURE_~w|ABIERTA|No se pudieron cerrar todas las dependencias declaradas del objetivo ~w.~n', [UpperGoal, UpperGoal])
    ).
