# Propuesta numerica de lectura conjunta por caminos

**Estado actualizado: ensayo no aplicable a la maquina V del autor.**
El autor exige que la medida solo se desencadene en $t=t_0$, sin recorrer
caminos o salidas para calcular el resultado. Esta propuesta no cumple
ese requisito y se retira como candidata a ejecucion de V. El desarrollo
y sus datos se conservan como historial numerico, no como resultados de V.
No se refuta la propuesta del autor.

Fecha: 10 de octubre de 2026.

Esta es una propuesta de desarrollo autorizada para estudiar la lectura
que faltaba. No modifica las premisas del autor ni el MD principal.
Es un modelo numerico clasico, no una maquina cuantica fisicamente
construida. Su activacion es explicita; V1, V2 y V3 no lo adoptan por defecto.

## Regla candidata

Sea $x_0$ la preparacion binaria declarada, y sean $U_1,\ldots,U_m$
los bloques en el orden del circuito. Para una palabra final $y$, definimos:

$$
A(y)=\sum_{x_1,\ldots,x_{m-1}}
\prod_{j=1}^{m}\langle x_j|U_j|x_{j-1}\rangle,
\qquad x_m=y.
$$

La suma se evalua recorriendo caminos uno a uno, no almacenando el
vector conjunto. Los bloques de fase aportan factores complejos; no se
eliminan ni se sustituyen por cambios sobre bits medidos previamente.
NOT, CNOT, SWAP, Toffoli y la multiplicacion modular aportan conexiones
reversibles. H y Rx pueden abrir dos caminos en cada paso local.

Las matrices locales de tamaño fijo proceden de las puertas de Qiskit.
El evaluador no utiliza `Statevector`, un operador matricial conjunto,
una lista de amplitudes finales ni una tabla completa de probabilidades.

Al medir, se calcula una probabilidad de salida cada vez:

$$
p(y)=|A(y)|^2.
$$

Una primera pasada comprueba la masa total:

$$
M=\sum_y p(y).
$$

En aritmetica exacta, la composicion unitaria implica $M=1$.
El programa trabaja con precision finita y exige una masa numericamente
proxima a uno. Si no supera la comprobacion, no entrega una salida.

En una segunda pasada se acumula la masa hasta localizar una unica palabra:

$$
\sum_{z<y}p(z)\le rM<\sum_{z\le y}p(z),\qquad 0\le r<1.
$$

La palabra $y$ se convierte en bits con la unidad cero primero. Es una
seleccion conjunta: no son comparadores independientes por unidad.

## Que se esta suponiendo

Esta propuesta introduce explicitamente pesos complejos de camino y una
lectura mediante modulo cuadrado. Esas reglas no se deducen solamente de
que un resultado sea desconocido antes de medir. La coincidencia con Q
comprueba esta construccion matematica; no demuestra que cualquier
electronica que oculte sus bits realice esas transformaciones.

Con una referencia continua uniforme, la regla de intervalos produce la
distribucion normalizada $p(y)/M$. La implementacion por defecto obtiene
una referencia discreta de 53 bits al medir, mediante `secrets`. Su precision
es finita; no se identifica con una fuente fisica cuantica ni con una
distribucion continua exactamente uniforme.

Los ensayos reproducibles declaran una referencia fija $r=0.37$.
Ese valor es conocido por el comprobador: no acredita desconocimiento
fisico de la preparacion ni representa repeticiones aleatorias de hardware.
H, las fases y Fourier siguen siendo operaciones deterministas del circuito;
la referencia pertenece exclusivamente a la seleccion final.

## Tiempo, memoria e instante de medida

Durante la preparacion solo se guardan conexiones, coeficientes de puertas
y condiciones declaradas. No se calcula ni se registra una salida.
La evaluacion de caminos y la seleccion empiezan en la llamada de medida
con coordenada $t=t_0$. La interfaz muestra `@` antes de esa llamada.

Esto no significa que el calculo numerico sea instantaneo en un reloj
fisico. El tiempo empleado se registra por separado. La propuesta no
resuelve la realizacion fisica de la evolucion previa ni la calibracion
de un detector que responda en un instante real especificado.

La pila conserva como maximo un numero de marcos proporcional al numero
de puertas. Cada marco contiene un indice de palabra, un indice de puerta
y un coeficiente complejo. La memoria es polinomial en la descripcion,
pero existen variables numericas intermedias durante el calculo de medida.
No se afirma que el programa carezca de estado interno.

Se recorren posibles palabras finales sin guardarlas juntas: hasta $2^n$
palabras para $n$ unidades. Ademas, el numero de caminos puede crecer
exponencialmente con las puertas que mezclan caminos. Eliminar la tabla
exponencial no elimina el posible tiempo exponencial.

Un limite de visitas protege la ejecucion. Si se alcanza, se registra
`LIMITE_PROPUESTA`, sin inventar un bit ni volver a medir esa preparacion.

## Implementacion y contrastes

- `comparacion/propuesta_lectura.py`: evaluacion por caminos y lectura unica.
- `comparacion/verificar_propuesta.py`: contraste optativo y registro de resultados.
- `comparacion/tests/test_propuesta_lectura.py`: interferencia, correlaciones,
  rotaciones, fases, Fourier, conexiones modulares, limite de trabajo y lectura.

Pasan 49 pruebas del conjunto actual. Los nuevos contrastes incluyen
amplitudes complejas, no solo frecuencias: H-fase-H para distintos angulos,
Toffoli en superposicion, Fourier inversa para todas las entradas de tres
unidades y varios circuitos V3. Tambien se contrasta la distribucion completa
de control de la instancia pequeña $N=3$ de V2.

El informe `VERIFICACION_PROPUESTA_LECTURA_20261010.json` registra ademas
una lectura de la instancia $N=15$. El resultado se conserva aunque no
permita extraer factores; no se seleccionan solo ejecuciones favorables.
Un unico ensayo favorable no determina una tasa de exito.

## Alcance

La tecnica se encuadra en la simulacion clasica mediante sumas de caminos.
Como antecedentes, [Aaronson y Chen](https://arxiv.org/abs/1612.05903)
estudian simulacion de circuitos generales con espacio polinomial y coste
temporal elevado; [Amy y Stinchcombe](https://quantum-journal.org/papers/q-2025-12-02-1926/)
estudian simplificaciones de sumas simbolicas para una familia especifica.
No se afirma que este programa implemente sus algoritmos ni sus mejoras.

La regla permite ejecutar un modelo de lectura para los tres protocolos
y comprobar su consistencia numerica. No demuestra construccion fisica de V,
equivalencia universal de una arquitectura electronica ni igualdad de orden
temporal con hardware Q. No sustituye silenciosamente la maquina propuesta
por el autor. No se publica ni se certifica.
