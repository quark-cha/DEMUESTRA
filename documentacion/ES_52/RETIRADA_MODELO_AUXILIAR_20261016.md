# -ES_52: Retirada del modelo auxiliar y sincronización local

Fecha: 16 de octubre de 2026.

Por indicación del autor se retira V_ref del documento activo: no es su
máquina V y añadía una representación conjunta de amplitudes de tamaño
$2^n$ que no forma parte de su diseño.

Se retiran las secciones del registro auxiliar, sus conexiones y composición,
y los ensayos anteriores que ejecutaban ese registro. También se retira el
bloque conjunto de amplitudes que lo sustentaba. No se renombra ese modelo
como V ni se trasladan sus resultados a la máquina del autor.

Se mantienen las relaciones, los desarrollos de una unidad y la especificación
de V como máquina determinista convencional. La sección 20.2 describe los
planes actuales de V1, V2 y V3 y el contrato de disparo único. No añade una
realización de puertas que no esté implementada.

El documento pasa de 35 a 30 nodos. Se retiran D_GENERADORCONJUNTO,
D_REGISTROREF, D_CONEXIONREF, P_CIERRECONJUNTO y T_COMPOSICIONCOND.
Las dependencias del contenido conservado se ajustan sin dejar enlaces
a esos nodos. Ambas vías Prolog se vuelven a ejecutar sobre los archivos
actuales: la directa registra 26/26 nodos estructurales y cero refutaciones.
Ese recuento no se presenta como una certificación física de V.

Lean continúa pendiente por limitaciones del traductor: probabilidades
condicionadas y un tipo de matriz en D_PROTOCOLOFASE. No se alteran las
fórmulas para ocultar esas limitaciones.

Se regeneran los cinco documentos editoriales y el informe PDF de Prolog
directo. El catálogo incorpora los JSON actuales y los módulos portátiles
de las tres máquinas. Se sincroniza localmente con UNIHOLOG mediante el
gestor existente, que conserva respaldo de cada archivo sustituido.

La copia completa anterior de ES_52 está en
`respaldos/retirada_vref_20261016/`. Es un respaldo, no parte del catálogo
activo ni evidencia de la ejecución actual.

No se modifica Git, GitHub ni la web. La publicación la realiza el autor.

## Verificación final

- 101 tests del gestor superados.
- 58 tests activos de las máquinas superados; 14 del ensayo retirado omitidos.
- Catálogo local validado: 60 materiales y 70 copias verificadas en UNIHOLOG.
- MD, PDF, JSON extraído y evaluaciones actuales idénticos en ambas ubicaciones.
- Ficha PHP comprobada: muestra 26/26, no el antiguo 31/31.
- Texto de los PDF principal, índice, traductores e informe Prolog comprobado
  sin referencias al modelo retirado. Páginas seleccionadas revisadas visualmente.
