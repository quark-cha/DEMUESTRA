# ES_52: Podemos construir máquinas cuánticas con electrónica convencional

## Computar mediante relaciones sin conocer el valor hasta la medida

**Víctor Estrada Díaz**\
**Einstein-VED --- UNIHOLOG**

------------------------------------------------------------------------

## Resumen

Este trabajo parte de una pregunta muy sencilla: ¿es imprescindible
construir una máquina con componentes específicamente cuánticos para
obtener el comportamiento computacional que buscamos en una máquina
cuántica?

La hipótesis que desarrollo aquí es que no necesariamente.

Propongo una máquina, que denominaré **V**, construible mediante
electrónica convencional, cuyo principio fundamental consiste en
renunciar deliberadamente a conocer los valores internos durante el
proceso de cálculo.

La máquina no almacena `?`.

$$
\boxed{?=\text{valor desconocido}.}
$$

Los valores continúan perteneciendo al dominio lógico:

$$
\{0,1\}.
$$

Mientras no medimos, no conocemos cuál de ellos tenemos. Sin embargo,
desconocer los valores no significa desconocer las **relaciones entre
ellos**.

Podemos conocer, construir y transformar relaciones entre valores
desconocidos. Podemos propagar esas relaciones, introducir retardos,
fases, excitaciones, inhibiciones y composiciones sin realizar una
medida intermedia.

Solamente cuando imponemos una medida en:

$$
t=t_0
$$

obtenemos necesariamente:

$$
0\lor1.
$$

La propuesta consiste en someter una máquina cuántica Q y una máquina
convencional V exactamente a las mismas condiciones operacionales y
estudiar si existe alguna operación observable de Q que V no pueda
replicar.

V no pretende simular matemáticamente Q.

$$
\boxed{\text{V replica Q; no simula Q}.}
$$

Lo presentado es una hipótesis de trabajo y una invitación a estudiarla,
discutirla, ampliarla, refutarla o construirla.

------------------------------------------------------------------------

# 1. El origen de la idea

En un computador convencional queremos conocer y controlar los estados
lógicos. Pero podemos construir físicamente un circuito convencional y
**renunciar a conocer el valor que está recorriendo ese circuito**.

Un transistor no necesita que un observador conozca el valor sobre el
que actúa. Una puerta NOT tampoco.

Si $A=?$, podemos construir físicamente:

$$
B=\neg A
$$

sin medir previamente A. Entonces:

$$
A=?,\qquad B=?,
$$

pero conocemos:

$$
\boxed{A\neq B.}
$$

o:

$$
A\oplus B=1.
$$

**Podemos desconocer los valores y conocer las relaciones.**

# 2. Qué significa `?`

Escribiremos $A=?$ cuando el valor de A sea desconocido.

$$
\boxed{?\text{ no es un valor}.}
$$

No estamos definiendo $\{0,1,?\}$. El dominio lógico continúa siendo:

$$
\boxed{\{0,1\}.}
$$

`?` no es un tercer estado lógico, un valor almacenado, una señal
electrónica, una superposición que debamos implementar ni una variable
oculta. Es nuestra notación para:

$$
\boxed{\text{valor desconocido}.}
$$

Podemos escribir $K[A]=?$ para hacer explícito que hablamos de nuestro
conocimiento. La máquina no almacena `?`.

# 3. La medida

Al observar A en $t=t_0$ realizamos $M(A,t_0)$ y:

$$
\boxed{M(A,t_0)\in\{0,1\}.}
$$

Nunca $M(A,t_0)=?$. Por tanto:

$$
\boxed{?\xrightarrow{\,M(t=t_0)\,}0\lor1}
$$

expresa que antes desconocemos el valor y después conocemos el
resultado.

# 4. El colapso entendido como medida

Hasta $t=t_0$ no conocemos el resultado. En $t=t_0$ medimos y obtenemos
$0\lor1$.

Para este trabajo basta la consecuencia experimental:

