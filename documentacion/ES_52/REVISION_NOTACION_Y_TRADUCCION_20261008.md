# Lectura del texto y traduccion tipada

Se ha leido el texto que acompana a las formulas, no solo los errores del
traductor. No se modifica el MD cientifico en esta revision.

## Lo que ya esta expresado

La seccion del registro define D = 2^n, senales complejas y normalizacion.
Tambien especifica instrumentos de medida finitos. Por tanto, decir que el
documento no proporciona ningun dominio para las sumas de Kraus era excesivo.
Los indices se pueden representar mediante conjuntos finitos abstractos;
no es necesario inventar sus cardinalidades ni convertirlos en numeros reales.

La expansion ket(Psi) = sum_j alpha_j e_j representa un vector complejo,
con j en Fin(2^n). Los e_j son los vectores de la base del registro. No debe
traducirse como un producto de escalares reales ni descartarse e_j porque el
traductor no haya registrado la familia de vectores.

## Traduccion de las formulas

TRADUCCION_TIPADA_REGISTRO_Y_BASE.lean contiene una interpretacion en Mathlib:

- complete: sumas finitas sobre el resultado visible y las ramas internas,
  adjunto mediante conjTranspose, multiplicacion de matrices e identidad.
- visibleBranch: sum_nu K(a,nu) rho K(a,nu)^dagger, sin omitir las ramas
  internas y sin conceder acceso a ellas al observador.
- posterior: el inverso escalar de la traza multiplica la matriz anterior.
  Si la traza es cero, no se inventa un estado condicionado; devuelve none.
- expansion: sum_j alpha_j por el vector de base j, mediante multiplicacion
  escalar de vectores. Incluye la instancia de dimension 2^n.

Las ramas pueden tener un conjunto finito diferente para cada resultado
visible. Las definiciones usan matrices de entradas complejas,
no funciones escalares arbitrarias del contexto.

complete es una condicion escrita como predicado, NO un teorema demostrado
para cualquier K. Las pruebas de expansion y del comportamiento de posterior
no prueban la realizacion fisica de V ni la equivalencia operacional completa.
La validez fisica de rho como matriz de densidad y de K como instrumento
corresponde a las condiciones del modelo; estas definiciones no la certifican.

Este archivo separado todavia no esta conectado a toda la emision automatica
de publica.py. No se afirma que el proyecto completo ya se traduzca o certifique.

Validacion: lake env lean termino con salida 0 y sin diagnosticos. El kernel
acepta las definiciones matriciales, las dos reglas de estado posterior y la
identidad de expansion vectorial para dimension d, incluida d = 2^n.

## Escritura a aclarar, sin cambiar la hipotesis

1. Linea 1074: alphae y betae son nombres de comandos LaTeX unidos.
   La expresion pretendida debe escribirse como:

   ket(psi) = alpha e_0 + beta e_1.

   En el MD:

   ```latex
   \operatorname{ket}(\psi)=\alpha e_{0}+\beta e_{1}.
   ```

2. Linea 1182: el texto desarrolla probabilidades condicionadas al historial,
   pero la formula escribe argumentos separados por comas. Si esos argumentos
   denotan probabilidades conjuntas, el producto no es la regla de la cadena.
   La intencion expuesta debe hacerse explicita mediante:

   P_V(a_1,...,a_m | C) = product_k P_V(a_k | a_1,...,a_(k-1), C).

   Esto aclara la notacion de la demostracion ya descrita; no demuestra una
   propiedad fisica nueva ni exige a V algo distinto que a Q.

3. Linea 1572: escribir p_a = tr(sum_nu K(a,nu) rho K(a,nu)^dagger) y
   rho_(a,post) = p_a^(-1) sum_nu K(a,nu) rho K(a,nu)^dagger, para p_a > 0.
   La condicion ya aparece en la parte proyectiva; conviene repetirla para
   las medidas generales. Un resultado imposible no tiene estado posterior
   condicionado definido, en ninguna de las dos maquinas.

Los puntos 2 y 3 precisan una intencion que el texto ya permite reconocer;
no son una refutacion de la hipotesis. El punto 1 es un error de escritura.
