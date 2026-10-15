# Construccion de V1, V2 y V3: lectura conjunta

Fecha: 10 de octubre de 2026.

## Cambios ejecutables

- V1 declara la preparacion $(0,1)$ y conserva H, H, oraculo y H en su orden.
- V2 declara el registro de trabajo en $1$ y los controles en $0$.
  Conserva las potencias modulares y Fourier inversa; extrae el valor
  de control solo de los bits registrados tras la medida.
- V3 declara la preparacion cero y conserva el circuito recibido.
- Toffoli ya tiene una conexion binaria ejecutable. OR reversible se
  construye con dos CNOT y una Toffoli, sin borrar los controles.
- Las tres admiten la misma conexion de realizacion y una unica medida
  conjunta en $t=t_0$. Antes de esa medida, la interfaz sigue mostrando `@`.
- Se retiraron de los comparadores activos las llamadas al banco anterior,
  las fases de prueba impuestas y las afirmaciones de que V almacena
  un registro exponencial. Los vectores de Qiskit pertenecen exclusivamente
  a las referencias Q simuladas, no a V.

La descripcion de conexiones no contiene valores internos medidos ni
tablas de amplitudes. La preparacion conocida no es una lectura intermedia.
Un resultado registrado se conserva; no se repite la medida de la misma
preparacion, tampoco cuando el detector falla.

## Conexion de una realizacion

Una realizacion implementa dos operaciones:

```python
def preparar(plan):
    # Configurar preparacion y conexiones; no medir ni devolver resultados.
    ...

def disparar(t0):
    # Una lectura conjunta: un bit por unidad, con q0 primero.
    ...
```

El plan incluye numero de unidades, preparacion declarada y orden completo
de operaciones. No incluye la respuesta de Q, factores, periodos, una
clasificacion del oraculo ni una distribucion de salida prefabricada.

El instante recibido es la coordenada de medida del protocolo. Esta interfaz
no es un temporizador fisico: la realizacion debe definir su relacion con
el reloj y efectuar la lectura correspondiente. El tiempo registrado por
el programa mide la duracion de las llamadas, no acredita esa calibracion.

La conexion permite usar una realizacion propia en Python o controlar un
circuito electronico. No proporciona por si misma la dinamica del dispositivo.
Una realizacion externa tiene que documentar sus recursos; la interfaz no
puede garantizar que su codigo respete las restricciones de memoria.

## Que falta exactamente

No se ha implementado una realizacion compacta que ejecute conjuntamente
H, fases, rotaciones, controles y bloques modulares sobre las relaciones
de V y entregue sus bits finales. Las formulas de dos caminos estan
implementadas, pero no basta aplicarlas por separado despues de medir
generadores binarios: eso cambiaria el orden y las relaciones del circuito.

El MD principal, seccion 20.1, describe una lectura conjunta para V_ref
mediante amplitudes conjuntas y umbrales acumulados. Ese procedimiento
requiere el registro exponencial que se ha excluido de esta construccion.
No se ha incorporado a V. La subseccion "Obligacion central de la
arquitectura basada en relaciones" distingue expresamente la arquitectura
compacta de ese procedimiento de referencia.

Por tanto, lo pendiente no es volver a definir `@` ni repetir la premisa
de desconocimiento hasta $t=t_0$. Es la realizacion ejecutable de las
transformaciones conjuntas y de su detector final sin ese registro.
No se considera una refutacion de la propuesta ni se declara terminada
la construccion de las tres maquinas.

## Comprobaciones

Pasan 44 pruebas; otras 14 del ensayo retirado se omiten. Comprueban conexiones, preparaciones, medida unica,
errores del detector, orden de bits y procesamiento de una lectura dada.
Los detectores de prueba devuelven datos de ensayo; no son realizaciones
de H, entrelazamiento, Fourier ni de los algoritmos completos.

El informe `VERIFICACION_TRES_MAQUINAS_20261010.json` registra la ejecucion
actual de los tres comparadores. Sin una realizacion conectada, el estado
es `PENDIENTE_REALIZACION`, no "demostrado", "refutado" ni "medido".
No se inventan resultados o tiempos de una captura que no se ha realizado.

Los tiempos de una distribucion Q simulada y de una lectura individual V
son trabajos distintos. No se utilizan para afirmar igualdad de orden
temporal o ventaja computacional. El contraste de ese objetivo requiere
ejecuciones correspondientes completas.

No se cambia el MD de autor, no se publica y no se certifica.

## Propuesta posterior autorizada

Se desarrolla un modelo numerico independiente en
[PROPUESTA_LECTURA_POR_CAMINOS_20261010.md](PROPUESTA_LECTURA_POR_CAMINOS_20261010.md).
Permite probar una regla de lectura sin almacenar la tabla conjunta,
pero su tiempo puede ser exponencial. No completa la realizacion fisica
pendiente ni sustituye por defecto la arquitectura de V.

El autor aclara posteriormente que la medida solo debe desencadenarse,
sin recorrer caminos ni salidas. Por ello se retira esa propuesta como
candidata de V y se conserva como ensayo separado no aplicable a su
premisa. La interfaz actual hace una unica llamada a `disparar(t0)`;
sigue pendiente conectar esa llamada con la realizacion propia de V.

## Correccion del instante constitutivo

V1, V2 y V3 requieren ahora `preparar(plan)` y `disparar(t0)` de su
realizacion. Su `capture_t0()` registra el reloj del disparo y ya no
acepta un numero inventado como etiqueta. No utiliza el evaluador binario
del banco ni calcula caminos o probabilidades. El modelo retirado no
implementa ese contrato y no se acepta como realizacion V.

La evaluacion de este control se registra por separado en
`Proyectos/ES_52/evaluaciones/TEMPORAL_ES_52_Maquina_V_UNIHOLOG.md`.
Se verifica el control temporal, no la dinamica fisica pendiente.

## Enlace concreto entre las formulas y la construccion

La seccion 12.1 del MD principal explicita dos caminos coherentes,
recombinacion y fase relativa. Las formulas de H y fase no estan ausentes:

$$
H(s_0,s_1)=\left(\frac{s_0+s_1}{\sqrt{2}},
\frac{s_0-s_1}{\sqrt{2}}\right),\qquad
U_\phi(s_0,s_1)=(s_0,e^{i\phi}s_1).
$$

`operaciones_senales.Bloque.transformar_par` implementa estas expresiones.
Sin embargo, `MaquinaRelacional.execute` solo compila las conexiones y
entrega el plan a `realizacion.preparar`. No llama a `transformar_par`
para realizar la evolucion de V. `disparar` tampoco debe hacerlo:
la medida no debe convertirse en una evaluacion del circuito.

El paso de construccion pendiente es conectar esos bloques a senales
que evolucionen antes del disparo, sin observar las salidas binarias.
No se identifica desconocimiento de una salida con inexistencia de la
dinamica interna. Tampoco se introduce por ello una tabla conjunta de
amplitudes ni se autoriza el modelo retirado de recorridos.

Para una realizacion Python queda por aclarar si las dos senales pueden
representarse como variables internas no expuestas. Esa representacion
no es una lectura fisica, pero no garantiza inaccesibilidad a quien
inspeccione la memoria. No se incorpora sin aclarar esta restriccion.

Incluso resuelto el bloque de dos caminos, queda por realizar su
composicion con controles y correlaciones para V1, V2 y V3 sin un
registro exponencial. Las formulas locales, por si solas, no implementan
esa composicion. Este es un estado del programa, no una refutacion del MD.
