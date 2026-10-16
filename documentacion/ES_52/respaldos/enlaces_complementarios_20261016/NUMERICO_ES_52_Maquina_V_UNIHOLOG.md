# Evaluacion numerica del proyecto 52

Estado: **ENSAYO_NO_APLICABLE_A_V**.

**Criterio del autor:** la medida solo debe desencadenarse en $t=t_0$,
sin recorrer caminos ni posibles salidas para calcular el resultado.

La propuesta por caminos no cumple ese criterio. Se retira como candidata
a ejecucion de V; sus resultados se conservan como ensayo numerico separado.
Esto no refuta V ni modifica su demostracion: identifica una implementacion
que no corresponde a las premisas exigidas.

## Resultados historicos del ensayo

- V1: los cuatro casos de Deutsch coinciden con la referencia Q local.
- V2: distribucion completa N=3, error maximo 1.39e-34.
- V2: lectura N=15, control 64, factores [3, 5].
- V2: 74.328 segundos; 22199239 visitas; pila maxima 10.
- V3: distribucion de tres unidades, error maximo 1.11e-16.

## Orden de ejecucion

El ensayo conserva el orden de las puertas Q y sus fases. Su memoria evita la tabla
conjunta, pero la lectura recorre hasta $2^n$ palabras y muchos caminos.
No se ha demostrado mejor orden temporal ni mejora respecto de un algoritmo
convencional para la misma tarea. No hay tiempos de hardware Q.

## Alcance

Ensayo numerico conservado como historial. Sus coincidencias no evaluan V: el recorrido de caminos incumple el criterio de medida por disparo.

La referencia de ensayo es fija, 0.37. Una lectura favorable no determina
la tasa de exito. La precision es finita. Estos resultados no sustituyen
ni modifican los veredictos independientes de Lean y Prolog.

[Evaluacion estructurada](NUMERICO_ES_52_Maquina_V_UNIHOLOG.json)
[Datos completos del ensayo](NUMERICO_DATOS_ES_52_Maquina_V_UNIHOLOG.json)
