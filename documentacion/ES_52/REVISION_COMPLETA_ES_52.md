# Revision de ES_52

## Resultado actual

El documento conserva sus 34 secciones numeradas y sus 35 marcadores.
Los 220 fragmentos matematicos de esta version pasan el analisis lexico
y sintactico. La auditoria de cobertura Markdown a grafo pasa sin perder
fragmentos. Estas comprobaciones no son una prueba de equivalencia fisica.

Los 13 bloqueos son fallos de traduccion y tipado del sistema PUBLICAR
al intentar generar Lean a partir del MD. No son errores de sintaxis
Markdown ni errores cientificos demostrados del documento. El sistema
no ha obtenido una traduccion formal fiel para esas expresiones; por
ello no puede emitirlas ni certificarlas. Estos diagnosticos no prueban
que las formulas sean falsas y no refutan la hipotesis V=Q.

La generacion Lean NO esta completada. Hay 13 bloqueos de traduccion en la emision,
frente a los 19 de la revision previa. La comprobacion semantica adicional
de todos los fragmentos registra 27 incidencias de traduccion y tipado,
incluidas expresiones auxiliares. Esta comprobacion examina los tipos
inferidos por el traductor; no constituye un juicio de validez cientifica.
Los detalles y sus formulas exactas constan en
validacion_marcadores_ES_52.json. No se han silenciado ni certificado.

Pasar la sintaxis no demuestra por si solo la equivalencia V=Q.
La validacion cientifica y fisica queda separada de estos fallos de traduccion.

## Publicacion Independiente

publica.py separa ahora el fallo Lean de la preparacion editorial. Si
PUBLICAR lanza LeanCompilationError, vuelve a preparar HTML, PDF, DOCX
y JSON sin exigir Lean ni Prolog para publicar el documento. El proyecto
permanece en la lista de subida web y se publica un informe independiente
TRADUCCION_<proyecto>.json con el hash de fuente, el diagnostico tecnico,
veredicto cientifico NO_EMITIDO y certificacion formal PENDIENTE.

No se evalua un Lean anterior como prueba de esta ejecucion fallida, no
se emite certificado ni se marca el proyecto como completado por ese fallo.
Se conservan los certificados y evaluaciones previos como historicos.
Los errores editoriales y los cambios de fuente durante la generacion
siguen impidiendo publicar una preparacion fallida. El camino correcto
del 46 permanece sin cambios. Las pruebas aisladas de seleccion por hash,
recuperacion editorial y seleccion para publicacion pasan. No se realiza
ninguna subida real durante estas pruebas.

La decision de cierre y de preparacion del JSON no certificado se toma
ahora individualmente por proyecto. Un fallo de otro proyecto no cambia
el JSON de un proyecto que ha aprobado ni impide devolver sus fuentes
verificadas tras la subida. No hay condiciones especiales por numero
de proyecto. Se añaden seis pruebas aisladas del flujo de publicacion en
tests/test_publicacion_aislada.py dentro de DEMUESTRA: todas pasan sobre
el publica.py instalado, sin conexion real a FTP. La generacion Lean y
las auditorias internas del 46 vuelven a pasar con su fuente intacta;
no se ha ejecutado Lean externo. Los bloqueos de traduccion del 52
siguen pendientes; estas pruebas no declaran resuelta su formalizacion.

## Subida Real Verificada

El 7 de octubre de 2026 se realiza la subida autorizada a
https://estradad.es/teorias/pdf/DEMUESTRA/proyectos/.
La primera ejecucion detecta una exigencia residual de archivos Lean y
Prolog no generados. Se corrige la preparacion para omitir esos artefactos
cuando falla el traductor, sin reutilizar archivos antiguos como prueba.
La preparacion normal sigue exigiendo sus artefactos formales.

La segunda ejecucion termina con codigo 0. ES_46_RV6 se omite de la
reevaluacion por hash coincidente y sincroniza sus 28 archivos existentes.
ES_52 publica su MD, PDF, JSON extraido, informe de traduccion e indice.
Tambien se sincronizan el indice general y los documentos de la raiz.
No se registra ningun borrado remoto. Se comprueban por descarga HTTP
y SHA-256 los MD y PDF de ambos proyectos y el informe TRADUCCION del 52:
los cinco archivos coinciden exactamente con las copias locales.
La publicacion no se presenta como certificacion formal ni como refutacion.
Se añaden dos pruebas de preparacion de artefactos, sin subir archivos.

## Prueba De Forzado

El 7 de octubre de 2026 se conecta la seleccion forzada individual de
publica.py con Md.forzado, y Md.html respeta ese atributo. No se activa
Publicar.FORZADO de forma global. Se ejecuta localmente publica.py con
--forzar-proyecto ES_52 y la subida web desactivada. La ejecucion termina
con codigo 0: el 46 se omite por hash vigente y el 52 regenera sus
formatos editoriales. Su fallo de traduccion Lean sigue declarado como
error de herramienta, sin emitir veredicto cientifico ni certificado.

El argumento forzado solo existe durante esa ejecucion; no se guarda en
configuracion. Se restauran las opciones temporales del proceso. Los MD
del 46 y del 52 conservan exactamente sus hashes anteriores. Diez pruebas
del flujo pasan, incluidas seleccion de un proyecto completado forzado,
seleccion por nombre de carpeta y retorno a la omision normal al retirar
el forzado. No se ha realizado una nueva subida durante esta prueba.

## Sintaxis De Ejecucion

- python publica.py: seleccion normal por hash y estado de procesamiento.
- python publica.py forzado=46: fuerza el proyecto de numero 46; los demas
  conservan su seleccion normal y se procesan si estan pendientes.
