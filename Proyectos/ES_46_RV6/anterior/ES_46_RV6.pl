% GENERADO_POR: C:\Users\vedq\Desktop\desarrollo\SRC-VED\DEMUESTRA\vendor\PUBLICAR\PackPublica\prolog.py | FECHA_HORA_GENERACION: 2026-10-10T15:59:51+02:00
% FUENTE_MARKDOWN: C:\Users\vedq\Desktop\desarrollo\SRC-VED\DEMUESTRA\ES_46_RV6.md
% REQUISITO: SWI-Prolog (https://www.swi-prolog.org/Download.html)
% INSTALAR_EN_WINDOWS: winget install SWI-Prolog.SWI-Prolog
% COMPROBAR_INSTALACION: swipl --version
% EJECUTAR_EN_ESTA_CARPETA: swipl -q -s ES_46_RV6.pl
% La ejecucion audita el grafo formal derivado del Markdown; no demuestra por si sola la verdad matematica externa de sus premisas.
%
% ============================================================
% DEMUESTRA / PUBLICAR
% Auditoria logica Prolog
%
% Fuente unica:
%     Markdown
%
% Cadena:
%     Markdown
%       -> FormalGraph
%       -> FormalGraphCompiler
%       -> Prolog
%
% Este archivo NO se genera desde el JSON de ADEC.
% Este archivo NO modifica el Markdown.
% Este archivo NO modifica JSON, Lean ni otros derivados.
%
% Prolog verifica:
%   - integridad estructural del grafo
%   - dependencias declaradas
%   - ausencia de ciclos
%   - ausencia de autorreferencias
%   - ausencia de referencias inexistentes
%   - cierre del arbol de dependencias del objetivo
%   - cobertura de formulas extraidas como hechos estructurados
%   - referencias a conjuntos con definicion unica
%   - cobertura deductiva respecto del objetivo
% No valida todas las implicaciones matematicas del Markdown.
%
% IMPORTANTE:
% Un nodo fuera de la clausura del objetivo no es
% automaticamente un error. Puede pertenecer a una rama
% independiente del documento.
% ============================================================

:- set_prolog_flag(double_quotes, string).
:- discontiguous fact/1.
:- discontiguous rule/2.
:- discontiguous declared_node/2.
:- discontiguous graph_error/1.
:- discontiguous formula_count/2.
:- discontiguous source_formula/3.
:- discontiguous defines_set/2.
:- discontiguous uses_defined_set/2.
:- discontiguous inferred_definition_dependency/3.
:- dynamic unresolved_dependency/2.

goal(t_riemann).

declared_node(d_u, definition).
declared_node(d_t_prime, definition).
declared_node(a_l, foundation).
declared_node(d_lambda, definition).
declared_node(d_l, definition).
declared_node(d_r_ved, definition).
declared_node(d_k, definition).
declared_node(d_rho, definition).
declared_node(d_mathcal_e_ved, definition).
declared_node(d_particion, definition).
declared_node(a_7, foundation).
declared_node(d_rim, definition).
declared_node(d_rho_r, definition).
declared_node(d_f, definition).
declared_node(d_finv, definition).
declared_node(p_coord, proposition).
declared_node(p_ved_inv, proposition).
declared_node(t_iso, theorem).
declared_node(p_st, proposition).
declared_node(p_ved_e, proposition).
declared_node(p_rho_iso, proposition).
declared_node(p_v, proposition).
declared_node(p_st_2, proposition).
declared_node(p_ved_i, proposition).
declared_node(p_ved_e_2, proposition).
declared_node(p_rim_s, proposition).
declared_node(p_a, proposition).
declared_node(p_ved_k_e, proposition).
declared_node(p_vr_rho, proposition).
declared_node(p_ved_k_i, proposition).
declared_node(p_ved_k_e_2, proposition).
declared_node(p_vr_e, proposition).
declared_node(p_z, proposition).
declared_node(p_ved_r_c, proposition).
declared_node(t_riemann, theorem).
declared_node(p_ved_completo, proposition).
declared_node(p_vs, proposition).
declared_node(p_ved_completo_2, proposition).
declared_node(p_f, proposition).
declared_node(p_f1, proposition).
declared_node(p_w, proposition).
declared_node(p_f2, proposition).
declared_node(p_f3, proposition).
declared_node(d_lap, definition).
declared_node(p_f3_2, proposition).
declared_node(p_lap_z, proposition).
declared_node(p_lap_z_2, proposition).

formula_count(d_u, 1).
source_formula(d_u, 1, ast(binary, "EQ", [ast(identifier, "U", []), ast(binary, "PLUS", [ast(binary, "MUL", [ast(number, "3", []), ast(identifier, "S", [])]), ast(identifier, "T", [])])])).
formula_count(d_t_prime, 4).
source_formula(d_t_prime, 1, ast(derivative, "1", [ast(identifier, "t'", []), ast(identifier, "t", [])])).
source_formula(d_t_prime, 2, ast(identifier, "t'", [])).
source_formula(d_t_prime, 3, ast(identifier, "t'", [])).
source_formula(d_t_prime, 4, ast(identifier, "dt'", [])).
formula_count(a_l, 5).
source_formula(a_l, 1, ast(binary, "EQ", [ast(identifier, "dt'", []), ast(binary, "MUL", [ast(identifier, "dt", []), ast(call, "sqrt", [ast(binary, "MINUS", [ast(number, "1", []), ast(binary, "DIV", [ast(power, none, [ast(identifier, "v", []), ast(number, "2", [])]), ast(power, none, [ast(identifier, "c", []), ast(number, "2", [])])])])])])])).
source_formula(a_l, 2, ast(binary, "EQ", [ast(identifier, "v", []), ast(derivative, "1", [ast(identifier, "s", []), ast(identifier, "t", [])])])).
source_formula(a_l, 3, ast(binary, "EQ", [ast(identifier, "c", []), ast(number, "1", [])])).
source_formula(a_l, 4, ast(binary, "EQ", [ast(power, none, [ast(identifier, "dt'", []), ast(number, "2", [])]), ast(binary, "MINUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(power, none, [ast(identifier, "ds", []), ast(number, "2", [])])])])).
source_formula(a_l, 5, ast(identifier, "v", [])).
formula_count(d_lambda, 5).
source_formula(d_lambda, 1, ast(binary, "EQ", [ast(identifier, "E", []), ast(binary, "DIV", [ast(identifier, "hc", []), ast(identifier, "lambda", [])])])).
source_formula(d_lambda, 2, ast(binary, "EQ", [ast(identifier, "E", []), ast(power, none, [ast(identifier, "Mc", []), ast(number, "2", [])])])).
source_formula(d_lambda, 3, ast(binary, "EQ", [ast(power, none, [ast(identifier, "Mc", []), ast(number, "2", [])]), ast(binary, "DIV", [ast(identifier, "hc", []), ast(identifier, "lambda", [])])])).
source_formula(d_lambda, 4, ast(binary, "EQ", [ast(identifier, "lambda", []), ast(binary, "DIV", [ast(identifier, "h", []), ast(identifier, "Mc", [])])])).
source_formula(d_lambda, 5, ast(identifier, "lambda", [])).
formula_count(d_l, 6).
source_formula(d_l, 1, ast(binary, "EQ", [ast(identifier, "L", []), ast(binary, "MUL", [ast(identifier, "n", []), ast(identifier, "lambda", [])])])).
source_formula(d_l, 2, ast(binary, "IN", [ast(identifier, "n", []), ast(power, none, [ast(identifier, "Real", []), ast(sign, "PLUS", [])])])).
source_formula(d_l, 3, ast(identifier, "L", [])).
source_formula(d_l, 4, ast(identifier, "lambda", [])).
source_formula(d_l, 5, ast(binary, "EQ", [ast(identifier, "n", []), ast(binary, "DIV", [ast(identifier, "L", []), ast(identifier, "lambda", [])])])).
source_formula(d_l, 6, ast(binary, "GT", [ast(identifier, "L", []), ast(number, "0", [])])).
formula_count(d_r_ved, 7).
source_formula(d_r_ved, 1, ast(binary, "EQ", [ast(binary, "MUL", [ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])]), ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])])]), ast(identifier, "L", [])])).
source_formula(d_r_ved, 2, ast(binary, "AND", [ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])]), ast(binary, "DIV", [ast(identifier, "L", []), ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])])])]), ast(binary, "EQ", [ast(binary, "DIV", [ast(identifier, "L", []), ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])])]), ast(binary, "DIV", [ast(binary, "MUL", [ast(identifier, "n", []), ast(identifier, "lambda", [])]), ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])])])])])).
source_formula(d_r_ved, 3, ast(binary, "AND", [ast(binary, "AND", [ast(binary, "EQ", [ast(apply, none, [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(text, "onda", [])]), ast(apply, none, [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(text, "cerrada", []), ast(text, "abierta", [])])]), ast(binary, "EQ", [ast(apply, none, [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(text, "cerrada", []), ast(text, "abierta", [])]), ast(apply, none, [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])])])])]), ast(binary, "EQ", [ast(apply, none, [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])])]), ast(apply, none, [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(identifier, "L", []), ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])])])])])).
source_formula(d_r_ved, 4, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(d_r_ved, 5, ast(identifier, "L", [])).
source_formula(d_r_ved, 6, ast(binary, "PLUS", [ast(binary, "MUL", [ast(number, "3", []), ast(identifier, "S", [])]), ast(identifier, "T", [])])).
source_formula(d_r_ved, 7, ast(identifier, "L", [])).
formula_count(d_k, 1).
source_formula(d_k, 1, ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])])).
formula_count(d_rho, 10).
source_formula(d_rho, 1, ast(binary, "EQ", [ast(identifier, "rho", []), ast(apply, none, [ast(identifier, "dist", []), ast(identifier, "n", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])])])).
source_formula(d_rho, 2, ast(binary, "AND", [ast(binary, "LE", [ast(number, "0", []), ast(identifier, "rho", [])]), ast(binary, "LE", [ast(identifier, "rho", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])).
source_formula(d_rho, 3, ast(tuple, "LBRACE", [ast(binary, "EQ", [ast(identifier, "n", []), ast(binary, "PM", [ast(identifier, "k", []), ast(identifier, "rho", [])])]), ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])]), ast(binary, "AND", [ast(binary, "LE", [ast(number, "0", []), ast(identifier, "rho", [])]), ast(binary, "LE", [ast(identifier, "rho", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])).
source_formula(d_rho, 4, ast(binary, "EQ", [ast(call, "L", [ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(binary, "MUL", [ast(binary, "PM", [ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(identifier, "lambda", [])])])).
source_formula(d_rho, 5, ast(binary, "EQ", [ast(apply, none, [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])]), ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(binary, "DIV", [ast(binary, "MUL", [ast(binary, "PM", [ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(identifier, "lambda", [])]), ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])])])])).
source_formula(d_rho, 6, ast(identifier, "rho", [])).
source_formula(d_rho, 7, ast(identifier, "n", [])).
source_formula(d_rho, 8, ast(identifier, "k", [])).
source_formula(d_rho, 9, ast(binary, "EQ", [ast(identifier, "rho", []), ast(call, "abs", [ast(binary, "MINUS", [ast(identifier, "n", []), ast(identifier, "k", [])])])])).
source_formula(d_rho, 10, ast(binary, "EQ", [ast(identifier, "rho", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
formula_count(d_mathcal_e_ved, 6).
source_formula(d_mathcal_e_ved, 1, ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])])).
source_formula(d_mathcal_e_ved, 2, ast(binary, "IN", [ast(identifier, "rho", []), ast(interval, "LBRACK", [ast(number, "0", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])).
source_formula(d_mathcal_e_ved, 3, ast(binary, "EQ", [ast(identifier, "n", []), ast(binary, "PM", [ast(identifier, "k", []), ast(identifier, "rho", [])])])).
source_formula(d_mathcal_e_ved, 4, ast(binary, "EQ", [ast(subscript, none, [ast(decorated, "mathcal", [ast(identifier, "E", [])]), ast(identifier, "VED", [])]), ast(set_builder, none, [ast(tuple, "LPAREN", [ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(binary, "AND", [ast(binary, "AND", [ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])]), ast(binary, "IN", [ast(identifier, "rho", []), ast(interval, "LBRACK", [ast(number, "0", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])]), ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])])])])])).
source_formula(d_mathcal_e_ved, 5, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(d_mathcal_e_ved, 6, ast(binary, "IN", [ast(identifier, "n", []), ast(power, none, [ast(identifier, "Real", []), ast(sign, "PLUS", [])])])).
formula_count(d_particion, 2).
source_formula(d_particion, 1, ast(binary, "EQ", [ast(power, none, [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(identifier, "cerrado", [])]), ast(set_builder, none, [ast(tuple, "LPAREN", [ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(binary, "AND", [ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])]), ast(binary, "IN", [ast(identifier, "rho", []), ast(interval, "LBRACK", [ast(number, "0", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])])])).
source_formula(d_particion, 2, ast(binary, "EQ", [ast(subscript, none, [ast(decorated, "mathcal", [ast(identifier, "I", [])]), ast(identifier, "VED", [])]), ast(set_builder, none, [ast(tuple, "LPAREN", [ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(binary, "AND", [ast(binary, "AND", [ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])]), ast(binary, "IN", [ast(identifier, "rho", []), ast(interval, "LBRACK", [ast(number, "0", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])]), ast(binary, "GT", [ast(identifier, "rho", []), ast(number, "0", [])])])])])).
formula_count(a_7, 5).
source_formula(a_7, 1, ast(binary, "EQ", [ast(decorated, "tilde", [ast(identifier, "N", [])]), ast(binary, "MUL", [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])]), ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "Sch", [])])])])).
source_formula(a_7, 2, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "Sch", [])]), ast(binary, "DIV", [ast(decorated, "tilde", [ast(identifier, "N", [])]), ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])])])])).
source_formula(a_7, 3, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])]), ast(binary, "DIV", [ast(decorated, "tilde", [ast(identifier, "N", [])]), ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "Sch", [])])])])).
source_formula(a_7, 4, ast(binary, "COLON", [ast(subscript, none, [ast(identifier, "Phi", []), ast(decorated, "tilde", [ast(identifier, "N", [])])]), ast(binary, "MAPSTO", [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])]), ast(binary, "DIV", [ast(decorated, "tilde", [ast(identifier, "N", [])]), ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])])])])])).
source_formula(a_7, 5, ast(binary, "CORRESPONDS", [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Sch", [])])])).
formula_count(d_rim, 10).
source_formula(d_rim, 1, ast(binary, "EQ", [ast(identifier, "z", []), ast(binary, "PM", [ast(identifier, "a", []), ast(identifier, "ib", [])])])).
source_formula(d_rim, 2, ast(binary, "EQ", [ast(apply, none, [ast(identifier, "zeta", []), ast(identifier, "s", [])]), ast(summation, none, [ast(identifier, "n", []), ast(number, "1", []), ast(constant, "INFINITY", []), ast(binary, "DIV", [ast(number, "1", []), ast(power, none, [ast(identifier, "n", []), ast(identifier, "s", [])])])])])).
source_formula(d_rim, 3, ast(binary, "EQ", [ast(identifier, "s", []), ast(number, "1", [])])).
source_formula(d_rim, 4, ast(binary, "AND", [ast(binary, "EQ", [ast(power, none, [ast(subscript, none, [ast(identifier, "Z", []), ast(identifier, "Rim", [])]), ast(identifier, "triv", [])]), ast(set, none, [ast(unary, "NEG", [ast(number, "2", [])]), ast(unary, "NEG", [ast(number, "4", [])]), ast(unary, "NEG", [ast(number, "6", [])]), ast(identifier, "ldots", [])])]), ast(binary, "EQ", [ast(set, none, [ast(unary, "NEG", [ast(number, "2", [])]), ast(unary, "NEG", [ast(number, "4", [])]), ast(unary, "NEG", [ast(number, "6", [])]), ast(identifier, "ldots", [])]), ast(set_builder, none, [ast(binary, "MUL", [ast(unary, "NEG", [ast(number, "2", [])]), ast(identifier, "m", [])]), ast(binary, "IN", [ast(identifier, "m", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])])])])])).
source_formula(d_rim, 5, ast(binary, "EQ", [ast(power, none, [ast(subscript, none, [ast(identifier, "Z", []), ast(identifier, "Rim", [])]), ast(identifier, "nt", [])]), ast(set_builder, none, [ast(identifier, "z", []), ast(binary, "AND", [ast(binary, "AND", [ast(binary, "IN", [ast(identifier, "z", []), ast(identifier, "Complex", [])]), ast(binary, "EQ", [ast(apply, none, [ast(identifier, "zeta", []), ast(identifier, "z", [])]), ast(number, "0", [])])]), ast(binary, "AND", [ast(binary, "LT", [ast(number, "0", []), ast(call, "Re", [ast(identifier, "z", [])])]), ast(binary, "LT", [ast(call, "Re", [ast(identifier, "z", [])]), ast(number, "1", [])])])])])])).
source_formula(d_rim, 6, ast(tuple, "LBRACE", [ast(binary, "EQ", [ast(identifier, "z", []), ast(binary, "PM", [ast(identifier, "a", []), ast(identifier, "ib", [])])]), ast(binary, "AND", [ast(binary, "LT", [ast(number, "0", []), ast(identifier, "a", [])]), ast(binary, "LT", [ast(identifier, "a", []), ast(number, "1", [])])])])).
source_formula(d_rim, 7, ast(binary, "CORRESPONDS", [ast(identifier, "a", []), ast(binary, "MINUS", [ast(number, "1", []), ast(identifier, "a", [])])])).
source_formula(d_rim, 8, ast(binary, "EQ", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(d_rim, 9, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(d_rim, 10, ast(binary, "GT", [ast(call, "Re", [ast(identifier, "s", [])]), ast(number, "1", [])])).
formula_count(d_rho_r, 9).
source_formula(d_rho_r, 1, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(call, "abs", [ast(binary, "MINUS", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])).
source_formula(d_rho_r, 2, ast(binary, "AND", [ast(binary, "LT", [ast(number, "0", []), ast(identifier, "a", [])]), ast(binary, "LT", [ast(identifier, "a", []), ast(number, "1", [])])])).
source_formula(d_rho_r, 3, ast(binary, "AND", [ast(binary, "LE", [ast(number, "0", []), ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])])]), ast(binary, "LT", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])).
source_formula(d_rho_r, 4, ast(binary, "EQ", [ast(identifier, "a", []), ast(binary, "PLUS", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(binary, "MUL", [ast(identifier, "varepsilon", []), ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])])])])])).
source_formula(d_rho_r, 5, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "z", []), ast(tuple, "LBRACE", [ast(identifier, "varepsilon", []), ast(sign, "PM", [])])]), ast(binary, "PM", [ast(binary, "PLUS", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(binary, "MUL", [ast(identifier, "varepsilon", []), ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])])])]), ast(identifier, "ib", [])])])).
source_formula(d_rho_r, 6, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(call, "abs", [ast(binary, "MINUS", [ast(call, "Re", [ast(identifier, "z", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])).
source_formula(d_rho_r, 7, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(d_rho_r, 8, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(d_rho_r, 9, ast(binary, "EQ", [ast(identifier, "varepsilon", []), ast(unary, "PM", [ast(number, "1", [])])])).
formula_count(d_f, 6).
source_formula(d_f, 1, ast(binary, "EQ", [ast(power, none, [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(identifier, "rho", [])]), ast(set_builder, none, [ast(identifier, "x", []), ast(binary, "IN", [ast(apply, none, [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "VED", [])]), ast(identifier, "x", [])]), ast(interval, "LBRACK", [ast(number, "0", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])])).
source_formula(d_f, 2, ast(binary, "EQ", [ast(power, none, [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])]), ast(identifier, "rho", [])]), ast(set_builder, none, [ast(identifier, "z", []), ast(binary, "IN", [ast(apply, none, [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(identifier, "z", [])]), ast(interval, "LBRACK", [ast(number, "0", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])])).
source_formula(d_f, 3, ast(binary, "COLON", [ast(identifier, "f", []), ast(binary, "MAPSTO", [ast(power, none, [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(identifier, "rho", [])]), ast(power, none, [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])]), ast(identifier, "rho", [])])])])).
source_formula(d_f, 4, ast(identifier, "rho", [])).
source_formula(d_f, 5, ast(binary, "EQ", [ast(identifier, "a", []), ast(call, "Re", [ast(identifier, "z", [])])])).
source_formula(d_f, 6, ast(binary, "EQ", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
formula_count(d_finv, 2).
source_formula(d_finv, 1, ast(binary, "COLON", [ast(power, none, [ast(identifier, "f", []), ast(unary, "NEG", [ast(number, "1", [])])]), ast(binary, "MAPSTO", [ast(power, none, [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])]), ast(identifier, "rho", [])]), ast(power, none, [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(identifier, "rho", [])])])])).
source_formula(d_finv, 2, ast(tuple, "LBRACE", [ast(binary, "EQ", [ast(apply, none, [ast(power, none, [ast(identifier, "f", []), ast(unary, "NEG", [ast(number, "1", [])])]), ast(call, "f", [ast(identifier, "x", [])])]), ast(identifier, "x", [])]), ast(binary, "EQ", [ast(call, "f", [ast(apply, none, [ast(power, none, [ast(identifier, "f", []), ast(unary, "NEG", [ast(number, "1", [])])]), ast(identifier, "z", [])])]), ast(identifier, "z", [])])])).
formula_count(p_coord, 5).
source_formula(p_coord, 1, ast(binary, "AND", [ast(binary, "EQ", [ast(identifier, "dy", []), ast(number, "0", [])]), ast(binary, "EQ", [ast(identifier, "dz", []), ast(number, "0", [])])])).
source_formula(p_coord, 2, ast(binary, "EQ", [ast(identifier, "ds", []), ast(identifier, "dx", [])])).
source_formula(p_coord, 3, ast(identifier, "x", [])).
source_formula(p_coord, 4, ast(binary, "MUL", [ast(number, "3", []), ast(identifier, "S", [])])).
source_formula(p_coord, 5, ast(identifier, "t'", [])).
formula_count(p_ved_inv, 12).
source_formula(p_ved_inv, 1, ast(binary, "AND", [ast(binary, "EQ", [ast(identifier, "L", []), ast(binary, "MUL", [ast(identifier, "n", []), ast(identifier, "lambda", [])])]), ast(binary, "LT", [ast(binary, "MUL", [ast(identifier, "n", []), ast(identifier, "lambda", [])]), ast(constant, "INFINITY", [])])])).
source_formula(p_ved_inv, 2, ast(limit, none, [ast(identifier, "n", []), ast(constant, "INFINITY", [])])).
source_formula(p_ved_inv, 3, ast(limit, none, [ast(identifier, "L", []), ast(constant, "INFINITY", [])])).
source_formula(p_ved_inv, 4, ast(limit, none, [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])]), ast(constant, "INFINITY", [])])).
source_formula(p_ved_inv, 5, ast(binary, "AND", [ast(binary, "AND", [ast(binary, "IFF", [ast(limit, none, [ast(identifier, "n", []), ast(constant, "INFINITY", [])]), ast(limit, none, [ast(identifier, "L", []), ast(constant, "INFINITY", [])])]), ast(binary, "IFF", [ast(limit, none, [ast(identifier, "L", []), ast(constant, "INFINITY", [])]), ast(limit, none, [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])]), ast(constant, "INFINITY", [])])])]), ast(binary, "IFF", [ast(limit, none, [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])]), ast(constant, "INFINITY", [])]), ast(text, "onda_abierta_o_libre", [])])])).
source_formula(p_ved_inv, 6, ast(identifier, "L", [])).
source_formula(p_ved_inv, 7, ast(identifier, "lambda", [])).
source_formula(p_ved_inv, 8, ast(identifier, "n", [])).
source_formula(p_ved_inv, 9, ast(identifier, "rho", [])).
source_formula(p_ved_inv, 10, ast(identifier, "n", [])).
source_formula(p_ved_inv, 11, ast(identifier, "k", [])).
source_formula(p_ved_inv, 12, ast(identifier, "rho", [])).
formula_count(t_iso, 5).
source_formula(t_iso, 1, ast(binary, "CONG", [ast(power, none, [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(identifier, "rho", [])]), ast(power, none, [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])]), ast(identifier, "rho", [])])])).
source_formula(t_iso, 2, ast(identifier, "f", [])).
source_formula(t_iso, 3, ast(power, none, [ast(identifier, "f", []), ast(unary, "NEG", [ast(number, "1", [])])])).
source_formula(t_iso, 4, ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])])).
source_formula(t_iso, 5, ast(binary, "AND", [ast(binary, "LT", [ast(number, "0", []), ast(identifier, "rho", [])]), ast(binary, "LE", [ast(identifier, "rho", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])).
formula_count(p_st, 2).
source_formula(p_st, 1, ast(binary, "EQ", [ast(power, none, [ast(identifier, "ds", []), ast(number, "2", [])]), ast(binary, "MINUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(power, none, [ast(identifier, "dt'", []), ast(number, "2", [])])])])).
source_formula(p_st, 2, ast(binary, "EQ", [ast(power, none, [ast(identifier, "ds", []), ast(number, "2", [])]), ast(binary, "MUL", [ast(binary, "MINUS", [ast(identifier, "dt", []), ast(identifier, "dt'", [])]), ast(binary, "PLUS", [ast(identifier, "dt", []), ast(identifier, "dt'", [])])])])).
formula_count(p_ved_e, 26).
source_formula(p_ved_e, 1, ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])])).
source_formula(p_ved_e, 2, ast(binary, "EQ", [ast(identifier, "n", []), ast(identifier, "k", [])])).
source_formula(p_ved_e, 3, ast(binary, "EQ", [ast(identifier, "L", []), ast(binary, "MUL", [ast(identifier, "k", []), ast(identifier, "lambda", [])])])).
source_formula(p_ved_e, 4, ast(binary, "AND", [ast(binary, "AND", [ast(binary, "AND", [ast(binary, "IFF", [ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])]), ast(binary, "AND", [ast(binary, "EQ", [ast(identifier, "n", []), ast(identifier, "k", [])]), ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])])])]), ast(binary, "IFF", [ast(binary, "AND", [ast(binary, "EQ", [ast(identifier, "n", []), ast(identifier, "k", [])]), ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])])]), ast(binary, "EQ", [ast(identifier, "L", []), ast(binary, "MUL", [ast(identifier, "k", []), ast(identifier, "lambda", [])])])])]), ast(binary, "IFF", [ast(binary, "EQ", [ast(identifier, "L", []), ast(binary, "MUL", [ast(identifier, "k", []), ast(identifier, "lambda", [])])]), ast(text, "cierre_exacto_en_fase", [])])]), ast(binary, "IFF", [ast(text, "cierre_exacto_en_fase", []), ast(text, "estado_estable", [])])])).
source_formula(p_ved_e, 5, ast(binary, "AND", [ast(binary, "LT", [ast(number, "0", []), ast(identifier, "rho", [])]), ast(binary, "LE", [ast(identifier, "rho", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])).
source_formula(p_ved_e, 6, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(p_ved_e, 7, ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])])).
source_formula(p_ved_e, 8, ast(identifier, "rho", [])).
source_formula(p_ved_e, 9, ast(interval, "Ioc", [ast(number, "0", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(p_ved_e, 10, ast(identifier, "lambda", [])).
source_formula(p_ved_e, 11, ast(binary, "EQ", [ast(identifier, "L", []), ast(binary, "MUL", [ast(identifier, "n", []), ast(identifier, "lambda", [])])])).
source_formula(p_ved_e, 12, ast(identifier, "n", [])).
source_formula(p_ved_e, 13, ast(binary, "EQ", [ast(identifier, "L", []), ast(binary, "MUL", [ast(identifier, "n", []), ast(identifier, "lambda", [])])])).
source_formula(p_ved_e, 14, ast(binary, "AND", [ast(binary, "EQ", [ast(identifier, "n", []), ast(identifier, "k", [])]), ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])])])).
source_formula(p_ved_e, 15, ast(binary, "EQ", [ast(identifier, "L", []), ast(binary, "MUL", [ast(identifier, "k", []), ast(identifier, "lambda", [])])])).
source_formula(p_ved_e, 16, ast(identifier, "n", [])).
source_formula(p_ved_e, 17, ast(interval, "Ioc", [ast(number, "0", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(p_ved_e, 18, ast(identifier, "j", [])).
source_formula(p_ved_e, 19, ast(binary, "AND", [ast(binary, "LT", [ast(identifier, "j", []), ast(identifier, "n", [])]), ast(binary, "LT", [ast(identifier, "n", []), ast(binary, "PLUS", [ast(identifier, "j", []), ast(number, "1", [])])])])).
source_formula(p_ved_e, 20, ast(identifier, "n", [])).
source_formula(p_ved_e, 21, ast(identifier, "rho", [])).
source_formula(p_ved_e, 22, ast(identifier, "j", [])).
source_formula(p_ved_e, 23, ast(identifier, "k", [])).
source_formula(p_ved_e, 24, ast(identifier, "n", [])).
source_formula(p_ved_e, 25, ast(identifier, "k", [])).
source_formula(p_ved_e, 26, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
formula_count(p_rho_iso, 6).
source_formula(p_rho_iso, 1, ast(tuple, "LBRACE", [ast(binary, "EQ", [ast(apply, none, [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(call, "f", [ast(identifier, "x", [])])]), ast(apply, none, [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "VED", [])]), ast(identifier, "x", [])])]), ast(binary, "EQ", [ast(apply, none, [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "VED", [])]), ast(apply, none, [ast(power, none, [ast(identifier, "f", []), ast(unary, "NEG", [ast(number, "1", [])])]), ast(identifier, "z", [])])]), ast(apply, none, [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(identifier, "z", [])])])])).
source_formula(p_rho_iso, 2, ast(binary, "IFF", [ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])]), ast(text, "clase_estable", [])])).
source_formula(p_rho_iso, 3, ast(binary, "IFF", [ast(binary, "AND", [ast(binary, "LT", [ast(number, "0", []), ast(identifier, "rho", [])]), ast(binary, "LE", [ast(identifier, "rho", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])]), ast(text, "clase_no_estable", [])])).
source_formula(p_rho_iso, 4, ast(identifier, "rho", [])).
source_formula(p_rho_iso, 5, ast(identifier, "f", [])).
source_formula(p_rho_iso, 6, ast(power, none, [ast(identifier, "f", []), ast(unary, "NEG", [ast(number, "1", [])])])).
formula_count(p_v, 4).
source_formula(p_v, 1, ast(binary, "EQ", [ast(derivative, "1", [ast(identifier, "s", []), ast(identifier, "t", [])]), ast(identifier, "v", [])])).
source_formula(p_v, 2, ast(binary, "EQ", [ast(derivative, "2", [ast(identifier, "s", []), ast(identifier, "t", [])]), ast(number, "0", [])])).
source_formula(p_v, 3, ast(identifier, "t", [])).
source_formula(p_v, 4, ast(identifier, "v", [])).
formula_count(p_st_2, 2).
source_formula(p_st_2, 1, ast(binary, "EQ", [ast(power, none, [ast(identifier, "ds", []), ast(number, "2", [])]), ast(binary, "MINUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(power, none, [ast(identifier, "dt'", []), ast(number, "2", [])])])])).
source_formula(p_st_2, 2, ast(identifier, "t", [])).
formula_count(p_ved_i, 2).
source_formula(p_ved_i, 1, ast(binary, "IFF", [ast(binary, "AND", [ast(binary, "LT", [ast(number, "0", []), ast(identifier, "rho", [])]), ast(binary, "LE", [ast(identifier, "rho", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])]), ast(text, "cierre_no_estable", [])])).
source_formula(p_ved_i, 2, ast(binary, "EQ", [ast(identifier, "rho", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
formula_count(p_ved_e_2, 1).
source_formula(p_ved_e_2, 1, ast(binary, "IFF", [ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])]), ast(text, "estado_estable", [])])).
formula_count(p_rim_s, 8).
source_formula(p_rim_s, 1, ast(quantifier, "FORALL", [ast(identifier, "z", []), ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])]), ast(binary, "IFF", [ast(apply, none, [ast(subscript, none, [ast(identifier, "Stable", []), ast(identifier, "Rim", [])]), ast(identifier, "z", [])]), ast(binary, "EQ", [ast(apply, none, [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(identifier, "z", [])]), ast(number, "0", [])])])])).
source_formula(p_rim_s, 2, ast(binary, "IMPLIES", [ast(binary, "IN", [ast(identifier, "z", []), ast(power, none, [ast(subscript, none, [ast(identifier, "Z", []), ast(identifier, "Rim", [])]), ast(identifier, "nt", [])])]), ast(binary, "IMPLIES", [ast(apply, none, [ast(subscript, none, [ast(identifier, "Stable", []), ast(identifier, "Rim", [])]), ast(identifier, "z", [])]), ast(binary, "EQ", [ast(apply, none, [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(identifier, "z", [])]), ast(number, "0", [])])])])).
source_formula(p_rim_s, 3, ast(identifier, "rho", [])).
source_formula(p_rim_s, 4, ast(identifier, "f", [])).
source_formula(p_rim_s, 5, ast(power, none, [ast(identifier, "f", []), ast(unary, "NEG", [ast(number, "1", [])])])).
source_formula(p_rim_s, 6, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(p_rim_s, 7, ast(binary, "NE", [ast(apply, none, [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(identifier, "z", [])]), ast(number, "0", [])])).
source_formula(p_rim_s, 8, ast(power, none, [ast(subscript, none, [ast(identifier, "Z", []), ast(identifier, "Rim", [])]), ast(identifier, "nt", [])])).
formula_count(p_a, 4).
source_formula(p_a, 1, ast(binary, "AND", [ast(binary, "EQ", [ast(derivative, "2", [ast(identifier, "s", []), ast(identifier, "t", [])]), ast(derivative, "1", [ast(identifier, "v", []), ast(identifier, "t", [])])]), ast(binary, "EQ", [ast(derivative, "1", [ast(identifier, "v", []), ast(identifier, "t", [])]), ast(identifier, "a", [])])])).
source_formula(p_a, 2, ast(identifier, "t", [])).
source_formula(p_a, 3, ast(identifier, "t'", [])).
source_formula(p_a, 4, ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])])).
formula_count(p_ved_k_e, 17).
source_formula(p_ved_k_e, 1, ast(binary, "EQ", [ast(subscript, none, [ast(decorated, "mathcal", [ast(identifier, "E", [])]), ast(identifier, "VED", [])]), ast(set_builder, none, [ast(tuple, "LPAREN", [ast(identifier, "k", []), ast(number, "0", [])]), ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])])])])).
source_formula(p_ved_k_e, 2, ast(enumeration, none, [ast(identifier, "k", []), ast(number, "1", []), ast(number, "2", []), ast(number, "3", []), ast(identifier, "ldots", [])])).
source_formula(p_ved_k_e, 3, ast(quantifier, "FORALL", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])]), ast(binary, "IMPLIES", [ast(binary, "EQ", [ast(identifier, "n", []), ast(identifier, "k", [])]), ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])])])])).
source_formula(p_ved_k_e, 4, ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])])).
source_formula(p_ved_k_e, 5, ast(identifier, "lambda", [])).
source_formula(p_ved_k_e, 6, ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])])).
source_formula(p_ved_k_e, 7, ast(binary, "EQ", [ast(identifier, "n", []), ast(identifier, "k", [])])).
source_formula(p_ved_k_e, 8, ast(binary, "EQ", [ast(identifier, "L", []), ast(binary, "MUL", [ast(identifier, "k", []), ast(identifier, "lambda", [])])])).
source_formula(p_ved_k_e, 9, ast(tuple, "LPAREN", [ast(identifier, "k", []), ast(number, "0", [])])).
source_formula(p_ved_k_e, 10, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(p_ved_k_e, 11, ast(identifier, "k", [])).
source_formula(p_ved_k_e, 12, ast(binary, "GT", [ast(identifier, "n", []), ast(number, "0", [])])).
source_formula(p_ved_k_e, 13, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(p_ved_k_e, 14, ast(identifier, "n", [])).
source_formula(p_ved_k_e, 15, ast(identifier, "k", [])).
source_formula(p_ved_k_e, 16, ast(binary, "EQ", [ast(identifier, "L", []), ast(binary, "MUL", [ast(identifier, "k", []), ast(identifier, "lambda", [])])])).
source_formula(p_ved_k_e, 17, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
formula_count(p_vr_rho, 14).
source_formula(p_vr_rho, 1, ast(binary, "CORRESPONDS", [ast(binary, "PLUS", [ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(binary, "MINUS", [ast(identifier, "k", []), ast(identifier, "rho", [])])])).
source_formula(p_vr_rho, 2, ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])])).
source_formula(p_vr_rho, 3, ast(binary, "CORRESPONDS", [ast(binary, "PLUS", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])])]), ast(binary, "MINUS", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])])])])).
source_formula(p_vr_rho, 4, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(number, "0", [])])).
source_formula(p_vr_rho, 5, ast(binary, "COLON", [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "rho", [])]), ast(binary, "MAPSTO", [ast(subscript, none, [ast(interval, "LBRACK", [ast(number, "0", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])]), ast(identifier, "VED", [])]), ast(subscript, none, [ast(interval, "LBRACK", [ast(number, "0", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])]), ast(identifier, "Rim", [])])])])).
source_formula(p_vr_rho, 6, ast(binary, "AND", [ast(binary, "EQ", [ast(apply, none, [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "rho", [])]), ast(identifier, "rho", [])]), ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])])]), ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(identifier, "rho", [])])])).
source_formula(p_vr_rho, 7, ast(binary, "EQ", [ast(apply, none, [ast(power, none, [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "rho", [])]), ast(unary, "NEG", [ast(number, "1", [])])]), ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])])]), ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])])])).
source_formula(p_vr_rho, 8, ast(binary, "EQ", [ast(call, "abs", [ast(binary, "MINUS", [ast(apply, none, [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "rho", [])]), ast(subscript, none, [ast(identifier, "rho", []), ast(number, "1", [])])]), ast(apply, none, [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "rho", [])]), ast(subscript, none, [ast(identifier, "rho", []), ast(number, "2", [])])])])]), ast(call, "abs", [ast(binary, "MINUS", [ast(subscript, none, [ast(identifier, "rho", []), ast(number, "1", [])]), ast(subscript, none, [ast(identifier, "rho", []), ast(number, "2", [])])])])])).
source_formula(p_vr_rho, 9, ast(binary, "AND", [ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "VED", [])]), ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])])]), ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(call, "abs", [ast(binary, "MINUS", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])])).
source_formula(p_vr_rho, 10, ast(binary, "CORRESPONDS", [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])])).
source_formula(p_vr_rho, 11, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(p_vr_rho, 12, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(p_vr_rho, 13, ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "rho", [])])).
source_formula(p_vr_rho, 14, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
formula_count(p_ved_k_i, 2).
source_formula(p_ved_k_i, 1, ast(binary, "EQ", [ast(identifier, "rho", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(p_ved_k_i, 2, ast(identifier, "k", [])).
formula_count(p_ved_k_e_2, 1).
source_formula(p_ved_k_e_2, 1, ast(assertion, "enumera_todos_los_estados_estables.", [ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])])])).
formula_count(p_vr_e, 5).
source_formula(p_vr_e, 1, ast(binary, "IFF", [ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "VED", [])]), ast(number, "0", [])]), ast(text, "estado_estable", [])])).
source_formula(p_vr_e, 2, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "VED", [])]), ast(call, "abs", [ast(binary, "MINUS", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])).
source_formula(p_vr_e, 3, ast(binary, "IFF", [ast(text, "estado_estable", []), ast(binary, "EQ", [ast(call, "abs", [ast(binary, "MINUS", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])]), ast(number, "0", [])])])).
source_formula(p_vr_e, 4, ast(binary, "IFF", [ast(text, "estado_estable", []), ast(binary, "EQ", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])).
source_formula(p_vr_e, 5, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
formula_count(p_z, 21).
source_formula(p_z, 1, ast(binary, "EQ", [ast(apply, none, [ast(identifier, "zeta", []), ast(identifier, "z", [])]), ast(number, "0", [])])).
source_formula(p_z, 2, ast(binary, "IN", [ast(identifier, "z", []), ast(power, none, [ast(subscript, none, [ast(identifier, "Z", []), ast(identifier, "Rim", [])]), ast(identifier, "nt", [])])])).
source_formula(p_z, 3, ast(tuple, "LBRACE", [ast(binary, "EQ", [ast(apply, none, [ast(identifier, "zeta", []), ast(identifier, "z", [])]), ast(number, "0", [])]), ast(binary, "AND", [ast(binary, "LT", [ast(number, "0", []), ast(call, "Re", [ast(identifier, "z", [])])]), ast(binary, "LT", [ast(call, "Re", [ast(identifier, "z", [])]), ast(number, "1", [])])])])).
source_formula(p_z, 4, ast(binary, "EQ", [ast(identifier, "z", []), ast(binary, "PM", [ast(identifier, "a", []), ast(identifier, "ib", [])])])).
source_formula(p_z, 5, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(call, "abs", [ast(binary, "MINUS", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])).
source_formula(p_z, 6, ast(binary, "IFF", [ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])]), ast(text, "estado_estable", [])])).
source_formula(p_z, 7, ast(binary, "IFF", [ast(binary, "AND", [ast(binary, "LT", [ast(number, "0", []), ast(identifier, "rho", [])]), ast(binary, "LE", [ast(identifier, "rho", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])]), ast(text, "estado_no_estable", [])])).
source_formula(p_z, 8, ast(binary, "AND", [ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "VED", [])]), ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])])]), ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(call, "abs", [ast(binary, "MINUS", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])])).
source_formula(p_z, 9, ast(binary, "COLON", [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])]), ast(assertion, "identifica_el_cero", [ast(binary, "EQ", [ast(apply, none, [ast(identifier, "zeta", []), ast(identifier, "z", [])]), ast(number, "0", [])])])])).
source_formula(p_z, 10, ast(binary, "COLON", [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(assertion, "clasifica_exhaustivamente_su_localización_transversal", [ast(identifier, "rho", [])])])).
source_formula(p_z, 11, ast(binary, "IMPLIES", [ast(binary, "IN", [ast(identifier, "z", []), ast(power, none, [ast(subscript, none, [ast(identifier, "Z", []), ast(identifier, "Rim", [])]), ast(identifier, "nt", [])])]), ast(assertion, "clasifica_su_localización_transversal", [ast(binary, "AND", [ast(binary, "CONTEXT", [ast(binary, "EQ", [ast(apply, none, [ast(identifier, "zeta", []), ast(identifier, "z", [])]), ast(number, "0", [])]), ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])]), ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "VED", [])])])])])])).
source_formula(p_z, 12, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(p_z, 13, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(p_z, 14, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(p_z, 15, ast(identifier, "zeta", [])).
source_formula(p_z, 16, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(p_z, 17, ast(binary, "EQ", [ast(apply, none, [ast(identifier, "zeta", []), ast(identifier, "z", [])]), ast(number, "0", [])])).
source_formula(p_z, 18, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(p_z, 19, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(p_z, 20, ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])])).
source_formula(p_z, 21, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
formula_count(p_ved_r_c, 2).
source_formula(p_ved_r_c, 1, ast(binary, "AND", [ast(binary, "LE", [ast(number, "0", []), ast(identifier, "rho", [])]), ast(binary, "LE", [ast(identifier, "rho", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])).
source_formula(p_ved_r_c, 2, ast(identifier, "k", [])).
formula_count(t_riemann, 126).
source_formula(t_riemann, 1, ast(binary, "EQ", [ast(identifier, "z", []), ast(binary, "PM", [ast(identifier, "a", []), ast(identifier, "ib", [])])])).
source_formula(t_riemann, 2, ast(binary, "EQ", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(t_riemann, 3, ast(binary, "EQ", [ast(apply, none, [ast(identifier, "zeta", []), ast(identifier, "z", [])]), ast(number, "0", [])])).
source_formula(t_riemann, 4, ast(binary, "AND", [ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(call, "abs", [ast(binary, "MINUS", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])]), ast(binary, "EQ", [ast(call, "abs", [ast(binary, "MINUS", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])]), ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "VED", [])])])])).
source_formula(t_riemann, 5, ast(binary, "IFF", [ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "VED", [])]), ast(number, "0", [])]), ast(text, "estado_estable", [])])).
source_formula(t_riemann, 6, ast(binary, "IFF", [ast(binary, "AND", [ast(binary, "LT", [ast(number, "0", []), ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "VED", [])])]), ast(binary, "LE", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "VED", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])]), ast(text, "estado_no_estable", [])])).
source_formula(t_riemann, 7, ast(binary, "NE", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(t_riemann, 8, ast(binary, "GT", [ast(call, "abs", [ast(binary, "MINUS", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])]), ast(number, "0", [])])).
source_formula(t_riemann, 9, ast(binary, "AND", [ast(binary, "EQ", [ast(identifier, "rho", []), ast(call, "abs", [ast(binary, "MINUS", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])]), ast(binary, "GT", [ast(call, "abs", [ast(binary, "MINUS", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])]), ast(number, "0", [])])])).
source_formula(t_riemann, 10, ast(binary, "IMPLIES", [ast(binary, "GT", [ast(identifier, "rho", []), ast(number, "0", [])]), ast(text, "estado_no_estable", [])])).
source_formula(t_riemann, 11, ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])])).
source_formula(t_riemann, 12, ast(binary, "NE", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(t_riemann, 13, ast(binary, "EQ", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(t_riemann, 14, ast(quantifier, "FORALL", [ast(identifier, "z", []), ast(power, none, [ast(subscript, none, [ast(identifier, "Z", []), ast(identifier, "Rim", [])]), ast(identifier, "nt", [])]), ast(binary, "EQ", [ast(call, "Re", [ast(identifier, "z", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])).
source_formula(t_riemann, 15, ast(binary, "SUBSETEQ", [ast(power, none, [ast(subscript, none, [ast(identifier, "Z", []), ast(identifier, "Rim", [])]), ast(identifier, "nt", [])]), ast(set_builder, none, [ast(identifier, "s", []), ast(binary, "AND", [ast(binary, "IN", [ast(identifier, "s", []), ast(identifier, "Complex", [])]), ast(binary, "EQ", [ast(call, "Re", [ast(identifier, "s", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])])).
source_formula(t_riemann, 16, ast(binary, "EQ", [ast(call, "Re", [ast(identifier, "s", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(t_riemann, 17, ast(binary, "EQ", [ast(apply, none, [ast(identifier, "zeta", []), ast(identifier, "z", [])]), ast(number, "0", [])])).
source_formula(t_riemann, 18, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "VED", [])])])).
source_formula(t_riemann, 19, ast(binary, "NE", [ast(call, "Re", [ast(identifier, "s", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(t_riemann, 20, ast(binary, "GT", [ast(identifier, "rho", []), ast(number, "0", [])])).
source_formula(t_riemann, 21, ast(binary, "CORRESPONDS", [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])])).
source_formula(t_riemann, 22, ast(binary, "EQ", [ast(identifier, "F", []), ast(binary, "PLUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "dt", [])])])])).
source_formula(t_riemann, 23, ast(binary, "EQ", [ast(identifier, "F", []), ast(binary, "MUL", [ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "dt", [])]), ast(binary, "PLUS", [ast(number, "1", []), ast(binary, "MUL", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(identifier, "dt", [])])])])])).
source_formula(t_riemann, 24, ast(binary, "EQ", [ast(call, "Re", [ast(identifier, "s", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(t_riemann, 25, ast(binary, "MAPSTO", [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])])).
source_formula(t_riemann, 26, ast(binary, "AND", [ast(binary, "AND", [ast(binary, "MAPSTO", [ast(text, "Lorentz", []), ast(identifier, "F", [])]), ast(binary, "MAPSTO", [ast(identifier, "F", []), ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Lap", [])])])]), ast(binary, "MAPSTO", [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Lap", [])]), ast(binary, "EQ", [ast(call, "Re", [ast(identifier, "s", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])).
source_formula(t_riemann, 27, ast(binary, "EQ", [ast(power, none, [ast(identifier, "ds", []), ast(number, "2", [])]), ast(binary, "MINUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(power, none, [ast(identifier, "dt'", []), ast(number, "2", [])])])])).
source_formula(t_riemann, 28, ast(binary, "EQ", [ast(identifier, "lambda", []), ast(binary, "DIV", [ast(identifier, "h", []), ast(identifier, "Mc", [])])])).
source_formula(t_riemann, 29, ast(binary, "EQ", [ast(identifier, "L", []), ast(binary, "MUL", [ast(identifier, "n", []), ast(identifier, "lambda", [])])])).
source_formula(t_riemann, 30, ast(binary, "AND", [ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])]), ast(binary, "DIV", [ast(identifier, "L", []), ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])])])]), ast(binary, "EQ", [ast(binary, "DIV", [ast(identifier, "L", []), ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])])]), ast(binary, "DIV", [ast(binary, "MUL", [ast(identifier, "n", []), ast(identifier, "lambda", [])]), ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])])])])])).
source_formula(t_riemann, 31, ast(binary, "AND", [ast(binary, "AND", [ast(binary, "EQ", [ast(identifier, "n", []), ast(binary, "PM", [ast(identifier, "k", []), ast(identifier, "rho", [])])]), ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])])]), ast(binary, "AND", [ast(binary, "LE", [ast(number, "0", []), ast(identifier, "rho", [])]), ast(binary, "LE", [ast(identifier, "rho", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])).
source_formula(t_riemann, 32, ast(binary, "EQ", [ast(decorated, "tilde", [ast(identifier, "N", [])]), ast(binary, "MUL", [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])]), ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "Sch", [])])])])).
source_formula(t_riemann, 33, ast(binary, "EQ", [ast(identifier, "F", []), ast(binary, "PLUS", [ast(binary, "MINUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(power, none, [ast(identifier, "dt'", []), ast(number, "2", [])])]), ast(derivative, "1", [ast(binary, "MINUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(power, none, [ast(identifier, "dt'", []), ast(number, "2", [])])]), ast(identifier, "t", [])])])])).
source_formula(t_riemann, 34, ast(binary, "EQ", [ast(identifier, "F", []), ast(binary, "MINUS", [ast(binary, "PLUS", [ast(binary, "MINUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(power, none, [ast(identifier, "dt'", []), ast(number, "2", [])])]), ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "dt", [])])]), ast(binary, "MUL", [ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "dt'", [])]), ast(derivative, "1", [ast(identifier, "t'", []), ast(identifier, "t", [])])])])])).
source_formula(t_riemann, 35, ast(tuple, none, [ast(limit, none, [ast(identifier, "dt'", []), ast(number, "0", [])]), ast(limit, none, [ast(derivative, "1", [ast(identifier, "t'", []), ast(identifier, "t", [])]), ast(number, "0", [])])])).
source_formula(t_riemann, 36, ast(binary, "EQ", [ast(identifier, "F", []), ast(binary, "PLUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "dt", [])])])])).
source_formula(t_riemann, 37, ast(binary, "EQ", [ast(identifier, "F", []), ast(binary, "MUL", [ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "dt", [])]), ast(binary, "PLUS", [ast(number, "1", []), ast(binary, "MUL", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(identifier, "dt", [])])])])])).
source_formula(t_riemann, 38, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "s", []), ast(sign, "PM", [])]), ast(binary, "PM", [ast(identifier, "a", []), ast(identifier, "ib", [])])])).
source_formula(t_riemann, 39, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(call, "abs", [ast(binary, "MINUS", [ast(call, "Re", [ast(identifier, "z", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])).
source_formula(t_riemann, 40, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "VED", [])]), ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])])])).
source_formula(t_riemann, 41, ast(quantifier, "FORALL", [ast(identifier, "z", []), ast(power, none, [ast(subscript, none, [ast(identifier, "Z", []), ast(identifier, "Rim", [])]), ast(identifier, "nt", [])]), ast(binary, "EQ", [ast(call, "Re", [ast(identifier, "z", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])).
source_formula(t_riemann, 42, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "R", []), ast(identifier, "VED", [])]), ast(binary, "DIV", [ast(binary, "MUL", [ast(identifier, "n", []), ast(identifier, "lambda", [])]), ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])])])])).
source_formula(t_riemann, 43, ast(binary, "EQ", [ast(identifier, "n", []), ast(binary, "PM", [ast(identifier, "k", []), ast(identifier, "rho", [])])])).
source_formula(t_riemann, 44, ast(set_builder, none, [ast(tuple, "LPAREN", [ast(identifier, "k", []), ast(number, "0", [])]), ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])])])).
source_formula(t_riemann, 45, ast(binary, "EQ", [ast(identifier, "F", []), ast(binary, "PLUS", [ast(binary, "MINUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(power, none, [ast(identifier, "dt'", []), ast(number, "2", [])])]), ast(derivative, "1", [ast(binary, "MINUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(power, none, [ast(identifier, "dt'", []), ast(number, "2", [])])]), ast(identifier, "t", [])])])])).
source_formula(t_riemann, 46, ast(binary, "EQ", [ast(identifier, "F", []), ast(binary, "PLUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "dt", [])])])])).
source_formula(t_riemann, 47, ast(binary, "EQ", [ast(identifier, "F", []), ast(binary, "MUL", [ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "dt", [])]), ast(binary, "PLUS", [ast(number, "1", []), ast(binary, "MUL", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(identifier, "dt", [])])])])])).
source_formula(t_riemann, 48, ast(binary, "EQ", [ast(apply, none, [ast(identifier, "zeta", []), ast(identifier, "z", [])]), ast(number, "0", [])])).
source_formula(t_riemann, 49, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])]), ast(call, "abs", [ast(binary, "MINUS", [ast(call, "Re", [ast(identifier, "z", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])).
source_formula(t_riemann, 50, ast(quantifier, "FORALL", [ast(identifier, "z", []), ast(power, none, [ast(subscript, none, [ast(identifier, "Z", []), ast(identifier, "Rim", [])]), ast(identifier, "nt", [])]), ast(binary, "EQ", [ast(call, "Re", [ast(identifier, "z", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])).
source_formula(t_riemann, 51, ast(power, none, [ast(subscript, none, [ast(identifier, "Z", []), ast(identifier, "Rim", [])]), ast(identifier, "nt", [])])).
source_formula(t_riemann, 52, ast(power, none, [ast(subscript, none, [ast(identifier, "Z", []), ast(identifier, "Rim", [])]), ast(identifier, "nt", [])])).
source_formula(t_riemann, 53, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(t_riemann, 54, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 55, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 56, ast(binary, "EQ", [ast(apply, none, [ast(identifier, "zeta", []), ast(identifier, "z", [])]), ast(number, "0", [])])).
source_formula(t_riemann, 57, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(t_riemann, 58, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 59, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 60, ast(binary, "NE", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(t_riemann, 61, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(t_riemann, 62, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 63, ast(binary, "EQ", [ast(apply, none, [ast(identifier, "zeta", []), ast(identifier, "z", [])]), ast(number, "0", [])])).
source_formula(t_riemann, 64, ast(identifier, "z", [])).
source_formula(t_riemann, 65, ast(power, none, [ast(subscript, none, [ast(identifier, "Z", []), ast(identifier, "Rim", [])]), ast(identifier, "nt", [])])).
source_formula(t_riemann, 66, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 67, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(t_riemann, 68, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 69, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 70, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 71, ast(binary, "GT", [ast(identifier, "rho", []), ast(number, "0", [])])).
source_formula(t_riemann, 72, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(t_riemann, 73, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 74, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Lap", [])])).
source_formula(t_riemann, 75, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Lap", [])])).
source_formula(t_riemann, 76, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Lap", [])])).
source_formula(t_riemann, 77, ast(identifier, "dt'", [])).
source_formula(t_riemann, 78, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "v", []), ast(identifier, "onda", [])]), ast(identifier, "c", [])])).
source_formula(t_riemann, 79, ast(identifier, "F", [])).
source_formula(t_riemann, 80, ast(binary, "EQ", [ast(identifier, "U", []), ast(binary, "PLUS", [ast(binary, "MUL", [ast(number, "3", []), ast(identifier, "S", [])]), ast(identifier, "T", [])])])).
source_formula(t_riemann, 81, ast(binary, "EQ", [ast(identifier, "ds", []), ast(identifier, "dx", [])])).
source_formula(t_riemann, 82, ast(binary, "AND", [ast(binary, "EQ", [ast(identifier, "dy", []), ast(identifier, "dz", [])]), ast(binary, "EQ", [ast(identifier, "dz", []), ast(number, "0", [])])])).
source_formula(t_riemann, 83, ast(identifier, "t'", [])).
source_formula(t_riemann, 84, ast(binary, "EQ", [ast(identifier, "v", []), ast(binary, "DIV", [ast(identifier, "ds", []), ast(identifier, "dt", [])])])).
source_formula(t_riemann, 85, ast(identifier, "lambda", [])).
source_formula(t_riemann, 86, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 87, ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])])).
source_formula(t_riemann, 88, ast(binary, "AND", [ast(binary, "LT", [ast(number, "0", []), ast(identifier, "rho", [])]), ast(binary, "LE", [ast(identifier, "rho", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])).
source_formula(t_riemann, 89, ast(binary, "EQ", [ast(identifier, "rho", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(t_riemann, 90, ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])])).
source_formula(t_riemann, 91, ast(limit, none, [ast(identifier, "n", []), ast(constant, "INFINITY", [])])).
source_formula(t_riemann, 92, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 93, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Sch", [])])).
source_formula(t_riemann, 94, ast(identifier, "c", [])).
source_formula(t_riemann, 95, ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])).
source_formula(t_riemann, 96, ast(binary, "EQ", [ast(call, "Re", [ast(identifier, "s", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(t_riemann, 97, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(t_riemann, 98, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(t_riemann, 99, ast(binary, "EQ", [ast(apply, none, [ast(identifier, "zeta", []), ast(identifier, "z", [])]), ast(number, "0", [])])).
source_formula(t_riemann, 100, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 101, ast(identifier, "rho", [])).
source_formula(t_riemann, 102, ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])])).
source_formula(t_riemann, 103, ast(binary, "GT", [ast(identifier, "rho", []), ast(number, "0", [])])).
source_formula(t_riemann, 104, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "VED", [])]), ast(subscript, none, [ast(identifier, "rho", []), ast(identifier, "R", [])])])).
source_formula(t_riemann, 105, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(t_riemann, 106, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 107, ast(identifier, "k", [])).
source_formula(t_riemann, 108, ast(binary, "IN", [ast(identifier, "rho", []), ast(interval, "LBRACK", [ast(number, "0", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])).
source_formula(t_riemann, 109, ast(binary, "CONG", [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Sch", [])])])).
source_formula(t_riemann, 110, ast(identifier, "dt'", [])).
source_formula(t_riemann, 111, ast(identifier, "c", [])).
source_formula(t_riemann, 112, ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])).
source_formula(t_riemann, 113, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(t_riemann, 114, ast(identifier, "rho", [])).
source_formula(t_riemann, 115, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 116, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Rim", [])])).
source_formula(t_riemann, 117, ast(identifier, "zeta", [])).
source_formula(t_riemann, 118, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 119, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 120, ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])])).
source_formula(t_riemann, 121, ast(binary, "GT", [ast(identifier, "rho", []), ast(number, "0", [])])).
source_formula(t_riemann, 122, ast(binary, "NE", [ast(call, "Re", [ast(identifier, "z", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(t_riemann, 123, ast(identifier, "z", [])).
source_formula(t_riemann, 124, ast(binary, "EQ", [ast(apply, none, [ast(identifier, "zeta", []), ast(identifier, "z", [])]), ast(number, "0", [])])).
source_formula(t_riemann, 125, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(t_riemann, 126, ast(binary, "CONG", [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Sch", [])])])).
formula_count(p_ved_completo, 2).
source_formula(p_ved_completo, 1, ast(binary, "EQ", [ast(power, none, [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(identifier, "cerrado", [])]), ast(binary, "UNION", [ast(subscript, none, [ast(decorated, "mathcal", [ast(identifier, "E", [])]), ast(identifier, "VED", [])]), ast(subscript, none, [ast(decorated, "mathcal", [ast(identifier, "I", [])]), ast(identifier, "VED", [])])])])).
source_formula(p_ved_completo, 2, ast(limit, none, [ast(identifier, "n", []), ast(constant, "INFINITY", [])])).
formula_count(p_vs, 6).
source_formula(p_vs, 1, ast(binary, "CONG", [ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])]), ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Sch", [])])])).
source_formula(p_vs, 2, ast(binary, "EQ", [ast(call, "G", [ast(number, "2", [])]), ast(identifier, "G", [])])).
source_formula(p_vs, 3, ast(converges, none, [ast(identifier, "n", []), ast(constant, "INFINITY", []), ast(call, "G", [ast(identifier, "n", [])]), ast(number, "0", [])])).
source_formula(p_vs, 4, ast(identifier, "n", [])).
source_formula(p_vs, 5, ast(binary, "EQ", [ast(identifier, "n", []), ast(number, "2", [])])).
source_formula(p_vs, 6, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Sch", [])])).
formula_count(p_ved_completo_2, 1).
source_formula(p_ved_completo_2, 1, ast(assertion, "contempla_exhaustivamente_todos_los_cierres_finitos.", [ast(tuple, "LPAREN", [ast(identifier, "k", []), ast(identifier, "rho", [])])])).
formula_count(p_f, 3).
source_formula(p_f, 1, ast(binary, "EQ", [ast(identifier, "F", []), ast(binary, "PLUS", [ast(binary, "MINUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(power, none, [ast(identifier, "dt'", []), ast(number, "2", [])])]), ast(derivative, "1", [ast(binary, "MINUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(power, none, [ast(identifier, "dt'", []), ast(number, "2", [])])]), ast(identifier, "t", [])])])])).
source_formula(p_f, 2, ast(identifier, "dt'", [])).
source_formula(p_f, 3, ast(identifier, "t", [])).
formula_count(p_f1, 3).
source_formula(p_f1, 1, ast(binary, "EQ", [ast(identifier, "F", []), ast(binary, "MINUS", [ast(binary, "PLUS", [ast(binary, "MINUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(power, none, [ast(identifier, "dt'", []), ast(number, "2", [])])]), ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "dt", [])])]), ast(binary, "MUL", [ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "dt'", [])]), ast(derivative, "1", [ast(identifier, "t'", []), ast(identifier, "t", [])])])])])).
source_formula(p_f1, 2, ast(identifier, "dt'", [])).
source_formula(p_f1, 3, ast(binary, "DIV", [ast(identifier, "dt'", []), ast(identifier, "dt", [])])).
formula_count(p_w, 12).
source_formula(p_w, 1, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "v", []), ast(identifier, "onda", [])]), ast(identifier, "c", [])])).
source_formula(p_w, 2, ast(binary, "EQ", [ast(identifier, "c", []), ast(number, "1", [])])).
source_formula(p_w, 3, ast(binary, "EQ", [ast(identifier, "v", []), ast(derivative, "1", [ast(identifier, "s", []), ast(identifier, "t", [])])])).
source_formula(p_w, 4, ast(binary, "EQ", [ast(derivative, "1", [ast(identifier, "s", []), ast(identifier, "t", [])]), ast(number, "1", [])])).
source_formula(p_w, 5, ast(binary, "EQ", [ast(identifier, "ds", []), ast(identifier, "dt", [])])).
source_formula(p_w, 6, ast(binary, "EQ", [ast(identifier, "dt'", []), ast(binary, "MUL", [ast(identifier, "dt", []), ast(call, "sqrt", [ast(binary, "MINUS", [ast(number, "1", []), ast(binary, "DIV", [ast(power, none, [ast(identifier, "v", []), ast(number, "2", [])]), ast(power, none, [ast(identifier, "c", []), ast(number, "2", [])])])])])])])).
source_formula(p_w, 7, ast(limit, none, [ast(identifier, "v", []), ast(identifier, "c", [])])).
source_formula(p_w, 8, ast(limit, none, [ast(identifier, "dt'", []), ast(number, "0", [])])).
source_formula(p_w, 9, ast(limit, none, [ast(power, none, [ast(identifier, "dt'", []), ast(number, "2", [])]), ast(number, "0", [])])).
source_formula(p_w, 10, ast(limit, none, [ast(derivative, "1", [ast(identifier, "t'", []), ast(identifier, "t", [])]), ast(number, "0", [])])).
source_formula(p_w, 11, ast(identifier, "F", [])).
source_formula(p_w, 12, ast(identifier, "c", [])).
formula_count(p_f2, 2).
source_formula(p_f2, 1, ast(binary, "EQ", [ast(identifier, "F", []), ast(binary, "PLUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "dt", [])])])])).
source_formula(p_f2, 2, ast(binary, "EQ", [ast(binary, "PLUS", [ast(power, none, [ast(identifier, "dt", []), ast(number, "2", [])]), ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "dt", [])])]), ast(binary, "MUL", [ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "dt", [])]), ast(binary, "PLUS", [ast(number, "1", []), ast(binary, "MUL", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(identifier, "dt", [])])])])])).
formula_count(p_f3, 35).
source_formula(p_f3, 1, ast(binary, "EQ", [ast(identifier, "F", []), ast(binary, "MUL", [ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "dt", [])]), ast(binary, "PLUS", [ast(number, "1", []), ast(binary, "MUL", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(identifier, "dt", [])])])])])).
source_formula(p_f3, 2, ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])).
source_formula(p_f3, 3, ast(binary, "EQ", [ast(decorated, "mathcal", [ast(identifier, "F", [])]), ast(binary, "PLUS", [ast(power, none, [ast(identifier, "ds", []), ast(number, "2", [])]), ast(derivative, "1", [ast(power, none, [ast(identifier, "ds", []), ast(number, "2", [])]), ast(identifier, "t", [])])])])).
source_formula(p_f3, 4, ast(binary, "EQ", [ast(derivative, "1", [ast(power, none, [ast(identifier, "ds", []), ast(number, "2", [])]), ast(identifier, "t", [])]), ast(binary, "MUL", [ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "ds", [])]), ast(binary, "DIV", [ast(call, "d", [ast(identifier, "ds", [])]), ast(identifier, "dt", [])])])])).
source_formula(p_f3, 5, ast(binary, "EQ", [ast(decorated, "mathcal", [ast(identifier, "F", [])]), ast(binary, "PLUS", [ast(power, none, [ast(identifier, "ds", []), ast(number, "2", [])]), ast(binary, "MUL", [ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "ds", [])]), ast(binary, "DIV", [ast(call, "d", [ast(identifier, "ds", [])]), ast(identifier, "dt", [])])])])])).
source_formula(p_f3, 6, ast(binary, "EQ", [ast(power, none, [ast(identifier, "ds", []), ast(number, "2", [])]), ast(binary, "MUL", [ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "ds", [])]), ast(binary, "MUL", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(identifier, "ds", [])])])])).
source_formula(p_f3, 7, ast(binary, "EQ", [ast(decorated, "mathcal", [ast(identifier, "F", [])]), ast(binary, "MUL", [ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "ds", [])]), ast(binary, "PLUS", [ast(binary, "DIV", [ast(call, "d", [ast(identifier, "ds", [])]), ast(identifier, "dt", [])]), ast(binary, "MUL", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(identifier, "ds", [])])])])])).
source_formula(p_f3, 8, ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])).
source_formula(p_f3, 9, ast(binary, "EQ", [ast(decorated, "mathcal", [ast(identifier, "D", [])]), ast(binary, "PLUS", [ast(binary, "DIV", [ast(identifier, "d", []), ast(identifier, "dt", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])).
source_formula(p_f3, 10, ast(binary, "EQ", [ast(binary, "MUL", [ast(identifier, "ds", []), ast(identifier, "t", [])]), ast(binary, "MUL", [ast(subscript, none, [ast(identifier, "ds", []), ast(number, "0", [])]), ast(power, none, [ast(identifier, "e", []), ast(binary, "MUL", [ast(identifier, "mu", []), ast(identifier, "t", [])])])])])).
source_formula(p_f3, 11, ast(binary, "EQ", [ast(binary, "DIV", [ast(call, "d", [ast(identifier, "ds", [])]), ast(identifier, "dt", [])]), ast(binary, "MUL", [ast(identifier, "mu", []), ast(identifier, "ds", [])])])).
source_formula(p_f3, 12, ast(binary, "EQ", [ast(binary, "MUL", [ast(decorated, "mathcal", [ast(identifier, "D", [])]), ast(identifier, "ds", [])]), ast(binary, "MUL", [ast(binary, "PLUS", [ast(identifier, "mu", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])]), ast(identifier, "ds", [])])])).
source_formula(p_f3, 13, ast(binary, "EQ", [ast(identifier, "s", []), ast(binary, "PLUS", [ast(identifier, "mu", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])).
source_formula(p_f3, 14, ast(binary, "EQ", [ast(identifier, "mu", []), ast(binary, "MINUS", [ast(identifier, "s", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])).
source_formula(p_f3, 15, ast(binary, "EQ", [ast(call, "Re", [ast(identifier, "mu", [])]), ast(number, "0", [])])).
source_formula(p_f3, 16, ast(binary, "EQ", [ast(apply, none, [ast(subscript, none, [ast(identifier, "mu", []), ast(sign, "PM", [])]), ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(binary, "MUL", [ast(unary, "PM", [ast(identifier, "i", [])]), ast(call, "b", [ast(identifier, "k", []), ast(identifier, "rho", [])])])])).
source_formula(p_f3, 17, ast(binary, "EQ", [ast(identifier, "s", []), ast(binary, "PLUS", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(identifier, "mu", [])])])).
source_formula(p_f3, 18, ast(binary, "EQ", [ast(apply, none, [ast(subscript, none, [ast(identifier, "s", []), ast(sign, "PM", [])]), ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(binary, "PM", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(binary, "MUL", [ast(identifier, "i", []), ast(call, "b", [ast(identifier, "k", []), ast(identifier, "rho", [])])])])])).
source_formula(p_f3, 19, ast(binary, "EQ", [ast(call, "Re", [ast(apply, none, [ast(subscript, none, [ast(identifier, "s", []), ast(sign, "PM", [])]), ast(identifier, "k", []), ast(identifier, "rho", [])])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(p_f3, 20, ast(binary, "EQ", [ast(call, "b", [ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(binary, "DIV", [ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])]), ast(binary, "MUL", [ast(binary, "PM", [ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(identifier, "lambda", [])])])])).
source_formula(p_f3, 21, ast(tuple, "LBRACE", [ast(binary, "EQ", [ast(apply, none, [ast(subscript, none, [ast(identifier, "s", []), ast(sign, "PM", [])]), ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(binary, "PM", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(binary, "MUL", [ast(identifier, "i", []), ast(binary, "DIV", [ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])]), ast(binary, "MUL", [ast(binary, "PM", [ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(identifier, "lambda", [])])])])])]), ast(binary, "AND", [ast(binary, "LE", [ast(number, "0", []), ast(identifier, "rho", [])]), ast(binary, "LE", [ast(identifier, "rho", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])).
source_formula(p_f3, 22, ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])])).
source_formula(p_f3, 23, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "T", []), ast(identifier, "k", [])]), ast(binary, "MUL", [ast(identifier, "k", []), ast(identifier, "lambda", [])])])).
source_formula(p_f3, 24, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "b", []), ast(identifier, "k", [])]), ast(binary, "DIV", [ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])]), ast(binary, "MUL", [ast(identifier, "k", []), ast(identifier, "lambda", [])])])])).
source_formula(p_f3, 25, ast(tuple, "LBRACE", [ast(binary, "EQ", [ast(apply, none, [ast(subscript, none, [ast(identifier, "s", []), ast(tuple, "LBRACE", [ast(identifier, "Z", []), ast(sign, "PM", [])])]), ast(identifier, "k", [])]), ast(binary, "PM", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(binary, "MUL", [ast(identifier, "i", []), ast(binary, "DIV", [ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])]), ast(binary, "MUL", [ast(identifier, "k", []), ast(identifier, "lambda", [])])])])])]), ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])])])).
source_formula(p_f3, 26, ast(quantifier, "FORALL", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])]), ast(binary, "EQ", [ast(call, "Re", [ast(apply, none, [ast(subscript, none, [ast(identifier, "s", []), ast(tuple, "LBRACE", [ast(identifier, "Z", []), ast(sign, "PM", [])])]), ast(identifier, "k", [])])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])).
source_formula(p_f3, 27, ast(identifier, "F", [])).
source_formula(p_f3, 28, ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])).
source_formula(p_f3, 29, ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "ds", [])])).
source_formula(p_f3, 30, ast(identifier, "t", [])).
source_formula(p_f3, 31, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Lap", [])])).
source_formula(p_f3, 32, ast(decorated, "mathcal", [ast(identifier, "D", [])])).
source_formula(p_f3, 33, ast(decorated, "mathcal", [ast(identifier, "D", [])])).
source_formula(p_f3, 34, ast(identifier, "mu", [])).
source_formula(p_f3, 35, ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])).
formula_count(d_lap, 12).
source_formula(d_lap, 1, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "s", []), ast(sign, "PM", [])]), ast(binary, "PM", [ast(identifier, "a", []), ast(identifier, "ib", [])])])).
source_formula(d_lap, 2, ast(binary, "EQ", [ast(identifier, "a", []), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(d_lap, 3, ast(binary, "EQ", [ast(call, "T", [ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(binary, "MUL", [ast(binary, "PM", [ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(identifier, "lambda", [])])])).
source_formula(d_lap, 4, ast(binary, "EQ", [ast(power, none, [ast(identifier, "e", []), ast(unary, "PM", [ast(identifier, "ibT", [])])]), ast(number, "1", [])])).
source_formula(d_lap, 5, ast(binary, "EQ", [ast(identifier, "bT", []), ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])])])).
source_formula(d_lap, 6, ast(binary, "EQ", [ast(call, "b", [ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(binary, "DIV", [ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])]), ast(binary, "MUL", [ast(binary, "PM", [ast(identifier, "k", []), ast(identifier, "rho", [])]), ast(identifier, "lambda", [])])])])).
source_formula(d_lap, 7, ast(binary, "EQ", [ast(identifier, "rho", []), ast(number, "0", [])])).
source_formula(d_lap, 8, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "b", []), ast(identifier, "k", [])]), ast(binary, "DIV", [ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])]), ast(binary, "MUL", [ast(identifier, "k", []), ast(identifier, "lambda", [])])])])).
source_formula(d_lap, 9, ast(binary, "EQ", [ast(subscript, none, [ast(identifier, "Z", []), ast(limit, none, [ast(identifier, "VED", []), ast(identifier, "Lap", [])])]), ast(set_builder, none, [ast(binary, "PM", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(binary, "MUL", [ast(identifier, "i", []), ast(binary, "DIV", [ast(binary, "MUL", [ast(number, "2", []), ast(constant, "PI", [])]), ast(binary, "MUL", [ast(identifier, "k", []), ast(identifier, "lambda", [])])])])]), ast(binary, "IN", [ast(identifier, "k", []), ast(power, none, [ast(identifier, "Nat", []), ast(sign, "PLUS", [])])])])])).
source_formula(d_lap, 10, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "Lap", [])])).
source_formula(d_lap, 11, ast(identifier, "t", [])).
source_formula(d_lap, 12, ast(binary, "EQ", [ast(identifier, "c", []), ast(number, "1", [])])).
formula_count(p_f3_2, 1).
source_formula(p_f3_2, 1, ast(binary, "EQ", [ast(identifier, "F", []), ast(binary, "MUL", [ast(binary, "MUL", [ast(number, "2", []), ast(identifier, "dt", [])]), ast(binary, "PLUS", [ast(number, "1", []), ast(binary, "MUL", [ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])]), ast(identifier, "dt", [])])])])])).
formula_count(p_lap_z, 4).
source_formula(p_lap_z, 1, ast(binary, "EQ", [ast(call, "Re", [ast(identifier, "s", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])).
source_formula(p_lap_z, 2, ast(subscript, none, [ast(identifier, "U", []), ast(identifier, "VED", [])])).
source_formula(p_lap_z, 3, ast(identifier, "k", [])).
source_formula(p_lap_z, 4, ast(identifier, "k", [])).
formula_count(p_lap_z_2, 1).
source_formula(p_lap_z_2, 1, ast(binary, "SUBSET", [ast(subscript, none, [ast(identifier, "Z", []), ast(limit, none, [ast(identifier, "VED", []), ast(identifier, "Lap", [])])]), ast(set_builder, none, [ast(identifier, "s", []), ast(binary, "EQ", [ast(call, "Re", [ast(identifier, "s", [])]), ast(binary, "DIV", [ast(number, "1", []), ast(number, "2", [])])])])])).
defines_set(d_f, u_rim_rho).
defines_set(d_particion, u_ved_cerrado).
defines_set(d_f, u_ved_rho).
defines_set(d_rim, z_rim_nt).
uses_defined_set(d_particion, u_ved_cerrado).
uses_defined_set(d_rim, z_rim_nt).
uses_defined_set(d_f, u_rim_rho).
uses_defined_set(d_f, u_ved_rho).
uses_defined_set(d_finv, u_rim_rho).
inferred_definition_dependency(d_finv, d_f, u_rim_rho).
uses_defined_set(d_finv, u_ved_rho).
inferred_definition_dependency(d_finv, d_f, u_ved_rho).
uses_defined_set(t_iso, u_rim_rho).
uses_defined_set(t_iso, u_ved_rho).
uses_defined_set(p_rim_s, z_rim_nt).
inferred_definition_dependency(p_rim_s, d_rim, z_rim_nt).
uses_defined_set(p_z, z_rim_nt).
inferred_definition_dependency(p_z, d_rim, z_rim_nt).
uses_defined_set(t_riemann, z_rim_nt).
inferred_definition_dependency(t_riemann, d_rim, z_rim_nt).
uses_defined_set(p_ved_completo, u_ved_cerrado).

fact(d_u).
fact(d_t_prime).
fact(a_l).
fact(d_lambda).
fact(d_l).
fact(d_r_ved).
fact(d_k).
fact(d_rho).
fact(d_mathcal_e_ved).
fact(d_particion).
fact(a_7).
fact(d_rim).
fact(d_rho_r).
fact(d_f).
rule(d_finv, [d_f]).
rule(p_coord, [d_u]).
rule(p_ved_inv, [d_lambda, d_l, d_r_ved]).
rule(t_iso, [d_f, d_finv]).
rule(p_st, [p_coord, d_t_prime, a_l]).
rule(p_ved_e, [p_ved_inv, d_k, d_rho]).
rule(p_rho_iso, [t_iso]).
rule(p_v, [d_t_prime, a_l, p_st]).
rule(p_st_2, [p_st]).
rule(p_ved_i, [d_k, d_rho, p_ved_e]).
rule(p_ved_e_2, [p_ved_e]).
rule(p_rim_s, [t_iso, p_rho_iso, d_rim]).
rule(p_a, [a_l, p_st, p_v]).
rule(p_ved_k_e, [p_ved_e, p_ved_i, d_mathcal_e_ved]).
rule(p_vr_rho, [t_iso, p_rho_iso, p_rim_s]).
rule(p_ved_k_i, [d_mathcal_e_ved, p_ved_k_e, d_particion]).
rule(p_ved_k_e_2, [p_ved_k_e]).
rule(p_vr_e, [p_ved_e, p_vr_rho]).
rule(p_z, [p_vr_rho, d_rim]).
rule(p_ved_r_c, [p_ved_k_e, d_particion, p_ved_k_i]).
rule(t_riemann, [t_iso, p_rho_iso, p_rim_s, p_z, d_rho_r, p_vr_rho, d_rim]).
rule(p_ved_completo, [d_particion, p_ved_k_i, p_ved_r_c]).
rule(p_vs, [p_ved_r_c, p_ved_completo, a_7]).
rule(p_ved_completo_2, [p_ved_completo]).
rule(p_f, [a_7, p_vs, p_st_2]).
rule(p_f1, [p_vs, p_st_2, p_f]).
rule(p_w, [p_f1]).
rule(p_f2, [p_f, p_f1, p_w]).
rule(p_f3, [p_f1, p_w, p_f2]).
rule(d_lap, [p_f3]).
rule(p_f3_2, [p_f3]).
rule(p_lap_z, [p_f2, p_f3, d_lap]).
rule(p_lap_z_2, [p_lap_z]).

% ============================================================
% MOTOR DE DEMOSTRACION
% ============================================================

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

% ============================================================
% RELACIONES DE DEPENDENCIA
% ============================================================

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
    depends_transitively_(
        Intermediate,
        Dependency,
        [Intermediate|Seen]
    ).

% ============================================================
% AUDITORIA GLOBAL DEL GRAFO
% ============================================================

implemented_node(Node) :-
    fact(Node).

implemented_node(Node) :-
    rule(Node, _).

graph_error(reference_not_declared(Node, Dependency)) :-
    depends_on(Node, Dependency),
    \+ declared_node(Dependency, _).

graph_error(unresolved_dependency(Node, Dependency)) :-
    unresolved_dependency(Node, Dependency).

graph_error(node_without_fact_or_rule(Node)) :-
    declared_node(Node, _),
    \+ implemented_node(Node).

graph_error(formula_coverage_mismatch(Node, Expected, Actual)) :-
    formula_count(Node, Expected),
    findall(Index, source_formula(Node, Index, _), Indices),
    length(Indices, Actual),
    Expected =\= Actual.

graph_error(self_dependency(Node)) :-
    depends_on(Node, Node).

graph_error(cyclic_dependency(Node)) :-
    declared_node(Node, _),
    depends_transitively(Node, Node).

graph_error(conflicting_node_types(Node, Kinds)) :-
    declared_node(Node, _),
    findall(
        Kind,
        declared_node(Node, Kind),
        RawKinds
    ),
    sort(RawKinds, Kinds),
    length(Kinds, Count),
    Count > 1.

node_definition(Node, fact) :-
    fact(Node).

node_definition(Node, rule(Dependencies)) :-
    rule(Node, Dependencies).

graph_error(conflicting_definitions(Node, Definitions)) :-
    implemented_node(Node),
    findall(
        Definition,
        node_definition(Node, Definition),
        RawDefinitions
    ),
    sort(RawDefinitions, Definitions),
    length(Definitions, Count),
    Count > 1.

% ============================================================
% ADVERTENCIAS ESTRUCTURALES
% ============================================================

graph_warning(redundant_declaration(Node, Kind)) :-
    declared_node(Node, Kind),
    findall(
        Kind,
        declared_node(Node, Kind),
        Declarations
    ),
    length(Declarations, Count),
    Count > 1,
    findall(
        OtherKind,
        declared_node(Node, OtherKind),
        RawKinds
    ),
    sort(RawKinds, [Kind]).

graph_warning(redundant_definition(Node, Definition)) :-
    node_definition(Node, Definition),
    findall(
        Definition,
        node_definition(Node, Definition),
        Definitions
    ),
    length(Definitions, Count),
    Count > 1,
    findall(
        OtherDefinition,
        node_definition(Node, OtherDefinition),
        RawDefinitions
    ),
    sort(RawDefinitions, [Definition]).

% ============================================================
% AUDITORIA DEL OBJETIVO
% ============================================================

goal_error(Goal, goal_not_declared(Goal)) :-
    \+ declared_node(Goal, _).

goal_error(Goal, missing_definition_dependency(Node, Provider, Symbol)) :-
    used_by_goal(Goal, Node),
    uses_defined_set(Node, Symbol),
    defines_set(Provider, Symbol),
    Node \= Provider,
    \+ depends_transitively(Node, Provider).

audit_graph(Goal) :-
    findall(
        Error,
        (graph_error(Error) ; goal_error(Goal, Error)),
        RawErrors
    ),
    sort(RawErrors, Errors),

    findall(
        Warning,
        graph_warning(Warning),
        RawWarnings
    ),
    sort(RawWarnings, Warnings),

    forall(
        member(Warning, Warnings),
        format(
            'AVISO ESTRUCTURAL: ~q~n',
            [Warning]
        )
    ),

    (
        Errors = []
    ->
        true
    ;
        format(
            'RESULTADO PROLOG: ARBOL INCOMPLETO~n',
            []
        ),
        format(
            'Errores estructurales del grafo:~n',
            []
        ),
        forall(
            member(Error, Errors),
            format('  - ~q~n', [Error])
        ),
        fail
    ).

% ============================================================
% COBERTURA DEDUCTIVA
% ============================================================

% Un nodo pertenece a la prueba del objetivo si es el propio
% objetivo o una dependencia transitiva del mismo.

used_by_goal(Goal, Goal).

used_by_goal(Goal, Node) :-
    depends_transitively(Goal, Node).

% Los nodos externos a la clausura del objetivo se conservan.
% No se consideran automaticamente errores.

outside_goal(Goal, Node) :-
    declared_node(Node, _),
    \+ used_by_goal(Goal, Node).

% Raiz de una rama externa:
% nodo externo que no es dependencia de otro nodo externo.

external_root(Goal, Node) :-
    outside_goal(Goal, Node),
    \+ (
        outside_goal(Goal, Other),
        Other \= Node,
        depends_on(Other, Node)
    ).

% ============================================================
% INFORME
% ============================================================

write_atoms([]).

write_atoms([Atom]) :-
    format('~w', [Atom]).

write_atoms([Atom|Atoms]) :-
    format('~w, ', [Atom]),
    write_atoms(Atoms).

write_clause(Node) :-
    fact(Node),
    !,
    format('  ~w.~n', [Node]).

write_clause(Node) :-
    rule(Node, Dependencies),
    format('  ~w :- ', [Node]),
    write_atoms(Dependencies),
    format('.~n', []).

write_external_branch(Goal, Root) :-
    findall(
        Node,
        (
            Node = Root
        ;
            depends_transitively(Root, Node)
        ),
        RawNodes
    ),
    sort(RawNodes, Nodes),
    include(outside_goal(Goal), Nodes, ExternalNodes),
    format('  Rama externa desde ~w: ', [Root]),
    write_atoms(ExternalNodes),
    format('~n', []).

write_report(Goal) :-
    findall(
        Node,
        used_by_goal(Goal, Node),
        RawUsed
    ),
    sort(RawUsed, Used),

    findall(
        Node,
        outside_goal(Goal, Node),
        RawOutside
    ),
    sort(RawOutside, Outside),

    findall(
        Root,
        external_root(Goal, Root),
        RawRoots
    ),
    sort(RawRoots, Roots),

    findall(
        Node,
        declared_node(Node, _),
        RawAll
    ),
    sort(RawAll, All),

    length(All, TotalCount),
    length(Used, UsedCount),
    length(Outside, OutsideCount),
    findall((Node, Index), source_formula(Node, Index, _), FormulaFacts),
    length(FormulaFacts, FormulaCount),

    format(
        'RESULTADO PROLOG: ARBOL COMPLETO~n',
        []
    ),
    format(
        'Objetivo alcanzable en el grafo: ~w~n',
        [Goal]
    ),
    format(
        'Nodos formales totales: ~d~n',
        [TotalCount]
    ),
    format('Formulas extraidas como hechos: ~d~n', [FormulaCount]),
    format(
        'Nodos de la clausura deductiva del objetivo: ~d~n',
        [UsedCount]
    ),

    (
        Outside = []
    ->
        format(
            'Nodos fuera de la clausura del objetivo: 0~n',
            []
        )
    ;
        format(
            'Nodos fuera de la clausura del objetivo: ~d~n',
            [OutsideCount]
        ),
        format(
            'Estos nodos NO se consideran errores por si mismos.~n',
            []
        ),
        format(
            'Pueden pertenecer a comprobaciones o ramas independientes.~n',
            []
        ),
        format(
            'Nodos externos: ~w~n',
            [Outside]
        )
    ),

    (
        Roots = []
    ->
        true
    ;
        format(
            'Raices de ramas externas al objetivo: ~w~n',
            [Roots]
        )
    ),

    format(
        'Cadena deductiva utilizada para el objetivo:~n',
        []
    ),
    forall(
        member(Node, Used),
        write_clause(Node)
    ).

% ============================================================
% EJECUCION
% ============================================================

go(Goal) :-
    audit_graph(Goal),
    (
        prove(Goal, _Proof, [])
    ->
        write_report(Goal)
    ;
        format(
            'RESULTADO PROLOG: ARBOL INCOMPLETO~n',
            []
        ),
        format(
            'No se pudo cerrar el arbol del objetivo: ~w~n',
            [Goal]
        ),
        fail
    ).

go :-
    goal(Goal),
    go(Goal).

:- initialization(
    (go -> halt(0) ; halt(1)),
    main
).