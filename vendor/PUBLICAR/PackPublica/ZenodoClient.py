# PackPublica/ZenodoClient.py

from pathlib import Path
from typing import Optional, Union, Dict, List, Any
from urllib.parse import quote
import os
import re
import time

import requests

from .env import env
from .trace import ProgressBar


# =============================================================================
# Cliente base para la API de Zenodo
# =============================================================================
class ZenodoClient:
    BASE_URL = "https://zenodo.org/api"
    _blocked_until = 0.0
    _blocked_reason = ""

    def __init__(self, token: Optional[str] = None):
        if token is None:
            env.require("ZENODO_TOKEN")
            self.token = getattr(env, "ZENODO_TOKEN", None)
        else:
            self.token = token

        if not self.token:
            raise ValueError("No se pudo obtener ZENODO_TOKEN")

        self.headers = {
            "Authorization": f"Bearer {self.token}",
            "Accept": "application/json",
            "User-Agent": os.getenv(
                "PUBLICAR_USER_AGENT",
                "PUBLICAR/1.0 (https://estradad.es; Zenodo publishing client)",
            ),
        }
        self.max_retries = int(os.getenv("ZENODO_MAX_RETRIES", "8"))
        self.retry_base_seconds = int(os.getenv("ZENODO_RETRY_BASE_SECONDS", "60"))
        self.retry_max_seconds = int(os.getenv("ZENODO_RETRY_MAX_SECONDS", "900"))
        self.request_connect_timeout = int(os.getenv("ZENODO_CONNECT_TIMEOUT_SECONDS", "15"))
        self.request_read_timeout = int(os.getenv("ZENODO_READ_TIMEOUT_SECONDS", "45"))
        self.request_timeout = (
            self.request_connect_timeout,
            self.request_read_timeout,
        )
        self.upload_timeout = int(os.getenv("ZENODO_UPLOAD_TIMEOUT_SECONDS", "1800"))
        self.retry_statuses = {403, 429, 493, 502, 503, 504}

    # -------------------------------------------------------------------------
    # Petición genérica
    # -------------------------------------------------------------------------
    def _request(
        self,
        method: str,
        endpoint: str,
        **kwargs,
    ) -> Any:
        """
        Ejecuta una petición contra la API de Zenodo.

        - Añade siempre el token Bearer.
        - Reintenta errores temporales/rate-limit con espera controlada.
        - Muestra el cuerpo del error antes de lanzar HTTPError final.
        - Devuelve JSON tanto si es dict como si es list.
        - Devuelve {} para respuestas vacías/204.
        """
        endpoint = str(endpoint)
        if endpoint.startswith("http://") or endpoint.startswith("https://"):
            url = endpoint
        else:
            url = f"{self.BASE_URL}/{endpoint.lstrip('/')}"

        kwargs.setdefault("timeout", self.request_timeout)

        response = None
        method_label = method.upper()

        self._raise_if_temporarily_blocked()

        for attempt in range(1, self.max_retries + 1):
            try:
                response = requests.request(
                    method,
                    url,
                    headers=self.headers,
                    **kwargs,
                )
            except requests.RequestException as exc:
                if attempt >= self.max_retries:
                    raise
                delay = self._retry_delay(None, attempt)
                print(
                    f"⚠️ Zenodo fallo de red en intento {attempt}/"
                    f"{self.max_retries}: {exc}. Reintentando en {delay}s..."
                )
                self._sleep_with_status(delay, "Zenodo espera por fallo de red")
                continue

            if response.ok or response.status_code not in self.retry_statuses:
                break

            if self._is_temporary_block_response(response):
                self._remember_temporary_block(response)
                reason = self._summarize_response(response)
                raise RuntimeError(
                    "Zenodo ha bloqueado temporalmente esta red antes de la "
                    f"subida (HTTP {response.status_code}). No se esta "
                    "subiendo ningun archivo a Zenodo. "
                    f"Causa: {reason}"
                )

            if attempt >= self.max_retries:
                break

            delay = self._retry_delay(response, attempt)
            reason = self._summarize_response(response)
            print(
                f"⚠️ Zenodo HTTP {response.status_code} {method_label} {url}. "
                f"Intento {attempt}/{self.max_retries}. "
                f"Reintentando en {delay}s..."
            )
            if reason:
                print(f"   Causa Zenodo: {reason}")
            self._sleep_with_status(
                delay,
                f"Zenodo espera HTTP {response.status_code}",
            )

        if response is None:
            raise RuntimeError(f"No se obtuvo respuesta de Zenodo para {method_label} {url}")

        if not response.ok:
            self._remember_temporary_block(response)
            print(
                f"❌ Zenodo HTTP {response.status_code} "
                f"{method_label} {url}"
            )
            print(f"❌ Respuesta Zenodo: {response.text}")

        response.raise_for_status()

        if response.status_code == 204 or not response.content:
            return {}

        try:
            return response.json()
        except ValueError:
            return {}

    def _retry_delay(self, response, attempt: int) -> int:
        if response is not None:
            retry_after = response.headers.get("Retry-After")
            if retry_after:
                try:
                    return max(1, min(int(retry_after), self.retry_max_seconds))
                except ValueError:
                    pass

        delay = self.retry_base_seconds * (2 ** (attempt - 1))
        return max(1, min(delay, self.retry_max_seconds))

    def _raise_if_temporarily_blocked(self) -> None:
        now = time.time()
        if now >= self.__class__._blocked_until:
            return

        remaining = int(self.__class__._blocked_until - now)
        reason = self.__class__._blocked_reason or "bloqueo temporal previo"
        raise RuntimeError(
            f"Zenodo bloqueó temporalmente esta red. "
            f"Se evita insistir durante {remaining}s. Causa: {reason}"
        )

    def _remember_temporary_block(self, response) -> None:
        if response.status_code not in {403, 493}:
            return

        text = (getattr(response, "text", "") or "").lower()
        if "unusual traffic" not in text and "restricted" not in text:
            return

        cooldown = int(os.getenv("ZENODO_403_COOLDOWN_SECONDS", "900"))
        self.__class__._blocked_until = time.time() + max(60, cooldown)
        self.__class__._blocked_reason = self._summarize_response(response)

    @staticmethod
    def _is_temporary_block_response(response) -> bool:
        if response.status_code not in {403, 493}:
            return False

        text = (getattr(response, "text", "") or "").lower()
        return "unusual traffic" in text or "restricted" in text or "forbidden" in text

    @staticmethod
    def _sleep_with_status(seconds: int, label: str) -> None:
        step = 10 if seconds <= 120 else 30
        ProgressBar.wait(label, seconds, step=step)

    @staticmethod
    def _summarize_response(response) -> str:
        text = (getattr(response, "text", "") or "").strip()
        if not text:
            return ""

        status = getattr(response, "status_code", "")
        pieces = []

        title = re.search(r"<title>(.*?)</title>", text, flags=re.I | re.S)
        if title:
            pieces.append(re.sub(r"\s+", " ", title.group(1)).strip())

        if "unusual traffic" in text.lower():
            pieces.append("Zenodo indica trafico inusual desde esta red")
        elif "restricted" in text.lower():
            pieces.append("Zenodo indica acceso restringido temporalmente")

        reference = re.search(
            r"<strong>\s*Reference:\s*</strong>\s*<code>(.*?)</code>",
            text,
            flags=re.I | re.S,
        )
        if reference:
            pieces.append(f"referencia {reference.group(1).strip()}")

        if pieces:
            prefix = f"HTTP {status}: " if status else ""
            return prefix + " | ".join(pieces)

        text = " ".join(text.split())
        return text[:500]

    # -------------------------------------------------------------------------
    # Depósitos
    # -------------------------------------------------------------------------
    def create_deposition(
        self,
        title: str,
        description: str = "",
        upload_type: str = "publication",
        publication_type: str = "article",
    ) -> Dict[str, Any]:

        data = {
            "metadata": {
                "title": title,
                "description": description,
                "upload_type": upload_type,
                "publication_type": publication_type,
            }
        }

        return self._request(
            "POST",
            "deposit/depositions",
            json=data,
        )

    def get_deposition(
        self,
        deposition_id: int,
    ) -> Dict[str, Any]:

        result = self._request(
            "GET",
            f"deposit/depositions/{deposition_id}",
        )

        if not isinstance(result, dict):
            raise RuntimeError(
                f"Zenodo devolvió una respuesta inesperada "
                f"para el depósito {deposition_id}: "
                f"{type(result).__name__}"
            )

        return result

    def publish_deposition(
        self,
        deposition_id: int,
    ) -> Dict[str, Any]:

        result = self._request(
            "POST",
            f"deposit/depositions/{deposition_id}/actions/publish",
        )

        return result if isinstance(result, dict) else {}

    # -------------------------------------------------------------------------
    # Archivos
    # -------------------------------------------------------------------------
    def list_files(
        self,
        deposition_id: int,
    ) -> List[Dict[str, Any]]:
        """
        Lista los archivos del depósito.

        IMPORTANTE:
        GET /deposit/depositions/:id/files devuelve un ARRAY JSON.

        La implementación anterior trataba la respuesta como un dict y,
        cuando Zenodo devolvía correctamente una lista, retornaba [].
        Eso hacía creer al publicador que el borrador estaba vacío.
        """
        result = self._request(
            "GET",
            f"deposit/depositions/{deposition_id}/files",
        )

        if isinstance(result, list):
            return result

        # Compatibilidad defensiva por si alguna respuesta/envuelta futura
        # devuelve {"files": [...]}.
        if isinstance(result, dict):
            files = result.get("files", [])
            return files if isinstance(files, list) else []

        return []

    def upload_file(
        self,
        deposition_id: int,
        file_path: Union[str, Path],
    ) -> Dict[str, Any]:
        """
        Sube un archivo usando la API moderna de Zenodo:

            GET deposition -> links.bucket
            PUT {bucket}/{filename}

        La API antigua:
            POST /deposit/depositions/:id/files
        sigue documentada, pero Zenodo recomienda el bucket API.
        """
        file_path = Path(file_path)

        if not file_path.exists():
            raise FileNotFoundError(
                f"File not found: {file_path}"
            )

        if not file_path.is_file():
            raise ValueError(
                f"No es un archivo: {file_path}"
            )

        deposition = self.get_deposition(deposition_id)

        bucket_url = (
            deposition
            .get("links", {})
            .get("bucket")
        )

        if not bucket_url:
            raise RuntimeError(
                f"El depósito {deposition_id} no proporciona links.bucket. "
                "No se puede subir el archivo con seguridad."
            )

        # Codificar correctamente espacios, acentos, ñ, etc. en el nombre.
        encoded_name = quote(file_path.name, safe="")
        upload_url = f"{bucket_url.rstrip('/')}/{encoded_name}"

        with open(file_path, "rb") as f:
            response = None
            for attempt in range(1, self.max_retries + 1):
                self._raise_if_temporarily_blocked()
                f.seek(0)
                response = requests.put(
                    upload_url,
                    data=f,
                    headers=self.headers,
                    timeout=self.upload_timeout,
                )

                if response.ok or response.status_code not in self.retry_statuses:
                    break

                if self._is_temporary_block_response(response):
                    self._remember_temporary_block(response)
                    reason = self._summarize_response(response)
                    raise RuntimeError(
                        "Zenodo ha bloqueado temporalmente esta red durante "
                        f"la subida (HTTP {response.status_code}). No se "
                        f"ha completado la subida de {file_path.name}. "
                        f"Causa: {reason}"
                    )

                if attempt >= self.max_retries:
                    break

                delay = self._retry_delay(response, attempt)
                print(
                    f"⚠️ Zenodo HTTP {response.status_code} PUT {upload_url}. "
                    f"Intento {attempt}/{self.max_retries}. "
                    f"Reintentando subida en {delay}s..."
                )
                self._sleep_with_status(
                    delay,
                    f"Zenodo espera subida HTTP {response.status_code}",
                )

        if response is None:
            raise RuntimeError(f"No se obtuvo respuesta de Zenodo al subir {file_path.name}")

        if not response.ok:
            self._remember_temporary_block(response)
            print(
                f"❌ Zenodo HTTP {response.status_code} "
                f"PUT {upload_url}"
            )
            print(f"❌ Respuesta Zenodo: {response.text}")

        response.raise_for_status()

        if not response.content:
            return {}

        try:
            result = response.json()
        except ValueError:
            return {}

        return result if isinstance(result, dict) else {}

    def delete_file(
        self,
        deposition_id: int,
        file_id: Union[str, int],
    ) -> Dict[str, Any]:
        """
        Elimina un archivo de un depósito NO publicado.

        Este endpoint sigue documentado por Zenodo y trabaja con el file_id
        obtenido mediante list_files().
        """
        result = self._request(
            "DELETE",
            f"deposit/depositions/{deposition_id}/files/{file_id}",
        )

        return result if isinstance(result, dict) else {}
