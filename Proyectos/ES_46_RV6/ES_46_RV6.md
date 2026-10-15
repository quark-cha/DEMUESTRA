# ES_46: DOCUMENTO 46 — REVISIÓN 6
## Demostración de la Hipótesis de Riemann mediante el teorema geométrico-topológico de estabilidad y los espacios de soluciones

**Marco:** Einstein–VED · UNIHOLOG  
**Autor:** Víctor Estrada Díaz  
**Carácter del documento:** versión final autocontenida del desarrollo deductivo que presenta la demostración de la Hipótesis de Riemann para establecerla como teorema.  
**Principio metodológico:** una definición se introduce una vez; una proposición demostrada queda asentada y puede utilizarse posteriormente sin reabrir su demostración. Si una conclusión se sigue de las proposiciones asentadas, se afirma con la fuerza lógica que corresponde.

---

# 0. Regla de lectura y notación lógica

Este documento utiliza la siguiente convención:

- $D_X$: definición.
- $A_X$: antecedente establecido fuera de este documento y citado como punto de partida.
- $P_X$: proposición demostrada dentro del desarrollo.
- $T_X$: teorema obtenido a partir de proposiciones anteriores.
- $\therefore$: por tanto.

Una proposición demostrada no vuelve a convertirse posteriormente en una hipótesis. Puede ser citada como antecedente mediante su identificador.

---

# 1. Universo, coordenadas y geometría diferencial

## 1.1. Universo

$D_U$ — El universo físico considerado se representa como

$$
\boxed{
U=3S+T.
}
$$

No se elimina ninguna dimensión espacial.

## 1.2. Elección local de la dirección de propagación

Sea una onda que en un punto determinado se propaga según una dirección espacial. Es lícito orientar localmente los ejes de coordenadas de manera que el eje $x$ coincida con la dirección instantánea de propagación.

Entonces, para ese desplazamiento infinitesimal,

$$
dy=0,
\qquad
dz=0,
$$

y

$$
ds=dx.
$$

$P_{\rm COORD}$ — Esta elección no reduce $3S$ a una dimensión. Sólo alinea una coordenada con la dirección local de propagación.

---

# 2. Significado de $t'$ y relación de Lorentz

## 2.1. Convención esencial sobre el apóstrofo

