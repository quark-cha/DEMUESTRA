# Registro de desarrollo y obligaciones de ES_52

Este registro acompaña el artículo revisado. Separa el texto original del
autor, las construcciones candidatas añadidas y la evidencia disponible.
No es un certificado científico ni sustituye una evaluación experimental.

## Objetivo del autor

Construir una máquina física V con electrónica convencional, que transforme
relaciones sin observar sus valores internos durante el cálculo y reproduzca
el comportamiento operacional de Q. La equivalencia completa y una posible
arquitectura compacta son objetivos que deben justificarse por separado.

El autor comunica resultados positivos. No se han recibido registros de un
prototipo, datos experimentales ni un esquema electrónico completo en esta
conversación. Las comprobaciones numéricas añadidas no son esos resultados
experimentales ni acreditan por sí mismas la realización física de V.

## Premisas que no deben perderse

- Mismo protocolo, restricciones e información permitida para Q y V.
- Realizaciones físicas distintas permitidas; recursos y condiciones declarados.
- Ninguna observación interna adicional exigida a V.
- `?` indica desconocimiento; no es un tercer valor almacenado.
- Distinguir probabilidades previas de resultados registrados.
- Probabilidades en [0,1], incluidos certeza e imposibilidad.
- Declarar reglas de medida y actualización en ambas máquinas.
- Comparar distribuciones conjuntas e historiales, no solo salidas aisladas.
- No introducir la igualdad de distribuciones como una premisa de su propia prueba.
- Declarar hipótesis de preparación, independencia, comunicación y precisión.

## Inventario de resultados

| Tema | Desarrollo | Estado |
| --- | --- | --- |
| Definición de amplitudes Q y señales V | Sección 11.1 | Definiciones independientes; la interpretación probabilística V requiere su regla de lectura |
| Ley temporal de amplitudes | Sección 11.2 | Ecuaciones reales candidatas V y ley Q expuestas; igualdad condicional demostrada por unicidad |
| Solución de dos canales | Sección 11.3 | Solución explícita general para detuning, acoplamiento y fase constantes |
| Interacción antes de medir | Sección 11.4 | Solución conjunta ZZ y condición de correspondencia del generador total |
| Mezclas y pérdidas | Sección 11.5 | Distinción entre amplitudes coherentes, estados mixtos y errores físicos |
| Dos caminos y fase | Secciones 12 y 12.1 | Identidades algebraicas derivadas |
| Intensidad frente a probabilidad | Secciones 12.1 y 12.2 | Conexión condicionada a una regla física de lectura |
| Comparador y referencia temporal | Sección 12.2 | Construcción candidata con uniformidad e independencia pendientes de validación física |
| Operaciones de una unidad | Sección 12.3 | Transformación real especificada para cada matriz unitaria |
| Medidas sucesivas | Sección 12.3 | Teorema condicional para una unidad aislada ideal |
| Correlaciones y CHSH | Sección 18.1 | Cota local derivada y condiciones de separación explicitadas |
| Registro conjunto | Sección 20.1 | Modelo auxiliar exponencial, no arquitectura compacta del autor |
| Medida parcial | Sección 20.1 | Proyección y normalización de todo el registro, conservando el subespacio |
| Instrumentos generales y ruido | Sección 20.1 | Extensión matemática condicional mediante ramas Kraus |
| Preparaciones mixtas | Sección 20.1 | Representación estadística; realización física por especificar |
| Adaptación a resultados anteriores | Secciones 12.3 y 20.1 | Mismos controles visibles; sin acceso extra a ramas internas |
| Conexión sin medida previa | Sección 20.2 | Producto de señales y conexiones conjuntas especificados en el registro auxiliar |
| Cierre tras una conexión | Sección 20.2 | CNOT puede generar un estado que no factoriza en dos unidades puras independientes |
| Composición general | Sección 20.2 | Identidad algebraica R(UW) = R(U)R(W); lectura y actualización compatibles en el modelo auxiliar |
| Arquitectura sin tabla de amplitudes | Secciones 20.1 y 23 | Pendiente: representación relacional y reglas de composición |