$$
\boxed{\text{antes de medir: resultado desconocido;}}
$$

$$
\boxed{\text{después de medir: resultado conocido.}}
$$

# 5. Dos máquinas: Q y V

Usaremos $Q=\text{máquina cuántica}$ y $V=\text{máquina VED}$.

> **No exigiremos a V una información que no exigimos a Q, ni
> atribuiremos a V un valor que no observamos en Q.**

Antes de medir:

$$
Q(t)=?,\qquad V(t)=?.
$$

Al medir:

$$
M_Q(t_0)\in\{0,1\},\qquad M_V(t_0)\in\{0,1\}.
$$

Así:

$$
\boxed{Q: ?\xrightarrow{t=t_0}0\lor1}
$$

$$
\boxed{V: ?\xrightarrow{t=t_0}0\lor1}
$$

# 6. Computar sin medir valores internos

La propuesta no consiste en ocultar al usuario una variable conocida
internamente. Durante el cálculo no utilizamos la medida de los valores
internos como condición necesaria para continuar.

Si:

$$
A=?,\qquad B=\neg A,\qquad C=B,\qquad D=\neg C,
$$

podemos mantener desconocidos los valores individuales y conocer toda la
estructura relacional. **La información computacional está en las
relaciones.**

# 7. Computar relaciones

Representemos las relaciones por $\mathcal R$. Podemos aplicar
transformaciones:

$$
\mathcal R_0\xrightarrow{T_1}\mathcal R_1\xrightarrow{T_2}\mathcal R_2
\rightarrow\cdots\xrightarrow{T_n}\mathcal R_n.
$$

Mientras:

$$
V_1=?,V_2=?,\ldots,V_n=?.
$$

El principio es:

$$
\boxed{\text{transformar relaciones sin medir los valores relacionados}.}
$$

# 8. Una operación física no necesita conocer su entrada

Para un inversor:

$$
B=\neg A.
$$

No necesita realizar primero $M(A)$. Por tanto:

$$
?\xrightarrow{\mathrm{NOT}}?
$$

no significa que nada haya sucedido: conocemos exactamente la relación
$B=\neg A$, aunque A y B sean desconocidos.

# 9. La función temporal $f(t)$

Introducimos una evolución física $f(t)$. Puede describir la evolución
de la máquina mientras:

$$
V(t)=?
$$

y $\mathcal R(t)$ evoluciona.

La medida selecciona $t=t_0$:

$$
M[V(t_0)]\in\{0,1\}.
$$

El resultado binario procede de haber restringido esta primera V al modo
lógico comparable con un qubit, no de que $f(t)$ sea binaria.

# 10. La neurona biológica como inspiración

Una posible V futura puede parecerse más a una neurona biológica:
múltiples señales excitadoras e inhibidoras, pulsos, trenes temporales,
retardos y realimentación.

Una unidad V podría incorporar:

$$
\text{excitación},\quad
\text{inhibición},\quad
\text{retardo},\quad
\text{fase},\quad
\text{realimentación}.
$$

Este trabajo establece primero el principio, no la construcción
completa.

# 11. La fase $\phi$

La fase debe tratarse simétricamente:

$$
Q\xrightarrow{\phi}Q',\qquad
V\xrightarrow{\phi}V'.
$$

Podemos conocer:

$$
X'=T_\phi(X)
$$

sin conocer X ni $X'$:

$$
X=?,\qquad X'=?.
$$

Por tanto:

$$
\boxed{\text{conocer la transformación}\neq\text{conocer el valor transformado}.}
$$

# 12. Dos caminos y fase relativa

Si:

$$
\phi_B-\phi_A=\phi,
$$

podemos combinar:

$$
R_C\propto e^{i\phi_A}+e^{i\phi_B},
$$

$$
R_D\propto e^{i\phi_A}-e^{i\phi_B}.
$$

Con $\phi_B=\phi_A+\phi$:

