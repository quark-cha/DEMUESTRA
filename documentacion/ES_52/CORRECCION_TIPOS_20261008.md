# Correcciones de tipos de la herramienta

Se modifica el traductor instalado en DEMUESTRA. Los modulos anteriores estan
en respaldos/traductor_tipos_20261008. No se cambian fuentes cientificas,
certificados, evaluaciones ni resultados del proyecto.

## Defectos corregidos

- Un mapeo cuya salida lleva una condicion de pertenencia no tiene por ello
  codominio Prop: Q: xi -> b in {0,1} devuelve un valor, no una proposicion.
- Una asignacion numerica explicita a C puede usar C como variable del circuito.
  No se confunde con el dominio de los complejos. La notacion mathbb C conserva
  su significado de dominio, igual que mathbb N, Z y R.
- Se admiten conversiones numericas de ampliacion, no conversiones inversas:
  Nat -> Int -> Real -> Complex. Nunca se convierte Prop en un numero.
- norm de un escalar numerico se emite con la norma nativa de Lean y devuelve
  Real. No se sustituye por una funcion arbitraria del contexto.
- Un factor exponencial seguido de parentesis se lee como producto. Se
  conservan las llamadas inversas f^{-1}(x) y las potencias trigonometricas.

## Resultado comprobado

Las 52 pruebas automatizadas pasan. Se compara el codigo matematico generado
para el 46 con el anterior a esta revision: es identico, excluyendo comentarios
que incluyen la fecha de generacion. Los MD del 46 y del 52 conservan sus hashes.

En las 220 formulas del 52, los diagnosticos semanticos bajan de 24 a 7 y los
bloqueos del control inicial de emision de 12 a 3. Esos tres bloqueos son:

- D_REGISTROREF, formula 6: sumatoria sobre varios indices sin dominio explicito.
- D_REGISTROREF, formula 7: familia de operadores con indices concatenados.
- D_OBJETIVORELACIONAL, formula 1: familia de vectores de base dentro de la suma.

No son los unicos limites: siguen sin resolverse cuatro diagnosticos en
expresiones textuales mezcladas con operaciones, un cuantificador sin dominio
inferido y un producto indexado. Superar el control inicial no acreditaria una
traduccion completa ni un certificado.

La representacion generica de matrices, vectores, adjuntos, trazas y dominios
de indices requiere tipos y operaciones estructurados. Que un nombre se
declare como funcion en un contexto no demuestra que implemente una matriz,
una traza o una base vectorial. Esta revision no acredita esos modelos.

## Estado honesto

La traduccion completa del 52 NO ESTA RESUELTA. Los limites anteriores se
atribuyen a la herramienta, no a un error o una refutacion del documento.
No se eliminan formulas, no se fuerzan dominios de indices, no se convierten
vectores u operadores en escalares para conseguir emision y no se emite una
nueva certificacion ni una nueva publicacion.
