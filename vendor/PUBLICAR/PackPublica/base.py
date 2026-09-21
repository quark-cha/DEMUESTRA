from pathlib import Path
import logging
import sys
import io

# ---------------------------------------------------------------------
# Forzar stdout a UTF-8 para que los logs en consola muestren acentos
# ---------------------------------------------------------------------
if hasattr(sys.stdout, 'buffer'):
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8', errors='replace')

# ---------------------------------------------------------------------
# Configuración del logger (se ejecuta solo una vez)
# ---------------------------------------------------------------------
_logger = None

def _get_logger():
    global _logger
    if _logger is not None:
        return _logger

    # Crear carpeta logs/ si no existe
    log_dir = Path("logs")
    log_dir.mkdir(exist_ok=True)
    log_file = log_dir / "publicacion.log"

    # Configurar logger
    logger = logging.getLogger("Publicacion")
    logger.setLevel(logging.INFO)

    # Handler para archivo (ya con UTF-8)
    fh = logging.FileHandler(log_file, encoding="utf-8")
    fh.setLevel(logging.INFO)

    # Handler para consola (usa sys.stdout, que ahora es UTF-8)
    ch = logging.StreamHandler(sys.stdout)
    ch.setLevel(logging.INFO)

    # Formato con fecha y mensaje
    formatter = logging.Formatter(
        "%(asctime)s - %(name)s - %(levelname)s - %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S"
    )
    fh.setFormatter(formatter)
    ch.setFormatter(formatter)

    logger.addHandler(fh)
    logger.addHandler(ch)

    _logger = logger
    logger.info("=" * 50)
    logger.info("Sistema de publicación inicializado.")
    logger.info(f"Log guardado en: {log_file.resolve()}")
    return logger


# ---------------------------------------------------------------------
# Clase base Publicacion
# ---------------------------------------------------------------------
class Publicacion:
    """
    Clase base para formatos de publicación.
    Las subclases solo deben definir:
        - carpeta_salida (str): ej. "htmls"
        - extension (str): ej. ".html"
    """
    carpeta_salida = None
    extension = None

    def __init__(self, documento=None):
        self.documento = documento   # Referencia al documento original (opcional)
        self.origen = None           # Referencia al objeto Md (para obtener el nombre)
        self.contenido = ""          # Aquí se almacena el contenido (str o bytes)
        self.logger = _get_logger()  # Logger compartido
        
    

    def save(self, fichero=None):
        """
        Guarda el contenido en disco.
        - Si no se da fichero: usa carpeta_salida + nombre_base + extension.
        - Si se da fichero: usa esa ruta (crea carpetas automáticamente).
        """
        self.logger.info(f"Iniciando guardado de {self.__class__.__name__}")

        # Validar que la subclase tenga configurado su destino
        if self.carpeta_salida is None:
            raise NotImplementedError(
                f"{self.__class__.__name__} debe definir 'carpeta_salida'"
            )
        if self.extension is None:
            raise NotImplementedError(
                f"{self.__class__.__name__} debe definir 'extension'"
            )

        # Determinar la ruta final
        if fichero is None:
            # Obtener el nombre base del archivo
            base = "documento"
            if self.documento and hasattr(self.documento, 'md'):
                base = self.documento.md.stem
            elif self.origen and hasattr(self.origen, 'fichero'):
                base = self.origen.fichero.stem
            else:
                self.logger.warning("No se pudo determinar el nombre base. Usando 'documento'.")

            carpeta = Path(self.carpeta_salida)
            carpeta.mkdir(exist_ok=True)
            fichero = carpeta / f"{base}{self.extension}"
            self.logger.info(f"Ruta generada automáticamente: {fichero}")
        else:
            fichero = Path(fichero)
            fichero.parent.mkdir(parents=True, exist_ok=True)
            self.logger.info(f"Ruta especificada por el usuario: {fichero}")

        # Si la subclase tiene un método _escribir, lo usamos para generar el archivo
        if hasattr(self, '_escribir') and callable(self._escribir):
            self._escribir(fichero)
            self.logger.info(f"Guardado con _escribir: {fichero.resolve()}")
            return fichero

        # Determinar qué contenido escribir
        contenido_a_escribir = self.contenido

        # Fallback: si 'contenido' está vacío, probar con 'cuerpo' (compatibilidad)
        if not contenido_a_escribir and hasattr(self, 'cuerpo') and self.cuerpo:
            contenido_a_escribir = self.cuerpo
            self.logger.warning(
                "Usando 'cuerpo' como contenido. "
                "Se recomienda asignar a 'contenido' en lugar de 'cuerpo'."
            )

        # Escribir según el tipo de dato
        if isinstance(contenido_a_escribir, str):
            fichero.write_text(contenido_a_escribir, encoding="utf-8")
            self.logger.info(f"Escrito como texto: {len(contenido_a_escribir)} caracteres")
        elif isinstance(contenido_a_escribir, bytes):
            fichero.write_bytes(contenido_a_escribir)
            self.logger.info(f"Escrito como binario: {len(contenido_a_escribir)} bytes")
        else:
            error = (
                f"Tipo de contenido no soportado: {type(contenido_a_escribir).__name__}. "
                "Debe ser str o bytes."
            )
            self.logger.error(error)
            raise TypeError(error)

        self.logger.info(f"Guardado completado: {fichero.resolve()}")
        return fichero

    def __str__(self):
        return str(self.contenido) if self.contenido else ""

    

