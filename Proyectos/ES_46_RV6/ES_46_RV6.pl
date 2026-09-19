% Generado por PUBLICAR desde el grafo JSON del Markdown.
% Audita dependencias logicas; no sustituye la comprobacion matematica Lean.
% Requiere SWI-Prolog: https://www.swi-prolog.org/Download.html
% Windows (winget): winget install SWI-Prolog.SWI-Prolog
% Debian/Ubuntu: sudo apt install swi-prolog
% macOS (Homebrew): brew install swi-prolog
% Comprobar instalacion: swipl --version
% Ejecutar: swipl -q -s ES_46_RV6.pl
:- set_prolog_flag(double_quotes, string).
:- discontiguous fact/1.
:- discontiguous rule/2.
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
rule(p_vr_rho, [p_ved_e]).
rule(p_vr_e, [p_vr_rho]).
rule(p_z, [p_rho_iso, p_vr_rho, p_vr_e]).
rule(t_riemann, [t_iso, p_rho_iso, p_z, d_rho_r, p_vr_rho]).

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

go(Goal) :-
    declared_node(Goal, _),
    \+ unresolved_dependency(Goal, _),
    prove(Goal, Proof, []),
    write_term(Proof, [quoted(true), portray(true)]), nl.

go :-
    goal(Goal),
    go(Goal).

:- initialization((go -> halt(0) ; halt(1)), main).