$$
R_C\propto e^{i\phi_A}(1+e^{i\phi}),
$$

$$
R_D\propto e^{i\phi_A}(1-e^{i\phi}).
$$

Y:

$$
|1+e^{i\phi}|^2=4\cos^2\left(\frac{\phi}{2}\right),
$$

$$
|1-e^{i\phi}|^2=4\sin^2\left(\frac{\phi}{2}\right).
$$

Esto no determina previamente qué salida observaremos. Antes de medir:

$$
C=?,\qquad D=?.
$$

# 13. Frecuencia no significa causa física probabilística

Tras N experimentos medidos podemos contar $N_0,N_1$ y construir:

$$
F(0)=\frac{N_0}{N},\qquad F(1)=\frac{N_1}{N}.
$$

La comparación operacional pregunta si:

$$
F_Q(0|\phi)=F_V(0|\phi),\qquad
F_Q(1|\phi)=F_V(1|\phi),
$$

o:

$$
P_Q(a|\phi)\stackrel{?}{=}P_V(a|\phi).
$$

# 14. Cada medida constituye un experimento

Una medida en $t=t_0$ y otra en $t=t_1$ son experimentos distintos salvo
preparación explícita que los conecte:

$$
E_0: ?\xrightarrow{t=t_0}0\lor1,
$$

$$
E_1: ?\xrightarrow{t=t_1}0\lor1.
$$

No introducimos una trayectoria conocida que nunca hemos medido.

# 15. Medidas alternativas

Sean $M_0,M_1$ y $x\in\{0,1\}$. Antes:

$$
Q=?,\qquad V=?.
$$

En $t=t_0$:

$$
M_x(Q,t_0)\rightarrow q\in\{0,1\},
$$

$$
M_x(V,t_0)\rightarrow v\in\{0,1\}.
$$

La medida no elegida no recibe por ello un resultado observado. Requiere
otro experimento, que comienza nuevamente con valores desconocidos.

# 16. Dos unidades correlacionadas

Tenemos:

$$
Q_A=?,\quad Q_B=?,\qquad
V_A=?,\quad V_B=?.
$$

Con configuraciones $x,y\in\{0,1\}$, al medir en $t=t_0$ obtenemos
$(a,b)$ con:

$$
a,b\in\{0,1\}.
$$

Construimos:

$$
P_Q(a,b|x,y),\qquad P_V(a,b|x,y).
$$

La condición de replicación es:

$$
\boxed{P_V(a,b|x,y)=P_Q(a,b|x,y).}
$$

# 17. No inventar resultados no medidos

No imponemos a V una tabla previa $(a_0,a_1,b_0,b_1)$ si esos resultados
nunca han sido observados conjuntamente. Cada configuración requiere sus
experimentos y la misma regla se aplica a Q y V.

# 18. Correlaciones observables

Podemos mapear $0\rightarrow-1$, $1\rightarrow+1$ y construir:

$$
E(x,y)=\sum_{a,b}ab\,P(a,b|x,y).
$$

También:

$$
S=E(0,0)+E(0,1)+E(1,0)-E(1,1).
$$

La pregunta es:

$$
\boxed{E_V(x,y)\stackrel{?}{=}E_Q(x,y).}
$$

Si aparece una diferencia observable encontramos un límite; si no, el
paralelismo permanece.

# 19. Composición

Partimos de $V_0=?$ y componemos:

$$
V_n=R_n\circ R_{n-1}\circ\cdots\circ R_1(V_0).
$$

Desde nuestro conocimiento:

$$
\boxed{?\xrightarrow{R_1}?\xrightarrow{R_2}?\xrightarrow{R_3}\cdots\xrightarrow{R_n}?}
$$

y al final:

$$
\boxed{?\xrightarrow{t=t_0}0\lor1.}
$$

# 20. De una unidad a $n$ unidades

Antes de medir:

$$
V_1=?,V_2=?,\ldots,V_n=?.
$$

Con una red:

