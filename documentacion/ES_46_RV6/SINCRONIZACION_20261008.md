# Integridad y sincronizacion del 46

## Fuente Conservada

Se conserva el Markdown activo de la revision Git 66ad61b. Coincide con
HEAD, con UNIHOLOG/ES_46_RV6.md y con la copia publicada en DEMUESTRA.
No hay diferencias locales en ese Markdown respecto de Git. SHA-256:

`90cf88725aede8ecb78ee7ee7c5acc0f8e0ddc3c83ef5a69f2619fe37d9c71dd`

Frente a 5020154, el cambio cientifico registrado en Git es la adicion
de P_RIM_S y su inclusion entre las dependencias de T_RIEMANN. No se ha
demostrado que esa adicion empeore el documento. No se retira para
recuperar una etiqueta de aprobacion; tampoco se declara aqui demostrada.

## Certificados Y Artefactos

La aprobacion de 5020154 se conserva en historial/5020154, con su propio
Markdown, Lean e informe. Su resultado incluye la hipotesis hCompat.
No se atribuye ese certificado historico al Markdown posterior.

El certificado parcial actual conserva 17 nodos. Su source_sha256
coincide con el Lean activo usando la misma normalizacion de saltos de
linea que emplea el evaluador. El hash de los bytes CRLF es distinto,
pero eso no indica una fuente diferente de la evaluada.

Las copias JSON de evaluaciones y de la ficha publica son identicas.
Los dos informes Lean en Markdown difieren solo en los enlaces relativos
necesarios para sus ubicaciones distintas; no se sobreescriben entre si.

Se verifican por HTTPS, frente a los archivos locales, el Markdown, PDF,
JSON cientifico, JSON extraido, informe Lean, certificado parcial,
auditoria y semaforo del 46: ocho coincidencias exactas.

Se sincroniza UNIHOLOG/pdfs/ES_46_RV6.pdf con el PDF activo de DEMUESTRA.
Su copia anterior se conserva en respaldos/sincronizacion_20261008.
SHA-256 del PDF sincronizado:

`601e7c8ad399c9ad3b04162799af9dcab15c2748ee83d5d18b839d139a6b55f4`

## Alcance De La Comprobacion

Esta comprobacion acredita integridad, procedencia y sincronizacion,
no una nueva demostracion matematica ni certificacion global del 46.
La demostracion global actual sigue pendiente. No se ha sustituido
ningun certificado ni modificado el documento cientifico.

tests/test_integridad_46.py fija esta referencia y comprueba sus fuentes
historicas, el hash del certificado parcial y las copias de los informes.
Una futura modificacion cientifica exige revisar expresamente la referencia.
