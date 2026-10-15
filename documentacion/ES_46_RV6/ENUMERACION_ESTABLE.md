# Enumeracion de cierres estables

La definicion D_mathcal_E_VED recoge el dominio de parametros y el criterio
de desfase nulo del documento: k entero positivo, rho real en [0,1/2], rho=0.
Se mantiene sincronizada en los documentos de DEMUESTRA y UNIHOLOG.

El traductor genera derive_P_VED_K_E a partir de esa definicion. La prueba
establece por inclusion en ambos sentidos que el conjunto resultante es
exactamente {(k,0): k entero positivo}. No presupone esa igualdad ni afirma
que todos los parametros se realicen fisicamente en la naturaleza.

Correcciones del traductor compartido con PUBLICAR:

- La comprension de un conjunto de pares vincula ambos parametros.
- Los tipos de coordenadas se conservan entre declaraciones: (k,0) tiene
  un desfase real cuando pertenece a un conjunto de pares natural-real.
- El indice local de una suma no modifica el tipo del numero de ciclos n.
- Las familias indexadas conservan el tipo de su indice dentro de la suma.

Las pruebas de regresion incluyen el caso sin definicion: en ese caso no
se genera una demostracion de enumeracion. Los ejemplos historicos se
comparan sin la nueva definicion, que tiene pruebas especificas actuales.

Tras esta correccion quedan pendientes de derivacion automatica completa:
P_VR_rho, T_RIEMANN, P_VED_Completo, P_F, P_W y P_F2. Son obligaciones
de formalizacion, no refutaciones del documento. Esta prueba de enumeracion
no certifica por si sola la hipotesis de Riemann.

La verificacion local no publica la web ni sustituye un certificado anterior.

## Verificacion local del 9 de octubre de 2026

- 115 pruebas generales: correctas.
- Archivo completo generado: Lean termina con codigo 0.
- derive_P_VED_K_E depende solo de propext, Classical.choice y Quot.sound;
  no contiene sorry ni axiomas particulares de la enumeracion.
- La salida ejecutable actual coincide con la comprobada por Lean; las
  importaciones de la comprobacion local se limitaron a los modulos usados.
- PUBLICAR y DEMUESTRA usan copias identicas de los tres modulos modificados.
