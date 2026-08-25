import logging
import sys
from pathlib import Path

_logger = None


def get_logger(log_file: Path | None = None) -> logging.Logger:
    global _logger
    if _logger is not None:
        return _logger

    if log_file is None:
        log_file = Path("logs") / "demuestra.log"

    log_file.parent.mkdir(parents=True, exist_ok=True)

    logger = logging.getLogger("Demuestra")
    logger.setLevel(logging.INFO)
    logger.handlers.clear()

    formatter = logging.Formatter(
        "%(asctime)s - %(name)s - %(levelname)s - %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
    )

    file_handler = logging.FileHandler(log_file, encoding="utf-8")
    file_handler.setFormatter(formatter)
    logger.addHandler(file_handler)

    stream_handler = logging.StreamHandler(sys.stdout)
    stream_handler.setFormatter(formatter)
    logger.addHandler(stream_handler)

    _logger = logger
    logger.info("=" * 50)
    logger.info("Sistema DEMUESTRA inicializado.")
    logger.info("Log guardado en: %s", log_file.resolve())
    return logger
