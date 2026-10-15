# Tabla de correspondencias: qubit Q y unidad V

Esta tabla compara una unidad aislada desde las reglas de las secciones
11.1, 11.3, 12.1, 12.2 y 12.3 del documento 52. No es un registro de
estados internos que V deba almacenar ni una enumeracion de un registro
conjunto. Describe preparaciones, relaciones de senal y predicciones.

## Convenciones

Q tiene los vectores de referencia e0 y e1. Para la realizacion de senales
descrita en el MD, V tiene dos caminos coherentes s0 y s1. La pareja que
aparece en la tabla expresa una relacion de preparacion, no una lectura
interna durante el calculo. Una potencia total positiva y una fase global
comun no cambian las predicciones normalizadas.

Z lee en la base (e0,e1); X en la base (+,-); Y en la base (+i,-i).
El resultado 0 corresponde al primer vector de cada base. Cada columna
P(0) se refiere a un protocolo alternativo: no son tres lecturas simultaneas.
Las probabilidades de resultado 1 son los complementos.

| Preparacion Q | Imagen de preparacion V: s0:s1 | Relacion entre caminos | P_Q(0)=P_V(0), Z | P_Q(0)=P_V(0), X | P_Q(0)=P_V(0), Y |
| --- | --- | --- | ---: | ---: | ---: |
| e0 | 1:0 | Solo el camino 0 excitado | 1 | 1/2 | 1/2 |
| e1 | 0:1 | Solo el camino 1 excitado | 0 | 1/2 | 1/2 |
| + = (e0+e1)/sqrt(2) | 1:1 | Igual intensidad y fase relativa 0 | 1/2 | 1 | 1/2 |
| - = (e0-e1)/sqrt(2) | 1:-1 | Igual intensidad y fase relativa pi | 1/2 | 0 | 1/2 |
| +i = (e0+i e1)/sqrt(2) | 1:i | Igual intensidad y fase relativa pi/2 | 1/2 | 1/2 | 1 |
| -i = (e0-i e1)/sqrt(2) | 1:-i | Igual intensidad y fase relativa -pi/2 | 1/2 | 1/2 | 0 |

Las igualdades de lectura se entienden bajo las condiciones del comparador
y de la referencia temporal declaradas en 12.2 y del cambio de base de
12.3. No se afirman a partir del mero desconocimiento de la salida.

## Familia completa de estados puros de una unidad

Los seis casos son referencias; no agotan los estados puros. Para
0 <= theta <= pi y phi modulo 2*pi, se considera:

$$
\psi_Q=\cos(\theta/2)e_0+e^{i\phi}\sin(\theta/2)e_1.
$$

La imagen de preparacion de senales es:

$$
s_0:s_1=\cos(\theta/2):e^{i\phi}\sin(\theta/2).
$$

Esto permite describir matematicamente intensidades y fase relativa sin
observar una salida binaria ni almacenar una tabla de resultados posibles.
La notacion xi sigue representando el resultado no observado, no un tercer
estado. En los protocolos con prediccion cierta, no debe confundirse no
haber realizado la lectura con no poder predecir su resultado.

## Comprobacion general de las lecturas

Sea B=(b0,b1) cualquier base ortonormal admitida. Q predice:

$$
P_Q(0\mid B)=|b_0^\dagger\psi_Q|^2.
$$

V realiza el cambio de base sobre las senales, y=B^dagger s, antes de
la lectura, sin registrar salidas intermedias. El umbral es:

$$
w=\frac{|y_0|^2}{|y_0|^2+|y_1|^2}.
$$

Para una preparacion correspondiente s=A exp(i gamma) psi_Q, A>0,
la unitariedad de B y la normalizacion de psi_Q dan:

$$
w=\frac{A^2|b_0^\dagger\psi_Q|^2}{A^2}
=|b_0^\dagger\psi_Q|^2.
$$

Con la referencia r(t0) uniforme en [0,1) bajo las condiciones del
protocolo, y la regla v=0 si r(t0)<w, se obtiene:

$$
P_V(0\mid B)=\int_0^w dr=w=P_Q(0\mid B),
\qquad P_V(1\mid B)=1-w=P_Q(1\mid B).
$$

La preparacion de la referencia y la realizacion del cambio de base son
hipotesis constructivas explicitas del MD. La igualdad anterior se deduce
de sus reglas; no se introduce como premisa de la comparacion.

## Operaciones que conectan las imagenes

| Operacion Q | Regla V presente en el MD | Comprobacion |
| --- | --- | --- |
| X | Bloque 11.3 con Omega=Delta=chi=0 y kappa*tau=pi/2 | Realiza -iX: intercambio de caminos, salvo fase global de la unidad aislada |
| H | Bloque 11.3 con Omega=chi=0, Delta=kappa=g/sqrt(2), g*tau=pi/2 | Realiza -iH; conecta e0 con + y e1 con - |
| U_phi | Introducir fase relativa phi entre caminos, 12.1 | Conserva intensidades de lectura Z y modifica la interferencia posterior |
| Lectura en B | Cambio de base, comparador y captura, 12.2 y 12.3 | Iguales probabilidades bajo las condiciones declaradas |

La fase global de una unidad aislada no puede descartarse sin mas al
convertir el bloque en una operacion controlada sobre varias unidades.
La equivalencia de lectura de una unidad no prueba por si sola la conexion
compacta de varias unidades ni una cota general del orden de ejecucion.

## Estado de la comprobacion

La derivacion algebraica cubre todos los estados puros y bases de lectura
de una unidad que las reglas declaradas admitan. La tabla de seis casos
es una muestra verificable de ese resultado, no una prueba de las tres
maquinas completas ni un certificado de realizacion fisica.

Comprobacion numerica local del 9 de octubre de 2026: las 18 entradas de
la tabla coinciden con los valores indicados. Se comprueban ademas 969
casos de preparacion y lectura en Z, X e Y, incluyendo escala de senal
3.7 y fase global 0.83. Error maximo: 8.881784197001252e-16. Se usan
vectores de dos componentes exclusivamente para auditar estas formulas,
no como implementacion ni registro interno de la maquina V propuesta.
