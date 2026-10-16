# -ES_52: Máquina V: relaciones, medida y comparación sin alterar la propuesta

[Documento principal del proyecto ES_52](./ES_52_Maquina_V_UNIHOLOG.pdf)


Por Víctor Estrada Díaz · Einstein–VED · ES_52

Presento una propuesta de investigación: estudiar una máquina V determinista, construible con electrónica o software convencional, y comparar su comportamiento con una máquina cuántica Q mediante operaciones y protocolos explícitos.

El punto de partida es estudiar cada máquina según su definición. No podemos añadir a V operaciones, mecanismos o exigencias que no forman parte de su diseño y después evaluar esa modificación como si fuera la propuesta original.

## 1. Relaciones conocidas entre valores desconocidos

Un inversor establece:

B = 1 − A

Podemos conocer esta relación sin conocer A ni B. El componente tiene un comportamiento definido y funciona sin que tengamos que observar su entrada.

Desconocer un estado no significa que ese estado no exista. Tampoco convierte el desconocimiento en un mecanismo físico adicional.

Mi propuesta consiste en construir y transformar relaciones entre valores que permanecen desconocidos para nosotros hasta la lectura. V no se define como una simulación de un registro de amplitudes cuánticas ni requiere, por definición, almacenar 2ⁿ amplitudes.

El inversor ilustra este principio. Para establecer el alcance computacional de V hay que examinar las máquinas completas, sus operaciones y los resultados obtenidos.

## 2. Evolución y conocimiento: el papel de f(t)

En Einstein–VED, f es una función interna del espacio-tiempo 3S+T: describe estados en el propio espacio-tiempo. La escritura f(t) considera su dependencia temporal en el contexto estudiado; no introduce un tiempo externo al sistema.

Mi documento ES_2 distingue la existencia de f para todo t ∈ T de la perspectiva interna situada en t₀: el pasado causal determina el estado, mientras el futuro no es accesible como conocimiento desde esa posición temporal. Definido no significa conocido. Esta distinción fundamenta el uso de f en la explicación del desconocimiento previo y de la medida en V.

La medida en t₀ registra el resultado de esa ejecución; no crea por el mero acto de conocer la función interna f. En este planteamiento, el colapso designa la transición del desconocimiento al conocimiento del resultado.