$$
\mathcal R=\{R_1,R_2,\ldots,R_m\},
$$

podemos conocer $\mathcal R$ sin conocer los valores individuales. Las
relaciones evolucionan:

$$
\mathcal R_0\rightarrow\mathcal R_1\rightarrow\cdots\rightarrow\mathcal R_k,
$$

mientras:

$$
V_i=?\qquad\forall i.
$$

# 21. No existe un `?` almacenado

`?` representa conocimiento, no una palabra física almacenada:

$$
K[V_1]=?,\quad K[V_2]=?,\quad\ldots,\quad K[V_n]=?.
$$

Al medir:

$$
\boxed{\mathbf V(t_0)=(v_1,v_2,\ldots,v_n),\qquad v_i\in\{0,1\}.}
$$

Obtenemos un resultado, nunca `?`.

# 22. La cuestión de los $2^n$ estados

Un sistema de $n$ bits admite matemáticamente $2^n$ combinaciones
posibles, pero V no tiene que representarlas físicamente durante cada
ejecución.

Por ejemplo:

$$
V_2=\neg V_1,\qquad
V_3=V_1,\qquad
V_4=\neg V_3.
$$

No necesitamos construir una tabla de $2^4=16$ combinaciones para
implementar esas relaciones.

$$
\boxed{\text{n valores desconocidos}\neq\text{una representación física de }2^n\text{ estados}.}
$$

# 23. V no representa el vector de estado de Q

Una simulación clásica puede intentar representar:

$$
|\Psi\rangle=\sum_{j=0}^{2^n-1}\alpha_j|j\rangle.
$$

V no necesita almacenar $\alpha_0,\ldots,\alpha_{2^n-1}$. Su
procedimiento es:

$$
\boxed{\mathcal R_0\rightarrow\mathcal R_1\rightarrow\cdots\rightarrow\mathcal R_k
\xrightarrow{t=t_0}(v_1,\ldots,v_n).}
$$

# 24. Replicación, no simulación

V tiene su propia realización física, señales, relaciones, propagación,
tiempo y medida. Exigimos equivalencia de resultados observables:

$$
\boxed{Q\neq_{\mathrm{phys}}V}
$$

mientras investigamos:

$$
\boxed{Q\equiv_{\mathrm{op}}V.}
$$

**Físicamente diferentes, operacionalmente equivalentes.**

# 25. Criterio general de replicación

Para un protocolo C:

$$
P_Q(\mathbf q|C)
$$

y:

$$
P_V(\mathbf v|C).
$$

La replicación operacional exige:

$$
\boxed{P_V(\mathbf v|C)=P_Q(\mathbf q|C).}
$$

Es una afirmación experimentalmente refutable.

# 26. Principio de simetría Q-V

$$
\boxed{\text{No exigir a V lo que no exigimos a Q.}}
$$

Y recíprocamente: no conceder a V información que Q no tenga. La
comparación debe realizarse bajo las mismas reglas.

# 27. Qué hemos encontrado

Hemos considerado valor desconocido, medida binaria, relaciones,
operaciones sin medida intermedia, evolución temporal, propagación, fase
$\phi$, interferencia, frecuencias, medidas alternativas, unidades
relacionadas, configuraciones independientes, correlaciones,
composición, extensión a $n$ unidades y medida conjunta.

No hemos necesitado introducir `?` como estado físico ni medir los
valores intermedios. La información necesaria para continuar la
computación puede residir en las relaciones físicas.

# 28. Una máquina electrónica convencional diferente

Podemos construir una máquina cuyo principio sea:

$$
\boxed{\text{no medir mientras se calcula}.}
$$

Puede usar puertas lógicas, retardos, osciladores, fases, suma y
diferencia, realimentación, pulsos, excitación, inhibición y relaciones
temporales. La novedad puede residir en **la arquitectura y la forma de
utilizar la información**.

# 29. Más allá del qubit