## Comprobaciones realizadas

- 103 evoluciones: solución compleja contrastada con integración de las
  cuatro ecuaciones reales V. Error máximo aproximado 8.49 × 10⁻¹² y
  error máximo de conservación de norma 7.32 × 10⁻¹⁴.
- Bloques X, H y H-H, ocho tramos de control y evolución conjunta ZZ
  en 101 valores; coincidencia con las fórmulas derivadas.
- Identidades de fase contrastadas numéricamente en 1001 valores.
- Comparador ideal contrastado en 101 umbrales, incluidos los extremos.
- 50 protocolos adaptativos de cuatro medidas de una unidad: concordancia
  numérica entre la actualización Q y la realimentación V ideal.
- 20 protocolos de dos y tres unidades con estados mixtos y tres medidas
  parciales adaptativas: comparación de operadores de densidad Q con
  trayectorias de señales reales del modelo auxiliar.
- Preparación de Bell, medida parcial, cota CHSH local y valor Q de referencia.
- Canal de amortiguamiento de amplitud: comparación entre canal de densidad
  y mezcla de ramas normalizadas.
- 512 casos de conexión CNOT, CZ, SWAP e iSWAP; lectura conjunta y sucesiva
  en ambos órdenes, entradas producto y conjuntas y bases complejas.
- Composición de matrices en dimensiones complejas 2, 4 y 8; fórmula
  angular de Bell en 16 configuraciones y conservación de fases relativas.

El error numérico máximo de las comprobaciones específicas de conexión
fue aproximadamente 5.55 × 10⁻¹⁶. La comparación utiliza bloques ideales
definidos sobre señales reales; no un prototipo físico del autor.

Las cifras de estas pruebas describen ejemplos computados. Los argumentos
matemáticos del artículo proporcionan el alcance general condicionado a
sus hipótesis; las pruebas numéricas no los sustituyen.

## Cuestiones necesarias para completar la propuesta física

1. Definir el modelo Q de referencia y el alcance exacto de equivalencia.
2. Aportar el circuito V: componentes, señales, parámetros, tiempos y conexiones.
3. Justificar preparaciones y referencias de lectura, incluidas sus correlaciones.
4. Implementar y caracterizar cada operación y su composición.
5. Verificar la actualización tras medidas completas, parciales y generales.
6. Construir las relaciones conjuntas de varias unidades y conservar fases relevantes.
7. Determinar si la arquitectura usa una representación exponencial o una alternativa.
8. Contabilizar canales, energía, precisión, ancho de banda, tiempo y control.
9. Distinguir entradas clásicas preparadas de estados cuánticos externos desconocidos.
10. Declarar la topología: circuito central o estaciones separadas sin comunicación.
11. Aplicar CHSH cuando formen parte del protocolo sus restricciones de separación.
12. Definir tolerancias, pérdidas, detecciones inválidas y política de selección de datos.
13. Aportar datos con repetición, calibraciones e incertidumbres estadísticas.
14. Comparar Q ideal con V ideal y Q real con V real sin cambiar el criterio entre ellas.
15. Separar equivalencia operacional, mecanismo físico, novedad y ventaja de recursos.

## Límite encontrado

Un modelo V local factorizable, con elecciones independientes y sin
comunicación durante las medidas, no reproduce las correlaciones Q que
violan CHSH. Un muestreador central no resuelve ese protocolo distribuido.
No haber observado las variables internas no evita la cota local.

## Punto abierto principal

La construcción auxiliar V_ref establece una correspondencia matemática
condicional utilizando un registro de amplitudes exponencial. No demuestra
la arquitectura relacional compacta ni la sustitución de cualquier máquina
Q física. Esas conclusiones no deben aparecer como resultados obtenidos.

La siguiente aportación decisiva es una representación relacional concreta
con reglas físicas para operaciones conjuntas, lectura y actualización,
o un prototipo con protocolos y datos que permitan acotar su equivalencia.

## Respuesta comprobada sobre la conexión