La definición y su desarrollo se encuentran en [ES_2: Determinismo, Indeterminación y Libre Albedrío, apartado 2](https://estradad.es/ver_trabajo.php?trabajo=/teorias/pdf/UNIHOLOG/ES_2_determinismo.pdf) y en [ES_0: Einstein–VED, apartado 2](https://estradad.es/ver_trabajo.php?trabajo=/teorias/pdf/UNIHOLOG/ES_0_Einstein-VED.pdf), ambos accesibles desde mi [catálogo UNIHOLOG](https://estradad.es/catalogo.php?grupo=UNIHOLOG&todas=1).

Tomamos t₀ como el instante en que realizamos la medida. La lectura registra un resultado:

b = Mᵥ(t₀) ∈ {0, 1}

Podemos representar nuestro conocimiento de esa lectura mediante:

Antes de medir: Kᵦ(V) = ξ.

Después de medir: Kᵦ(V) = b.

Aquí Kᵦ representa nuestro conocimiento del resultado de esa ejecución. ξ expresa desconocimiento; no es un tercer estado físico almacenado en V.

El registro informa de lo leído en t₀. No implica conocer automáticamente toda la evolución anterior o posterior del sistema.

## 3. El colapso en este planteamiento

En V, llamo colapso al paso del desconocimiento al conocimiento del resultado mediante su lectura y registro.

La medida observa lo que hay en t₀. No es necesario atribuir al desconocimiento una existencia física ni suponer que el acto de conocer crea retrospectivamente el estado observado.

Esta es mi interpretación del colapso dentro del marco Einstein–VED. La correspondencia con la descripción cuántica debe estudiarse mediante las operaciones y los resultados de cada protocolo; la interpretación, por sí sola, no demuestra equivalencia.

## 4. Estudiar V sin introducir mecanismos ajenos

La construcción propuesta utiliza componentes convencionales de comportamiento definido. No postulo mecanismos físicos adicionales para explicar que el observador desconozca sus valores internos.

Sin embargo, conviene distinguir ese significado de «mecanismo oculto» del uso técnico de «variable oculta» en física. Un parámetro que represente un estado interno determinante de las respuestas puede desempeñar ese papel matemático. La clasificación exige mostrar cómo se corresponde con la arquitectura real; no basta con aplicar una etiqueta.

El desconocimiento previo no demuestra por sí solo ni equivalencia cuántica ni inaplicabilidad de un teorema. Lo decisivo es la estructura concreta de la máquina y del experimento.

## 5. Por qué CHSH no se aplica al protocolo aquí presentado

El protocolo de lectura aquí descrito no contempla configuraciones alternativas de medida. Contempla una lectura definida en t₀:

b = Mᵥ(t₀)

La prueba CHSH requiere correlaciones correspondientes a elecciones alternativas de configuración en dos ramas del experimento. Esas operaciones no están definidas en este protocolo de V.

Introducir respuestas A₀, A₁, B₀ y B₁ como si fueran operaciones disponibles en esta máquina añade una estructura experimental que no se ha propuesto.

Por tanto, CHSH no se aplica a este protocolo de lectura única. No corresponde utilizar esa desigualdad para invalidar el funcionamiento del inversor ni el principio de operar con relaciones entre valores desconocidos.

La razón es la ausencia de la estructura experimental requerida. No es necesario sostener que Bell queda excluido porque V sea determinista o porque interpretemos la probabilidad como desconocimiento.

Si se construyera otra realización de V con configuraciones alternativas y un protocolo de correlaciones, habría que analizar sus condiciones específicas. Esa sería una prueba distinta y debería identificarse como tal.

## 6. Un criterio simétrico para Q y V

La comparación debe definir las operaciones disponibles para ambas máquinas, las condiciones de preparación, las transformaciones y la lectura.

No corresponde exigir a V conocer previamente todos sus valores internos si ese requisito no se exige a Q en la misma prueba. Tampoco corresponde atribuir a V propiedades cuánticas únicamente porque sus resultados sean desconocidos antes de medir.

Ambas deben someterse a criterios comparables de precisión, repetibilidad y recursos. También deben documentarse las conexiones, comunicaciones, tiempos y criterios de selección de resultados necesarios para interpretar la prueba.

Si Q y V realizan la misma tarea bajo el protocolo acordado y cumplen el criterio fijado, el resultado establece una equivalencia operacional para esa tarea y esas condiciones. Su extensión a otras operaciones requiere nuevas pruebas.

## 7. Qué propongo presentar y estudiar

Propongo documentar los pares Q₁/V₁, Q₂/V₂ y Q₃/V₃ mediante correspondencias explícitas, protocolos reproducibles y resultados registrados.

Mi máquina V debe distinguirse de V_ref y de cualquier variante empleada como referencia. Cada resultado debe indicar qué implementación se ha probado.

La investigación debe examinar las relaciones, la evolución temporal y las medidas que realmente define cada máquina. Las objeciones deben referirse a esas operaciones, y las conclusiones deben limitarse al alcance de las pruebas realizadas.

Mi propuesta es estudiar V sin alterar su construcción y comparar Q y V con criterios explícitos y simétricos. El desconocimiento de un valor no niega su existencia; conocer una relación permite operar sin conocer necesariamente sus valores individuales.

— Víctor Estrada Díaz
Einstein–VED · ES_52
ORCID: 0000-0001-9942-1021

## Referencia sobre el alcance de Bell

J. S. Bell (1964), «On the Einstein Podolsky Rosen paradox», Physics Physique Fizika 1, 195–200. https://doi.org/10.1103/PhysicsPhysiqueFizika.1.195


## Contexto: mi explicación del entrelazamiento

En mis documentos también abordo el entrelazamiento desde una perspectiva distinta de la convencional. En Einstein–VED relaciono esta explicación con el origen común (t₀, s₀) y con los límites de los diferenciales del observado:

dt′ → 0 y ds′ → 0

(t₀ + dt′, s₀ + ds′) → (t₀, s₀)

Esta explicación no afirma que el espacio y el tiempo desaparezcan ni atribuye reposo a las partículas. Distingo la relación ds/dt = c del cociente ds′/dt′, que presenta la forma indeterminada 0/0 en el límite señalado.

Remito al desarrollo de mis documentos para conocer el argumento y sus fundamentos. Lo incluyo aquí como contexto conceptual de mi propuesta; la comparación operacional Q–V se realiza mediante los protocolos concretos descritos en este artículo.

Véanse [Explicación Determinista del Entrelazamiento](https://estradad.es/teorias/pdf/ES_Explicaci%C3%B3n_Determinista_del_Entrelazamiento.pdf), [ES_0: Einstein–VED](https://estradad.es/ver_trabajo.php?trabajo=/teorias/pdf/UNIHOLOG/ES_0_Einstein-VED.pdf) y la [colección Einstein–VED / UNIHOLOG en Zenodo](https://doi.org/10.5281/zenodo.17172925). Los trabajos también están disponibles desde mi [catálogo](https://estradad.es/catalogo.php?idioma=ES).

## Documentos del autor: entrelazamiento y marco Einstein–VED

Para conocer mi explicación del entrelazamiento y el contexto geométrico y temporal de esta propuesta, remito a los siguientes trabajos propios. Se citan como desarrollo de mi marco, no como una verificación independiente de la equivalencia Q–V.

1. Víctor Estrada Díaz, **Explicación Determinista del Entrelazamiento**. Documento específico incluido en el catálogo del autor.
   [Consultar documento](https://estradad.es/teorias/pdf/ES_Explicaci%C3%B3n_Determinista_del_Entrelazamiento.pdf).
   [Acceso alternativo desde el catálogo](https://estradad.es/catalogo.php?idioma=ES).

2. Víctor Estrada Díaz, **ES_0: EINSTEIN–VED – El Marco Determinista que Completa el Programa de Einstein**. Exposición general del marco; incluye la función f, la distinción entre realidad y conocimiento y la interpretación geométrica del entrelazamiento.
   [Consultar documento](https://estradad.es/ver_trabajo.php?trabajo=/teorias/pdf/UNIHOLOG/ES_0_Einstein-VED.pdf).

3. **Colección Einstein–VED / UNIHOLOG en Zenodo**, Víctor Estrada Díaz. Referencia del conjunto documental, no DOI individual asignado a cada uno de los textos anteriores.
   [DOI: 10.5281/zenodo.17172925](https://doi.org/10.5281/zenodo.17172925).

Catálogo de trabajos: https://estradad.es/catalogo.php?idioma=ES

Web del autor: https://estradad.es


### Referencia específica de la función interna f

Víctor Estrada Díaz, **ES_2: Einstein–VED: Determinismo, Indeterminación y Libre Albedrío**, apartado 2, «Función f: Definición, Causalidad y Determinación», especialmente 2.3, «Extensión de f a Todo el Espacio-Tiempo».

[Documento ES_2](https://estradad.es/ver_trabajo.php?trabajo=/teorias/pdf/UNIHOLOG/ES_2_determinismo.pdf) · [Catálogo UNIHOLOG](https://estradad.es/catalogo.php?grupo=UNIHOLOG&todas=1) · [Catálogo general](https://estradad.es/catalogo.php?idioma=ES).
