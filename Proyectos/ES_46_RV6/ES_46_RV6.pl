% Generado por PUBLICAR desde el grafo JSON del Markdown.
% Audita dependencias logicas; no sustituye la comprobacion matematica Lean.
% Requiere SWI-Prolog: https://www.swi-prolog.org/Download.html
% Windows (winget): winget install SWI-Prolog.SWI-Prolog
% Debian/Ubuntu: sudo apt install swi-prolog
% macOS (Homebrew): brew install swi-prolog
% Comprobar instalacion: swipl --version
% Ejecutar: swipl -q -s ES_46_RV6.pl
% Lectura: a :- b, c. significa que a es cierta si b Y c lo son.
% Lectura: a :- (b ; c). significa que a es cierta si b O c lo es.
% Corte: a :- b, c, !. confirma a tras b y c y descarta alternativas.
% Si hay una meta despues de !, esa meta todavia debe demostrarse.
% go valida el objetivo final y todas sus dependencias alcanzables.
% Antes de probarlo audita todo el grafo: ciclos, duplicados,
% autorreferencias, referencias inexistentes y nodos sin definicion.
:- set_prolog_flag(double_quotes, string).
:- discontiguous fact/1.
:- discontiguous rule/2.
:- discontiguous graph_error/1.
:- dynamic unresolved_dependency/2.

goal(t_riemann).

declared_node(d_u, definition).
declared_node(p_coord, proposition).
declared_node(d_t_prime, definition).
declared_node(a_l, foundation).
declared_node(p_st, proposition).
declared_node(p_v, proposition).
declared_node(p_a, proposition).
declared_node(d_lambda, definition).
declared_node(d_l, definition).
declared_node(p_ved_inv, proposition).
declared_node(d_k, definition).
declared_node(d_rho, definition).
declared_node(p_ved_e, proposition).
declared_node(p_ved_i, proposition).
declared_node(p_ved_k_e, proposition).
declared_node(p_ved_k_i, proposition).
declared_node(p_ved_r_c, proposition).
declared_node(p_ved_completo, proposition).
declared_node(p_vs, proposition).
declared_node(p_st_2, proposition).
declared_node(p_f, proposition).
declared_node(p_f1, proposition).
declared_node(p_w, proposition).
declared_node(p_f1_2, proposition).
declared_node(p_f2, proposition).
declared_node(p_f3, proposition).
declared_node(d_lap, definition).
declared_node(p_lap_z, proposition).
declared_node(p_ved_e_2, proposition).
declared_node(p_ved_completo_2, proposition).
declared_node(p_ved_k_e_2, proposition).
declared_node(p_f3_2, proposition).
declared_node(p_lap_z_2, proposition).
declared_node(d_rim, definition).
declared_node(d_rho_r, definition).
declared_node(d_f, definition).
declared_node(d_finv, definition).
declared_node(t_iso, theorem).
declared_node(p_rho_iso, proposition).
declared_node(p_rim_s, proposition).
declared_node(p_vr_rho, proposition).
declared_node(p_vr_e, proposition).
declared_node(p_z, proposition).
declared_node(t_riemann, theorem).

fact(d_u).
rule(p_coord, [d_u]).
fact(d_t_prime).
fact(a_l).
rule(p_st, [p_coord, d_t_prime, a_l]).
rule(p_v, [d_t_prime, a_l, p_st]).
rule(p_a, [a_l, p_st, p_v]).
fact(d_lambda).
fact(d_l).
rule(p_ved_inv, [p_a, d_lambda, d_l]).
fact(d_k).
fact(d_rho).
rule(p_ved_e, [p_ved_inv, d_k, d_rho]).
rule(p_ved_i, [d_k, d_rho, p_ved_e]).
rule(p_ved_k_e, [d_rho, p_ved_e, p_ved_i]).
rule(p_ved_k_i, [p_ved_e, p_ved_i, p_ved_k_e]).
rule(p_ved_r_c, [p_ved_i, p_ved_k_e, p_ved_k_i]).
rule(p_ved_completo, [p_ved_k_e, p_ved_k_i, p_ved_r_c]).
rule(p_vs, [p_ved_k_i, p_ved_r_c, p_ved_completo]).
rule(p_st_2, [p_ved_r_c, p_ved_completo, p_vs]).
rule(p_f, [p_ved_completo, p_vs, p_st_2]).
rule(p_f1, [p_vs, p_st_2, p_f]).
rule(p_w, [p_st_2, p_f, p_f1]).
rule(p_f1_2, [p_f, p_f1, p_w]).
rule(p_f2, [p_f1, p_w, p_f1_2]).
rule(p_f3, [p_w, p_f1_2, p_f2]).
rule(d_lap, [p_f3]).
rule(p_lap_z, [p_f2, p_f3, d_lap]).
rule(p_ved_e_2, [p_f3, d_lap, p_lap_z]).
rule(p_ved_completo_2, [d_lap, p_lap_z, p_ved_e_2]).
rule(p_ved_k_e_2, [p_lap_z, p_ved_e_2, p_ved_completo_2]).
rule(p_f3_2, [p_ved_e_2, p_ved_completo_2, p_ved_k_e_2]).
rule(p_lap_z_2, [p_ved_completo_2, p_ved_k_e_2, p_f3_2]).
fact(d_rim).
fact(d_rho_r).
fact(d_f).
fact(d_finv).
rule(t_iso, [d_f, d_finv]).
rule(p_rho_iso, [t_iso]).
rule(p_rim_s, [t_iso, p_rho_iso]).
rule(p_vr_rho, [p_ved_e]).
rule(p_vr_e, [p_vr_rho]).
rule(p_z, [p_rim_s, p_vr_rho, p_vr_e]).
rule(t_riemann, [t_iso, p_rho_iso, p_rim_s, p_z, d_rho_r, p_vr_rho]).