- python publica.py forzado=todos: fuerza todos los proyectos y documentos
  editoriales de la raiz, sin omitirlos por la cache.

El numero se compara completo, no como prefijo. No se codifican numeros
concretos en el selector. Tambien se admiten nombres y listas de seleccion,
y se conserva --forzar-proyecto. El forzado solo dura esa ejecucion; no se
guarda como configuracion. Doce pruebas pasan sobre el publica.py real.
Se comprueba la seleccion real del 46 y del 52 en memoria y el retorno al
modo normal, sin realizar nuevas evaluaciones ni subidas.

## Registro Del 8 De Octubre

El registro aportado por el usuario termina con subida correcta de ES_46_RV6
y ES_52 y Proceso completado. El 46 compila Lean y conserva 17 nodos con
certificacion parcial; el objetivo global sigue no determinado, sin
refutacion formal. El 52 se publica con su informe de fallo del traductor.

Un intento anterior se detuvo con WinError 5 al rotar el directorio anterior.
Se corrige guardar_evaluacion_anterior en DEMUESTRA: nombres temporales
unicos, cinco intentos ante PermissionError, recuperacion del directorio
anterior cuando falla la promocion de la copia nueva y conservacion de
ambas copias si falla la recuperacion. No se borran los temporales legados
de ejecuciones interrumpidas. Si el bloqueo persiste se detiene esa
ejecucion con un diagnostico de respaldo, no con un veredicto sobre el MD.
Un fallo de limpieza del respaldo sustituido no cancela la copia completada.

Pasan 17 pruebas locales, incluidas cinco de respaldo con fallos simulados.
No se modifican documentos cientificos, certificados ni evaluaciones del
46 o del 52 y no se ejecutan nuevas evaluaciones ni subidas en esta revision.

## Correcciones

- Las nueve potencias trigonometricas se escriben como cos(x)^2 o sin(x)^2.
- Se distingue la marca de resultado no observado xi del estado fisico.
- Se indica pertenencia del resultado a {0,1}, no una disyuncion entre numeros.
- La puerta NOT binaria se expresa como B = 1 - A, con dominio {0,1}.
- El conocimiento K se escribe como funcion, sin corchetes ambiguos.
- Se distingue la potencia de normalizacion del numero de ensayos.
- Se separan la configuracion del protocolo y los controles de las salidas.
- Se explicitan productos en las identidades de partes real e imaginaria.
- Se conserva el control de fase phi y los instantes t0 y t1.
- La equivalencia de evoluciones requiere generadores iguales en todo el
  intervalo y condiciones de unicidad, no igualdad en un solo instante.
- La comparacion de distribuciones requiere correspondencia de etiquetas.

Se corrige en formal_ast.py la interpretacion de potencias trigonometricas
y se conserva la correccion previa de recursion infinita de derivadas.
Quince pruebas de regresion pasan. Los archivos pasan la validacion de sintaxis
Python. La generacion Lean de ES_46 pasa sus auditorias internas con la
correccion; no se ha ejecutado su compilacion externa ni emitido certificados.

En esta ultima revision no se modifica el MD. Las copias en outputs,
DEMUESTRA y UNIHOLOG tienen el mismo SHA-256:
569C3A48464D4F094763739ED0F0B3C18EDE1DBFE19642C489F8273A9A7D9F51.
Se corrigen en el lector las listas separadas por comas, los nombres
decorados de funciones y el modulo complejo. El modulo devuelve un real
y se emite como norm en Lean, conservando abs para escalares reales.
Se comprueba el mismo tratamiento con nombres V y Q y con alcance local.
Estos cambios no prueban ni refutan la equivalencia fisica.

## Comprobaciones numericas repetidas

- 103 evoluciones: error maximo 8.49e-12; norma, 7.32e-14.
- Bloques X, H, H-H, ocho tramos de control y 101 casos ZZ: pasan.
- 50 protocolos adaptativos de cuatro medidas: error maximo 5.55e-16.
- 20 protocolos conjuntos de dos y tres unidades: error 1.67e-16.
- 512 casos de CNOT, CZ, SWAP e iSWAP: error 5.55e-16.
- Lecturas conjuntas y sucesivas, fases, composicion y canal Kraus: pasan.

Son pruebas del modelo ideal especificado y del registro auxiliar. No son
experimentos sobre una maquina V construida ni sobre hardware Q remoto.

## Completitud y cuestiones pendientes

El desarrollo contiene premisas comunes, estados y amplitudes, evolucion,
lectura candidata, actualizacion, protocolos sucesivos, correlaciones,
conexion, composicion, limitaciones de localidad y propuesta de contraste.
No se han encontrado huecos en la numeracion de secciones.

Eso no basta para declarar completa la demostracion universal V=Q.
Faltan la especificacion y caracterizacion del circuito fisico propuesto,
la justificacion experimental de la referencia de lectura, la conexion
de la arquitectura relacional del autor y las pruebas fisicas de contraste.
La realizacion compacta no se identifica con el registro auxiliar exponencial.

Para Lean faltan una traduccion tipada fiel de vectores, operadores e indices,
dominios de sumatoria, simbolos con alcance local y demostraciones formales
de las afirmaciones correspondientes. El backend actual usa inferencias
escalares que no representan automaticamente toda esta notacion.
No es valido resolverlo suponiendo conclusiones, descartando formulas,
declarando axiomas para obtener certificados o tratando matrices como numeros.

No se ha ejecutado PUBLICAR completo, publicado en servicios externos ni
modificado certificados o evaluaciones existentes durante esta revision.