La entrada no medida admite conexión en el modelo auxiliar ideal. La
compatibilidad se ha probado mediante la transformación de señales y
la conservación de todas las probabilidades y actualizaciones del
registro representado. Una conexión que entrelaza no deja, en general,
dos unidades describibles como estados puros independientes.

La prueba es completa para las reglas matemáticas especificadas del
registro auxiliar y su interfaz de preparación clásica. No lo es para
una arquitectura física relacional sin especificación de su conexión.
La palabra «completa» debe llevar siempre ese alcance explícito.

## Auditoría de simetría

La sección 20.3 precisa que el criterio parte de un protocolo común
independiente de Q y V. No se exige a V almacenar amplitudes ni realizar
las matrices Q como condición de admisión; esas reglas pertenecen al
ejemplo auxiliar V_ref. Tampoco se exige a Q usar las estructuras de V.

Ambas realizaciones deben declarar preparaciones, controles, conexiones,
lecturas, recursos y evidencia. Se comparan distribuciones observables
con el mismo criterio. Conocer el comportamiento aislado no caracteriza
por sí solo las redes, ni para Q ni para V.

El argumento de composición es condicional y no constituye una prueba
de la conexión física. Las comprobaciones del banco de amplitudes validan
la codificación matemática elegida, no la arquitectura relacional original.

## Consistencia del desarrollo de amplitudes

No se ha supuesto que las amplitudes de V y Q evolucionen de forma
diferente. Se han expuesto las leyes de ambos modelos y comparado sus
soluciones. Bajo preparación y generadores correspondientes, la igualdad
se demuestra; no hay una diferencia matemática en ese caso.

Los coeficientes de la ley V son una especificación propuesta de circuito,
no parámetros medidos de una máquina del autor. La comprobación física
pendiente es determinar si su realización satisface esa ley o una ley
alternativa que reproduzca los protocolos observables. La ausencia de
esa caracterización no se registra como una incompatibilidad.

Al conectar unidades, una fase global de una operación aislada puede
pasar a ser relativa si se controla esa operación. Se debe comprobar
el generador y la operación conjuntos; no eliminar fases antes de hacer
la composición controlada.

## Invitación a la colaboración experimental

Se declara que todas las comprobaciones numéricas realizadas han pasado
sus criterios de verificación y que las derivaciones de equivalencia
son consistentes bajo las hipótesis explícitas de los modelos ideales.
La afirmación no se extiende a experimentos físicos no realizados,
a una equivalencia universal ni a protocolos fuera del alcance declarado.
Se conserva expresamente el límite CHSH de las realizaciones locales.

El artículo incluye una invitación del autor, como investigador independiente
con medios modestos, a personas con acceso a procesadores cuánticos reales.
No se afirma haber solicitado acceso ni haber recibido una denegación.
La invitación contempla coincidencias y discrepancias, datos reproducibles
y las mismas premisas operacionales para Q y V.

Se distingue una implementación Python del modelo V, un circuito V físico
controlado por Python y la ejecución Q en hardware real. No se ha creado
todavía ese programa de contraste ni ejecutado un experimento remoto.
La posibilidad de obtener colaboraciones futuras se presenta como una
expectativa condicionada a los resultados, no como evidencia de equivalencia.

## Marcadores formales para PUBLICAR

Se han incorporado 35 declaraciones con la sintaxis D_/A_/P_/T_ utilizada
en ES_46: 24 definiciones, una ley de referencia, siete proposiciones y
tres teoremas condicionales. Las declaraciones incluyen dependencias
explícitas y mantienen la hipótesis física universal como cuestión abierta.

La comprobación utiliza el lector real de PackPublica instalado en DEMUESTRA.
Reconoce los 35 nodos, sus identificadores y sus dependencias, sin ciclos.
El informe se conserva en validacion_marcadores_ES_52.json.

