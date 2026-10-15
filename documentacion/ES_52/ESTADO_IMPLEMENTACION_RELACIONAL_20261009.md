# Retirada del registro de amplitudes de V

Los cuerpos anteriores de V1, V2 y V3 se conservan en
DEMUESTRA/archivo_local/ES_52_retirada_20261009/implementaciones_anteriores.
Ya no se usan como clases V activas. Los informes numericos anteriores
describen esas versiones retiradas y no acreditan las nuevas.

v1.py, v2.py y v3.py exponen los protocolos relacionales. Las referencias
de Q permanecen separadas en los programas de contraste. El MD no se
modifica ni se publica en esta revision.

## Parte implementada

- Los generadores se proporcionan como funciones f(t0); la preparacion y
  execute no llaman a esas funciones ni asignan sus resultados.
- Antes de medir, la interfaz de resultados indica @. Las operaciones
  convencionales NOT, XOR, AND, CNOT binaria y SWAP construyen relaciones.
- Una captura conjunta evalua cada generador una vez en el mismo t0 y
  registra los bits. La lectura posterior solo entrega lo ya registrado.
- No hay una tabla de amplitudes o probabilidades en las clases V nuevas.
  El numero de nodos de relaciones es lineal en unidades y operaciones.
- Esta es una restriccion de la interfaz. No demuestra inaccesibilidad
  fisica frente a inspeccion de Python ni independencia de los generadores.

## Parte no implementada

H, fase, Rx y Rz tienen transformaciones deterministas de dos senales
implementadas en operaciones_senales.py. La Fourier inversa se descompone
en bloques H, fases controladas y permutas, sin tabla de amplitudes.
Estas formulas y conexiones todavia no tienen realizacion conjunta ni
lectura ejecutable sobre los generadores de esta representacion relacional.
Sus descripciones matematicas del MD no se declaran ausentes ni falsas.
No se sustituyen esas operaciones por un inversor, un sorteo, una respuesta
conocida, factorizacion convencional ni otra tabla de amplitudes.

Actualizacion del 10 de octubre: V1 vincula el oraculo mediante sus
conexiones reversibles NOT/CNOT; V2 conserva el modulo, el registro de
trabajo y las potencias sucesivas de la base. Los tres protocolos preparan
sus conexiones, pero se detienen al intentar la lectura conjunta de las
puertas de senal. V1 requiere recibir su oraculo al preparar el circuito.
Preparar esos bloques no significa haber
ejecutado fisicamente sus transformaciones. Son implementaciones parciales, NO tres
maquinas completas demostradas equivalentes a Q. El bloqueo es un trabajo
de implementacion pendiente, no una refutacion del documento.

## Comparacion que puede hacerse ahora

Las tablas de verdad de NOT, CNOT binaria y SWAP se contrastan con X,
CNOT y SWAP de una referencia Q sobre las cuatro preparaciones de base
computacional de dos unidades. Se comprueban doce casos. El controlador V
no observa las fuentes antes de t0; los valores de esos casos conocidos
pertenecen al banco de prueba, no a una lectura intermedia de V.

Esta comparacion limitada no verifica superposiciones, interferencia,
entrelazamiento general, busqueda de periodo ni muestreo de circuitos.
Las pruebas de contrato temporal tampoco prueban coherencia cuantica.

Las pruebas antiguas de distribuciones Q1/V1, Q2/V2 y Q3/V3 no pueden
usarse como criterios de aprobacion de estas versiones: sus metodos de
lectura de distribuciones han sido retirados. Deben conservarse como
pruebas historicas del codigo anterior, no hacerse pasar como aprobadas.

El banco comparar_v_q.py y sus cuatro archivos de pruebas anteriores
se trasladaron al archivo local, fuera del directorio activo. No se borran.
Las veintiuna pruebas nuevas de contrato, correspondencias binarias y
operadores deterministas pasan; incluyen los doce casos de base
computacional citados y la Fourier inversa de una a cuatro unidades.
Las matrices de Q usadas en estas pruebas pertenecen exclusivamente al
banco de contraste: ninguna clase V las usa para decidir su salida.
Se anaden dieciseis contrastes del oraculo reversible con Q, treinta y dos
casos binarios de multiplicacion modular controlada y comprobaciones del
orden completo de las conexiones. El contraste del oraculo no constituye
todavia una ejecucion completa de Deutsch con H y lectura final.
La inspeccion de
v1.py, v2.py, v3.py y v_relacional.py no encuentra tablas de amplitudes,
Statevector, DensityMatrix, vectores NumPy ni calculo de distribuciones.
No se modifica el MD, no se certifica ni se publica esta revision.
