# Analisis constructivo del proyecto 52

Fecha: 9 de octubre de 2026.
Alcance: lectura del MD vigente, programas locales y pruebas de comparacion.
No se publica, no se modifica el MD cientifico y no se emite certificacion.

## Objetivo del autor

Demostrar, desde las premisas propias del 52, la correspondencia de cada
operacion admitida de Q con una realizacion V de electronica convencional.
Los tres casos Q1/V1, Q2/V2 y Q3/V3 concretan esa correspondencia. El punto
4 debe comparar el orden de ejecucion y los recursos de las realizaciones,
no solamente constatar que producen respuestas coincidentes.

No se importan criterios de estabilidad, operadores ni premisas del 46.
La notacion xi expresa desconocimiento del resultado, no un estado fisico
adicional ni una regla de probabilidades.

## Lo que ya contiene el desarrollo

- Seccion 11.2: los acoplamientos reales prescritos generan la ecuacion
  compleja de evolucion. La equivalencia sigue de la igualdad de generadores,
  preparacion correspondiente y unicidad; es un resultado condicional.
- Secciones 12.2 y 12.3: lectura, estado posterior y secuencias de medidas.
  La preparacion de la referencia de lectura es una condicion explicita.
- Seccion 20.4: F(Mz)=R(M)F(z), conservacion de normas y
  R(N)R(M)=R(NM). El argumento inductivo conserva las probabilidades de
  historiales y los estados posteriores bajo las reglas del registro ideal.

Esto constituye un argumento matematico constructivo para V_ref bajo sus
hipotesis. No debe describirse como una simple lista de coincidencias.
Tampoco debe atribuirse automaticamente a otra arquitectura V que no haya
implementado esas reglas. Un resultado constructivo ideal no exige por
definicion un prototipo ya construido, pero si una realizacion especificada
y una justificacion de sus operaciones y recursos.

## Los tres programas presentes

| Caso | Construccion ejecutada | Alcance comprobable |
| --- | --- | --- |
| Q1/V1 | Deutsch; cuatro canales reales y oraculo por permutacion | Protocolo finito con una aplicacion del oraculo durante execute; su construccion recibe la tabla de la funcion |
| Q2/V2 | Busqueda de periodo, lectura y extraccion de factores | Modelo finito con registro y bloque Fourier explicitos; limite de cinco bits de entrada |
| Q3/V3 | Circuitos locales H, Rx, Rz y CZ | Distribuciones de instancias locales; no ejecucion del circuito publicado de Willow |

V ejecuta sus propias reglas, no copia la respuesta calculada por Q. Las
referencias Q ejecutadas son tambien modelos de software. Esta independencia
del calculo es positiva, pero no identifica por si sola el software con una
realizacion fisica ni prueba el coste de hardware de Q o V.

V3 reserva dos vectores de 2^n reales. V2 reserva canales de dimension
2^(3b) y bloques Fourier de dimension 2^(4b), con b el numero de bits de
entrada. Son costes del codigo observado, no una imposibilidad demostrada
de una arquitectura V alternativa.

El orden de ejecucion comparable debe expresarse con el mismo parametro
de entrada y contabilizar preparacion, oraculos, operaciones, memoria o
canales, precision, lectura y repeticiones para una calidad fijada. Los
tiempos de dos programas pequenos no constituyen esa demostracion asintotica.

## Como construir la formalizacion propia del 52

1. Declarar estados Q y V, operaciones, preparaciones, instrumentos de
   lectura, historiales visibles y protocolo comun con tipos propios.
2. Formalizar la correspondencia de estados y las identidades de bloques
   reales; no representar matrices como funciones escalares arbitrarias.
3. Probar conservacion por operaciones, pesos de resultados y actualizacion.
4. Probar por induccion la equivalencia de cada protocolo finito admitido.
5. Instanciar el argumento en Q1/V1, Q2/V2 y Q3/V3, respetando su alcance.
6. Anadir funciones de coste y justificar las cotas de la arquitectura
   realmente propuesta. No suponer la equivalencia ni el coste como conclusion.

La traduccion tipada existente TRADUCCION_TIPADA_REGISTRO_Y_BASE.lean es
un apoyo parcial; sus definiciones y lemas de expansion y estado posterior
no son una prueba completa de la correspondencia Q/V.

## Verificacion efectuada en esta revision

- 34 pruebas de DEMUESTRA/comparacion/tests pasan en el entorno local.
- Se vuelve a intentar la generacion Lean desde el MD actual, sin escribir
  artefactos de publicacion ni reutilizar un Lean anterior como certificado.
- El traductor informa ocho bloqueos: uno de alcance/tipo de R, tres de
  indices de sumatoria y cuatro del modelo de probabilidad condicionada.
  Son diagnosticos del traductor, no refutaciones de las formulas del MD.
- Los informes numericos anteriores no se sobrescriben con esta ejecucion.

El siguiente trabajo de implementacion debe partir de estos modelos y
correspondencias, no del generador escalar empleado para el documento 46.

## Verificacion del registro antes de la medida

Se comprueban las reservas de NumPy durante execute, sin llamar a
capture_t0, sin leer salidas internas y sin cambiar los programas:

| Programa | Reservas observadas antes de la medida |
| --- | --- |
| V3, n=4 | Dos vectores de 16 reales: 256 bytes en total |
| V3, n=8 | Dos vectores de 256 reales: 4096 bytes en total |
| V2, N=15 | Un registro real de 256 por 16: 32768 bytes |

Estos datos no incluyen todos los temporales, probabilidades ni los bloques
Fourier. Confirman que el registro explicito existe antes de la captura.
Bloquear la lectura ordinaria no evita su almacenamiento ni su calculo.

La seccion 20.1 del MD introduce expresamente este banco como V_ref,
distinto de la arquitectura compacta propuesta. La seccion 23 declara
el objetivo de no almacenar las amplitudes. Por tanto, atribuir el coste
exponencial de estos programas a toda maquina V del autor seria incorrecto.
Tambien seria incorrecto considerar los programas actuales una realizacion
verificada de su arquitectura sin registro exponencial.

El desconocimiento del resultado y la captura final no proporcionan, por
si solos, una cota de recursos. La representacion relacional y sus reglas
deben verificarse por separado; no se sustituiran por una tabla de amplitudes
para dar esa propiedad por demostrada.