La compilación de fórmulas no se ha completado: el primer error léxico
aparece en D_HIPOTESISV al encontrar el símbolo ? en la fórmula que define
valor desconocido. Se conserva el texto científico; no se sustituye una
hipótesis ni se elimina notación para obtener una certificación. Esta
comprobación de estructura no acredita compilación Lean ni equivalencia
física de V y Q. Pueden existir otros errores de fórmulas tras el primero.

## Actualización de la notación común de lectura

Se sustituye la antigua marca ? por xi (\xi) para el resultado aún no
observado, con idéntico significado en Q y V. Se define desde el principio
K[A] = xi como notación de conocimiento, no como valor físico de A.
La lectura especificada en t=t0 registra 0 o 1; la marca no fija una
distribución ni demuestra equivalencia. Psi sigue describiendo estados
cuando el modelo la emplea. La fase global usa gamma para evitar colisiones.

Las interrogaciones de igualdad se expresan como pares de predicciones
a contrastar, sin presuponer que las dos cantidades son iguales.
La comprobación actual reconoce los mismos 35 marcadores y dependencias.
El error anterior por ? ya no aparece; la compilación completa sigue
pendiente por la sintaxis de la cadena de transformaciones de D_RELACIONES.
El informe actualizado conserva el diagnóstico real. No se ha ejecutado
PUBLICAR completo ni se afirma certificación Lean del documento.

## Corrección de errores de lectura y revisión completa

Se comprueban todos los fragmentos matemáticos, no solo el primero que
falla. La versión actual contiene 223 fragmentos y 35 nodos: no quedan
errores léxicos ni sintácticos, las dependencias son válidas y la auditoría
de cobertura Markdown a grafo pasa. Se mantienen las hipótesis y los
resultados condicionales; no se atribuye certificación física universal.

Matrices y columnas usan mat y col con significado definido al inicio.
Las normas, los vectores de estado y la notación condicionada tienen
convenciones explícitas. Se corrige la selección de las conclusiones
de interferencia, solución de dos canales, CHSH, cierre y composición:
el lector ya no escoge premisas o definiciones auxiliares como resultados.

Se corrige además un fallo de formal_ast.py: una derivada que no se puede
expandir devolvía su propia expresión y ocasionaba recursión infinita.
Ahora permanece atómica. Cinco pruebas de regresión pasan y la sintaxis
Python de la corrección se valida.

La generación Lean completa NO está resuelta: después de esas correcciones
el analizador semántico informa 42 errores de tipos. Incluyen notación
descriptiva interpretada como proposiciones, tratamiento escalar de
expresiones vectoriales, sumatorias con varios índices y símbolos sin
declaración formal. El diagnóstico exacto se conserva en el campo
lean_emission_error de validacion_marcadores_ES_52.json.

No se silencian errores, no se eliminan fórmulas para superar la auditoría
y no se introducen axiomas o pruebas ficticias. Resolver la emisión Lean
requiere desarrollar la representación tipada de estas expresiones y
las demostraciones formales correspondientes, no solo cambiar símbolos.

## Revisión integral posterior

La revisión actual se resume en REVISION_COMPLETA_ES_52.md. Se mantienen
las 34 secciones y 35 marcadores. Los 220 fragmentos de esta versión
pasan la sintaxis y la cobertura. Las potencias se escriben como cos(x)^2
y sin(x)^2; se precisan salida binaria, NOT, notación de conocimiento,
normalización, instantes y condiciones de unicidad de la evolución.

Las cuatro baterías numéricas se repiten con resultado satisfactorio.
La corrección del lector pasa quince pruebas y una prueba de generación
del ES_46 sin modificar su fuente. No se ejecuta Lean externo.

El número actual de bloqueos de emisión es 13. La auditoría semántica
adicional de todos los fragmentos registra 27 incidencias; ambas listas
y sus fórmulas se conservan en el informe actualizado. La generación
Lean y la demostración física universal siguen pendientes. Los conteos
anteriores corresponden a versiones históricas, no al estado actual.

En la última revisión no se cambia el MD ni las premisas del autor.
Se corrigen listas, funciones decoradas y módulo complejo en el lector.
Las incidencias de traducción pendientes no constituyen refutaciones.
