# Cuantificador universal al final

El traductor detecta una afirmacion matematica seguida de un cuantificador universal final, por ejemplo:

```latex
\Re[s_{Z,\pm}(k)] = \frac12 \qquad \forall k\in\mathbb N^+.
```

En este caso exige escribir el cuantificador delante:

```latex
\forall k\in\mathbb N^+,\qquad \Re[s_{Z,\pm}(k)] = \frac12.
```

El orden no cambia el significado de esta afirmacion cuando se conserva el dominio y el alcance del cuantificador. La herramienta no procesa correctamente ese cuantificador final; se trata de una limitacion de traduccion, no de una refutacion matematica.

El diagnostico `CUANTIFICADOR_UNIVERSAL_AL_FINAL` incluye archivo, linea, nodo y formula originales. No modifica automaticamente el Markdown. Los cuantificadores iniciales y los cuantificadores iniciales anidados mantienen su procesamiento habitual.

La comprobacion pertenece al analizador comun, por lo que el compilador compartido conserva el mismo aviso para los backends que utilizan esta representacion. Las copias del analizador en DEMUESTRA y PUBLICAR deben permanecer sincronizadas.
