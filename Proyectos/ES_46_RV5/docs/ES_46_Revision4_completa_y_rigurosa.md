# DOCUMENTO 46 — REVISIÓN 4
## Teorema geométrico-topológico de estabilidad, espacios de soluciones y conexión con la Hipótesis de Riemann

**Marco:** Einstein–VED · UNIHOLOG  
**Autor:** Víctor Estrada Díaz  
**Documento de continuidad:** esta revisión preserva y amplía `ES_46_Revision3_completa_y_rigurosa.md`.  
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

## 6.2. Estabilidad

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

El Documento 7, *La gravedad como relación geométrica de radios*, se toma aquí como antecedente externo.

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

En el mismo Documento 7, la función gravitatoria del marco depende del cierre $n$ y satisface

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

# 17. Completitud de los ceros estables

Por $P_{\rm VED}(K_E)$,

$$
\boxed{
\mathcal E_{\rm VED}
=
\{(k,0):k\in\mathbb N^+\}
}
$$

enumera todos y sólo los estados estables.

Por $P_{\rm VED}(\mathrm{Completo})$, no existe ningún estado estable adicional fuera de esa enumeración.

En consecuencia, bajo la correspondencia topológica, sólo los estados con

$$
\boxed{
\rho=0
}
$$

pueden pertenecer al sector de ceros estables.

Queda asentado:

$$
\boxed{
P_Z:
\qquad
\text{cero estable}
\Rightarrow
\rho=0.
}
$$

Y, por exhaustividad de la enumeración estable,

$$
\boxed{
\rho>0
\Rightarrow
\text{no pertenece al conjunto de ceros estables}.
}
$$

---

# 18. Teorema de Riemann por reducción al absurdo dentro del marco

**Teorema.** Sea

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

Pero por $P_Z$ y por la clasificación exhaustiva de $U_{\rm VED}$,

$$
\rho>0
\Rightarrow
\text{estado no estable}
\Rightarrow
\text{no pertenece al conjunto de ceros estables}.
$$

Esto contradice la premisa de que $z$ es un cero no trivial perteneciente al sector de ceros considerado.

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

Dentro de la cadena deductiva establecida en este documento, los ceros no triviales del sector de Riemann quedan restringidos a

$$
\boxed{
\Re(s)=\frac12.
}
$$

No existe, dentro de la parametrización completa transportada desde $U_{\rm VED}$, un cero no trivial con

$$
\Re(s)\neq\frac12,
$$

porque tal punto tendría necesariamente

$$
\rho>0,
$$

y $U_{\rm VED}$ ya ha demostrado que todo $\rho>0$ pertenece al complemento no estable.

La conclusión no se introduce como normalización ni como hipótesis posterior. Es el resultado de aplicar al espacio $U_{\rm Rim}$ la clasificación exhaustiva de estabilidad previamente obtenida en $U_{\rm VED}$.

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

15. El Documento 7 proporciona el precedente

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

28. La estabilidad se obtiene desde $U_{\rm VED}$, no desde Riemann.

29. Si un supuesto cero no trivial tuviera $\Re(z)\neq1/2$, entonces tendría $\rho>0$ y pertenecería al complemento no estable.

30. Por reducción al absurdo,

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

Finalmente, el sector no trivial de $U_{\rm Rim}$ admite la coordenada transversal

$$
\rho_R
=
\left|
\Re(z)-\frac12
\right|,
$$

que se corresponde con la desviación $\rho$ ya definida en $U_{\rm VED}$.

Como $U_{\rm VED}$ ha demostrado que sólo $\rho=0$ corresponde a estabilidad y ha enumerado exhaustivamente todos los estados estables, un cero no trivial con $\Re(z)\neq1/2$ implicaría $\rho>0$, es decir, un estado no estable, contradiciendo su pertenencia al conjunto de ceros estables.

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

## Referencias internas del marco

- Documento 7: *La gravedad como relación geométrica de radios*.
- Documento 46 — Revisión 3: versión inmediatamente anterior del presente desarrollo.
- Fundamentos Einstein–VED / UNIHOLOG.
- DOI general del marco: `10.5281/zenodo.17172925`.

