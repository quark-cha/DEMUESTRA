# Revision de la formalizacion del documento 46

El Markdown recoge las aclaraciones autorizadas sobre cierre, distancia al
entero mas proximo y positividad de L y lambda. Este informe distingue contenido de
origen, traduccion y prueba verificable. Un pendiente del generador no es una
refutacion del documento ni una prueba de que falte contenido en el Markdown.

## Correcciones implementadas

- Se conserva la prosa completa de cada nodo en una traza del archivo generado.
- Cada nodo pendiente identifica origen, enunciado, dependencias, partes aun
  pendientes y teoremas parciales emitidos. No se sustituyen por axiomas.
- Se demuestra el criterio de cierre entero desde la distancia a los enteros
  positivos y la definicion de estabilidad del documento.
- Se demuestra la consecuencia de que un cierre no entero no es estable.
- Se genera la prueba de P_VED_I por su definicion explicita.
- Lean verifica P_VED_E completo: rho=0 equivale a n=k con k positivo,
  a L=k lambda, al cierre exacto en fase y al estado estable. La cancelacion
  usa lambda>0, dominio declarado en la prosa y conservado con su procedencia.
- Lean verifica L>0 desde D_L: L=n lambda, n>0 y lambda>0.
- Se conserva D_L a traves de la dependencia explicita P_VED_Inv y se genera
  la deduccion n=k implica L=k lambda usando realmente L=n lambda.
- El informe de PUBLICA no denomina traduccion completa a una formalizacion
  cuya demostracion automatica sigue incompleta.

## Localizacion de los pendientes

1. P_VED_K_E, apartado 7: el conjunto de estados estables sigue como un campo
   independiente; no se ha construido el conjunto clasificado a partir de
   las coordenadas y su dominio.
2. P_VR_rho, apartado 15: R_rho y su inversa ya se interpretan como las
   aplicaciones identidad declaradas. Lean verifica sus inversas y la
   conservacion de distancias. Falta enlazar la evaluacion de un par
   transportado concreto con los escalares rho_VED, rho_R y a, que el
   generador aun mantiene separados de las coordenadas funcionales.
3. T_RIEMANN, apartado 18: no hay una prueba generada de cero no trivial implica
   estado estable. La afirmacion aparece en los apartados 14 y 18 y se conserva;
   aun no tiene una derivacion verificada. La clasificacion estable equivale
   a rho=0 y la conservacion de rho no bastan, por si solas, para obtener que
   todos los ceros pertenecen a esa clase. El paso necesita una justificacion
   propia, no simplemente convertir la afirmacion en una hipotesis. Ademas,
   ib se representa incorrectamente como un escalar y zeta como una funcion
   abstracta; no corresponde afirmar que esa representacion certifica la HR.
4. P_VED_Completo, apartado 7: no se ha construido el dominio de cierres
   clasificados ni la demostracion de su particion exhaustiva. La union de
   conjuntos, por si sola, tampoco certifica que las clases sean disjuntas.
5. P_F, apartado 9: no se conecta la definicion de F con la expresion diferencial.
   Hay operadores diferenciales abstractos cuya interpretacion en el marco
   debe trasladarse, en vez de considerarlos operaciones matematicas ya probadas.
6. P_W, apartado 10: la condicion de velocidad de la onda no esta enlazada
   con un modelo de propagacion; los limites se representan mediante relaciones
   abstractas, no mediante una derivacion nativa del limite de Lorentz.
7. P_F2, apartado 10: no se ha construido el paso de las expresiones y limites
    de P_F1/P_W al valor reducido de F. Un limite no puede reemplazarse por una
    igualdad puntual sin trasladar el alcance del paso escrito en el documento.

## Alcance

Las pruebas parciales no certifican la demostracion completa de la HR.
Conservar y reconocer un argumento escrito es necesario para traducirlo;
certificarlo exige ademas construir y verificar sus inferencias. Este informe
no autoriza a modificar el documento para ajustarlo al traductor.

## Verificacion completa del 8 de octubre de 2026

- Las 97 pruebas de DEMUESTRA pasan, incluidas integridad, ramas independientes,
  auditoria y verificacion de los archivos enviados por el publicador.
- Las dos copias del Markdown son identicas. Los 29 archivos Python compartidos
  de PUBLICAR y DEMUESTRA tambien son identicos.
- Se genero de nuevo todo el archivo Lean desde el Markdown actual y se verifico
  con Lean 4.33.1 y Mathlib. La ejecucion termino con codigo 0; solo hubo avisos
  de variables no utilizadas.
- Los 22 teoremas emitidos se comprobaron con `#print axioms`. Solo dependen de
  los fundamentos ordinarios de Lean: propext, Classical.choice y Quot.sound.
  No aparece sorryAx ni un axioma propio que sustituya una prueba pendiente.
- Esta verificacion se ejecuto sobre
  `tests/.tmp_publicacion/ES_46_RV6_verificacion_completa.lean`. No reemplaza los
  certificados existentes ni convierte las nueve derivaciones pendientes en
  resultados certificados.
