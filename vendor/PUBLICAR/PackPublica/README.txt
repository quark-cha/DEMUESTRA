UNIHOLOG/
├── publica.py                 ← Punto de entrada
├── htmls/                     ← HTML generado
├── pdfs/                      ← PDF generado
├── docxs/                     ← DOCX generado (y ODT automático)
├── odts/                      ← ODT generado (automático desde DOCX)
├── articulos/                 ← Artículos extraídos de libros
│   ├── htmls/
│   ├── pdfs/
│   ├── docxs/
│   └── odts/
├── logs/                      ← Logs de publicación
│   └── publicacion.log
└── PUBLICAR/                  ← Biblioteca de publicación (paquete)
    └── publicar/
        ├── __init__.py
        ├── base.py            ← Clase base Publicacion (save, logger)
        ├── documento.py       ← Documento (md, nombre, contenido)
        ├── articulo.py        ← Articulo (hereda de Documento)
        ├── libro.py           ← Libro (ensambla .config, .ini, .md, .glo, .bib, .sdi)
        ├── md.py              ← Procesa Markdown → HTML (MathJax + MathML)
        ├── html.py            ← Html (hereda de Publicacion, genera PDF/DOCX/ODT)
        ├── pdf.py             ← Pdf (hereda de Publicacion, genera PDF con Playwright)
        ├── docx.py            ← Docx (hereda de Publicacion, genera DOCX y ODT automático)
        ├── odt.py             ← Odt (hereda de Publicacion, convierte DOCX a ODT)
        └── articulodesdelibro.py ← Artículos extraídos de libros (HtmlArticulo, PdfArticulo, DocxArticulo, OdtArticulo)

## 🔐 Cliente FTP con soporte para `.env`

La clase `FTPClient` puede tomar credenciales de tres formas (en orden de prioridad):

1. **Argumentos explícitos** (siempre tienen prioridad).
2. **Variables de entorno** desde `.env` (con el prefijo que indiques, por defecto `FTP`).
3. **Valores por defecto** (solo si están definidos en el código).

### Ejemplos

```python
# Usar credenciales desde .env (FTP_HOST, FTP_USER, FTP_PASSWORD)
with FTPClient() as ftp:
    ftp.upload("file.txt", "/remote/file.txt")

# Usar otro prefijo (ej. SFTP_HOST, SFTP_USER, SFTP_PASSWORD)
with FTPClient(env_prefix="SFTP") as ftp:
    ftp.upload("file.txt", "/remote/file.txt")

# Usar credenciales explícitas (sobrescriben .env)
with FTPClient(
    host="ftp.misitio.com",
    user="manual_user",
    password="manual_pass"
) as ftp:
    ftp.upload("file.txt", "/remote/file.txt")
Parámetros
host: dirección del servidor FTP.

port: puerto (21 por defecto).

web_root: raíz del servidor (por defecto "/").

user: nombre de usuario.

password: contraseña.

env_prefix: prefijo para buscar en .env (por defecto "FTP").

timeout: tiempo de espera (30 segundos por defecto).

text

---

## 6. Resumen de cambios

1. **Unificar los dos `__init__` en uno solo** que acepte todos los parámetros.
2. **Usar `getattr(env, f"{env_prefix}_HOST", None)`** para leer de `.env`.
3. **El resto de tu código (300 líneas) sigue exactamente igual**, sin tocar nada más.

---

## 7. Código completo del `__init__` unificado

```python
# PUBLICA/ftp_client.py
import os
from pathlib import Path
from typing import Optional
from ftplib import FTP
from . import env

class FTPClient:
    def __init__(
        self,
        host: Optional[str] = None,
        port: int = 21,
        web_root: str = "/",
        user: Optional[str] = None,
        password: Optional[str] = None,
        test_mode: bool = False,
        env_prefix: str = "FTP",
        timeout: int = 30
    ):
        # Credenciales: argumentos explícitos o desde .env
        self.host = host or getattr(env, f"{env_prefix}_HOST", None)
        self.user = user or getattr(env, f"{env_prefix}_USER", None)
        self.password = password or getattr(env, f"{env_prefix}_PASSWORD", None)
        
        if not self.host:
            raise ValueError(f"No se encontró {env_prefix}_HOST en .env ni se pasó como argumento.")
        
        self.port = port
        self.web_root = web_root
        self.test_mode = test_mode
        self.timeout = timeout
        self._ftp = None
        
        # AQUÍ VA EL RESTO DE TU CÓDIGO DE 300 LÍNEAS
        # (métodos connect, upload, download, close, __enter__, __exit__, etc.)
        # Todo queda EXACTAMENTE IGUAL que antes.