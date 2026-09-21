# PUBLICAR/publicar/WebPublisher.py
import json
import hashlib
import shutil
import fnmatch
import os
import re
import tempfile
from ftplib import error_perm
from pathlib import Path
from typing import Dict, List, Tuple

from .trace import ProgressBar, TreeTrace


class WebPublisher:
    def __init__(
        self,
        ftp,
        local_dir,
        remote_dir,
        hash_name="hashes.json",
        extensions=None,
        forzado=False,
    ):
        self.ftp = ftp
        self.local_dir = Path(local_dir)
        self.remote_dir = remote_dir.rstrip("/")
        self.forzado = bool(forzado)

        self.extensions = (
            {ext.lower() for ext in extensions}
            if extensions is not None
            else {".pdf", ".md"}
        )
        self.exclude_patterns = self._read_exclude_patterns()
        self.excluded_files: List[str] = []

        self.local_hash_file = self.local_dir / hash_name
        self.remote_hash_file = f"{self.remote_dir}/{hash_name}"

    def _new_trace(self) -> TreeTrace:
        label = f"WEB/FTP {self.remote_dir}"
        return TreeTrace(label)

    def _read_exclude_patterns(self) -> List[str]:
        raw = os.getenv("PUBLICAR_EXCLUDE_PATTERNS")
        if raw is None:
            return []
        return [
            item.strip()
            for item in re.split(r"[,;]", raw)
            if item.strip()
        ]

    def _is_excluded(self, file: Path) -> bool:
        if any(
            fnmatch.fnmatchcase(file.name, pattern)
            for pattern in self.exclude_patterns
        ):
            return True

        return not self._has_active_markdown_source(file)

    def _project_root_for(self, file: Path) -> Path:
        parent = file.parent
        if parent.name.lower() == "md" and parent.parent.name.lower() == "articulos":
            return parent.parent.parent
        if parent.name.lower() in {"pdfs", "htmls", "docxs", "odts", "json", "lean"}:
            return parent.parent
        return parent

    def _has_active_markdown_source(self, file: Path) -> bool:
        match = re.match(r"^([A-Za-z]{2}_\d+)", file.name)
        if not match:
            return True

        project_root = self._project_root_for(file)
        prefix = match.group(1)
        return any(project_root.glob(f"{prefix}*.md"))


    def _publication_project_root(self) -> Path:
        if self.local_dir.name.lower() in {"pdfs", "htmls", "docxs", "odts", "json", "lean"}:
            return self.local_dir.parent
        return self.local_dir

    def prepare_web_base(self) -> List[str]:
        """
        Si el proyecto contiene web-base, copia sus recursos pequenos al
        directorio local que se sincroniza. Tambien copia catalogo.cat desde la
        raiz del proyecto. Si web-base no existe, el publicador conserva el
        comportamiento anterior.
        """
        prepared: List[str] = []
        project_root = self._publication_project_root()
        if self.local_dir.name.lower() != "pdfs":
            return prepared
        web_base = project_root / "web-base"

        if web_base.is_dir():
            for src in sorted(web_base.iterdir()):
                if not src.is_file():
                    continue
                if src.suffix.lower() not in {".php", ".csv"}:
                    continue
                dst = self.local_dir / src.name
                if not dst.exists() or dst.read_bytes() != src.read_bytes():
                    shutil.copy2(src, dst)
                prepared.append(dst.name)

        catalog = project_root / "catalogo.cat"
        if catalog.is_file():
            dst = self.local_dir / "catalogo.cat"
            if not dst.exists() or dst.read_bytes() != catalog.read_bytes():
                shutil.copy2(catalog, dst)
            prepared.append(dst.name)

        for abstract in sorted(project_root.glob("*.abstract")):
            if not abstract.is_file():
                continue
            dst = self.local_dir / abstract.name
            if not dst.exists() or dst.read_bytes() != abstract.read_bytes():
                shutil.copy2(abstract, dst)
            prepared.append(dst.name)

        for image in sorted(project_root.glob("*.png")):
            if not image.is_file():
                continue
            if not re.match(r"^[A-Za-z]{2}_\d+\.png$", image.name):
                continue
            dst = self.local_dir / image.name
            if not dst.exists() or dst.read_bytes() != image.read_bytes():
                shutil.copy2(image, dst)
            prepared.append(dst.name)

        return sorted(set(prepared))

    def compute_local_hashes(self) -> Dict[str, str]:
        hashes = {}
        self.excluded_files = []

        for file in self.local_dir.glob("*.*"):
            if file.name.startswith("hashes") and file.suffix.lower() == ".json":
                continue

            if file.suffix.lower() not in self.extensions:
                continue

            if self._is_excluded(file):
                self.excluded_files.append(file.name)
                continue

            hashes[file.name] = hashlib.md5(file.read_bytes()).hexdigest()

        with open(self.local_hash_file, "w", encoding="utf-8") as f:
            json.dump(hashes, f, indent=2)

        return hashes

    def compute_remote_hashes(self) -> Dict[str, str]:
        tmp_handle = tempfile.NamedTemporaryFile(
            prefix="publicar_remote_hashes_",
            suffix=".json",
            delete=False,
        )
        tmp = Path(tmp_handle.name)
        tmp_handle.close()

        try:
            self.ftp.download(self.remote_hash_file, tmp)
            remote_hashes = json.loads(tmp.read_text(encoding="utf-8"))
        except error_perm as exc:
            if "550" not in str(exc):
                raise
            remote_hashes = {}
        except FileNotFoundError:
            remote_hashes = {}

        if tmp.exists():
            tmp.unlink()

        return remote_hashes

    def _plan_changes(
        self,
        local_hashes: Dict[str, str],
        remote_hashes: Dict[str, str],
    ) -> Tuple[List[str], List[str], List[str]]:
        if self.forzado:
            to_upload = sorted(local_hashes)
            equal = []
        elif remote_hashes == {}:
            to_upload = sorted(local_hashes)
            equal = []
        else:
            to_upload = sorted(
                name
                for name, h_local in local_hashes.items()
                if name not in remote_hashes or remote_hashes[name] != h_local
            )
            equal = sorted(
                name
                for name, h_local in local_hashes.items()
                if remote_hashes.get(name) == h_local
            )

        to_delete = sorted(name for name in remote_hashes if name not in local_hashes)
        return equal, to_upload, to_delete

    def _verify_remote_hashes(
        self,
        local_hashes: Dict[str, str],
    ) -> None:
        remote_hashes = self.compute_remote_hashes()
        missing = sorted(set(local_hashes) - set(remote_hashes))
        unexpected = sorted(set(remote_hashes) - set(local_hashes))
        different = sorted(
            name
            for name, local_hash in local_hashes.items()
            if name in remote_hashes and remote_hashes[name] != local_hash
        )

        if missing or unexpected or different:
            details = []
            if missing:
                details.append("faltan=" + ", ".join(missing))
            if unexpected:
                details.append("sobran=" + ", ".join(unexpected))
            if different:
                details.append("hash distinto=" + ", ".join(different))
            raise RuntimeError(
                "La verificaciÃ³n remota no coincide con el estado local: "
                + " | ".join(details)
            )

    def sync(self):
        trace = self._new_trace()
        trace.start_destination()

        try:
            with trace.phase("preparacion web-base"):
                prepared = self.prepare_web_base()
                trace.kv("archivos preparados", len(prepared))
                for name in prepared:
                    trace.file("PREPARADO", name)

            with trace.phase("estado remoto"):
                remote_hashes = self.compute_remote_hashes()
                trace.kv("hashes remotos", len(remote_hashes))

            with trace.phase("calculo hashes locales"):
                local_hashes = self.compute_local_hashes()
                trace.kv("hashes locales", len(local_hashes))
                trace.kv("excluidos por politica", len(self.excluded_files))
                if self.exclude_patterns:
                    trace.kv("patrones excluidos", ", ".join(self.exclude_patterns))

            with trace.phase("comparacion de hashes"):
                equal, to_upload, to_delete = self._plan_changes(
                    local_hashes,
                    remote_hashes,
                )
                trace.result.files_equal = equal
                trace.result.files_pending = to_upload
                trace.kv("iguales", len(equal))
                trace.kv("pendientes de subir", len(to_upload))
                trace.kv("pendientes de borrar", len(to_delete))

                if equal:
                    trace.kv("archivos iguales omitidos del detalle", len(equal))
                for name in to_upload:
                    remote_hash = remote_hashes.get(name)
                    if remote_hash is None:
                        trace.file("PENDIENTE", name, "no existe en remoto")
                    else:
                        trace.file("PENDIENTE", name, "hash local distinto del remoto")
                for name in to_delete:
                    trace.file("BORRAR", name, "no existe en local")

            with trace.phase("subida de archivos"):
                if not to_upload:
                    trace.kv("subidas", 0)

                progress = ProgressBar("WEB subida", len(to_upload))
                progress.start()
                for name in to_upload:
                    progress.advance(name)
                    local_path = self.local_dir / name
                    try:
                        self.ftp.upload(local_path, f"{self.remote_dir}/{name}")
                    except Exception as exc:
                        progress.finish("fallo")
                        trace.failure("upload", error=exc, item=name)
                        raise
                    trace.result.files_uploaded.append(name)
                    trace.file("SUBIDO", name)
                progress.finish()

            with trace.phase("borrado remoto"):
                if not to_delete:
                    trace.kv("borrados", 0)

                progress = ProgressBar("WEB borrado", len(to_delete))
                progress.start()
                for name in to_delete:
                    progress.advance(name)
                    try:
                        self.ftp.delete(f"{self.remote_dir}/{name}")
                    except Exception as exc:
                        progress.finish("fallo")
                        trace.failure("delete", error=exc, item=name)
                        raise
                    trace.result.files_deleted.append(name)
                    trace.file("BORRADO", name)
                progress.finish()

            with trace.phase("actualizacion de hashes remotos"):
                self.ftp.upload(self.local_hash_file, self.remote_hash_file)
                trace.file("SUBIDO", Path(self.remote_hash_file).name)

            with trace.phase("verificacion posterior"):
                self._verify_remote_hashes(local_hashes)
                trace.kv("resultado", "hashes remotos coinciden con local")

        except Exception:
            status = "PARTIAL" if (
                trace.result.files_uploaded or trace.result.files_deleted
            ) else "FAILED"
            trace.finish_destination(status)
            return trace.result.as_dict()

        trace.finish_destination("OK")
        return trace.result.as_dict()

