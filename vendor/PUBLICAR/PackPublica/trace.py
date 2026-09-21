from contextlib import contextmanager
from dataclasses import dataclass, field
from typing import Any, Dict, List, Optional
import sys


@dataclass
class PublishFailure:
    phase: str
    operation: str
    item: Optional[str] = None
    error: Optional[str] = None
    http_status: Optional[int] = None
    cause: Optional[str] = None


@dataclass
class PublishResult:
    destination: str
    status: str = "PENDING"
    phases: List[Dict[str, Any]] = field(default_factory=list)
    files_equal: List[str] = field(default_factory=list)
    files_pending: List[str] = field(default_factory=list)
    files_uploaded: List[str] = field(default_factory=list)
    files_omitted: List[str] = field(default_factory=list)
    files_deleted: List[str] = field(default_factory=list)
    failures: List[PublishFailure] = field(default_factory=list)
    details: Dict[str, Any] = field(default_factory=dict)

    @property
    def success(self) -> bool:
        return self.status == "OK"

    def as_dict(self) -> Dict[str, Any]:
        return {
            "destination": self.destination,
            "success": self.success,
            "status": self.status,
            "phases": self.phases,
            "files_equal": self.files_equal,
            "files_pending": self.files_pending,
            "files_uploaded": self.files_uploaded,
            "files_omitted": self.files_omitted,
            "files_deleted": self.files_deleted,
            "failures": [f.__dict__ for f in self.failures],
            "details": self.details,
        }


class TreeTrace:
    def __init__(self, destination: str):
        self.destination = destination
        self.indent = 0
        self.current_phase = ""
        self.result = PublishResult(destination=destination)

    def start_destination(self) -> None:
        self.line(f"[DESTINO] {self.destination} START")
        self.indent += 1

    def finish_destination(self, status: str) -> None:
        self.result.status = status
        self.indent = max(0, self.indent - 1)
        self.line(f"[DESTINO] {self.destination} {status}")

    @contextmanager
    def phase(self, name: str, required: bool = True):
        previous = self.current_phase
        self.current_phase = name
        phase_info = {"name": name, "required": required, "status": "RUNNING"}
        self.result.phases.append(phase_info)
        self.line(f"+-- {name} START")
        self.indent += 1
        try:
            yield
        except Exception as exc:
            phase_info["status"] = "FAILED"
            self.failure(operation=name, error=exc)
            raise
        else:
            phase_info["status"] = "OK"
            self.line(f"`-- {name} OK")
        finally:
            self.indent = max(0, self.indent - 1)
            self.current_phase = previous

    def line(self, message: str) -> None:
        if ProgressBar.active_line:
            sys.stdout.write("\n")
            sys.stdout.flush()
            ProgressBar.active_line = False
        print(f"{'|   ' * self.indent}{message}")

    def kv(self, key: str, value: Any) -> None:
        self.line(f"|-- {key}: {value}")

    def file(self, status: str, name: str, detail: str = "") -> None:
        suffix = f" ({detail})" if detail else ""
        self.line(f"|-- [{status}] {name}{suffix}")

    def failure(
        self,
        operation: str,
        error: Optional[BaseException] = None,
        item: Optional[str] = None,
        http_status: Optional[int] = None,
        cause: Optional[str] = None,
    ) -> None:
        response = getattr(error, "response", None)
        if response is not None and http_status is None:
            http_status = getattr(response, "status_code", None)
        if response is not None and cause is None:
            cause = getattr(response, "text", "")[:1000]

        failure = PublishFailure(
            phase=self.current_phase or "sin fase",
            operation=operation,
            item=item,
            error=str(error) if error is not None else None,
            http_status=http_status,
            cause=cause,
        )
        self.result.failures.append(failure)

        parts = [f"[FALLO] fase={failure.phase}", f"operacion={operation}"]
        if item:
            parts.append(f"archivo={item}")
        if http_status:
            parts.append(f"http={http_status}")
        if failure.error:
            parts.append(f"error={failure.error}")
        if cause:
            parts.append(f"causa={cause}")
        self.line("|-- " + " | ".join(parts))


class ProgressBar:
    active_line = False

    def __init__(self, title: str, total: int, width: int = 32):
        self.title = title
        self.total = max(0, int(total))
        self.width = max(10, int(width))
        self.current = 0
        self._active = False
        self._last_len = 0

    def start(self) -> None:
        if self.total <= 0:
            return
        self._active = True
        self._render("")

    def update(self, current: int, label: str = "") -> None:
        if self.total <= 0:
            return
        self.current = min(max(0, int(current)), self.total)
        self._render(label)

    def advance(self, label: str = "") -> None:
        self.update(self.current + 1, label)

    def finish(self, label: str = "completado") -> None:
        if self.total <= 0:
            return
        self.current = self.total
        self._render(label)
        sys.stdout.write("\n")
        sys.stdout.flush()
        self._active = False
        self.__class__.active_line = False

    def message(self, text: str) -> None:
        if self.__class__.active_line:
            sys.stdout.write("\n")
            sys.stdout.flush()
            self.__class__.active_line = False
        print(text)

    @classmethod
    def wait(cls, title: str, seconds: int, step: int = 1) -> None:
        total = max(0, int(seconds))
        if total <= 0:
            return

        progress = cls(title, total)
        progress.start()
        elapsed = 0
        step = max(1, int(step))
        while elapsed < total:
            pause = min(step, total - elapsed)
            import time

            time.sleep(pause)
            elapsed += pause
            remaining = total - elapsed
            progress.update(elapsed, f"faltan {remaining}s")
        progress.finish("reintentando")

    def _render(self, label: str) -> None:
        ratio = 1.0 if self.total == 0 else self.current / self.total
        done = int(round(self.width * ratio))
        bar = "#" * done + "-" * (self.width - done)
        percent = int(round(ratio * 100))
        text = f"\r{self.title} [{bar}] {self.current}/{self.total} {percent:3d}%"
        if label:
            text += f"  {label[:80]}"
        padding = ""
        if self._last_len > len(text):
            padding = " " * (self._last_len - len(text))
        sys.stdout.write(text + padding)
        sys.stdout.flush()
        self._last_len = len(text)
        self.__class__.active_line = True