Aquí V se restringe deliberadamente a una salida $0\lor1$ para
compararla con Q. Una arquitectura general V podría admitir estados y
relaciones más ricos, incluido un dominio complejo y arquitecturas
inspiradas en la neurona biológica. Esa extensión queda fuera de este
primer trabajo.

# 30. La pregunta cambia

La pregunta no es «¿cómo simulamos Q?», sino:

> **¿Existe alguna operación observable realizada por Q que una máquina
> V, sometida exactamente a las mismas condiciones de conocimiento,
> propagación y medida, no pueda replicar?**

# 31. Consecuencia potencial

Si V puede reproducir las operaciones relevantes de Q, podríamos
investigar máquinas construidas con:

$$
\boxed{
\text{componentes convencionales}
+\text{valores desconocidos}
+\text{relaciones conocidas}
+\text{propagación}
+\text{medida}
}
$$

para tareas hoy asociadas a arquitecturas cuánticas.

# 32. Qué no estoy afirmando

Este trabajo no presenta todavía una V físicamente construida, una
arquitectura electrónica completa, una ventaja experimental de velocidad
ni una demostración experimental de todos los algoritmos cuánticos.

Establece un principio de construcción y un protocolo de comparación.
Las cuestiones restantes son precisamente las que hacen interesante
construirla.

# 33. Hipótesis de trabajo

> **Una máquina electrónica convencional capaz de mantener desconocidos
> sus valores internos mientras construye, conserva, compone y
> transforma físicamente sus relaciones puede replicar operacionalmente
> una máquina cuántica si, bajo las mismas preparaciones,
> transformaciones y medidas, reproduce las mismas distribuciones
> observables.**

$$
\boxed{Q\equiv_{\mathrm{op}}V}
$$

es la hipótesis que proponemos estudiar.

Su esquema mínimo:

$$
\boxed{
?\xrightarrow{\mathcal R_1}?
\xrightarrow{\mathcal R_2}\cdots
\xrightarrow{\mathcal R_n}?
\xrightarrow{\,t=t_0\,}
0\lor1
}
$$

Y siempre:

$$
\boxed{?=\text{valor desconocido}.}
$$

# 34. Conclusión: una hipótesis de trabajo abierta

La idea presentada en este trabajo es sencilla: **podemos construir una
máquina con electrónica convencional que opere bajo las mismas
condiciones fundamentales que hemos impuesto a una máquina cuántica.**

El punto de partida es:

$$
?=\text{valor desconocido}.
$$

`?` no es un tercer estado, no es un valor almacenado y no pertenece al
dominio lógico de la máquina.

La máquina continúa trabajando con $0$ o $1$, pero renunciamos a conocer
el valor mientras se desarrolla la computación.

Lo que sí podemos conocer y transformar son las relaciones:

$$
\mathcal R_0\rightarrow\mathcal R_1\rightarrow\cdots\rightarrow\mathcal R_n.
$$

Solamente cuando realizamos la medida $t=t_0$ obtenemos:

$$
0\lor1.
$$

Nunca obtenemos `?`.

V no pretende simular matemáticamente Q:

$$
\boxed{\text{V replica Q; no simula Q}.}
$$

Esto abre una posibilidad tecnológica y conceptual: **investigar
máquinas construidas con electrónica convencional capaces de reproducir
operacionalmente aquello para lo que actualmente construimos máquinas
cuánticas**, y explorar arquitecturas V que no tengan por qué quedar
limitadas a la estructura de Q.

Lo presentado aquí es una **hipótesis de trabajo**.

Animo a investigadores en computación cuántica, electrónica, física,
matemáticas e informática a estudiarla, debatirla, intentar refutarla,
ampliarla y, sobre todo, construirla.

No considero este artículo un punto final.

**Es un punto de partida.**

**Queda mucho trabajo por hacer.**

------------------------------------------------------------------------

**Víctor Estrada Díaz**\
Einstein-VED --- UNIHOLOG

**Licencia: CC BY-NC-SA**
