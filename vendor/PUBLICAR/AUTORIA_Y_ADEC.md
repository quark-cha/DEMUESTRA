# Autoria y formato ADEC

La autoria explicita de un documento o JSON tiene prioridad. La configuracion
privada solo completa documentos sin autor y los datos del mismo autor; nunca
reemplaza a los autores de documentos ajenos. No se presume ausencia de
conflictos de interes ni se confunde el marco teorico con una afiliacion.

Copie `author.env.example` a `author.env` en la raiz de configuracion compartida
(SRC-VED en esta instalacion), o ejecute desde PUBLICAR:

```powershell
python -m PackPublica.autoria
```

`PUBLICAR_CONFIG_ROOT` permite elegir otra raiz. Se leen `.env`, `author.env`
y las variables de entorno AUTHOR_*, en ese orden. No publique los archivos
privados: `*.env` debe permanecer en .gitignore. El ejemplo publico no tiene
una identidad predeterminada. Si falta el nombre, se detiene la generacion con
una indicacion concreta para configurarlo; no se exporta authors vacio.

HTML, JSON y las cabeceras Lean/Prolog conservan autor y ORCID. DOCX y ODT
incluyen el autor en sus metadatos, sin cambiar el cuerpo. La conversion MD
a PDF sigue usando el conversor existente de PUBLICAR, sin requerir fitz ni
PyMuPDF. La correccion de autoria en los JSON no depende de un editor PDF.

El contrato comun comprueba campos, tipos, identificadores, dependencias y
metadatos opcionales de ADEC. No demuestra premisas ni altera proof.status,
claim_scope o las hipotesis competitivas. Los diagnosticos de procedencia no
son refutaciones. La falta de proof.method es un aviso del motor ADEC, no una
autorizacion para inventar un metodo de prueba.

Referencia: [guia oficial ADEC v0.8.6](https://sites.google.com/view/numeriprimi-teoremiecongetture/adec-engine/v0-8-6).