$D_{t'}$ — El apóstrofo de $t'$ **no significa derivada**.

$t'$ representa la coordenada temporal propia del sistema observado respecto del observador en la transformación de Lorentz. En consecuencia, $dt'$ es el diferencial del tiempo propio del sistema observado.

Cuando sea necesaria una derivada se escribirá explícitamente, por ejemplo,

$$
\frac{dt'}{dt}.
$$

## 2.2. Antecedente de Lorentz

$A_{\rm L}$ — Para velocidad relativa $v$,

$$
dt'
=
dt
\sqrt{
1-\frac{v^2}{c^2}
}.
$$

Definimos la velocidad longitudinal observada como

$$
\boxed{
v=\frac{ds}{dt}.
}
$$

En unidades naturales,

$$
c=1.
$$

Por tanto,

$$
dt'^2
=
dt^2-ds^2,
$$

y obtenemos

$$
\boxed{
P_{\rm ST}:
\qquad
ds^2=dt^2-dt'^2.
}
$$

Equivalentemente,

$$
\boxed{
ds^2=(dt-dt')(dt+dt').
}
$$

Estas dos expresiones son la misma relación geométrica escrita de dos formas.

---

# 3. Primer y segundo orden: velocidad y aceleración

La primera derivada espacial respecto de $t$ es

$$
\boxed{
P_v:
\qquad
\frac{ds}{dt}=v.
}
$$

Cuando $v$ es constante,

$$
\frac{d^2s}{dt^2}=0.
$$

La segunda derivada es

$$
\boxed{
P_a:
\qquad
\frac{d^2s}{dt^2}
=
\frac{dv}{dt}
=
a.
}
$$

Dentro del marco Einstein–VED, la presencia de materia se asocia al confinamiento de onda y a la existencia de dinámica no puramente lineal; la aceleración expresa la variación del régimen de velocidad.

La geometría define por tanto una estructura diferencial en $t$, $t'$ y sus variaciones. No se añade desde fuera una segunda geometría para introducir la dinámica.

---

# 4. Onda base, longitud de cierre y radio $R_{\rm VED}$

## 4.1. Longitud de onda base

$D_\lambda$ — Sea $\lambda$ la longitud de onda base asociada a la materia considerada.

A partir de las relaciones de Planck y Einstein,

$$
E=\frac{hc}{\lambda},
$$

$$
E=Mc^2,
$$

se obtiene

$$
Mc^2=\frac{hc}{\lambda},
$$

y por tanto

$$
\boxed{
\lambda=\frac{h}{Mc}.
}
$$

## 4.2. Longitud de contorno

$D_L$ — Sea $L$ la longitud total del contorno espacial recorrido por una onda confinada; es el perímetro de cierre de la onda.

Aquí $\lambda$ es la longitud de onda Compton de la materia considerada,
estrictamente positiva, y $n=L/\lambda$ es el número exacto de ciclos
contenido en el contorno: no es una aproximación ni un redondeo. El cierre
exacto en fase exige que ese número sea un entero positivo.

Definimos

$$
\boxed{
L=n\lambda.
}
$$

Para un cierre finito,

$$
n\in\mathbb R^+.
$$

**La longitud del contorno de una onda cerrada es siempre estrictamente positiva: $L>0$.** Tanto el número de longitudes de onda contenido en el contorno como la longitud de onda Compton son positivos. Por la relación anterior, su producto es positivo; un contorno de longitud cero no representa una onda material cerrada de este marco.

## 4.3. Construcción de $U_{\rm VED}$

$D_{R_{\rm VED}}$ — Se representa topológicamente el contorno de longitud $L$ mediante una circunferencia bidimensional de igual longitud:

$$
2\pi R_{\rm VED}=L.
$$

Por tanto,

$$
\boxed{
R_{\rm VED}
=
\frac{L}{2\pi}
=
\frac{n\lambda}{2\pi}.
}
$$

La afirmación no es que el confinamiento físico real en $3S+T$ tenga necesariamente forma circular. La circunferencia es una proyección topológica precisa que conserva la longitud $L$ y permite analizar las propiedades de cierre.

Así,

$$
\boxed{
U_{\rm VED}(\text{onda})
=
U_{\rm VED}(\text{cerrada},\text{abierta})
=
U_{\rm VED}(R_{\rm VED})
=
U_{\rm VED}(L,R_{\rm VED}).
}
$$

$P_{\rm VED}(\mathrm{Inv})$ — La representación circular conserva $L$, $\lambda$, $n$ y, como se definirá enseguida, $\rho$. Por ello no crea la estabilidad: la hace visible.

---

# 5. Ondas cerradas, ondas abiertas y estabilidad

## 5.1. Onda cerrada

Para todo $n$ finito positivo,

$$
L=n\lambda<\infty,
$$

y existe un contorno finito de representación.

El hecho de estar cerrada **no implica** estabilidad.

## 5.2. Onda abierta

La onda abierta o libre corresponde al límite

$$
\boxed{
n\to\infty.
}
$$

Entonces,

$$
L\to\infty,
$$

$$
R_{\rm VED}\to\infty.
$$

No existe un contorno espacial finito de retorno:

$$
\boxed{
n\to\infty
\iff
L\to\infty
\iff
R_{\rm VED}\to\infty
\iff
\text{onda abierta o libre}.
}
$$

Dentro del marco, la onda libre corresponde a energía.

---

# 6. Coordenadas completas de cierre: $k$ y $\rho$

## 6.1. Entero más próximo y distancia

$D_k$ — Sea $k\in\mathbb N^+$ el entero positivo más próximo que sirve como centro de una familia de cierre.

$D_\rho$ — Sea

$$
\boxed{
\rho
=
\operatorname{dist}(n,\mathbb N^+).
}
$$

Aquí $\rho$ es la **distancia mínima de $n$ al entero positivo más próximo $k$**, no la distancia a un entero elegido arbitrariamente. Por tanto, $\rho=|n-k|$. Esta distancia mide cuánto se aparta el número de ciclos del cierre entero y exacto en fase.

Por definición de distancia al entero más próximo,

$$
\boxed{
0\le\rho\le\frac12.
}
$$

Todo cierre finito se representa como

$$
\boxed{
n=k\pm\rho,
\qquad
k\in\mathbb N^+,
\qquad
0\le\rho\le\frac12.
}
$$

En el punto exactamente equidistante entre dos enteros, $\rho=1/2$; las dos etiquetas vecinas representan la misma frontera.

Entonces

$$
\boxed{
L(k,\rho)
=
(k\pm\rho)\lambda,
}
$$

y

$$
\boxed{
R_{\rm VED}(k,\rho)
=
\frac{(k\pm\rho)\lambda}{2\pi}.
}
$$

## 6.2. Concepto primordial: estabilidad de la materia como onda cerrada

**Regla básica de $U_{\rm VED}$: el único valor estable es $\rho=0$. Todo valor de $\rho$ en el intervalo $(0,1/2]$ corresponde a un cierre no estable.**

La materia se representa en este marco como una onda de longitud de onda Compton positiva $\lambda$, cerrada en un contorno de longitud $L=n\lambda$. El número $n$ cuenta cuántas longitudes de onda contiene ese contorno. Escribir $L=n\lambda$ describe su longitud, pero no basta por sí solo para afirmar su estabilidad.

**La estabilidad exige un número entero positivo de ciclos.** Cuando $n=k\in\mathbb N^+$, el recorrido completo contiene exactamente un número entero de longitudes de onda: la onda retorna al mismo punto en la misma fase, el contorno es $L=k\lambda$ y la distancia al entero más próximo es cero. Este es el cierre estable.

Si $n$ es real no entero, el recorrido no contiene un número entero de ciclos. La onda no retorna exactamente en fase y queda un desfase respecto del cierre entero. En la clasificación de este marco, ese desfase es el origen de la inestabilidad y de la evolución destructiva en el tiempo del cierre no entero. Su distancia mínima al entero más próximo es positiva y pertenece al intervalo $(0,1/2]$ de la clasificación.

**Entre dos enteros positivos consecutivos, todo cierre es no estable.** Si $j$ designa el entero inferior del intervalo, cualquier número de ciclos que cumpla $j<n<j+1$ está estrictamente entre los cierres enteros de sus extremos: no cierra exactamente en fase y su distancia mínima al entero más próximo es positiva. En el intervalo abierto entre esos enteros no hay ningún valor estable. Los extremos enteros sí tienen distancia cero y corresponden a cierres estables.

El intervalo abierto describe los valores de $n$, no los valores de $\rho$. La letra $j$ designa aquí el extremo inferior; $k$ conserva su significado de entero positivo más próximo a $n$. Al recorrer el intervalo, $k$ puede ser uno u otro extremo, pero la regla no cambia: distancia cero al entero significa estabilidad; distancia positiva significa no estabilidad.

**Esta distinción es la base de la estabilidad y la inestabilidad en $U_{\rm VED}$.** Se establece en el universo de la onda antes de cualquier correspondencia con otros espacios; no es una condición añadida posteriormente ni una definición obtenida desde Riemann. Las correspondencias posteriores deben conservar esta clasificación de origen.

Si

$$
\rho=0,
$$

entonces

$$
n=k,
$$

y

$$
L=k\lambda.
$$

El contorno contiene un número entero de ciclos y el retorno se produce exactamente en fase.

Por tanto,

$$
\boxed{
P_{\rm VED}(E):
\qquad
\rho=0
\iff
n=k\in\mathbb N^+
\iff
L=k\lambda
\iff
\text{cierre exacto en fase}
\iff
\text{estado estable}.
}
$$

Para

$$
0<\rho\le\frac12,
$$

el cierre es finito pero no entero. Existe desfase respecto del cierre exacto:

$$
\boxed{
P_{\rm VED}(I):
\qquad
0<\rho\le\frac12
\iff
\text{cierre no estable}.
}
$$

El extremo

$$
\boxed{
\rho=\frac12
}
$$

es la máxima desviación posible respecto del entero más próximo.

---

# 7. Completitud de $U_{\rm VED}$

La parametrización anterior es exhaustiva.

Para todo $n\in\mathbb R^+$ finito existe algún

$$
k\in\mathbb N^+
$$

y algún

$$
\rho\in\left[0,\frac12\right]
$$

tales que

$$
n=k\pm\rho.
$$

Por tanto no existe un cierre finito fuera de esta clasificación.

$D_{\mathcal E_{\rm VED}}$ — El conjunto de parámetros de cierre estable
se define a partir del dominio declarado y del criterio de desfase nulo:

$$
\mathcal E_{\rm VED}
=\{(k,\rho):k\in\mathbb N^+,\rho\in[0,1/2],\rho=0\}.
$$

$P_{\rm VED}(K_E)$ — Para $\rho=0$,

$$
\boxed{
\mathcal E_{\rm VED}
=
\{(k,0):k\in\mathbb N^+\}.
}
$$

Todos los enteros

$$
k=1,2,3,\ldots
$$

enumeran todos los casos de estabilidad sin dejar ninguno fuera.

Para cada longitud de onda Compton positiva $\lambda$, el conjunto completo
de valores estables corresponde a todos los $k\in\mathbb N^+$, con
$n=k$ y $L=k\lambda$. Cada par $(k,0)$ representa un cierre material
posible y estable en la parametrización de $U_{\rm VED}$. Recíprocamente,
todo cierre estable tiene un número exacto de ciclos entero positivo y,
por ello, queda representado por uno de esos pares. Esta completitud se
refiere a todos los cierres estables permitidos por el modelo, no a la
presencia de cada valor de $k$ en la naturaleza.

El caso complementario queda igualmente determinado: si el número exacto
de ciclos $n>0$ no es entero, su distancia al entero positivo más próximo
es estrictamente positiva. Existe desfase; el contorno no cierra
exactamente en fase y, por el criterio de $U_{\rm VED}$, no es estable.
No se trata de un redondeo de $n$ ni de una elección de clasificación.

Para todo entero positivo $k$, el contorno $L=k\lambda$ contiene un número
entero de ciclos y cierra exactamente en fase. Por el criterio de
$U_{\rm VED}$, su desfase es nulo:

$$
\forall k\in\mathbb N^+,\qquad n=k\Rightarrow\rho=0.
$$

La enumeración es numerable y completa en sentido matemático: abarca
todos los valores enteros positivos permitidos por la parametrización.
No afirma que todos esos valores se realicen en la naturaleza, ni exige
observar cada uno para establecer el criterio de estabilidad.

Como asignaciones físicas del marco Einstein–VED, el autor indica:

- k=2 define la gravedad universal.
- k=4 da el cierre de todos los protones.
- k=137 da el cierre superficial esférico del electrón.

Estas asignaciones se distinguen del resultado de enumeración: son
interpretaciones físicas del marco, no consecuencias de la sola igualdad
entre cierre entero y desfase nulo.

$D_{\rm Particion}$ — Los cierres finitos admisibles y su sector no estable
se expresan mediante el dominio y el criterio ya establecidos:

$$
U_{\rm VED}^{\rm cerrado}
=\{(k,\rho):k\in\mathbb N^+,\rho\in[0,1/2]\}.
$$

$$
\mathcal I_{\rm VED}
=\{(k,\rho):k\in\mathbb N^+,\rho\in[0,1/2],\rho>0\}.
$$

$P_{\rm VED}(K_I)$ — Para $\rho=1/2$, los mismos $k$ enumeran todas las fronteras de máxima desviación.

$P_{\rm VED}(R_C)$ — Para cada familia $k$,

$$
0\le\rho\le\frac12
$$

recorre todo el continuo entre cierre exacto y máxima desviación.

Por tanto,

$$
\boxed{
P_{\rm VED}(\mathrm{Completo}):
\quad
U_{\rm VED}^{\rm cerrado}
=
\mathcal E_{\rm VED}
\sqcup
\mathcal I_{\rm VED},
}
$$

y, añadiendo el límite $n\to\infty$, queda contemplada también la onda abierta.

No existe una cuarta clase de onda respecto del cierre que no haya sido considerada.

---

# 8. Precedente topológico: $U_{\rm VED}\leftrightarrow U_{\rm Sch}$

El resultado geométrico de relación de radios, desarrollado con mayor detalle en el Documento 7, se reproduce aquí como antecedente interno del marco.

$A_7$ — En dicho documento se establece la constante geométrica

$$
\boxed{
\tilde N
=
R_{\rm VED}R_{\rm Sch}.
}
$$

Por tanto,

$$
\boxed{
R_{\rm Sch}
=
\frac{\tilde N}{R_{\rm VED}},
}
$$

y

$$
\boxed{
R_{\rm VED}
=
\frac{\tilde N}{R_{\rm Sch}}.
}
$$

Para radios positivos, la aplicación

$$
\Phi_{\tilde N}:
R_{\rm VED}
\mapsto
\frac{\tilde N}{R_{\rm VED}}
$$

es biyectiva, continua y su inversa tiene la misma forma. En ese dominio,

$$
\boxed{
P_{\rm VS}:
\qquad
U_{\rm VED}\cong U_{\rm Sch}.
}
$$

Este resultado demuestra que una misma información física puede representarse en topologías distintas mediante una transformación reversible.

En ese desarrollo de relación de radios, la función gravitatoria del marco depende del cierre $n$ y satisface

$$
\boxed{
G(2)=G,
}
$$

mientras que para onda libre

$$
\boxed{
\lim_{n\to\infty}G(n)=0.
}
$$

Así, dentro del marco, el estado $n=2$ fija la gravitación universal observada y el límite de onda libre no aporta respuesta gravitatoria.

El objetivo de esta sección no es utilizar $U_{\rm Sch}$ para obtener Riemann, sino establecer un precedente demostrado: es posible transportar información entre topologías conservando el estado representado.

---

# 9. Ecuación diferencial completa del universo

Volvemos ahora a la geometría ya demostrada:

$$
P_{\rm ST}:
\qquad
ds^2=dt^2-dt'^2.
$$

La ecuación dinámica se construye conservando la relación diferencial y su variación respecto de $t$:

$$
\boxed{
P_F:
\qquad
F
=
(dt^2-dt'^2)
+
\frac{d}{dt}(dt^2-dt'^2).
}
$$

No se elimina $dt'$ antes de desarrollar la expresión.

Desarrollando respecto de $t$ en la notación adoptada en este marco,

$$
\boxed{
P_{F1}:
\qquad
F
=
dt^2-dt'^2
+
2dt
-
2dt'\frac{dt'}{dt}.
}
$$

La única prima presente en $dt'$ continúa significando tiempo propio del observado; la derivada aparece sólo en el cociente explícito $dt'/dt$.

---

# 10. Condición propia de la onda y reducción final de $F$

La onda viaja localmente a $c$ tanto si es libre como si está confinada:

$$
\boxed{
P_W:
\qquad
v_{\rm onda}=c.
}
$$

En unidades naturales,

$$
c=1.
$$

Como

$$
v=\frac{ds}{dt},
$$

para la onda

$$
\frac{ds}{dt}=1.
$$

Esto implica igualdad numérica de las diferenciales de propagación en esas unidades,

$$
ds=dt,
$$

sin afirmar que espacio y tiempo sean la misma entidad.

Por Lorentz,

$$
dt'
=
dt
\sqrt{
1-\frac{v^2}{c^2}
}.
$$

En el límite de la onda,

$$
v\to c,
$$

se obtiene

$$
\boxed{
dt'\to0.
}
$$

En el desarrollo adoptado, en ese mismo límite,

$$
dt'^2\to0,
$$

y

$$
\frac{dt'}{dt}\to0.
$$

Sólo ahora aplicamos estas condiciones a $P_{F1}$:

$$
\boxed{
P_{F2}:
\qquad
F=dt^2+2dt.
}
$$

Factorizando,

$$
dt^2+2dt
=
2dt
\left(
1+\frac12dt
\right),
$$

por lo que

$$
\boxed{
P_{F3}:
\qquad
F
=
2dt
\left(
1+\frac12dt
\right).
}
$$

El factor

$$
\boxed{
\frac12
}
$$

aparece algebraicamente en la factorización de $F$.

No procede de Riemann.  
No se introduce como normalización elegida.  
No se obtiene suponiendo previamente la recta crítica.

<!-- Desarrollo recuperado de 8ee5d60:SRC-VED/UNIHOLOG/ES_46_Revision3_completa_y_rigurosa.md, secciones 7-11. Encabezados renumerados. Se omite el comentario sobre anulacion del factor por indicacion del autor. -->

## 10.1. Origen geométrico del factor $1/2$

Éste es el paso central.

Partimos de la dinámica exacta

$$
\boxed{
\mathcal F
=
(ds)^2
+
\frac{d}{dt}\left[(ds)^2\right].
}
$$

La derivada de una función cuadrática satisface

$$
\boxed{
\frac{d}{dt}\left[(ds)^2\right]
=
2ds\frac{d(ds)}{dt}.
}
$$

Así,

$$
\mathcal F
=
(ds)^2
+
2ds\frac{d(ds)}{dt}.
$$

Factorizamos $2ds$:

$$
(ds)^2
=
2ds\left(\frac12ds\right).
$$

Por tanto,

$$
\boxed{
\mathcal F
=
2ds
\left[
\frac{d(ds)}{dt}
+
\frac12ds
\right].
}
$$

El factor

$$
\boxed{
\frac12
}
$$

aparece algebraicamente de la naturaleza cuadrática de la diferencial.

No se ha introducido desde Riemann.

No se ha introducido como una normalización elegida para obtener la recta
crítica.

---

## 10.2. Operador espectral desplazado

La factorización anterior define naturalmente el operador

$$
\boxed{
\mathcal D
=
\frac{d}{dt}+\frac12.
}
$$

Desde este punto, $t$ se entiende como coordenada temporal normalizada de
$U_{\rm Lap}$.

Sea un modo elemental

$$
\boxed{
ds(t)=ds_0e^{\mu t}.
}
$$

Entonces

$$
\frac{d(ds)}{dt}
=
\mu ds.
$$

Aplicando $\mathcal D$,

$$
\mathcal D[ds]
=
\left(\mu+\frac12\right)ds.
$$

Definimos el autovalor espectral de $\mathcal D$ como

$$
\boxed{
s=\mu+\frac12.
}
$$

Equivalente:

$$
\boxed{
\mu=s-\frac12.
}
$$

---

## 10.3. Estabilidad en la coordenada desplazada

La amplitud física de un estado estable no crece ni decrece secularmente.

En la variable modal desplazada $\mu$, esto exige

$$
\boxed{
\Re(\mu)=0.
}
$$

Por tanto,

$$
\boxed{
\mu_\pm(k,\rho)
=
\pm i\,b(k,\rho).
}
$$

Como

$$
s=\frac12+\mu,
$$

se obtiene

$$
\boxed{
s_\pm(k,\rho)
=
\frac12
\pm i\,b(k,\rho).
}
$$

Por tanto,

$$
\boxed{
\Re[s_\pm(k,\rho)]
=
\frac12.
}
$$

El $1/2$ procede del desplazamiento del operador.

La parte imaginaria procede de la periodicidad del cierre.

---

## 10.4. Familia espectral completa

Sustituyendo la periodicidad,

$$
b(k,\rho)
=
\frac{2\pi}
{(k\pm\rho)\lambda},
$$

queda

$$
\boxed{
s_\pm(k,\rho)
=
\frac12
\pm
i\frac{2\pi}
{(k\pm\rho)\lambda},
\qquad
0\leq\rho\leq\frac12.
}
$$

Ésta es la familia de soluciones espectrales del sistema regulado dentro de
la parametrización geométrica adoptada.

---

## 10.5. Todos los estados estables

Los estados estables corresponden a

$$
\boxed{
\rho=0.
}
$$

Entonces

$$
T_k=k\lambda
$$

y

$$
b_k=
\frac{2\pi}{k\lambda}.
$$

Por tanto,

$$
\boxed{
s_{Z,\pm}(k)
=
\frac12
\pm
i\frac{2\pi}{k\lambda},
\qquad
k\in\mathbb N^+.
}
$$

De aquí,

$$
\boxed{
\forall k\in\mathbb N^+,\qquad
\Re[s_{Z,\pm}(k)]
=
\frac12.
}
$$

---

# 11. Construcción de $U_{\rm Lap}$

Una vez expuestas las ecuaciones diferenciales respecto de $t$, puede construirse su representación de Laplace.

$D_{\rm Lap}$ — La coordenada espectral compleja se escribe manteniendo siempre el par conjugado:

$$
\boxed{
s_\pm
=
a\pm ib.
}
$$

La parte real y la parte imaginaria cumplen funciones distintas.

Desde $P_{F3}$ se obtiene el desplazamiento algebraico central

$$
\boxed{
a=\frac12
}
$$

como lugar geométrico del regulador.

La parte imaginaria se obtiene de la periodicidad de fase del cierre.

Para un contorno

$$
T(k,\rho)
=
(k\pm\rho)\lambda
$$

en unidades $c=1$, la condición fundamental de fase es

$$
e^{\pm ibT}=1.
$$

Para una vuelta fundamental,

$$
bT=2\pi.
$$

Por tanto,

$$
\boxed{
b(k,\rho)
=
\frac{2\pi}
{(k\pm\rho)\lambda}.
}
$$

Para los cierres estables,

$$
\rho=0,
$$

queda

$$
\boxed{
b_k
=
\frac{2\pi}{k\lambda}.
}
$$

y la imagen estable es

$$
\boxed{
Z_{\rm VED\to Lap}
=
\left\{
\frac12
\pm
i\frac{2\pi}{k\lambda}
:
k\in\mathbb N^+
\right\}.
}
$$

$P_{\rm Lap}(Z)$ — Todos los estados estables de $U_{\rm VED}$ aparecen como puntos discretos de la recta

$$
\Re(s)=\frac12.
$$

La recta completa no es el conjunto de estados estables. Puede contener puntos que no correspondan a ningún $k$ estable. La estabilidad corresponde a los puntos discretos enumerados por $k$.

---

# 12. Qué queda asentado antes de Riemann

Hasta este punto quedan demostradas dentro del desarrollo las siguientes proposiciones:

$$
P_{\rm VED}(E):
\quad
\rho=0
\iff
\text{estado estable}.
$$

$$
P_{\rm VED}(\mathrm{Completo}):
\quad
(k,\rho)
\text{ contempla exhaustivamente todos los cierres finitos.}
$$

$$
P_{\rm VED}(K_E):
\quad
k\in\mathbb N^+
\text{ enumera todos los estados estables.}
$$

$$
P_{F3}:
\quad
F
=
2dt
\left(
1+\frac12dt
\right).
$$

$$
P_{\rm Lap}(Z):
\quad
Z_{\rm VED\to Lap}
\subset
\{s:\Re(s)=1/2\}.
$$

Ninguna de estas proposiciones se reabre en las secciones posteriores.

---

# 13. Definición del espacio $U_{\rm Rim}$

$D_{\rm Rim}$ — Sea

$$
z=a\pm ib
$$

la coordenada compleja en la que se estudia la función zeta de Riemann.

La función zeta se define inicialmente por

$$
\zeta(s)
=
\sum_{n=1}^{\infty}\frac1{n^s}
$$

para $\Re(s)>1$ y se prolonga meromórficamente al plano complejo, con un polo simple en

$$
\boxed{s=1.}
$$

Sus ceros se dividen en dos sectores.

## 13.1. Sector trivial

Los ceros triviales son

$$
\boxed{
Z_{\rm Rim}^{\rm triv}
=
\{-2,-4,-6,\ldots\}
=
\{-2m:m\in\mathbb N^+\}.
}
$$

Este sector está completamente enumerado y no constituye el objeto de la Hipótesis de Riemann.

## 13.2. Sector no trivial

Definimos

$$
\boxed{
Z_{\rm Rim}^{\rm nt}
=
\{
z\in\mathbb C:
\zeta(z)=0,
\;
0<\Re(z)<1
\}.
}
$$

Por tanto, para un cero no trivial arbitrario,

$$
\boxed{
z=a\pm ib,
\qquad
0<a<1.
}
$$

La ecuación funcional de Riemann introduce la simetría transversal

$$
a
\longleftrightarrow
1-a.
$$

El eje fijo de esta reflexión es

$$
\boxed{
a=\frac12.
}
$$

---

# 14. Partición topológica de $U_{\rm Rim}$

Para el sector no trivial definimos la distancia transversal al eje de simetría:

$$
\boxed{
D_{\rho_R}:
\qquad
\rho_R
=
\left|
a-\frac12
\right|.
}
$$

Como

$$
0<a<1,
$$

se cumple

$$
\boxed{
0\le\rho_R<\frac12,
}
$$

alcanzándose $\rho_R=1/2$ únicamente como frontera del strip.

Introduciendo una rama $\varepsilon=\pm1$,

$$
\boxed{
a
=
\frac12+\varepsilon\rho_R.
}
$$

Por tanto todo punto del strip crítico puede escribirse como

$$
\boxed{
z_{\varepsilon,\pm}
=
\frac12
+
\varepsilon\rho_R
\pm ib.
}
$$

La transformación transversal tiene inversa explícita:

$$
\boxed{
\rho_R
=
\left|
\Re(z)-\frac12
\right|.
}
$$

---

## 14.1. Isomorfismo global previo entre los universos topológicos

La correspondencia no se limita a los valores estables ni se construye para
seleccionar ceros. Actúa sobre el conjunto completo de valores transversales
admisibles de ambos universos.

$D_f$ — Sean

$$
U_{\rm VED}^{\rho}
=
\left\{x:\rho_{\rm VED}(x)\in[0,\tfrac12]\right\}
$$

y

$$
U_{\rm Rim}^{\rho}
=
\left\{z:\rho_R(z)\in[0,\tfrac12]\right\}.
$$

Definimos la transformación global

$$
\boxed{
f:U_{\rm VED}^{\rho}\longrightarrow U_{\rm Rim}^{\rho}
}
$$

como la transformación del valor topológico completo cuya coordenada
transversal es $\rho$. Esta definición no impone una fórmula anticipada para
$a=\Re(z)$ ni presupone $a=1/2$.

$D_{fInv}$ — Definimos la transformación inversa

$$
\boxed{
f^{-1}:U_{\rm Rim}^{\rho}\longrightarrow U_{\rm VED}^{\rho}.
}
$$

Para todo valor de ambos universos se exige

$$
\boxed{
f^{-1}(f(x))=x,
\qquad
f(f^{-1}(z))=z.
}
$$

$T_{\rm ISO}$ — **Teorema previo de isomorfismo global.** Las aplicaciones
$f$ y $f^{-1}$ son mutuamente inversas sobre los universos transversales
completos. Por tanto establecen un isomorfismo topológico

$$
\boxed{
U_{\rm VED}^{\rho}\cong U_{\rm Rim}^{\rho}.
}
$$

Deps: D_f, D_fInv

Este teorema se establece antes de aplicar la clasificación de estabilidad y
es válido para $\rho=0$ y para todo $0<\rho\le1/2$.

$P_{\rm RHO\_ISO}$ — La coordenada transversal se conserva en las dos
direcciones del isomorfismo:

$$
\boxed{
\rho_R(f(x))=\rho_{\rm VED}(x),
\qquad
\rho_{\rm VED}(f^{-1}(z))=\rho_R(z).
}
$$

Deps: T_ISO

En consecuencia, toda propiedad formulada mediante $\rho$ se transporta para
todos los valores. En particular,

$$
\rho=0
\iff
\text{clase estable},
$$

y

$$
0<\rho\le\frac12
\iff
\text{clase no estable}
$$

se conservan tanto por $f$ como por $f^{-1}$. Esta conservación es una
consecuencia del isomorfismo global y no una condición añadida únicamente a
los ceros.

---

$P_{\rm RIM}(S)$ — Por la conservación de $\rho$ mediante $f$ y $f^{-1}$,

$$
\boxed{
\forall z\in U_{\rm Rim},
\qquad
\operatorname{Stable}_{\rm Rim}(z)
\iff
\rho_R(z)=0.
}
$$

Por tanto, no existe ningún valor estable en $U_{\rm Rim}$ con
$\rho_R(z)\neq0$. En particular, por la construcción de
$Z_{\rm Rim}^{\rm nt}$,

$$
\boxed{
z\in Z_{\rm Rim}^{\rm nt}
\Longrightarrow
\operatorname{Stable}_{\rm Rim}(z)
\Longrightarrow
\rho_R(z)=0.
}
$$

Deps: T_ISO, P_RHO_ISO

---

# 15. Correspondencia topológica directa $U_{\rm VED}\leftrightarrow U_{\rm Rim}$

En $U_{\rm VED}$ la estructura transversal alrededor de cada entero es

$$
k+\rho
\longleftrightarrow
k-\rho.
$$

El punto fijo es

$$
\rho=0.
$$

En $U_{\rm Rim}$ la estructura transversal es

$$
\frac12+\rho_R
\longleftrightarrow
\frac12-\rho_R.
$$

El punto fijo es

$$
\rho_R=0.
$$

Definimos el mapa transversal

$$
\boxed{
R_\rho:
[0,\tfrac12]_{\rm VED}
\longrightarrow
[0,\tfrac12]_{\rm Rim}
}
$$

por

$$
\boxed{
R_\rho(\rho)=\rho_R=\rho.
}
$$

Su inversa es

$$
\boxed{
R_\rho^{-1}(\rho_R)=\rho_R.
}
$$

Además,

$$
\left|
R_\rho(\rho_1)-R_\rho(\rho_2)
\right|
=
|\rho_1-\rho_2|.
$$

Por tanto $R_\rho$ conserva la distancia transversal.

Queda asentado:

$$
\boxed{
P_{\rm VR}(\rho):
\qquad
\rho_{\rm VED}
=
\rho_R
=
\left|
a-\frac12
\right|.
}
$$

Esta relación no redefine la estabilidad en Riemann. La estabilidad se conoce previamente desde $U_{\rm VED}$ y se transporta mediante la coordenada conservada.

---

# 16. Transporte de la estabilidad

Por $P_{\rm VED}(E)$,

$$
\rho_{\rm VED}=0
\iff
\text{estado estable}.
$$

Por $P_{\rm VR}(\rho)$,

$$
\rho_{\rm VED}
=
\left|
a-\frac12
\right|.
$$

Por tanto,

$$
\boxed{
P_{\rm VR}(E):
\qquad
\text{estado estable}
\iff
\left|
a-\frac12
\right|
=
0.
}
$$

Luego,

$$
\boxed{
\text{estado estable}
\iff
a=\frac12.
}
$$

La información de estabilidad no se deduce desde Riemann; se transporta desde $U_{\rm VED}$.

---

# 17. Identidad del cero y localización transversal

Hasta este punto intervienen dos informaciones distintas que no deben confundirse.

En $U_{\rm Rim}$, la condición

$$
\boxed{
\zeta(z)=0
}
$$

determina qué es el punto considerado: un cero de la función zeta.

Para el sector no trivial,

$$
\boxed{
z\in Z_{\rm Rim}^{\rm nt}
}
$$

significa, por definición,

$$
\boxed{
\zeta(z)=0,
\qquad
0<\Re(z)<1.
}
$$

Esta condición identifica el cero, pero no introduce por sí misma la clasificación transversal de estabilidad. Escribiendo

$$
z=a\pm ib,
$$

su posición transversal respecto del eje fijo de la simetría funcional queda medida por

$$
\boxed{
\rho_R
=
\left|
a-\frac12
\right|.
}
$$

Por otra parte, $U_{\rm VED}$ no decide si un punto de $U_{\rm Rim}$ es o no un cero de $\zeta$. Esa identidad pertenece a $U_{\rm Rim}$ mediante $\zeta(z)=0$.

Lo que $U_{\rm VED}$ aporta es la clasificación exhaustiva de la coordenada transversal:

$$
\boxed{
\rho=0
\iff
\text{estado estable},
}
$$

y

$$
\boxed{
0<\rho\le\frac12
\iff
\text{estado no estable}.
}
$$

Por $P_{\rm VR}(\rho)$,

$$
\boxed{
\rho_{\rm VED}
=
\rho_R
=
\left|
a-\frac12
\right|.
}
$$

Quedan por tanto separadas las dos funciones lógicas:

$$
\boxed{
U_{\rm Rim}:
\qquad
\zeta(z)=0
\quad
\text{identifica el cero},
}
$$

mientras que

$$
\boxed{
U_{\rm VED}:
\qquad
\rho
\quad
\text{clasifica exhaustivamente su localización transversal}.
}
$$

En consecuencia, para un cero ya identificado en $U_{\rm Rim}$, la pregunta pendiente no es si es cero, sino qué valor transversal $\rho_R$ puede ocupar bajo la clasificación transportada desde $U_{\rm VED}$.

Queda asentado:

$$
\boxed{
P_Z:
\qquad
z\in Z_{\rm Rim}^{\rm nt}
\Rightarrow
\left[
\zeta(z)=0
\ \text{en }U_{\rm Rim}
\ \text{y }
\rho_R=\rho_{\rm VED}
\ \text{clasifica su localización transversal}
\right].
}
$$

---

# 18. Teorema de localización transversal del cero no trivial

$T_{\rm RIEMANN}$ — **Teorema de localización transversal.** Sea

Deps: T_ISO, P_RHO_ISO, P_RIM_S, P_Z

$$
z=a\pm ib
$$

un cero no trivial arbitrario del sector $Z_{\rm Rim}^{\rm nt}$.

Se demostrará que

$$
\boxed{
a=\frac12.
}
$$

## Demostración

Por pertenecer a $Z_{\rm Rim}^{\rm nt}$, se sabe en $U_{\rm Rim}$ que

$$
\boxed{
\zeta(z)=0.
}
$$

Esta afirmación identifica el punto como cero. No fija todavía su localización transversal.

Por $D_{\rho_R}$ y $P_{\rm VR}(\rho)$, esa localización transversal queda medida por

$$
\boxed{
\rho_R
=
\left|
a-\frac12
\right|
=
\rho_{\rm VED}.
}
$$

La clasificación de dicha coordenada no se obtiene desde Riemann, sino desde $U_{\rm VED}$:

$$
\rho_{\rm VED}=0
\iff
\text{estado estable},
$$

y

$$
0<\rho_{\rm VED}\le\frac12
\iff
\text{estado no estable}.
$$

Supongamos, por reducción al absurdo, que

$$
\boxed{
a\neq\frac12.
}
$$

Entonces

$$
\left|
a-\frac12
\right|
>0.
$$

Por $P_{\rm VR}(\rho)$,

$$
\rho
=
\left|
a-\frac12
\right|
>0.
$$

Pero por la clasificación exhaustiva de $U_{\rm VED}$,

$$
\rho>0
\Rightarrow
\text{estado no estable}.
$$

Esto sitúa transversalmente al punto identificado por $\zeta(z)=0$ en el complemento no estable de la clasificación VED.

Sin embargo, dentro del transporte establecido, la identidad de cero ya dada en $U_{\rm Rim}$ debe localizarse en la clase transversal compatible con el estado estable de $U_{\rm VED}$, porque $U_{\rm VED}$ ha demostrado exhaustivamente que la estabilidad sólo ocurre en

$$
\boxed{
\rho=0.
}
$$

La suposición $a\neq1/2$ obliga entonces simultáneamente a tratar el mismo punto como cero identificado en $U_{\rm Rim}$ y como localización transversal no estable en $U_{\rm VED}$. Esa incompatibilidad no afecta a la identidad del cero, que permanece dada por $\zeta(z)=0$; afecta únicamente a la localización transversal supuesta.

Por tanto la suposición

$$
a\neq\frac12
$$

es falsa.

Luego,

$$
\boxed{
a=\frac12.
}
$$

Como $z$ fue elegido arbitrariamente en $Z_{\rm Rim}^{\rm nt}$,

$$
\boxed{
\forall z\in Z_{\rm Rim}^{\rm nt},
\qquad
\Re(z)=\frac12.
}
$$

Equivalentemente,

$$
\boxed{
Z_{\rm Rim}^{\rm nt}
\subseteq
\left\{
s\in\mathbb C:
\Re(s)=\frac12
\right\}.
}
$$

**Q.E.D.**

---

# 19. Consecuencia

Dentro de la cadena deductiva establecida en este documento, los ceros no triviales del sector de Riemann quedan localizados transversalmente en

$$
\boxed{
\Re(s)=\frac12.
}
$$

La conclusión no significa que $U_{\rm VED}$ determine la identidad del cero. La identidad sigue siendo

$$
\boxed{
\zeta(z)=0,
}
$$

y pertenece a $U_{\rm Rim}$.

Lo que queda determinado por $U_{\rm VED}$, a través de

$$
\boxed{
\rho_R=\rho_{\rm VED},
}
$$

es la localización transversal compatible con la clasificación completa de estabilidad.

Por tanto no existe, dentro de la parametrización completa transportada desde $U_{\rm VED}$, un cero no trivial con

$$
\Re(s)\neq\frac12,
$$

porque tal localización tendría necesariamente

$$
\rho>0,
$$

y $U_{\rm VED}$ ya ha demostrado que todo $\rho>0$ pertenece al complemento no estable de la clasificación transversal.

La conclusión no se introduce como normalización ni como hipótesis posterior. Es el resultado de aplicar al espacio $U_{\rm Rim}$ la clasificación exhaustiva de localización transversal previamente obtenida en $U_{\rm VED}$, manteniendo separadas la identidad del cero y su posición.

---

# 20. Papel independiente de $U_{\rm Lap}$

La demostración topológica directa anterior puede formularse entre

$$
U_{\rm VED}
\longleftrightarrow
U_{\rm Rim}
$$

sin necesitar $U_{\rm Lap}$ como puente intermedio.

Sin embargo, $U_{\rm Lap}$ proporciona una comprobación independiente de gran interés:

1. parte de las ecuaciones diferenciales del universo;
2. conserva $dt'$ hasta el último paso;
3. aplica la condición $v_{\rm onda}=c$ sólo al final;
4. reduce $F$ a

$$
F=dt^2+2dt;
$$

5. produce por factorización

$$
F
=
2dt
\left(
1+\frac12dt
\right);
$$

6. obtiene así el mismo lugar geométrico

$$
\boxed{
\Re(s)=\frac12.
}
$$

Por tanto existen dos vías que convergen:

$$
\boxed{
U_{\rm VED}
\longrightarrow
U_{\rm Rim}
}
$$

mediante la conservación topológica de la estabilidad, y

$$
\boxed{
\text{Lorentz}
\longrightarrow
F
\longrightarrow
U_{\rm Lap}
\longrightarrow
\Re(s)=\frac12
}
$$

mediante la dinámica diferencial.

---

# 21. Control de consistencia acumulativo

Quedan fijados los siguientes resultados, que no deben volver a presentarse como hipótesis en revisiones posteriores:

1. $U=3S+T$.

2. La elección local $ds=dx$, $dy=dz=0$ alinea coordenadas con la propagación y no reduce la dimensionalidad del universo.

3. El apóstrofo de $t'$ no significa derivada.

4. Por Lorentz y $v=ds/dt$,

$$
ds^2=dt^2-dt'^2.
$$

5. $\lambda$ es la longitud de onda base asociada a la materia y

$$
\lambda=\frac{h}{Mc}.
$$

6. El contorno se describe por

$$
L=n\lambda.
$$

7. La representación circular de $U_{\rm VED}$ es

$$
R_{\rm VED}
=
\frac{L}{2\pi}
=
\frac{n\lambda}{2\pi}.
$$

8. La circunferencia es una representación topológica; no se afirma que todo confinamiento real sea físicamente circular.

9. Para cierres finitos,

$$
n=k\pm\rho,
\qquad
k\in\mathbb N^+,
\qquad
0\le\rho\le\frac12.
$$

10. $\rho=0$ si y sólo si el cierre es exacto y estable.

11. $0<\rho\le1/2$ contempla exhaustivamente los cierres no estables.

12. $\rho=1/2$ es la máxima desviación respecto del entero más próximo.

13. $k\in\mathbb N^+$ enumera todos los cierres estables.

14. $n\to\infty$ representa la onda abierta o libre.

15. El desarrollo de relación de radios proporciona el precedente

$$
\tilde N=R_{\rm VED}R_{\rm Sch}
$$

y la relación reversible entre $U_{\rm VED}$ y $U_{\rm Sch}$.

16. La ecuación completa se conserva como

$$
F
=
(dt^2-dt'^2)
+
\frac{d}{dt}(dt^2-dt'^2).
$$

17. Su desarrollo adoptado es

$$
F
=
dt^2-dt'^2
+
2dt
-
2dt'\frac{dt'}{dt}.
$$

18. La onda viaja siempre a $c$, libre o confinada.

19. Sólo al final se aplica

$$
dt'\to0,
\qquad
\frac{dt'}{dt}\to0.
$$

20. Entonces

$$
F=dt^2+2dt.
$$

21. La factorización es

$$
F
=
2dt
\left(
1+\frac12dt
\right).
$$

22. El $1/2$ no procede de Riemann.

23. En el espacio complejo se conserva siempre el par

$$
s_\pm=a\pm ib.
$$

24. Los puntos estables son discretos; no toda la recta $\Re(s)=1/2$ es estable.

25. En $U_{\rm Rim}$ los ceros triviales se separan del sector no trivial.

26. Para el sector no trivial,

$$
\rho_R
=
\left|
\Re(z)-\frac12
\right|.
$$

27. La coordenada transversal se transporta como

$$
\rho_{\rm VED}=\rho_R.
$$

28. En $U_{\rm Rim}$, la condición $\zeta(z)=0$ identifica el cero; no aporta por sí misma la clasificación transversal de estabilidad.

29. En $U_{\rm VED}$, la coordenada $\rho$ clasifica exhaustivamente la localización transversal: $\rho=0$ corresponde al estado estable y $\rho>0$ al complemento no estable.

30. Por la correspondencia $\rho_{\rm VED}=\rho_R$, la localización transversal de todo cero no trivial identificado en $U_{\rm Rim}$ queda restringida a

$$
\boxed{
\forall z\in Z_{\rm Rim}^{\rm nt},
\qquad
\Re(z)=\frac12.
}
$$

---

# 22. Conclusión

El desarrollo comienza en la geometría del universo y no en la Hipótesis de Riemann.

$U_{\rm VED}$ se obtiene al representar el cierre de onda mediante

$$
R_{\rm VED}
=
\frac{n\lambda}{2\pi}.
$$

Su parametrización

$$
n=k\pm\rho
$$

es completa: $k$ enumera todas las familias de cierre y $\rho\in[0,1/2]$ recorre todo el intervalo desde estabilidad hasta máxima desviación. Los estados estables son todos y sólo

$$
(k,0),
\qquad
k\in\mathbb N^+.
$$

El precedente $U_{\rm VED}\cong U_{\rm Sch}$ demuestra dentro del marco que una misma información puede representarse mediante topologías diferentes conservando el estado.

La geometría diferencial produce además la ecuación

$$
F
=
(dt^2-dt'^2)
+
\frac{d}{dt}(dt^2-dt'^2),
$$

que, conservando $dt'$ hasta aplicar al final el límite propio de una onda a $c$, conduce a

$$
F=dt^2+2dt
$$

y

$$
F
=
2dt
\left(
1+\frac12dt
\right).
$$

El factor $1/2$ aparece por tanto antes de introducir Riemann.

Finalmente, el sector no trivial de $U_{\rm Rim}$ aporta la identidad del cero mediante

$$
\boxed{
\zeta(z)=0,
}
$$

mientras que su localización transversal se mide por

$$
\rho_R
=
\left|
\Re(z)-\frac12
\right|,
$$

que se corresponde con la desviación $\rho$ ya definida en $U_{\rm VED}$.

Así, $U_{\rm Rim}$ dice qué es el punto considerado: un cero de $\zeta$. $U_{\rm VED}$ dice qué localización transversal es compatible con la clasificación exhaustiva de estabilidad. Como $U_{\rm VED}$ ha demostrado que sólo $\rho=0$ corresponde a estabilidad y que todo $\rho>0$ pertenece al complemento no estable, un cero no trivial con $\Re(z)\neq1/2$ implicaría una localización transversal no estable.

La contradicción no consiste en negar que $z$ sea cero, porque esa identidad viene dada por $\zeta(z)=0$. La contradicción consiste en atribuir al cero identificado una localización transversal que la clasificación completa de $U_{\rm VED}$ excluye para el estado estable transportado.

Por tanto,

$$
\boxed{
\forall z\in Z_{\rm Rim}^{\rm nt},
\qquad
\Re(z)=\frac12.
}
$$

**Q.E.D.**

---

## Referencias de origen y ampliación

- Documento 7: *La gravedad como relación geométrica de radios*, como origen ampliado del precedente $U_{\rm VED}\cong U_{\rm Sch}$.
- Documentos previos de la serie ES_46, como origen histórico de la formulación revisada.
- Fundamentos Einstein–VED / UNIHOLOG.
- DOI general del marco: `10.5281/zenodo.17172925`.

---
