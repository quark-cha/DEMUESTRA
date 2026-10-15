# Reparacion del traductor: estado comprobado

Este informe describe la revision anterior a la ampliacion de indices y sumas.
El estado posterior figura en AMPLIACION_INDICES_Y_SUMAS_20261008.md.

## Cambios en la herramienta

- Re e Im, incluidos sus nombres LaTeX operatorname, se interpretan como
  operaciones y se emiten mediante Complex.re y Complex.im, no como productos
  de identificadores ni funciones arbitrarias del contexto.
- Se conserva el indice del argumento y se distingue Re(z)^2 de Re(z^2).
- Las sumas finitas con limites naturales conservan ambos limites mediante
  Finset.sum y Finset.Icc. No se convierten en sumas infinitas.
- El contrato preexistente de las sumas infinitas no se cambia en esta revision.
- Im no introduce un campo artificial adicional en el contexto del backend.

## Verificacion y preservacion

Los ejemplos emitidos para Re, Im y las sumas de 1 a 2 y de 1 a 3 fueron
comprobados por el kernel de Lean mediante lake env lean, con salida 0.
Las pruebas comparan tambien el codigo Lean del 46 con el anterior a esta
revision, excluyendo solo comentarios (que incluyen la fecha de generacion).
No se cambia el Markdown cientifico ni se sustituyen certificados o evaluaciones.
Los originales del traductor quedan conservados en respaldos/traductor_operadores_20261008_010343_855.

## Limites pendientes: no es una reparacion completa

DIAGNOSTICO_TRADUCTOR_OPERADORES.json registra el analisis de las 220 formulas
del 52. La emision completa sigue bloqueada por limitaciones del traductor.
El analisis anterior daba 27 diagnosticos semanticos y 13 bloqueos de emision;
el actual da 30 y 15, respectivamente. No se oculta este resultado ni se
interpreta como una refutacion del documento.

Interpretar correctamente Re e Im hace que la inferencia global imponga tipos
complejos a simbolos compartidos. El traductor no distingue adecuadamente los
ambitos en los que F, por ejemplo, representa frecuencias o una representacion
vectorial. Tampoco modela de forma completa matrices, operaciones matriciales,
indices calculados y sumas con varios indices. Por eso persisten diagnosticos
de tipos que esta herramienta no permite atribuir al documento cientifico.

La correccion necesaria es general: separar los ambitos de declaraciones y
representar explicitamente los tipos estructurados y los indices ligados.
No es valido eliminar formulas, convertir matrices en escalares arbitrarios,
introducir axiomas para conseguir certificados ni modificar las premisas.

Esta revision no ejecuta una nueva publicacion ni emite un nuevo certificado.
