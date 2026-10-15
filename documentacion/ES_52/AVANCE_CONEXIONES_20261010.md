# Conexiones ejecutables de V: 10 de octubre de 2026

## Criterio de construccion

Conocer las conexiones del circuito no significa conocer los resultados
individuales. Los generadores no se consultan durante la preparacion.
La interfaz muestra @ hasta la medida conjunta en t=t0; despues conserva
los bits registrados. No se exige ausencia de relaciones entre unidades.
No se exige coincidencia de dos resultados individuales aleatorios para
establecer equivalencia de calculo.

## Correcciones realizadas

- V1 ya utiliza el oraculo recibido. Su conexion reversible se configura
  con las mismas reglas NOT/CNOT que la referencia Q; no recibe la respuesta
  correcta del problema ni la salida de Q.
- V2 conserva N, los puertos de trabajo y el multiplicador de cada puerta.
  Las potencias se calculan por cuadrados modulares sucesivos, sin buscar
  factores ni recibir el periodo como dato.
- La relacion modular binaria deja intacto el registro cuando el control
  es cero y conserva los valores fuera de [0,N). La coprimalidad garantiza
  que su accion dentro de ese intervalo sea una permutacion.
- El plan completo conserva el orden de puertas de senal, relaciones
  binarias y bloques modulares. No es una tabla de estados internos.

## Verificacion

Pasan 21 pruebas. Incluyen los contratos de lectura, las transformaciones
deterministas de senales, Fourier inversa y correspondencias binarias.
Los 16 casos del oraculo se contrastan con una referencia Q en el banco de
prueba. Los 32 casos modulares verifican la regla aritmetica de la puerta,
no la busqueda de periodo completa. Las pruebas usan entradas conocidas
del comprobador; la preparacion de V no lee los generadores.

## Trabajo restante

Preparar las conexiones de las tres maquinas no ejecuta aun su dinamica
conjunta de senales. Su captura permanece bloqueada cuando aparecen esas
puertas: falta la vinculacion ejecutable de esa dinamica con la medida.
No hay todavia resultados finales de V1, V2 o V3 para contrastar sus tareas
completas con Q. No se declara equivalencia universal, ventaja de recursos
ni construccion de hardware cuantico a partir de estas pruebas parciales.
No se modifica el MD de autor, no se publica y no se emite certificado.

## Continuacion: preparaciones y conexion de medida

El avance posterior se detalla en [LECTURA_CONJUNTA_20261010.md](LECTURA_CONJUNTA_20261010.md).
Se declaran las preparaciones de V1, V2 y V3, se incorpora Toffoli,
se conecta una interfaz de realizacion con medida unica y se reparan
los tres comparadores para que no llamen al banco retirado.
Pasan 35 pruebas. Sigue pendiente la realizacion compacta de la dinamica
conjunta y su detector; la interfaz no la sustituye ni la certifica.
