% Generated V wiring; code: HL3. No premeasurement outcome values.
% Victor Estrada Diaz, ES_52. https://estradad.es/licencia.php
:- module(qasm_v, [preparar/0, medir/1, estado_observado/1, plan/1, medidas/1,
                   instante_medida/1]).
:- use_module(library(lists)).
:- dynamic estado/1.
:- multifile realizar_preparacion/1, realizar_disparo/2.
plan(plan(2, [0,0], [op(h,[0],ninguno),op(cnot,[0,1],ninguno)])).
medidas([medida(0,0),medida(1,1)]).

preparar :- with_mutex(qasm_v, preparar_unica).
preparar_unica :-
    (estado(_) -> throw(error(permiso(preparacion_consumida), preparar/0)); true),
    assertz(estado(consumida)),
    plan(P),
    (once(realizar_preparacion(P)) -> retractall(estado(_)), assertz(estado(preparada));
     throw(error(realizacion_pendiente, preparar/0))).

medir(Bits) :- with_mutex(qasm_v, medir_unica(Bits)).
medir_unica(Bits) :- estado(leida(_, Bits)), !.
medir_unica(Bits) :-
    (retract(estado(preparada)) -> true;
     throw(error(permiso(no_preparada_o_consumida), medir/1))),
    get_time(T0),
    assertz(estado(disparada(T0))),
    (once(realizar_disparo(T0, Leidos)) -> true;
     throw(error(realizacion_pendiente, medir/1))),
    (is_list(Leidos), length(Leidos, 2), maplist(bit, Leidos) -> true;
     throw(error(lectura_no_binaria_o_incompleta, medir/1))),
    retractall(estado(_)), assertz(estado(leida(T0, Leidos))), Bits = Leidos.
bit(B) :- integer(B), (B =:= 0 ; B =:= 1).
estado_observado(Bits) :- with_mutex(qasm_v, observar(Bits)).
observar(Bits) :- estado(leida(_, Bits)), !.
observar(Bits) :- length(Bits, 2), maplist(=('@'), Bits).
instante_medida(T0) :- with_mutex(qasm_v, instante(T0)).
instante(T0) :- estado(leida(T0, _)), !.
instante(T0) :- estado(disparada(T0)), !.
instante(_) :- throw(error(no_medida, instante_medida/1)).
