# Revision de ES_52

## Resultado actual

El documento conserva sus 34 secciones numeradas y sus 35 marcadores.
Los 220 fragmentos matematicos de esta version pasan el analisis lexico
y sintactico. La auditoria de cobertura Markdown a grafo pasa sin perder
fragmentos. Estas comprobaciones no son una prueba de equivalencia fisica.

La generacion Lean NO esta completada. Hay 13 bloqueos en la emision,
frente a los 19 de la revision previa. La comprobacion semantica adicional
de todos los fragmentos registra 27 incidencias, incluidas expresiones auxiliares.
Los detalles y sus formulas exactas constan en
validacion_marcadores_ES_52.json. No se han silenciado ni certificado.

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
