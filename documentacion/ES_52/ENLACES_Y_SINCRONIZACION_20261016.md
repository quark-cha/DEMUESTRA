# -ES_52: Enlaces de documentos y sincronización local

Fecha: 16 de octubre de 2026.

## Petición recuperada

El principal evaluable debe enlazar todos los complementarios cuya primera
línea sea `# -ES_52:`. Cada complementario debe enlazar el principal y las
copias ES_ del proyecto deben quedar sincronizadas en UNIHOLOG. No se
modifican contenidos científicos, máquinas, evaluaciones ni GitHub.

## Resultado

- Se incorporó, con autorización expresa, el artículo recuperado
  `ES_52_Relaciones_medida_y_Bell.md`. Solo se adaptó el encabezado y se
  añadió la navegación. Su cuerpo coincide con el adjunto recuperado.
- Hay un principal y cinco complementarios no evaluables. Los diez enlaces
  recíprocos apuntan a PDF, no a las fuentes Markdown.
- MD y HTML conservan enlaces relativos. La base publicada declarada en
  `documentos_proyecto.json` se usa solo al imprimir los PDF para que Chromium
  genere enlaces pulsables. No se incorporan rutas del ordenador a los PDF.
- Los seis documentos tienen HTML y PDF regenerados. Se comprobaron los diez
  destinos mediante las anotaciones de los propios PDF, y se revisaron
  visualmente las primeras páginas del principal y del artículo nuevo.
- Se sincronizaron y verificaron 75 copias en UNIHOLOG, conservando respaldo
  de los archivos sustituidos mediante el gestor local existente.
- Se superaron 109 tests. Se añadieron pruebas de navegación incompleta,
  enlaces a Markdown en lugar de PDF, documentos sin catalogar, subcarpetas,
  respaldos y resolución de enlaces para impresión.

## Integridad y alcance

La extracción científica del principal, antes y después de añadir el enlace,
es idéntica. La modificación del principal se limita a su navegación inicial.
Se verificaron byte a byte 17 archivos de evaluaciones/JSON y 13 programas
respecto del respaldo: permanecen sin modificar. No se reejecutaron ni se
reemitieron las evaluaciones científicas. La huella del Markdown completo
cambia por su enlace nuevo; no se reescribe la huella de ningún informe para
aparentar una nueva evaluación. La próxima ejecución normal de publica.py
procesará la fuente actual conforme a sus comprobaciones habituales.

El artículo es no evaluable y no se generan para él Lean, Prolog ni JSON
de demostración. Su mención a otro modelo distingue propuestas; no incorpora
ese modelo al código de V.

Los enlaces externos de las citas del artículo se conservaron tal como
estaban en el texto recuperado. Esta tarea comprobó navegación local y PDF;
no reevaluó las afirmaciones científicas ni la disponibilidad de sitios externos.

El respaldo de partida está en `respaldos/enlaces_complementarios_20261016/`.
No se publicó en la web, no se ejecutó Git ni se modificó GitHub.
