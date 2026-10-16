# -ES_52: Continuación y consolidación exclusivamente local

Fecha: 15 de octubre de 2026.
Autor del proyecto: Víctor Estrada Díaz. Marco: Einstein-VED / UNIHOLOG.

## Especificación de trabajo

V es la máquina determinista del autor, construida con electrónica o
software convencional. Desconocer la salida no exige que la dinámica sea
aleatoria. La preparación configura conexiones y controles; no registra
los resultados internos no fijados por ella. La medida se desencadena una
sola vez en $t=t_0$ y registra los bits de esa ejecución.

V no es V_ref, ni el banco de amplitudes, ni el ensayo por caminos. Las
referencias Q usadas en los tests pertenecen al comprobador, no al núcleo
de V. No se introduce un registro de $2^n$ amplitudes ni una distribución
de salidas calculada para sustituir la máquina. Una fórmula de señales
complejas, por sí sola, tampoco implementa un registro conjunto de estados.

Esta especificación guía la construcción. Los resultados de un detector
de ensayo prueban el contrato de llamadas, no las operaciones físicas del
dispositivo. No se convierten en certificados de equivalencia con Q.

## Trabajo recuperado

- [Documento principal](../../Proyectos/ES_52/ES_52_Maquina_V_UNIHOLOG.md):
  se conserva sin cambios, incluidas las secciones que distinguen V de V_ref.
- [Controlador](../../comparacion/v_relacional.py): conexiones, preparación,
  lectura única, bloqueo de lectura previa y registro del instante de disparo.
- [V1](../../comparacion/v1.py): H, H, oráculo reversible recibido y H.
- [V2](../../comparacion/v2.py): controles, multiplicaciones modulares por
  potencias sucesivas y conexiones de Fourier inversa.
- [V3](../../comparacion/v3.py): preparación y operaciones del protocolo recibido.
- [Traductor](../../Proyectos/ES_52/Traductores_V/traductor_qasm_v.py):
  planes OpenQASM 2 a Python, Prolog y C++, sin calcular respuestas.
- El extractor JSON ya no recorta las pruebas a ocho pasos. El documento
  extraído tiene 35 nodos. El informe ADEC aportado en la conversación
  registró 131 pasos y ninguna incidencia lógica, pero dejó operaciones
  matemáticas pendientes de verificación automática.
- Las vías Prolog existentes informan alcanzabilidad del grafo y derivación
  interna desde premisas declaradas, respectivamente. La vía directa registra
  31/31 nodos estructurales y cero refutaciones; se conserva ese alcance.

## Consolidación realizada

Se completó el paquete portátil con copias exactas de los módulos existentes
`v1.py`, `v2.py`, `v3.py`, `protocolo_q3.py` y `ejecucion_v.py`. La dependencia
que impedía construir V3 al separar la carpeta queda incluida. No se inventan
otras puertas ni se cambia el comportamiento de las tres máquinas.

`protocolo_q3.py` puede seleccionar un diseño con una semilla fija. Esa
selección del circuito no es la dinámica de V ni un sorteo de su resultado.

El lanzador ya no carga Qiskit al listar, comprobar Python o ejecutar una
realización Python conectada. Qiskit solo se requiere al analizar OpenQASM;
si falta, se indica cómo instalarlo usando el mismo intérprete. No se usa
como simulador dentro de V.

Se añaden tests aislados sin paquetes externos que comprueban los tres
controladores, el disparo único y la ausencia de importaciones de Qiskit o
del ensayo por caminos en esa ejecución. Los detectores son fixtures de
prueba explícitos, no una realización nueva de H, fase o Fourier.

El lanzador anterior se conserva en
[respaldos/consolidacion_local_20261015/gestor_v.py](respaldos/consolidacion_local_20261015/gestor_v.py).
No se modificaron el MD principal, las láminas, los PDF, los JSON evaluados
ni los informes anteriores. No se ejecutó `publica.py`, Git ni GitHub.

## Pendiente concreto

1. Conectar una realización de la dinámica conjunta de V con
   `preparar(plan)` y `disparar(t0)`, sin sustituirla por V_ref, amplitudes,
   recorrido de caminos o respuestas del comprobador. Actualmente la
   interfaz funciona; sin esa conexión no produce resultados de las
   tareas completas de V1, V2 o V3.
2. Verificar esas tareas completas con las mismas condiciones operacionales
   declaradas para Q y V. Los tiempos de una referencia Q simulada y los
   de un disparo V no representan por sí solos el mismo trabajo.
3. Resolver en el traductor Lean el modelo tipado de probabilidad condicionada
   (`D_CORRELACIONES`, `D_CONDICIONREFERENCIA`, `P_LECTURAUNIFORME`,
   `T_SECUENCIACOND`), los índices de sumatoria (`D_REGISTROREF`) y el
   tipo esperado por `R` (`D_SIMETRIA`). El diagnóstico actual es un límite
   del traductor, no una refutación del MD.
4. No atribuir vigencia actual al informe temporal anterior: su huella del
   MD difiere de la actual. El informe local nuevo registra este hecho sin
   modificarlo ni trasladar sus resultados a otra fuente.

El siguiente avance de construcción es el punto 1, no repetir la definición
de desconocimiento ni volver a ensayar el modelo retirado como si fuera V.

## Repetir la comprobación local

Desde la carpeta DEMUESTRA:

```powershell
python comparacion/verificar_continuacion_local.py
```

Para guardar un informe nuevo, sin sobrescribir otros:

```powershell
python comparacion/verificar_continuacion_local.py --informe documentacion/ES_52/mi_comprobacion_local.json
```

El comando ejecuta tests, comprueba que las copias del paquete coincidan,
registra las huellas de los informes existentes y verifica que el MD principal
no cambie durante la comprobación. No publica, no usa Git ni certifica un
teorema. Una huella ausente se informa como desconocida, no como coincidencia.

Resultado de esta continuación:
[CONSOLIDACION_LOCAL_20261015_verificada.json](CONSOLIDACION_LOCAL_20261015_verificada.json).
Se descubrieron 72 tests: 58 activos superados, 14 del ensayo retirado
omitidos, cero fallos y cero errores. Las ocho copias compartidas coinciden
y el MD principal conserva su huella original. Se comprobó también que el
verificador rechaza sobrescribir un informe existente.

Los nuevos módulos se incluyen localmente. El catálogo de publicación y los
derivados editoriales anteriores no se regeneran ni se suben en esta sesión.

## Licencia

Texto: CC BY-NC-SA 4.0. Código: HL3. Se mantiene la declaración ética del
autor: no usos bélicos, discriminatorios ni otros usos dañinos, y no uso
lucrativo sin permiso, conforme a la licencia declarada en el proyecto.