- El PDF publico respondio HTTP 200 y ya contiene el titulo de demostracion.
  Aun no contiene las ultimas aclaraciones de concepto primordial y longitud
  estrictamente positiva. No se ha realizado una publicacion nueva en esta
  verificacion.

Las pruebas del cierre estable son relativas al dominio y a las condiciones
explicitas del documento. No prueban por si mismas la exhaustividad global de
la clasificacion ni la estabilidad de todos los ceros no triviales de zeta.

## Correccion del transporte y de los diagnosticos

Se conserva la procedencia completa de la definicion transportada en
DEMUESTRA_TRANSPORT_DEFINITION. La regla se obtiene del pasaje que declara
la conservacion de las clases por f y f inversa, no de convertir P_RIM_S
en una definicion que repita su propia conclusion.

Lean verifico `derive_P_RIM_S_transported_stability` con codigo 0, sin sorryAx
ni axiomas propios. Las 101 pruebas de DEMUESTRA pasan, incluida la comprobacion
de que quitar la declaracion del transporte impide inventarlo desde el teorema.
Tambien pasan las 12 pruebas de PckDemuestra; sus comprobaciones de alcances
usan el documento actual y casos independientes para las formulas historicas.

Los objetivos abiertos se describen como VERIFICACION_FORMAL_PENDIENTE; los
errores de construccion, como ERROR_EVALUADOR. Ambos indican explicitamente
source_refuted=false y se limitan a la representacion formalizada. La auditoria
local se actualizo conservando informes anteriores y certificados existentes.
Estas correcciones no se han publicado en la web ni sustituyen por si mismas
los artefactos de la proxima evaluacion y publicacion completas.

## Enlaces completados posteriormente

P_RIM_S ya no figura entre las ocho derivaciones pendientes. La definicion
transportada conserva su dominio: pertenencia a U_Rim_rho y estabilidad de la
preimagen por f inversa. Es la preimagen de la clase estable dentro del dominio
de la transformacion, no una identificacion arbitraria de U_Rim y U_Rim_rho.

La coordenada funcional rho_R se interpreta ahora mediante su formula
explicita en D_rho_R: abs(Re(z)-1/2). Su procedencia queda registrada en
DEMUESTRA_COORDINATE_DEFINITION. Los escalares de otros contextos no se
identifican automaticamente con esta funcion.

Se verificaron los siguientes enlaces:

- Todo punto del strip critico tiene coordenada en [0,1/2].
- Todo cero no trivial de la definicion D_Rim pertenece al universo transversal
  definido en D_f, sin suponer su estabilidad.
- La estabilidad transportada equivale a rho_R=0. Las definiciones de dominio
  llegan a P_RIM_S por sus dependencias explicitas, a traves de T_ISO.
- Para un cero no trivial, estabilidad transportada equivale a Re(z)=1/2.
  Esto es una equivalencia, no una prueba de que todos los ceros sean estables.

La nueva generacion completa se verifico en
`tests/.tmp_publicacion/enlaces_completos_generados.lean`, con las importaciones
especificas de Mathlib necesarias para estas formulas. Lean termino con codigo
0. Los 28 teoremas emitidos solo dependen de propext, Classical.choice y
Quot.sound; no hay sorryAx ni axiomas propios. Pasan 102 pruebas de DEMUESTRA y
12 de PckDemuestra. La web y los certificados anteriores no se han reemplazado
por esta generacion de verificacion.

## Coordenada local y mapa del apartado 15

P_VR_E ya no figura entre las siete derivaciones pendientes. El apartado 16
aplica explicitamente el criterio de P_VED_E a rho_VED. El traductor conserva
esa instanciacion como un alcance local de la etiqueta estado estable, en vez
de cambiar su significado en otros nodos o de suponer que todos los escalares
homonimos son iguales. DEMUESTRA_TEXT_COORDINATE_SCOPE conserva su procedencia.

Lean verifica derive_P_VR_E a partir de la igualdad de coordenadas en P_VR_rho.
Esta dependencia sigue siendo una obligacion separada: la prueba del apartado
16 no certifica por si misma P_VR_rho ni la Hipotesis de Riemann.

Las definiciones locales de R_rho y su inversa ya no se representan como
funciones arbitrarias. Se reconocen solo cuando estan presentes la declaracion
del mapa y su definicion explicita. Lean verifica que preservan distancias,
preservan el intervalo y son mutuamente inversas. Estas propiedades aparecen
como resultados parciales de P_VR_rho, no como sustitutos de su igualdad escalar.
DEMUESTRA_TRANSVERSAL_MAP registra el texto que origina cada definicion.

La nueva generacion completa se verifico en
`tests/.tmp_publicacion/mapa_y_estabilidad_generados.lean`. Lean termino con
codigo 0. Los 32 teoremas emitidos solo dependen de propext, Classical.choice y
Quot.sound; no hay sorryAx ni axiomas propios. Pasan 104 pruebas de DEMUESTRA y
12 de PckDemuestra. Se comprueba tambien que retirar el enlace de coordenada o
la declaracion de definicion impide inventar sus traducciones.

El Markdown permanece intacto y las copias del traductor estan sincronizadas.
Esta verificacion no ha actualizado el PDF publico ni reemplazado certificados
previos.
