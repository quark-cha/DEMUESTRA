import logging
from pathlib import Path
from datetime import datetime

# Configurar logger una sola vez al inicio del módulo
_logger = None

def get_logger():
    global _logger
    if _logger is None:
        _logger = logging.getLogger("Publicacion")
        _logger.setLevel(logging.INFO)
        # Crear carpeta logs/ si no existe
        log_dir = Path("logs")
        log_dir.mkdir(exist_ok=True)
        log_file = log_dir / "publicacion.log"
        handler = logging.FileHandler(log_file, encoding="utf-8-sig")
        formatter = logging.Formatter(
            "%(asctime)s - %(levelname)s - %(message)s",
            datefmt="%Y-%m-%d %H:%M:%S"
        )
        handler.setFormatter(formatter)
        _logger.addHandler(handler)
        # También mostrar en consola (opcional)
        console = logging.StreamHandler()
        console.setFormatter(formatter)
        _logger.addHandler(console)
    return _logger

