from dataclasses import dataclass
from pathlib import Path

from .config import DEFAULT_LEAN_DIR, DEFAULT_LOG_DIR


@dataclass
class Proyecto:
    raiz: Path

    @property
    def nombre(self) -> str:
        return self.raiz.name

    @property
    def lean_dir(self) -> Path:
        return self.raiz / DEFAULT_LEAN_DIR

    @property
    def log_dir(self) -> Path:
        return self.raiz / DEFAULT_LOG_DIR

    def lean_files(self) -> list[Path]:
        if not self.lean_dir.exists():
            return []
        return sorted(self.lean_dir.rglob("*.lean"))

    def asegurar_estructura(self) -> None:
        for nombre in ("docs", "json", "lean", "evaluaciones", "logs"):
            (self.raiz / nombre).mkdir(parents=True, exist_ok=True)

    def escribir_log(self, nombre: str, contenido: str) -> Path:
        self.log_dir.mkdir(parents=True, exist_ok=True)
        destino = self.log_dir / nombre
        destino.write_text(contenido, encoding="utf-8")
        return destino
