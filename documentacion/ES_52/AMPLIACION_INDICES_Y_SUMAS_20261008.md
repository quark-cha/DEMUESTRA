# Ampliacion del lenguaje del traductor

Esta revision modifica la herramienta instalada en DEMUESTRA, no el documento
cientifico. Los originales estan en respaldos/traductor_indices_20261008.

## Notacion admitida

- Familias con indices calculados, como s_{j+1} o mathcal R_{j-1}.
  Cuando los tipos son compatibles, las notaciones indexada y funcional
  comparten una funcion del contexto en lugar de crear constantes distintas
  para cada indice. No se inventa una definicion ni una prueba de esa funcion.
- Sumas sobre conjuntos finitos explicitos, con uno o varios indices.
  sum_{a,b in {0,1}} se convierte en dos Finset.sum anidados sobre el mismo
  conjunto. No se supone independencia de las probabilidades.
- Conjuntos no consecutivos: {0,2} conserva esos dos elementos, no el intervalo.
- Todos los factores del producto pertenecen al cuerpo de la sumatoria.
- Dos expresiones compuestas al cuadrado seguidas son factores de un producto,
  no una llamada a funcion.
- Se conserva el ambito previo cuando una sumatoria liga un indice ya ligado.

## Resultado sobre el documento real

Se conservan las 220 formulas del 52. Las sumas de D_DISTRIBUCIONCONJUNTA y
D_CORRELACIONES pasan ahora el analisis de tipos. El bloque D_RELACIONES ya
no presenta el bloqueo por indice calculado. El diagnostico de la formula
D_OBJETIVORELACIONAL alcanza ahora el factor e_j, que antes quedaba fuera del
cuerpo de la suma: no se oculta la falta de representacion vectorial.

Desde la revision inmediatamente anterior, los diagnosticos semanticos pasan
de 30 a 24 y los bloqueos de emision de 15 a 12. El informe JSON distingue
la version original, la anterior a esta ampliacion y la actual.

Persisten conflictos de ambito, como D usado para un conjunto y para el
tamano del registro; matrices y operadores matriciales no representados;
sumas de varios indices sin dominio explicito; y vectores de base.
El traductor todavia no emite el 52 completo. Esto no es una refutacion del MD
ni autoriza a modificarlo para conseguir un certificado.

## Comprobaciones

- 44 pruebas automatizadas pasan, incluida la lectura de las dos sumas reales
  del 52 y la comparacion del codigo matematico generado para el 46.
- La sintaxis Python es correcta.
- Los MD del 46 y del 52 conservan sus hashes anteriores.
- Los ejemplos de sumas anidadas, signos, conjuntos no consecutivos e indices
  calculados fueron verificados por separado con el kernel de Lean, salida 0.
- Lean verifica asimismo, para cualquier funcion P, la expansion completa
  de la correlacion: P(0,0,x,y) - P(0,1,x,y) - P(1,0,x,y) + P(1,1,x,y).
  No se supone factorizacion de P ni independencia de sus argumentos.

No se ejecuta una nueva publicacion ni se sustituyen evaluaciones o certificados.