prove(Goal, fact(Goal), _) :-
    fact(Goal).
prove(Goal, proof(Goal, Proofs), Seen) :-
    \+ memberchk(Goal, Seen),
    rule(Goal, Dependencies),
    prove_all(Dependencies, Proofs, [Goal|Seen]).

prove_all([], [], _).
prove_all([Goal|Goals], [Proof|Proofs], Seen) :-
    prove(Goal, Proof, Seen),
    prove_all(Goals, Proofs, Seen).

depends_on(Node, Dependency) :-
    rule(Node, Dependencies),
    member(Dependency, Dependencies).
depends_transitively(Node, Dependency) :-
    depends_transitively_(Node, Dependency, [Node]).
depends_transitively_(Node, Dependency, _Seen) :-
    depends_on(Node, Dependency).
depends_transitively_(Node, Dependency, Seen) :-
    depends_on(Node, Intermediate),
    \+ memberchk(Intermediate, Seen),
    depends_transitively_(Intermediate, Dependency, [Intermediate|Seen]).

% Auditoria independiente de todo el grafo, no solo del objetivo.
implemented_node(Node) :- fact(Node).
implemented_node(Node) :- rule(Node, _).

graph_error(reference_not_declared(Node, Dependency)) :-
    depends_on(Node, Dependency),
    \+ declared_node(Dependency, _).
graph_error(unresolved_dependency(Node, Dependency)) :-
    unresolved_dependency(Node, Dependency).
graph_error(node_without_fact_or_rule(Node)) :-
    declared_node(Node, _),
    \+ implemented_node(Node).
graph_error(self_dependency(Node)) :-
    depends_on(Node, Node).
graph_error(cyclic_dependency(Node)) :-
    declared_node(Node, _),
    depends_transitively(Node, Node).
graph_error(conflicting_node_types(Node, Kinds)) :-
    declared_node(Node, _),
    findall(Kind, declared_node(Node, Kind), RawKinds),
    sort(RawKinds, Kinds),
    length(Kinds, Count),
    Count > 1.
node_definition(Node, fact) :- fact(Node).
node_definition(Node, rule(Dependencies)) :- rule(Node, Dependencies).
graph_error(conflicting_definitions(Node, Definitions)) :-
    implemented_node(Node),
    findall(Definition, node_definition(Node, Definition), RawDefinitions),
    sort(RawDefinitions, Definitions),
    length(Definitions, Count),
    Count > 1.

graph_warning(redundant_declaration(Node, Kind)) :-
    declared_node(Node, Kind),
    findall(Kind, declared_node(Node, Kind), Declarations),
    length(Declarations, Count),
    Count > 1,
    findall(OtherKind, declared_node(Node, OtherKind), RawKinds),
    sort(RawKinds, [Kind]).
graph_warning(redundant_definition(Node, Definition)) :-
    node_definition(Node, Definition),
    findall(Definition, node_definition(Node, Definition), Definitions),
    length(Definitions, Count),
    Count > 1,
    findall(OtherDefinition, node_definition(Node, OtherDefinition), RawDefinitions),
    sort(RawDefinitions, [Definition]).

goal_error(Goal, goal_not_declared(Goal)) :-
    \+ declared_node(Goal, _).

audit_graph(Goal) :-
    findall(Error, (graph_error(Error) ; goal_error(Goal, Error)), RawErrors),
    sort(RawErrors, Errors),
    findall(Warning, graph_warning(Warning), RawWarnings),
    sort(RawWarnings, Warnings),
    forall(member(Warning, Warnings), format('AVISO ESTRUCTURAL: ~q~n', [Warning])),
    ( Errors = []
    -> true
    ;  format('RESULTADO PROLOG: RECHAZADO~n', []),
       format('Errores estructurales del grafo:~n', []),
       forall(member(Error, Errors), format('  - ~q~n', [Error])),
       fail
    ).

unreachable_from_goal(Goal, Node) :-
    declared_node(Node, _),
    Node \= Goal,
    \+ depends_transitively(Goal, Node).

write_atoms([Atom]) :-
    format('~w', [Atom]).
write_atoms([Atom|Atoms]) :-
    format('~w, ', [Atom]),
    write_atoms(Atoms).

write_clause(Node) :-
    fact(Node), !,
    format('  ~w.~n', [Node]).
write_clause(Node) :-
    rule(Node, Dependencies),
    format('  ~w :- ', [Node]),
    write_atoms(Dependencies),
    format('.~n', []).

write_report(Goal) :-
    findall(Node, (Node = Goal ; depends_transitively(Goal, Node)), RawNodes),
    sort(RawNodes, Nodes),
    findall(Node, unreachable_from_goal(Goal, Node), RawUnused),
    sort(RawUnused, Unused),
    length(Nodes, Count),
    format('RESULTADO PROLOG: APROBADO~n', []),
    format('Objetivo demostrado: ~w~n', [Goal]),
    format('Nodos utilizados: ~d~n', [Count]),
    ( Unused = []
    -> format('Nodos no alcanzables: 0~n', [])
    ;  length(Unused, UnusedCount),
       format('AVISO: ~d nodos validos no intervienen en este objetivo: ~w~n',
              [UnusedCount, Unused])
    ),
    format('Cadena deductiva (sintaxis Prolog):~n', []),
    forall(member(Node, Nodes), write_clause(Node)).

go(Goal) :-
    audit_graph(Goal),
    prove(Goal, _Proof, []),
    write_report(Goal).

go :-
    goal(Goal),
    go(Goal).

:- initialization((go -> halt(0) ; halt(1)), main).