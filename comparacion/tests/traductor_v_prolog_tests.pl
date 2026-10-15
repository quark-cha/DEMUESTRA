% Interface fixture only, not an implementation of physical H/CNOT.
:- use_module(library(plunit)).
:- dynamic llamadas/1.
:- multifile qasm_v:realizar_preparacion/1, qasm_v:realizar_disparo/2.
qasm_v:realizar_preparacion(plan(2, [0,0], [op(h,[0],ninguno),op(cnot,[0,1],ninguno)])).
qasm_v:realizar_disparo(T0, [1,0]) :-
    number(T0), T0 > 0, assertz(user:llamadas(T0)).

limpiar :- retractall(qasm_v:estado(_)), retractall(llamadas(_)).
:- begin_tests(traductor_v).
test(lectura_conjunta, [setup(user:limpiar), cleanup(user:limpiar)]) :-
    qasm_v:estado_observado(['@','@']),
    qasm_v:preparar,
    qasm_v:estado_observado(['@','@']),
    qasm_v:medir([1,0]),
    qasm_v:medir([1,0]),
    qasm_v:estado_observado([1,0]),
    findall(T, user:llamadas(T), [_]),
    qasm_v:instante_medida(T0), number(T0).
test(no_preparada, [setup(user:limpiar), cleanup(user:limpiar),
                    throws(error(permiso(no_preparada_o_consumida), medir/1))]) :-
    qasm_v:medir(_).
test(no_repreparacion, [setup(user:limpiar), cleanup(user:limpiar),
                       throws(error(permiso(preparacion_consumida), preparar/0))]) :-
    qasm_v:preparar, qasm_v:preparar.
:- end_tests(traductor_v).
