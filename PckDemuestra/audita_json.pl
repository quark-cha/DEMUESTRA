:- use_module(library(http/json)).
:- use_module(library(apply)).
:- use_module(library(lists)).
:- dynamic premise/1, rule/2.
:- table reachable/1.
:- initialization(main, main).

reachable(Node) :- premise(Node).
reachable(Node) :- rule(Node, Dependencies), maplist(reachable, Dependencies).

main(Args) :-
    catch(run(Args, Code), Error,
          (print_message(error, Error), writeln('RESULTADO PROLOG JSON: ERROR_EVALUADOR'), Code = 40)),
    halt(Code).

run([File, Goal], Code) :-
    setup_call_cleanup(open(File, read, Stream, [encoding(utf8)]),
                       json_read_dict(Stream, Data), close(Stream)),
    get_dict(nodes, Data, Nodes),
    maplist(register_node, Nodes),
    (reachable(Goal)
    -> writeln('RESULTADO PROLOG JSON: OBJETIVO_ALCANZABLE_DESDE_PREMISAS_DECLARADAS'), Code = 0
    ;  writeln('RESULTADO PROLOG JSON: OBJETIVO_NO_ALCANZADO_EN_MODELO_DECLARADO'), Code = 1),
    writeln('ALCANCE: reglas de dependencias declaradas; no verifica identidades matematicas ni pruebas Lean.').

register_node(Node) :-
    get_dict(id, Node, IdText), atom_string(Id, IdText),
    get_dict(kind, Node, Kind), get_dict(deps, Node, DepTexts),
    maplist(atom_string, Dependencies, DepTexts),
    (Dependencies == []
    -> (memberchk(Kind, ["definition", "foundation", "axiom", "assumption"])
        -> assertz(premise(Id)) ; true)
    ; assertz(rule(Id, Dependencies))).
