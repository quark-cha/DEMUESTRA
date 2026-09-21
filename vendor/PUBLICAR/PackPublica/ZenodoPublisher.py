# PackPublica/ZenodoPublisher.py

import json
import hashlib
import html
import fnmatch
import os
import requests
import time
import shutil
import re
import zipfile
from datetime import datetime, timezone
from pathlib import Path
from typing import Optional, Union, Dict, List, Any

from .ZenodoClient import ZenodoClient
from .trace import ProgressBar, TreeTrace


class ZenodoPublisher:
    def __init__(self, token: Optional[str] = None):
        self.client = ZenodoClient(token)
        project_name = Path.cwd().name
        self.title = os.getenv("ZENODO_TITLE", project_name)
        self.description = os.getenv(
            "ZENODO_DESCRIPTION",
            f"Publication files for {project_name}",
        )

        # pdfs/ = salida del proceso generador
        # zenodo/ = conjunto local preparado para publicar
        self.source_pdf_dir = Path("pdfs")
        self.pdf_dir = Path("zenodo")

        self.state_file = Path("zenodo/zenodo_state.json")
        self.init_local = False
        self.zenodo_languages = self._read_language_policy()
        self.include_unprefixed_in_zenodo = self._read_bool_env(
            "ZENODO_INCLUDE_UNPREFIXED",
            default=False,
        )
        self.zenodo_zip = self._read_bool_env("ZENODO_ZIP", default=False)
        self.zenodo_readme_name = os.getenv(
            "ZENODO_README_NAME",
            "README_ZENODO.txt",
        )
        self.zenodo_exclude_patterns = self._read_list_env(
            "ZENODO_EXCLUDE_PATTERNS",
            default=[],
        )
        self.zenodo_translations_url = os.getenv(
            "ZENODO_TRANSLATIONS_URL",
            f"https://estradad.es/teorias/pdf/{Path.cwd().name}/",
        )
        self.zenodo_max_files = int(os.getenv("ZENODO_MAX_FILES", "100"))
        self._zip_timestamp = (1980, 1, 1, 0, 0, 0)

    def _new_trace(self) -> TreeTrace:
        return TreeTrace("ZENODO publicacion versionada")

    def _read_bool_env(self, name: str, default: bool) -> bool:
        raw = os.getenv(name)
        if raw is None:
            return default
        return raw.strip().lower() not in {"0", "false", "no", "off"}

    def _read_language_policy(self) -> Optional[List[str]]:
        """
        Idiomas que PUBLICAR prepara para Zenodo.

        Por defecto Zenodo queda ligero: PDF con prefijo ES_/EN_.
        La web puede seguir publicando todos los idiomas. Para recuperar
        el comportamiento masivo anterior:

            ZENODO_LANGS=*
        """
        raw = os.getenv("ZENODO_LANGS", "ES,EN").strip()
        if raw in {"*", "ALL", "all", "TODO", "todo"}:
            return None

        langs = [
            item.strip().upper()
            for item in re.split(r"[,; ]+", raw)
            if item.strip()
        ]
        return langs or ["ES", "EN"]

    def _read_list_env(self, name: str, default: List[str]) -> List[str]:
        raw = os.getenv(name)
        if raw is None:
            return default
        return [
            item.strip()
            for item in re.split(r"[,;]", raw)
            if item.strip()
        ]

    def _zenodo_policy_label(self) -> str:
        if self.zenodo_languages is None:
            base = "todos los idiomas"
        else:
            suffix = " + archivos sin prefijo" if self.include_unprefixed_in_zenodo else ""
            base = f"{','.join(self.zenodo_languages)}{suffix}"

        if self.zenodo_exclude_patterns:
            return f"{base}; excluidos: {', '.join(self.zenodo_exclude_patterns)}"
        packaging = "; ZIP por idioma" if self.zenodo_zip else ""
        return f"{base}; documentos solo si existe .md activo en la raiz{packaging}"

    # =====================================================================
    # FASE 1: LECTURA REMOTA (NO MODIFICA ZENODO)
    # =====================================================================

    def fetch_remote_state(self, conceptrecid: int) -> Dict[str, Any]:
        """
        Obtiene la última versión PUBLICADA del concepto.

        IMPORTANTE:
        - Se piden todas las versiones.
        - Se ordenan por la más reciente.
        - El id resultante es el id de la última versión publicada,
          que es el que Zenodo exige para actions/newversion.
        """
        print(f"📡 Obteniendo última publicación del concepto {conceptrecid}...")

        params = {
            "q": f"conceptrecid:{conceptrecid}",
            "status": "published",
            "all_versions": "true",
            "sort": "mostrecent",
            "size": 25,
        }

        data = self.client._request(
            "GET",
            "records",
            params=params,
        )
        hits = data.get("hits", {}).get("hits", [])

        if not hits:
            raise ValueError(
                f"No se encontró ninguna publicación para el concepto {conceptrecid}"
            )

        # Con sort=mostrecent, el primer resultado es la versión publicada más reciente.
        record = hits[0]

        record_id = int(record["id"])
        doi = record.get("doi", "")

        files = record.get("files", [])
        file_hashes: Dict[str, str] = {}

        for f in files:
            filename = f.get("key") or f.get("filename") or f.get("name")
            if not filename:
                continue

            checksum = str(f.get("checksum", ""))

            if checksum.startswith("md5:"):
                file_hashes[filename] = checksum[4:]
            elif checksum.startswith("sha256:"):
                file_hashes[filename] = checksum[7:]
            elif checksum:
                file_hashes[filename] = checksum
            else:
                file_hashes[filename] = str(f.get("filesize", f.get("size", "unknown")))

        print(f"✅ Última versión publicada detectada: {record_id}")
        print(f"   DOI: {doi}")
        print(f"   Archivos remotos: {len(file_hashes)}")

        return {
            "conceptrecid": conceptrecid,
            "record_id": record_id,
            "deposition_id": record_id,
            "doi": doi,
            "files": file_hashes,
            "fetched_at": datetime.now(timezone.utc).isoformat(),
        }

    def generate_state_files(
        self,
        conceptrecid: int,
        pdf_dir: Union[str, Path] = "zenodo",
    ):
        """
        ORDEN OBLIGATORIO:

            1) sincronizar pdfs/ -> zenodo/
            2) generar manifiesto
            3) consultar Zenodo remoto
            4) guardar zenodo_remoto.json
            5) calcular y guardar zenodo_local.json
        """
        pdf_dir = Path(pdf_dir)
        trace = self._new_trace()
        trace.start_destination()

        try:
            # PRECONDICIÓN LOCAL. TODAVÍA NO SE TOCA ZENODO REMOTO.
            with trace.phase("precondicion local"):
                copied = self.prepare_local_publication_set(
                    source_dir=self.source_pdf_dir,
                    zenodo_dir=pdf_dir,
                )
                trace.result.details["pdfs_copiados_a_zenodo_local"] = copied
                trace.kv("pdfs copiados o actualizados en zenodo local", len(copied))

            with trace.phase("calculo hashes locales"):
                local_hashes = self.compute_local_hashes(pdf_dir)
                trace.kv("archivos locales Zenodo", len(local_hashes))

                local_file = pdf_dir / "zenodo_local.json"
                with open(local_file, "w", encoding="utf-8") as f:
                    json.dump({"files": local_hashes}, f, indent=2, ensure_ascii=False)
                trace.file("ESCRITO", local_file.name)

            # SOLO AHORA se consulta Zenodo.
            with trace.phase("estado remoto publicado"):
                remote_state = self.fetch_remote_state(conceptrecid)
                trace.kv("conceptrecid", conceptrecid)
                trace.kv("record publicado", remote_state.get("record_id"))
                trace.kv("doi", remote_state.get("doi", ""))
                trace.kv("archivos remotos", len(remote_state.get("files", {})))

                remote_file = pdf_dir / "zenodo_remoto.json"
                with open(remote_file, "w", encoding="utf-8") as f:
                    json.dump(remote_state, f, indent=2, ensure_ascii=False)
                trace.file("ESCRITO", remote_file.name)

            with trace.phase("comparacion de hashes"):
                remote_hashes = remote_state.get("files", {})
                pending = sorted(
                    name
                    for name, local_md5 in local_hashes.items()
                    if remote_hashes.get(name) != local_md5
                )
                remote_only = sorted(set(remote_hashes) - set(local_hashes))
                equal = sorted(set(local_hashes) - set(pending))
                trace.result.files_equal = equal
                trace.result.files_pending = pending
                trace.kv("iguales", len(equal))
                trace.kv("pendientes de subir/actualizar", len(pending))
                trace.kv("sobran en Zenodo publicado", len(remote_only))

        except Exception as exc:
            self._write_pending_state(
                pdf_dir=pdf_dir,
                conceptrecid=conceptrecid,
                reason=str(exc),
                phase=trace.current_phase or "generate_state_files",
            )
            trace.failure("generate_state_files", error=exc)
            trace.finish_destination("FAILED")
            result = trace.result.as_dict()
            result.update(
                {
                    "published": False,
                    "url": "",
                    "message": f"Zenodo FAILED: {exc}",
                }
            )
            return result

        self._clear_pending_state(pdf_dir)
        trace.finish_destination("OK")
        print()
        print("📌 Fase 1 Zenodo completada y verificada.")
        return trace.result.as_dict()

    def _write_pending_state(
        self,
        pdf_dir: Path,
        conceptrecid: int,
        reason: str,
        phase: str,
    ) -> Path:
        pending_file = pdf_dir / "zenodo_pending.json"
        local_file = pdf_dir / "zenodo_local.json"
        local_hashes: Dict[str, str] = {}

        if local_file.exists():
            try:
                with open(local_file, encoding="utf-8") as f:
                    local_hashes = json.load(f).get("files", {})
            except Exception:
                local_hashes = {}

        data = {
            "status": "PENDING",
            "conceptrecid": conceptrecid,
            "created_at": datetime.now(timezone.utc).isoformat(),
            "phase": phase,
            "reason": reason,
            "local_files": sorted(local_hashes),
            "local_file_count": len(local_hashes),
            "message": (
                "Zenodo no permitió completar la publicación. "
                "El conjunto local queda preparado; vuelva a ejecutar PUBLICAR "
                "cuando Zenodo deje de devolver el bloqueo."
            ),
        }

        pending_file.parent.mkdir(parents=True, exist_ok=True)
        with open(pending_file, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=2, ensure_ascii=False)

        print(f"🕒 Zenodo pendiente guardado: {pending_file}")
        return pending_file

    def _clear_pending_state(self, pdf_dir: Path) -> None:
        pending_file = pdf_dir / "zenodo_pending.json"
        if pending_file.exists():
            pending_file.unlink()
            print(f"✅ Zenodo pendiente resuelto: {pending_file}")

    def _pending_cooldown_remaining(self, pdf_dir: Path) -> int:
        pending_file = pdf_dir / "zenodo_pending.json"
        if not pending_file.exists():
            return 0

        try:
            with open(pending_file, encoding="utf-8") as f:
                pending = json.load(f)
        except Exception:
            return 0

        reason = str(pending.get("reason", "")).lower()
        if (
            "bloque" not in reason
            and "http 403" not in reason
            and "http 493" not in reason
            and "unusual traffic" not in reason
        ):
            return 0

        created_raw = pending.get("created_at")
        try:
            created = datetime.fromisoformat(str(created_raw))
        except Exception:
            return 0

        if created.tzinfo is None:
            created = created.replace(tzinfo=timezone.utc)

        cooldown = int(os.getenv("ZENODO_403_COOLDOWN_SECONDS", "900"))
        retry_at = created.timestamp() + max(60, cooldown)
        remaining = int(retry_at - datetime.now(timezone.utc).timestamp())
        return max(0, remaining)

    # =====================================================================
    # FASE 0 REMOTA: DETECCIÓN DE BORRADORES CONFLICTIVOS
    # =====================================================================

    def assert_no_conflicting_draft(self, conceptrecid: int) -> None:
        """
        Antes de crear una nueva versión, comprueba los depósitos del usuario.

        Si existe un borrador asociado al mismo conceptrecid:
          - NO lo borra automáticamente;
          - NO crea otra versión;
          - ABORTA y muestra el ID para revisión/eliminación manual.
        """
        print("🔍 Comprobando que no exista un borrador conflictivo en Zenodo...")

        try:
            deposits = self.client._request(
                "GET",
                "deposit/depositions?status=draft&size=100",
            )
        except requests.HTTPError as e:
            response = getattr(e, "response", None)
            if response is not None:
                print(
                    f"❌ Zenodo HTTP {response.status_code} "
                    "al consultar borradores"
                )
                print(f"❌ Respuesta Zenodo: {response.text}")
            raise

        conflicts: List[Dict[str, Any]] = []

        for dep in deposits:
            state = str(dep.get("state", ""))
            submitted = bool(dep.get("submitted", False))

            if state == "done" or submitted:
                continue

            dep_concept = dep.get("conceptrecid")

            if dep_concept is None:
                dep_concept = dep.get("metadata", {}).get("conceptrecid")

            if dep_concept is None:
                dep_concept = dep.get("record", {}).get("conceptrecid")

            if dep_concept is None:
                continue

            if str(dep_concept) != str(conceptrecid):
                continue

            conflicts.append(
                {
                    "id": dep.get("id"),
                    "state": state,
                    "title": (
                        dep.get("title")
                        or dep.get("metadata", {}).get("title", "")
                    ),
                    "files": len(dep.get("files", [])),
                }
            )

        if conflicts:
            print()
            print("❌ BORRADOR CONFLICTIVO DETECTADO EN ZENODO")

            for draft in conflicts:
                print(
                    f"   ID: {draft['id']} | "
                    f"estado: {draft['state']} | "
                    f"archivos: {draft['files']}"
                )
                print(f"   título: {draft['title']}")

            raise RuntimeError(
                "Existe un borrador del mismo concepto en Zenodo. "
                "Revíselo y elimínelo manualmente antes de continuar. "
                "No se creará una nueva versión."
            )

        print("✅ No existe ningún borrador conflictivo para este concepto.")

    # =====================================================================
    # FASE 2: PUBLICACIÓN
    # =====================================================================

    def publish_from_state(
        self,
        init_local: bool = False,
        pdf_dir: Union[str, Path] = "zenodo",
    ) -> Dict[str, Any]:

        pdf_dir = Path(pdf_dir)
        trace = self._new_trace()
        trace.start_destination()
        new_deposition_id: Optional[int] = None
        url = ""

        try:
            remaining = self._pending_cooldown_remaining(pdf_dir)
            if remaining > 0:
                with trace.phase("bloqueo temporal previo"):
                    trace.kv("resultado", "no se consulta Zenodo para no insistir")
                    trace.kv("reintentar en segundos", remaining)
                trace.finish_destination("FAILED")
                result = trace.result.as_dict()
                result.update(
                    {
                        "published": False,
                        "url": "",
                        "message": (
                            "Zenodo bloqueó temporalmente esta red. "
                            f"PUBLICAR evita insistir durante {remaining}s."
                        ),
                    }
                )
                return result

            # -------------------------------------------------------------
            # 0. PRECONDICIÓN LOCAL
            # -------------------------------------------------------------
            # Si FASE 2 se llama directamente, vuelve a comprobar pdfs/ -> zenodo/.
            with trace.phase("precondicion local"):
                copied = self.prepare_local_publication_set(
                    source_dir=self.source_pdf_dir,
                    zenodo_dir=pdf_dir,
                )
                trace.result.details["pdfs_copiados_a_zenodo_local"] = copied
                trace.kv("pdfs copiados o actualizados en zenodo local", len(copied))

            # Estado local actualizado DESPUÉS de sincronizar y generar manifiesto.
            with trace.phase("calculo hashes locales"):
                local_hashes = self.compute_local_hashes(pdf_dir)
                trace.kv("archivos locales Zenodo", len(local_hashes))

                local_file = pdf_dir / "zenodo_local.json"
                with open(local_file, "w", encoding="utf-8") as f:
                    json.dump({"files": local_hashes}, f, indent=2, ensure_ascii=False)
                trace.file("ESCRITO", local_file.name)

            remote_file = pdf_dir / "zenodo_remoto.json"

            if not remote_file.exists():
                raise FileNotFoundError(
                    "No existe zenodo_remoto.json. "
                    "Debe ejecutarse primero generate_state_files()."
                )

            with open(remote_file, encoding="utf-8") as f:
                saved_remote_state = json.load(f)

            conceptrecid = int(saved_remote_state["conceptrecid"])

            # -------------------------------------------------------------
            # 1. REFRESCAR REMOTO JUSTO ANTES DE PUBLICAR
            # -------------------------------------------------------------
            # Evita crear una nueva versión desde un id remoto antiguo.
            with trace.phase("estado remoto publicado"):
                remote_state = self.fetch_remote_state(conceptrecid)
                trace.kv("conceptrecid", conceptrecid)
                trace.kv("record publicado", remote_state.get("record_id"))
                trace.kv("doi", remote_state.get("doi", ""))
                trace.kv("archivos remotos", len(remote_state.get("files", {})))

                with open(remote_file, "w", encoding="utf-8") as f:
                    json.dump(remote_state, f, indent=2, ensure_ascii=False)
                trace.file("ESCRITO", remote_file.name)

            remote_hashes = remote_state["files"]
            deposition_id = int(remote_state["deposition_id"])

            # -------------------------------------------------------------
            # 2. DETERMINAR CAMBIOS
            # -------------------------------------------------------------
            with trace.phase("comparacion de hashes"):
                to_upload: List[str] = []
                equal: List[str] = []

                for filename, local_md5 in local_hashes.items():
                    remote_value = remote_hashes.get(filename)

                    if remote_value is None:
                        to_upload.append(filename)
                        trace.file("PENDIENTE", filename, "no existe en Zenodo publicado")
                    elif remote_value != local_md5:
                        to_upload.append(filename)
                        trace.file("PENDIENTE", filename, "hash local distinto del publicado")
                    else:
                        equal.append(filename)
                        trace.file("IGUAL", filename)

                to_upload = sorted(to_upload)
                equal = sorted(equal)
                trace.result.files_equal = equal
                trace.result.files_pending = to_upload

                # También interesa saber qué sobra remotamente.
                remote_only = sorted(set(remote_hashes) - set(local_hashes))
                trace.kv("iguales", len(equal))
                trace.kv("pendientes de subir/actualizar", len(to_upload))
                trace.kv("sobran en Zenodo publicado", len(remote_only))

                for name in remote_only:
                    trace.file("BORRAR", name, "no existe en conjunto local")

            if not to_upload and not remote_only:
                with trace.phase("verificacion posterior"):
                    self._verify_published_complete(conceptrecid, local_hashes)
                    trace.kv("resultado", "publicacion actual coincide con local")

                trace.finish_destination("OK")
                result = trace.result.as_dict()
                result.update(
                    {
                        "published": False,
                        "message": "Sin cambios. Publicacion actual verificada.",
                        "url": f"https://zenodo.org/records/{deposition_id}",
                    }
                )
                return result

            # -------------------------------------------------------------
            # 3. BARRERA DE SEGURIDAD REMOTA
            # -------------------------------------------------------------
            with trace.phase("barrera borradores"):
                self.assert_no_conflicting_draft(conceptrecid)

            # -------------------------------------------------------------
            # 4. CREAR NUEVA VERSIÓN Y OBTENER EL BORRADOR REAL
            # -------------------------------------------------------------
            with trace.phase("creacion version/deposicion"):
                new_deposition_id = self._create_new_version(
                    deposition_id=deposition_id,
                    conceptrecid=conceptrecid,
                )
                trace.kv("borrador nueva version", new_deposition_id)

            # -------------------------------------------------------------
            # 5. SINCRONIZAR EL BORRADOR REAL CON zenodo/
            # -------------------------------------------------------------
            with trace.phase("subida de archivos"):
                sync_result = self._sync_draft_with_local(
                    new_deposition_id=new_deposition_id,
                    pdf_dir=pdf_dir,
                    local_hashes=local_hashes,
                )
                trace.result.files_uploaded.extend(sync_result["uploaded"])
                trace.result.files_deleted.extend(sync_result["deleted"])
                for name in sync_result["deleted"]:
                    trace.file("BORRADO", name, "borrador Zenodo")
                for name in sync_result["uploaded"]:
                    trace.file("SUBIDO", name, "borrador Zenodo")

            # -------------------------------------------------------------
            # 6. VERIFICACIÓN COMPLETA ANTES DE PUBLICAR
            # -------------------------------------------------------------
            with trace.phase("verificacion borrador"):
                self._verify_draft_complete(
                    new_deposition_id=new_deposition_id,
                    local_hashes=local_hashes,
                )

            with trace.phase("actualizacion de metadatos"):
                self._update_draft_metadata_for_zip(new_deposition_id)
                draft_info = self.client.get_deposition(new_deposition_id)
                metadata = draft_info.get("metadata", {})
                trace.kv("titulo", metadata.get("title", self.title))
                trace.kv("estado", "metadatos actualizados/conservados")

            # -------------------------------------------------------------
            # 7. PUBLICAR
            # -------------------------------------------------------------
            with trace.phase("publicacion final"):
                print("📤 Publicando nueva versión...")

                try:
                    published = self.client._request(
                        "POST",
                        f"deposit/depositions/{new_deposition_id}/actions/publish",
                    )

                    print("🎉 Nueva versión publicada correctamente.")

                    url = (
                        published.get("links", {}).get("record_html")
                        or published.get("links", {}).get("html")
                        or f"https://zenodo.org/records/{published.get('record_id', new_deposition_id)}"
                    )
                    url = url.replace("https://zenodo.org/record/", "https://zenodo.org/records/")

                    print(f"🔗 URL: {url}")

                except requests.HTTPError as e:
                    response = getattr(e, "response", None)

                    if response is not None:
                        print(f"❌ Zenodo HTTP {response.status_code} al publicar")
                        print(f"❌ Respuesta Zenodo: {response.text}")

                    if response is not None and response.status_code == 504:
                        print("⚠️ Zenodo tardó demasiado en responder (504). Verificando estado...")
                        time.sleep(5)

                        dep_info = self.client.get_deposition(new_deposition_id)
                        state = dep_info.get("state")

                        if state == "done":
                            url = (
                                dep_info.get("links", {}).get("record_html")
                                or dep_info.get("links", {}).get("html")
                                or f"https://zenodo.org/records/{new_deposition_id}"
                            )
                            url = url.replace("https://zenodo.org/record/", "https://zenodo.org/records/")

                            print("🎉 La nueva versión SÍ se ha publicado correctamente.")
                            print(f"🔗 URL: {url}")
                        else:
                            raise

                    else:
                        raise

            with trace.phase("verificacion posterior"):
                verified_remote_state = self._verify_published_complete(
                    conceptrecid,
                    local_hashes,
                )
                with open(remote_file, "w", encoding="utf-8") as f:
                    json.dump(verified_remote_state, f, indent=2, ensure_ascii=False)
                trace.kv("resultado", "ultima version publicada coincide con local")
                trace.file("ESCRITO", remote_file.name)

        except Exception as exc:
            status = "PARTIAL" if new_deposition_id else "FAILED"
            try:
                pending_concept = int(saved_remote_state["conceptrecid"])
            except Exception:
                pending_concept = 0
            if pending_concept:
                self._write_pending_state(
                    pdf_dir=pdf_dir,
                    conceptrecid=pending_concept,
                    reason=str(exc),
                    phase=trace.current_phase or "publish_from_state",
                )
            trace.failure("publish_from_state", error=exc)
            trace.finish_destination(status)
            result = trace.result.as_dict()
            result.update(
                {
                    "published": False,
                    "url": url,
                    "message": f"Zenodo {status}: {exc}",
                }
            )
            return result

        self._clear_pending_state(pdf_dir)
        trace.finish_destination("OK")
        result = trace.result.as_dict()
        result.update(
            {
                "published": True,
                "url": url,
                "message": "Nueva version publicada y verificada correctamente.",
            }
        )
        return result

    # =====================================================================
    # CREACIÓN / OBTENCIÓN DEL BORRADOR DE NUEVA VERSIÓN
    # =====================================================================

    def _create_new_version(
        self,
        deposition_id: int,
        conceptrecid: int,
    ) -> int:
        """
        Zenodo exige que actions/newversion se ejecute usando el id de la
        ÚLTIMA versión publicada.

        La respuesta NO es el nuevo borrador.
        El nuevo borrador está en:

            response["links"]["latest_draft"]

        Si Zenodo devuelve 400:
        - muestra el cuerpo completo de la respuesta;
        - vuelve a consultar cuál es la última versión publicada;
        - si el id cambió, reintenta una sola vez con el id correcto.
        """

        print(f"📌 Creando nueva versión desde {deposition_id}...")

        try:
            response = self.client._request(
                "POST",
                f"deposit/depositions/{deposition_id}/actions/newversion",
            )

        except requests.HTTPError as e:
            http_response = getattr(e, "response", None)

            if http_response is not None:
                print(
                    f"❌ Zenodo HTTP {http_response.status_code} "
                    f"al crear nueva versión desde {deposition_id}"
                )
                print(f"❌ Respuesta Zenodo: {http_response.text}")

            # Un 400 puede ocurrir si el id usado dejó de ser la última versión.
            if http_response is not None and http_response.status_code == 400:
                refreshed = self.fetch_remote_state(conceptrecid)
                latest_id = int(refreshed["deposition_id"])

                if latest_id != deposition_id:
                    print(
                        f"⚠️ El id {deposition_id} ya no era la última versión. "
                        f"Reintentando desde {latest_id}..."
                    )

                    self.assert_no_conflicting_draft(conceptrecid)

                    response = self.client._request(
                        "POST",
                        f"deposit/depositions/{latest_id}/actions/newversion",
                    )
                else:
                    raise
            else:
                raise

        latest_draft_url = response.get("links", {}).get("latest_draft")

        if not latest_draft_url:
            raise RuntimeError(
                "Zenodo creó/respondió a newversion pero no devolvió "
                "links.latest_draft. No se puede identificar con seguridad "
                "el nuevo borrador."
            )

        new_deposition_id = self._extract_id_from_url(latest_draft_url)

        if new_deposition_id == deposition_id:
            raise RuntimeError(
                "Zenodo devolvió latest_draft apuntando a la versión publicada "
                f"{deposition_id}, no a un borrador nuevo."
            )

        print(f"✅ Borrador de nueva versión: {new_deposition_id}")
        return new_deposition_id

    @staticmethod
    def _extract_id_from_url(url: str) -> int:
        match = re.search(r"/(\d+)(?:/)?(?:\?.*)?$", str(url))

        if not match:
            raise RuntimeError(
                f"No se pudo extraer el id de depósito desde la URL: {url}"
            )

        return int(match.group(1))

    # =====================================================================
    # SINCRONIZACIÓN DEL BORRADOR REMOTO CON EL CONJUNTO LOCAL
    # =====================================================================

    def _sync_draft_with_local(
        self,
        new_deposition_id: int,
        pdf_dir: Path,
        local_hashes: Dict[str, str],
    ) -> Dict[str, List[str]]:
        """
        Hace que el borrador de Zenodo contenga exactamente el conjunto local.

        No presupone que newversion haya copiado archivos anteriores.
        """
        print("🧹 Sincronizando borrador con el conjunto local...")
        deleted: List[str] = []
        uploaded: List[str] = []

        draft_files = self.client.list_files(new_deposition_id)

        # Eliminar sobrantes o archivos cuyo contenido difiere.
        delete_progress = ProgressBar("ZENODO borrador limpieza", len(draft_files))
        delete_progress.start()
        for f in draft_files:
            name = f.get("filename") or f.get("key") or f.get("name")
            delete_progress.advance(name or "archivo sin nombre")

            if not name:
                continue

            if name not in local_hashes:
                print(
                    f"  🗑️ Eliminando {name} "
                    "(no pertenece al conjunto local)"
                )
                self.client.delete_file(new_deposition_id, f["id"])
                deleted.append(name)
                continue

            checksum = str(f.get("checksum", ""))

            if checksum.startswith("md5:"):
                draft_md5 = checksum[4:]
            else:
                draft_md5 = checksum

            if draft_md5 and draft_md5 != local_hashes[name]:
                print(
                    f"  🗑️ Eliminando {name} "
                    "(contenido diferente)"
                )
                self.client.delete_file(new_deposition_id, f["id"])
                deleted.append(name)

        # Consultar de nuevo el contenido real del borrador.
        draft_files = self.client.list_files(new_deposition_id)

        draft_names = set()

        for f in draft_files:
            name = f.get("filename") or f.get("key") or f.get("name")
            if name:
                draft_names.add(name)

        # Subir exactamente lo que falta.
        missing_in_draft = sorted(set(local_hashes) - draft_names)

        print(
            f"⬆️ Archivos realmente necesarios en el borrador: "
            f"{len(missing_in_draft)}"
        )

        delete_progress.finish()

        upload_progress = ProgressBar("ZENODO subida", len(missing_in_draft))
        upload_progress.start()
        for name in missing_in_draft:
            upload_progress.advance(name)
            local_path = pdf_dir / name

            if not local_path.exists():
                upload_progress.finish("fallo")
                raise FileNotFoundError(
                    "El archivo necesario para Zenodo no existe localmente: "
                    f"{local_path}"
                )

            print(f"  ⬆️ Subiendo {name}...")
            self.client.upload_file(new_deposition_id, local_path)
            print(f"  ✔ {name} subido.")
            uploaded.append(name)
        upload_progress.finish()

        return {"deleted": deleted, "uploaded": uploaded}

    # =====================================================================
    # VERIFICACIÓN DEL BORRADOR
    # =====================================================================

    def _verify_draft_complete(
        self,
        new_deposition_id: int,
        local_hashes: Dict[str, str],
    ):
        """
        Antes de publicar verifica que el borrador contiene exactamente
        todos los archivos del conjunto local y ninguno adicional.

        También compara MD5 cuando list_files() proporciona checksum.
        """
        print("🔍 Verificando conjunto completo del borrador...")

        draft_files = self.client.list_files(new_deposition_id)

        draft_by_name: Dict[str, Dict[str, Any]] = {}

        for f in draft_files:
            name = f.get("filename") or f.get("key") or f.get("name")
            if name:
                draft_by_name[name] = f

        expected_names = set(local_hashes)
        draft_names = set(draft_by_name)

        missing = sorted(expected_names - draft_names)
        unexpected = sorted(draft_names - expected_names)

        if missing:
            raise RuntimeError(
                "PUBLICACIÓN CANCELADA. Faltan archivos en el borrador de Zenodo: "
                + ", ".join(missing)
            )

        if unexpected:
            raise RuntimeError(
                "PUBLICACIÓN CANCELADA. Hay archivos inesperados en el borrador de Zenodo: "
                + ", ".join(unexpected)
            )

        # Comprobar hashes si la respuesta de list_files incluye checksum.
        bad_hashes: List[str] = []
        checked_hashes = 0

        for name, expected_md5 in local_hashes.items():
            f = draft_by_name[name]
            checksum = str(f.get("checksum", ""))

            if not checksum:
                # La API antigua de ficheros puede no devolverlo en esta llamada.
                continue

            checked_hashes += 1

            if checksum.startswith("md5:"):
                remote_hash = checksum[4:]
            else:
                remote_hash = checksum

            if remote_hash != expected_md5:
                bad_hashes.append(name)

        if bad_hashes:
            raise RuntimeError(
                "PUBLICACIÓN CANCELADA. MD5 diferente en el borrador para: "
                + ", ".join(sorted(bad_hashes))
            )

        print(
            f"✅ Borrador completo: {len(expected_names)} archivos. "
            f"Hashes comprobados: {checked_hashes}."
        )

    def _verify_published_complete(
        self,
        conceptrecid: int,
        local_hashes: Dict[str, str],
    ) -> Dict[str, Any]:
        remote_state = self.fetch_remote_state(conceptrecid)
        remote_hashes = remote_state.get("files", {})

        expected_names = set(local_hashes)
        remote_names = set(remote_hashes)

        missing = sorted(expected_names - remote_names)
        unexpected = sorted(remote_names - expected_names)
        bad_hashes = sorted(
            name
            for name, expected_md5 in local_hashes.items()
            if name in remote_hashes and remote_hashes[name] != expected_md5
        )

        if missing or unexpected or bad_hashes:
            details = []
            if missing:
                details.append("faltan=" + ", ".join(missing))
            if unexpected:
                details.append("sobran=" + ", ".join(unexpected))
            if bad_hashes:
                details.append("hash distinto=" + ", ".join(bad_hashes))
            raise RuntimeError(
                "La verificacion publicada de Zenodo no coincide con local: "
                + " | ".join(details)
            )

        return remote_state

    # =====================================================================
    # UTILIDADES
    # =====================================================================

    def verify(self) -> Dict[str, Any]:
        """
        Verifica el último estado remoto guardado.
        """
        result: Dict[str, Any] = {"error": ""}

        try:
            remaining = self._pending_cooldown_remaining(self.pdf_dir)
            if remaining > 0:
                result["error"] = (
                    "Zenodo bloqueó temporalmente esta red. "
                    f"No se verifica para no insistir durante {remaining}s."
                )
                return result

            remote_file = self.pdf_dir / "zenodo_remoto.json"

            if not remote_file.exists():
                result["error"] = "No se encuentra zenodo_remoto.json"
                return result

            with open(remote_file, encoding="utf-8") as f:
                remote_state = json.load(f)

            deposition_id = remote_state.get("deposition_id")
            dep_info = self.client.get_deposition(deposition_id)

            result["deposition_id"] = deposition_id
            result["title"] = dep_info.get("metadata", {}).get("title", "")
            result["state"] = dep_info.get("state", "")
            result["files"] = dep_info.get("files", [])

        except Exception as e:
            result["error"] = str(e)

        return result

    def list_drafts(self) -> List[Dict[str, Any]]:
        drafts: List[Dict[str, Any]] = []

        try:
            remaining = self._pending_cooldown_remaining(self.pdf_dir)
            if remaining > 0:
                print(
                    "ℹ️ No se listan borradores de Zenodo para no insistir "
                    f"durante {remaining}s."
                )
                return drafts

            response = self.client._request(
                "GET",
                "deposit/depositions?status=draft&size=100",
            )

            for dep in response:
                state = str(dep.get("state", ""))
                submitted = bool(dep.get("submitted", False))

                if state == "done" or submitted:
                    continue

                dep_id = dep.get("id")

                drafts.append(
                    {
                        "id": dep_id,
                        "conceptrecid": (
                            dep.get("conceptrecid")
                            or dep.get("metadata", {}).get("conceptrecid")
                        ),
                        "title": (
                            dep.get("title")
                            or dep.get("metadata", {}).get("title", "")
                        ),
                        "state": state,
                        "files": len(dep.get("files", [])),
                        "url": f"https://zenodo.org/deposit/{dep_id}",
                    }
                )

        except Exception as e:
            print(f"⚠ Error al listar borradores: {e}")

        return drafts

    # =====================================================================
    # HASHES
    # =====================================================================

    def _compute_hash(self, file_path: Path) -> str:
        """MD5 utilizado para comparar con el checksum que devuelve Zenodo."""
        md5 = hashlib.md5()

        with open(file_path, "rb") as f:
            for chunk in iter(lambda: f.read(1024 * 1024), b""):
                md5.update(chunk)

        return md5.hexdigest()

    def _compute_sha256(self, file_path: Path) -> str:
        """SHA-256 para comprobar integridad local pdfs/ -> zenodo/."""
        sha256 = hashlib.sha256()

        with open(file_path, "rb") as f:
            for chunk in iter(lambda: f.read(1024 * 1024), b""):
                sha256.update(chunk)

        return sha256.hexdigest()

    # =====================================================================
    # PDF PUBLICABLES
    # =====================================================================

    def _is_publishable_pdf(self, path: Path) -> bool:
        """
        Decide qué PDF de pdfs/ pertenecen al conjunto Zenodo.

        La web puede publicar todos los idiomas. Zenodo, por defecto, queda
        reducido a ES/EN y archivos generales para no forzar tráfico masivo.
        """
        if not path.is_file() or path.suffix.lower() != ".pdf":
            return False

        if any(
            fnmatch.fnmatchcase(path.name, pattern)
            for pattern in self.zenodo_exclude_patterns
        ):
            return False

        if not self._has_active_markdown_source(path):
            return False

        if self.zenodo_languages is None:
            return True

        match = re.match(r"^([A-Za-z]{2})_", path.name)
        if not match:
            return self.include_unprefixed_in_zenodo

        return match.group(1).upper() in self.zenodo_languages

    def _has_active_markdown_source(self, path: Path) -> bool:
        """
        Los documentos numerados ES_46_..., EN_48_..., etc. solo se publican
        si existe un .md activo con ese prefijo en la raíz del proyecto.
        Así, al sacar un documento superado de la raíz, sus derivados dejan de publicarse.
        """
        match = re.match(r"^([A-Za-z]{2}_\d+)", path.name)
        if not match:
            return True

        project_root = path.parent.parent
        prefix = match.group(1)
        return any(project_root.glob(f"{prefix}*.md"))

    # =====================================================================
    # SINCRONIZACIÓN LOCAL pdfs/ -> zenodo/
    # =====================================================================

    def sync_source_pdfs(
        self,
        source_dir: Union[str, Path] = "pdfs",
        zenodo_dir: Union[str, Path] = "zenodo",
    ) -> List[str]:
        """
        Se ejecuta ANTES de cualquier operación de publicación en Zenodo.

        pdfs/
            salida del proceso generador.

        zenodo/
            conjunto local que será publicado.

        Regla:
            - nuevo en pdfs/             -> copiar a zenodo/
            - mismo SHA-256              -> conservar
            - SHA-256 diferente          -> actualizar zenodo/

        Las fechas no deciden.
        pdfs/ es la fuente para los PDF recién generados.
        """
        source_dir = Path(source_dir)
        zenodo_dir = Path(zenodo_dir)

        if not source_dir.exists():
            raise FileNotFoundError(
                f"No existe el directorio fuente: {source_dir.resolve()}"
            )

        zenodo_dir.mkdir(parents=True, exist_ok=True)

        candidates = sorted(
            p
            for p in source_dir.iterdir()
            if self._is_publishable_pdf(p)
        )

        print(
            f"🔎 Sincronización previa: "
            f"{source_dir.resolve()} -> {zenodo_dir.resolve()}"
        )
        print(f"   Política Zenodo: {self._zenodo_policy_label()}")
        print(f"   PDFs publicables para Zenodo: {len(candidates)}")

        copied: List[str] = []
        equal_count = 0
        new_count = 0
        updated_count = 0
        candidate_names = {p.name for p in candidates}

        stale_files = sorted(
            p
            for p in zenodo_dir.iterdir()
            if p.is_file() and p.suffix.lower() == ".pdf" and p.name not in candidate_names
        )
        stale_progress = ProgressBar("ZENODO local retirada", len(stale_files))
        stale_progress.start()
        for stale in stale_files:
            stale_progress.advance(stale.name)
            stale_progress.message(
                f"  🗑️ {stale.name}: ya no existe en pdfs/ -> retirar de zenodo local"
            )
            stale.unlink()
        stale_progress.finish()

        copy_progress = ProgressBar("ZENODO local copia", len(candidates))
        copy_progress.start()
        for source in candidates:
            copy_progress.advance(source.name)
            target = zenodo_dir / source.name
            src_sha = self._compute_sha256(source)

            if not target.exists():
                copy_progress.message(f"  ➕ {source.name}: NUEVO -> COPIAR")
                shutil.copy2(source, target)

                if self._compute_sha256(target) != src_sha:
                    copy_progress.finish("fallo")
                    raise RuntimeError(
                        f"Error de integridad al copiar {source.name} a zenodo/"
                    )

                copied.append(source.name)
                new_count += 1
                continue

            dst_sha = self._compute_sha256(target)

            if src_sha == dst_sha:
                equal_count += 1
                continue

            copy_progress.message(f"  🔄 {source.name}: MODIFICADO -> ACTUALIZAR")
            shutil.copy2(source, target)

            if self._compute_sha256(target) != src_sha:
                copy_progress.finish("fallo")
                raise RuntimeError(
                    f"Error de integridad al actualizar {source.name} en zenodo/"
                )

            copied.append(source.name)
            updated_count += 1
        copy_progress.finish()

        print(
            "📊 Resumen copia local Zenodo: "
            f"iguales={equal_count}, nuevos={new_count}, "
            f"actualizados={updated_count}, retirados={len(stale_files)}"
        )

        if copied:
            print(
                f"✅ Copiados/actualizados en zenodo ({len(copied)}): "
                f"{copied}"
            )
        else:
            print("✅ No fue necesario copiar ningún PDF.")

        return copied



    def _project_navigation_url(self) -> str:
        return os.getenv(
            "ZENODO_PROJECT_WEB_URL",
            self.zenodo_translations_url,
        )

    def _build_navigation_description(self, current_description: str) -> str:
        """
        Inserta al comienzo de la descripcion de Zenodo un bloque estable de
        navegacion web. El marcador evita duplicarlo en versiones sucesivas.
        """
        url = html.escape(self._project_navigation_url(), quote=True)
        block = (
            "<!-- PUBLICAR_NAVIGATION_START -->\n"
            '<p><strong>Navegacion por el proyecto / Project navigation:</strong> '
            f'<a href="{url}">{url}</a></p>\n'
            "<p>El DOI y los archivos ZIP constituyen el registro archivado; "
            "la web permite navegar comodamente por idioma sin descargar el "
            "paquete completo.</p>\n"
            "<hr>\n"
            "<!-- PUBLICAR_NAVIGATION_END -->"
        )
        description = current_description or ""
        description = re.sub(
            r"<!-- PUBLICAR_NAVIGATION_START -->.*?<!-- PUBLICAR_NAVIGATION_END -->\s*",
            "",
            description,
            flags=re.DOTALL,
        ).lstrip()
        return block + ("\n\n" + description if description else "")

    def _normalize_zenodo_date_value(self, value: Any) -> Optional[str]:
        """
        Zenodo puede devolver fechas heredadas que acepta en lectura, pero que
        rechaza si se reenvian tal cual en un PUT de metadatos.
        """
        if value is None:
            return None

        text = str(value).strip()
        if not text:
            return None

        match = re.match(r"^(\d{4})-(\d{1,2})-(\d{1,2})", text)
        if match:
            year, month, day = (int(part) for part in match.groups())
            try:
                return datetime(year, month, day).date().isoformat()
            except ValueError:
                return None

        match = re.match(r"^(\d{1,2})/(\d{1,2})/(\d{4})$", text)
        if match:
            day, month, year = (int(part) for part in match.groups())
            try:
                return datetime(year, month, day).date().isoformat()
            except ValueError:
                return None

        return None

    def _sanitize_zenodo_dates_metadata(self, metadata: Dict[str, Any]) -> bool:
        """
        Mantiene metadata.dates solo si queda en formato publicable.

        El fallo observado fue:
            metadata.dates: Invalid date provided.

        Como esta actualizacion solo anade la navegacion web a la descripcion,
        no debe quedar bloqueada por una fecha heredada del borrador.
        """
        original_dates = metadata.get("dates")
        dates = original_dates
        if not isinstance(dates, list):
            return metadata.pop("dates", None) is not None

        clean_dates: List[Dict[str, Any]] = []
        for item in dates:
            if not isinstance(item, dict):
                continue

            clean_item = dict(item)
            valid = True
            has_date = False

            for key in ("date", "start", "end"):
                if key not in clean_item:
                    continue
                normalized = self._normalize_zenodo_date_value(clean_item.get(key))
                if normalized is None:
                    valid = False
                    break
                clean_item[key] = normalized
                has_date = True

            if valid and has_date:
                clean_dates.append(clean_item)

        if clean_dates:
            metadata["dates"] = clean_dates
        else:
            metadata.pop("dates", None)

        return metadata.get("dates") != original_dates

    def _update_draft_metadata_for_zip(self, deposition_id: int) -> None:
        if not self.zenodo_zip:
            return

        draft_info = self.client.get_deposition(deposition_id)
        metadata = dict(draft_info.get("metadata", {}))
        old_description = metadata.get("description", "")
        new_description = self._build_navigation_description(old_description)
        metadata["description"] = new_description
        dates_changed = self._sanitize_zenodo_dates_metadata(metadata)

        if new_description == old_description and not dates_changed:
            print("Metadatos Zenodo: enlace de navegacion ya actualizado.")
            return

        self.client._request(
            "PUT",
            f"deposit/depositions/{deposition_id}",
            json={"metadata": metadata},
        )
        print("Metadatos Zenodo actualizados: enlace de navegacion web al inicio.")


    # =====================================================================
    # MANIFIESTO
    # =====================================================================


    def generate_zenodo_readme(
        self,
        pdf_dir: Union[str, Path] = "zenodo",
    ) -> Path:
        """
        Anade una nota estable al paquete Zenodo.

        No incluye fecha ni datos volatiles: si el contenido cambiara en cada
        ejecucion, PUBLICAR detectaria un hash distinto y publicaria sin motivo.
        En modo ZIP puede generar HTML para que Zenodo actue como escaparate
        de descarga y navegacion.
        """
        pdf_dir = Path(pdf_dir)
        readme = pdf_dir / self.zenodo_readme_name

        if self.zenodo_readme_name.lower().endswith((".html", ".htm")):
            content = self._build_zenodo_readme_html(pdf_dir)
        else:
            content = self._build_zenodo_readme_text()

        with open(readme, "w", encoding="utf-8", newline="\n") as f:
            f.write(content)

        print(f"Nota Zenodo actualizada: {readme}")
        return readme

    def _build_zenodo_readme_text(self) -> str:
        if self.zenodo_languages is None:
            selected_files = "all available language-prefixed PDF files"
        else:
            prefixes = ", ".join(f"{lang}_" for lang in self.zenodo_languages)
            selected_files = f"PDF files with prefixes {prefixes}"

        if self.include_unprefixed_in_zenodo:
            selected_files += " plus unprefixed PDF files"

        if self.zenodo_zip:
            return (
                "Zenodo publication note\n"
                "========================\n\n"
                "This Zenodo record contains the canonical archived release for "
                "DOI preservation. Documents are grouped by language in ZIP "
                "packages to keep the Zenodo download area clean and within "
                "Zenodo's file-count limit.\n\n"
                "Download the ZIP package for the language you want to read.\n\n"
                "For comfortable online navigation without downloading ZIP files, "
                "use the project website:\n"
                f"{self.zenodo_translations_url}\n\n"
                "Integrity information for the ZIP packages and their internal "
                "PDF files is available in MANIFEST_HASHES.txt. Each ZIP also "
                "contains its own internal SHA-256 manifest.\n"
            )

        return (
            "Zenodo publication note\n"
            "========================\n\n"
            "This Zenodo record contains the canonical publication set selected "
            f"for DOI preservation: {selected_files}.\n\n"
            "Additional translations and web-oriented material are published "
            "on the project website:\n"
            f"{self.zenodo_translations_url}\n\n"
            "The complete integrity list for the Zenodo files is available in "
            "MANIFEST_HASHES.txt.\n"
        )

    def _build_zenodo_readme_html(self, pdf_dir: Path) -> str:
        project_name = os.getenv("PUBLICAR_PROJECT_NAME", Path.cwd().name)
        title = html.escape(self.title or project_name)
        web_url = html.escape(self.zenodo_translations_url, quote=True)
        catalog_url = html.escape(
            os.getenv("ZENODO_CATALOG_URL", "https://estradad.es/catalogo.php"),
            quote=True,
        )
        license_url = html.escape(
            os.getenv("ZENODO_LICENSE_URL", "https://estradad.es/licencia.php"),
            quote=True,
        )

        zip_cards = []
        for zip_path in sorted(pdf_dir.glob("*.zip")):
            label = zip_path.stem
            lang_match = re.search(r"_([A-Za-z]{2})$", zip_path.stem)
            lang = lang_match.group(1).upper() if lang_match else label
            if lang == "ES":
                heading = "Espanol"
                text = "Descargar el paquete completo en espanol."
            elif lang == "EN":
                heading = "English"
                text = "Download the complete English package."
            else:
                heading = lang
                text = f"Download the complete {lang} package."

            href = f"../files/{html.escape(zip_path.name, quote=True)}?download=1"
            size_mb = zip_path.stat().st_size / (1024 * 1024)
            zip_cards.append(
                "".join(
                    [
                        '<a class="card" href="', href, '">',
                        '<span class="card-kicker">ZIP</span>',
                        '<strong>', html.escape(heading), '</strong>',
                        '<span>', html.escape(text), '</span>',
                        '<em>', f"{size_mb:.1f} MB", '</em>',
                        '</a>',
                    ]
                )
            )

        if not zip_cards:
            zip_cards.append(
                '<div class="card muted"><strong>No ZIP packages found</strong>'
                '<span>The local ZIP set has not been generated yet.</span></div>'
            )

        return "".join(
            [
                '<!doctype html>\n',
                '<html lang="en">\n',
                '<head>\n',
                '<meta charset="utf-8">\n',
                '<meta name="viewport" content="width=device-width, initial-scale=1">\n',
                '<title>UNIHOLOG Zenodo access</title>\n',
                '<style>\n',
                ':root{color-scheme:light;--ink:#17202a;--muted:#5d6975;--line:#d9e1e8;--panel:#f7f9fb;--accent:#0f6b78;--accent2:#7b3f00;}\n',
                '*{box-sizing:border-box}body{margin:0;font-family:Arial,Helvetica,sans-serif;color:var(--ink);background:#fff;line-height:1.5}main{max-width:980px;margin:0 auto;padding:32px 18px 42px}header{border-bottom:1px solid var(--line);padding-bottom:22px;margin-bottom:22px}h1{font-size:28px;line-height:1.15;margin:0 0 12px}h2{font-size:18px;margin:28px 0 12px}.lead{font-size:17px;color:var(--muted);max-width:780px}.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:12px}.card{display:flex;min-height:138px;flex-direction:column;gap:8px;padding:18px;border:1px solid var(--line);border-radius:8px;text-decoration:none;color:var(--ink);background:var(--panel)}.card:hover{border-color:var(--accent);box-shadow:0 4px 14px rgba(15,107,120,.14)}.card strong{font-size:20px}.card span{color:var(--muted)}.card em{margin-top:auto;font-style:normal;color:var(--accent);font-weight:700}.card-kicker{font-size:12px;letter-spacing:.08em;text-transform:uppercase;color:var(--accent2)!important;font-weight:700}.actions{display:flex;flex-wrap:wrap;gap:10px;margin-top:14px}.button{display:inline-flex;align-items:center;justify-content:center;min-height:42px;padding:10px 14px;border-radius:6px;border:1px solid var(--accent);background:var(--accent);color:#fff;text-decoration:none;font-weight:700}.button.secondary{background:#fff;color:var(--accent)}.note{padding:14px 16px;border-left:4px solid var(--accent2);background:#fff8ef;color:#3c2b1a}.muted{opacity:.72}\n',
                '</style>\n',
                '</head>\n',
                '<body>\n',
                '<main>\n',
                '<header>\n',
                '<h1>', title, '</h1>\n',
                '<p class="lead">This Zenodo record is the archival DOI register. The ZIP packages are the preserved release files; the website provides comfortable online navigation without downloading the packages.</p>\n',
                '<div class="actions">\n',
                '<a class="button" href="', web_url, '">Browse online</a>\n',
                '<a class="button secondary" href="', catalog_url, '">Catalogo</a>\n',
                '<a class="button secondary" href="', license_url, '">Licencia</a>\n',
                '<a class="button secondary" href="../files/MANIFEST_HASHES.txt?download=1">Integrity manifest</a>\n',
                '</div>\n',
                '</header>\n',
                '<section>\n',
                '<h2>Download by language</h2>\n',
                '<div class="grid">', "\n".join(zip_cards), '</div>\n',
                '</section>\n',
                '<section>\n',
                '<h2>About this record</h2>\n',
                '<p class="note">The DOI and the ZIP files are the stable archival record. This HTML page is only an access guide for readers.</p>\n',
                '</section>\n',
                '</main>\n',
                '</body>\n',
                '</html>\n',
            ]
        )


    def generate_hash_manifest(
        self,
        pdf_dir: Union[str, Path] = "zenodo",
    ) -> Path:
        """
        Genera MANIFEST_HASHES.txt con MD5 + SHA-256.

        ZIP=0 registra los PDF individuales que forman el conjunto Zenodo.
        ZIP=1 registra los ZIP publicados y los archivos internos contenidos
        en cada ZIP. Los PDF sueltos de zenodo/ permanecen como base local,
        pero no forman el conjunto publicable.
        """
        pdf_dir = Path(pdf_dir)

        publish_files = [
            p
            for p in self.iter_zenodo_publish_files(pdf_dir, include_manifest=False)
            if p.name != self.zenodo_readme_name
        ]

        manifest = pdf_dir / "MANIFEST_HASHES.txt"
        project_name = os.getenv("PUBLICAR_PROJECT_NAME", Path.cwd().name)

        with open(manifest, "w", encoding="utf-8", newline="\n") as f:
            f.write(f"{project_name} - ZENODO INTEGRITY MANIFEST\n")
            f.write("================================================\n\n")
            if self.zenodo_zip:
                f.write(
                    "This manifest verifies the ZIP packages published in Zenodo "
                    "and the PDF files contained inside them.\n\n"
                )
            else:
                f.write(
                    "Each published PDF is identified by MD5 and SHA-256. "
                    "Any byte-level change modifies the fingerprints.\n\n"
                )

            progress = ProgressBar("ZENODO manifiesto hashes", len(publish_files))
            progress.start()
            for path in publish_files:
                progress.advance(path.name)
                kind = path.suffix.lower().lstrip(".")
                f.write(f"FILE: {path.name}\n")
                f.write(f"TYPE: {kind}\n")
                f.write(f"MD5: {self._compute_hash(path)}\n")
                f.write(f"SHA256: {self._compute_sha256(path)}\n\n")

                if self.zenodo_zip and path.suffix.lower() == ".zip":
                    for item in self._hash_zip_members(path):
                        f.write(f"ZIP: {path.name}\n")
                        f.write(f"INTERNAL_FILE: {item['name']}\n")
                        f.write(f"SIZE: {item['size']}\n")
                        f.write(f"MD5: {item['md5']}\n")
                        f.write(f"SHA256: {item['sha256']}\n\n")
            progress.finish()

        print(f"ðŸ” Manifiesto actualizado: {manifest} ({len(publish_files)} archivos publicables)")
        return manifest


    def compute_local_hashes(
        self,
        pdf_dir: Union[str, Path] = "zenodo",
    ) -> Dict[str, str]:
        """
        Conjunto que se compara/publica:

        ZIP=0:
            - TODOS los *.pdf existentes en zenodo/
            - MANIFEST_HASHES.txt
            - README_ZENODO.txt

        ZIP=1:
            - TODOS los *.zip existentes en zenodo/
            - MANIFEST_HASHES.txt
            - README_ZENODO.txt

        En ZIP=1 los PDF sueltos de zenodo/ se conservan localmente como
        materia prima, pero no entran en zenodo_local.json ni se publican.
        """
        pdf_dir = Path(pdf_dir)

        files = self.iter_zenodo_publish_files(pdf_dir)

        if len(files) > self.zenodo_max_files:
            raise RuntimeError(
                "El conjunto Zenodo tiene demasiados archivos: "
                f"{len(files)} > {self.zenodo_max_files}. "
                "Zenodo permite un mÃ¡ximo de 100 archivos por registro; "
                "reduzca el conjunto ES_/EN_ o empaquete archivos antes de publicar."
            )

        hashes: Dict[str, str] = {}
        progress = ProgressBar("ZENODO hashes locales", len(files))
        progress.start()
        for p in files:
            progress.advance(p.name)
            hashes[p.name] = self._compute_hash(p)
        progress.finish()
        return hashes

    def iter_zenodo_publish_files(
        self,
        pdf_dir: Union[str, Path] = "zenodo",
        include_manifest: bool = True,
    ) -> List[Path]:
        """
        Fuente Ãºnica de verdad para decidir quÃ© archivos ve Zenodo.

        ZIP=0 publica PDF sueltos.
        ZIP=1 publica ZIP por idioma.
        """
        pdf_dir = Path(pdf_dir)

        if self.zenodo_zip:
            files = sorted(
                p
                for p in pdf_dir.iterdir()
                if p.is_file() and p.suffix.lower() == ".zip"
            )
        else:
            files = sorted(
                p
                for p in pdf_dir.iterdir()
                if p.is_file() and p.suffix.lower() == ".pdf"
            )

        manifest = pdf_dir / "MANIFEST_HASHES.txt"
        readme = pdf_dir / self.zenodo_readme_name

        if include_manifest and manifest.exists():
            files.append(manifest)
        if not self.zenodo_zip and readme.exists():
            files.append(readme)

        return files

    def prepare_local_publication_set(
        self,
        source_dir: Union[str, Path] = "pdfs",
        zenodo_dir: Union[str, Path] = "zenodo",
    ) -> List[str]:
        """
        PRECONDICIÓN OBLIGATORIA:

            1) detectar PDF publicables en pdfs/
            2) copiar nuevos/cambiados a zenodo/
            3) verificar presencia
            4) verificar igualdad SHA-256
            5) generar MANIFEST_HASHES.txt
            6) generar README_ZENODO.txt

        SOLO DESPUÉS se permite consultar/modificar Zenodo remoto.
        """
        source_dir = Path(source_dir)
        zenodo_dir = Path(zenodo_dir)

        copied = self.sync_source_pdfs(
            source_dir=source_dir,
            zenodo_dir=zenodo_dir,
        )

        missing: List[str] = []
        different: List[str] = []

        sources = sorted(
            source
            for source in source_dir.iterdir()
            if self._is_publishable_pdf(source)
        )
        verify_progress = ProgressBar("ZENODO verifica local", len(sources))
        verify_progress.start()
        for source in sources:
            verify_progress.advance(source.name)
            target = zenodo_dir / source.name

            if not target.exists():
                missing.append(source.name)
                continue

            if self._compute_sha256(source) != self._compute_sha256(target):
                different.append(source.name)
        verify_progress.finish()

        if missing:
            raise RuntimeError(
                "La sincronización local no quedó completa. "
                "Faltan en zenodo/: "
                + ", ".join(sorted(missing))
            )

        if different:
            raise RuntimeError(
                "La sincronización local no quedó completa. "
                "Difieren entre pdfs/ y zenodo/: "
                + ", ".join(sorted(different))
            )

        if self.zenodo_zip:
            copied.extend(self.build_language_zips(zenodo_dir))

        self.generate_hash_manifest(zenodo_dir)
        if self.zenodo_zip:
            for stale_html in zenodo_dir.glob("zip_*.htm*"):
                stale_html.unlink()
            readme = zenodo_dir / self.zenodo_readme_name
            if readme.exists():
                readme.unlink()
        else:
            self.generate_zenodo_readme(zenodo_dir)

        manifest = zenodo_dir / "MANIFEST_HASHES.txt"
        readme = zenodo_dir / self.zenodo_readme_name

        if not manifest.exists():
            raise RuntimeError(
                "No se pudo generar MANIFEST_HASHES.txt en zenodo/."
            )

        if not self.zenodo_zip and not readme.exists():
            raise RuntimeError(
                f"No se pudo generar {self.zenodo_readme_name} en zenodo/."
            )

        print("âœ… PRECONDICIÃ“N LOCAL verificada:")
        print("   - todos los PDF del conjunto Zenodo estÃ¡n en zenodo/")
        print("   - su contenido coincide")
        print("   - MANIFEST_HASHES.txt actualizado")
        if self.zenodo_zip:
            print("   - modo ZIP: Zenodo publica ZIPs + MANIFEST_HASHES.txt")
        else:
            print(f"   - {self.zenodo_readme_name} actualizado")

        return copied


    # =====================================================================
    # ZIP POR IDIOMA
    # =====================================================================

    def build_language_zips(self, zenodo_dir: Union[str, Path] = "zenodo") -> List[str]:
        """
        Construye ZIP por idioma al final de la preparaciÃ³n local.

        No borra PDF locales de zenodo/. En modo ZIP esos PDF son base local
        para crear los paquetes, pero Zenodo solo ve los ZIP y auxiliares.
        """
        zenodo_dir = Path(zenodo_dir)
        project_name = os.getenv("PUBLICAR_PROJECT_NAME", Path.cwd().name)

        groups: Dict[str, List[Path]] = {}
        for pdf in sorted(zenodo_dir.iterdir()):
            if not pdf.is_file() or pdf.suffix.lower() != ".pdf":
                continue
            match = re.match(r"^([A-Za-z]{2})_", pdf.name)
            if not match:
                continue
            lang = match.group(1).upper()
            groups.setdefault(lang, []).append(pdf)

        if self.zenodo_zip and not groups:
            raise RuntimeError("ZIP=1 pero no se encontraron PDF con prefijo de idioma en zenodo/.")

        changed: List[str] = []
        expected = {
            self._language_zip_name(project_name, lang)
            for lang in groups
        }

        for old_zip in sorted(zenodo_dir.glob(f"{project_name}_*.zip")):
            if old_zip.name not in expected:
                old_zip.unlink()
                changed.append(old_zip.name)

        for lang, pdfs in sorted(groups.items()):
            zip_name = self._language_zip_name(project_name, lang)
            zip_path = zenodo_dir / zip_name
            temp_path = zenodo_dir / f"{zip_name}.tmp"
            manifest_name = f"{lang}/MANIFEST_{lang}_SHA256.txt"
            manifest_content = self._build_internal_manifest(lang, pdfs)

            with zipfile.ZipFile(
                temp_path,
                "w",
                compression=zipfile.ZIP_DEFLATED,
                compresslevel=9,
            ) as zf:
                for pdf in pdfs:
                    self._write_zip_member(zf, f"{lang}/{pdf.name}", pdf.read_bytes())
                self._write_zip_member(zf, manifest_name, manifest_content.encode("utf-8"))

            if zip_path.exists() and self._compute_sha256(zip_path) == self._compute_sha256(temp_path):
                temp_path.unlink()
            else:
                temp_path.replace(zip_path)
                changed.append(zip_name)

        print(
            "ðŸ“¦ ZIP Zenodo por idioma preparados: "
            f"{len(groups)} paquetes, {sum(len(v) for v in groups.values())} PDF internos"
        )
        return changed

    @staticmethod
    def _language_zip_name(project_name: str, lang: str) -> str:
        return f"{project_name}_{lang.upper()}.zip"

    def _build_internal_manifest(self, lang: str, pdfs: List[Path]) -> str:
        lines = [
            f"{lang} ZIP INTERNAL SHA-256 MANIFEST",
            "===================================",
            "",
            "Each PDF in this package is identified by MD5 and SHA-256.",
            "",
        ]
        for pdf in pdfs:
            lines.extend(
                [
                    f"FILE: {lang}/{pdf.name}",
                    f"SIZE: {pdf.stat().st_size}",
                    f"MD5: {self._compute_hash(pdf)}",
                    f"SHA256: {self._compute_sha256(pdf)}",
                    "",
                ]
            )
        return "\n".join(lines)

    def _write_zip_member(self, zf: zipfile.ZipFile, name: str, data: bytes) -> None:
        info = zipfile.ZipInfo(name)
        info.date_time = self._zip_timestamp
        info.compress_type = zipfile.ZIP_DEFLATED
        zf.writestr(info, data)

    def _hash_zip_members(self, package: Path) -> List[Dict[str, Any]]:
        members: List[Dict[str, Any]] = []
        with zipfile.ZipFile(package, "r") as zf:
            for info in sorted(zf.infolist(), key=lambda item: item.filename):
                if info.is_dir():
                    continue
                md5 = hashlib.md5()
                sha256 = hashlib.sha256()
                with zf.open(info, "r") as f:
                    for chunk in iter(lambda: f.read(1024 * 1024), b""):
                        md5.update(chunk)
                        sha256.update(chunk)
                members.append(
                    {
                        "name": info.filename,
                        "size": info.file_size,
                        "md5": md5.hexdigest(),
                        "sha256": sha256.hexdigest(),
                    }
                )
        return members

    # =====================================================================
    # COMPATIBILIDAD
    # =====================================================================

    def generate_sha256_manifest(
        self,
        pdf_dir: Union[str, Path] = "zenodo",
    ) -> Path:
        """Compatibilidad con llamadas antiguas."""
        return self.generate_hash_manifest(pdf_dir)
