# PckDemuestra/demuestra.py
# DEMUESTRA - controlador de validacion Lean 4.
#
# Regla central:
#   Solo DEMUESTRA/ es proyecto Lake. Todos los proyectos bajo Proyectos/
#   y YaEvaluado/ se validan usando la raiz DEMUESTRA como entorno Lean
#   compartido, para evitar crear .lake/Mathlib duplicados por proyecto.

from __future__ import annotations

import csv
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import logging
import os
import queue
import re
import shutil
import subprocess
import sys
import threading
import time
from shutil import which
from typing import Any, Dict, List, Optional

from .proyecto import Proyecto
from .seleccion_md import aviso_no_demostracion, fuente_principal, proyecto_evaluable
from .salida_archivos import enlace_archivo, FormatoConArchivos


DEFAULT_TIMEOUT = 600
CACHE_TIMEOUT = 900
LEAN_TIMEOUT: Optional[int] = None


def _configurar_salida_utf8() -> None:
    """Evita que la consola de Windows interrumpa Lean por simbolos Unicode."""
    for flujo in (sys.stdout, sys.stderr):
        reconfigure = getattr(flujo, "reconfigure", None)
        if reconfigure is not None:
            try:
                reconfigure(encoding="utf-8", errors="replace")
            except (OSError, ValueError):
                pass


_configurar_salida_utf8()


def _buscar_raiz_demuestra(desde: Path) -> Path:
    """
    Busca hacia arriba la carpeta DEMUESTRA.

    La raiz valida debe contener PckDemuestra, Proyectos, lakefile.toml
    y lean-toolchain. Si no se encuentra, se usa la carpeta indicada para
    poder producir errores claros.
    """
    p = desde.resolve()
    if p.is_file():
        p = p.parent

    for candidato in [p, *p.parents]:
        if (
            (candidato / "PckDemuestra").is_dir()
            and (candidato / "Proyectos").is_dir()
            and (candidato / "lakefile.toml").is_file()
            and (candidato / "lean-toolchain").is_file()
        ):
            return candidato

    return p


def _crear_logger(raiz_demuestra: Path) -> logging.Logger:
    logger = logging.getLogger("Demuestra")

    if getattr(logger, "_demuestra_configurado", False):
        return logger

    logger.setLevel(logging.INFO)
    logger.propagate = False

    logs = raiz_demuestra / "logs"
    logs.mkdir(parents=True, exist_ok=True)
    log_file = logs / "demuestra.log"

    formato = logging.Formatter(
        "%(asctime)s - Demuestra - %(levelname)s - %(message)s"
    )

    fh = logging.FileHandler(log_file, encoding="utf-8")
    fh.setFormatter(formato)
    logger.addHandler(fh)

    ch = logging.StreamHandler()
    ch.setFormatter(FormatoConArchivos(formato._fmt))
    logger.addHandler(ch)

    logger._demuestra_configurado = True

    logger.info("=" * 50)
    logger.info("Sistema DEMUESTRA inicializado.")
    logger.info("Raiz Lake compartida: %s", raiz_demuestra.resolve())
    logger.info("Log guardado en: %s", log_file.resolve())

    return logger


def _entorno_con_elan() -> dict[str, str]:
    env = os.environ.copy()
    elan_home = Path.home() / ".elan"
    elan_bin = elan_home / "bin"

    if elan_home.exists():
        env.setdefault("ELAN_HOME", str(elan_home))
    if elan_bin.exists():
        env["PATH"] = f"{elan_bin}{os.pathsep}{env.get('PATH', '')}"

    return env


def _resolver_exe(nombre: str) -> str:
    encontrado = which(nombre)
    if encontrado:
        return encontrado

    for candidato in (
        Path.home() / ".elan" / "bin" / f"{nombre}.exe",
        Path.home() / ".elan" / "bin" / nombre,
    ):
        if candidato.exists():
            return str(candidato)

    return nombre


def _clasificar_error_lean(salida: str, generado: bool = False) -> str:
    """Atribuye el fallo al artefacto o al generador que lo produjo."""
    if generado:
        return "ERROR_EVALUADOR"

    patrones_demostracion = (
        r"\bunsolved goals?\b",
        r"\btactic\b.*\bfailed\b",
        r"\bno goals to be solved\b",
        r"\bfailed to synthesize\b.*\bproof\b",
    )
    if any(
        re.search(patron, salida, re.IGNORECASE | re.DOTALL)
        for patron in patrones_demostracion
    ):
        return "DEMOSTRACION FALLIDA"
    return "CONSTRUCCION LEAN INCORRECTA"


def _clave_operacion(comando: List[str]) -> str:
    return " ".join(str(parte) for parte in comando)


def _ruta_historial(cwd: Path) -> Path:
    return _buscar_raiz_demuestra(cwd) / "evolucion.csv"


def _estimacion_historica(
    historial: Path,
    operacion: str,
) -> tuple[Optional[float], int]:
    """Obtiene la ultima ejecucion correcta de la misma operacion."""
    if not historial.is_file():
        return None, 0
    ultima = None
    try:
        with historial.open("r", encoding="utf-8-sig", newline="") as flujo:
            for fila in csv.DictReader(flujo):
                if str(fila.get("operacion", "")).casefold() != operacion.casefold():
                    continue
                if str(fila.get("codigo_salida", "")).strip() in {"124", "127"}:
                    continue
                try:
                    duracion = float(fila.get("duracion_segundos", ""))
                except (TypeError, ValueError):
                    continue
                if duracion > 0:
                    ultima = duracion
    except (OSError, csv.Error):
        return None, 0
    return (float(ultima), 1) if ultima is not None else (None, 0)


def _registrar_evolucion(
    historial: Path,
    operacion: str,
    duracion: float,
    codigo: int,
) -> None:
    """Conserva una sola medicion terminada por operacion en el CSV comun."""
    if int(codigo) in {124, 127}:
        return
    try:
        historial.parent.mkdir(parents=True, exist_ok=True)
        filas_por_operacion = {}
        if historial.is_file():
            with historial.open("r", encoding="utf-8-sig", newline="") as flujo:
                for fila in csv.DictReader(flujo):
                    clave = str(fila.get("operacion", "")).strip()
                    if (
                        clave
                        and str(fila.get("codigo_salida", "")).strip()
                        not in {"124", "127"}
                    ):
                        filas_por_operacion[clave.casefold()] = {
                            "operacion": clave,
                            "duracion_segundos": fila.get("duracion_segundos", ""),
                            "codigo_salida": fila.get("codigo_salida", ""),
                            "finalizado_en": fila.get("finalizado_en", ""),
                        }
        filas_por_operacion[operacion.casefold()] = {
            "operacion": operacion,
            "duracion_segundos": f"{max(0.0, duracion):.3f}",
            "codigo_salida": str(int(codigo)),
            "finalizado_en": datetime.now().astimezone().isoformat(
                timespec="seconds"
            ),
        }
        temporal = historial.with_suffix(".csv.tmp")
        with temporal.open("w", encoding="utf-8", newline="") as flujo:
            escritor = csv.DictWriter(
                flujo,
                fieldnames=(
                    "operacion",
                    "duracion_segundos",
                    "codigo_salida",
                    "finalizado_en",
                ),
            )
            escritor.writeheader()
            escritor.writerows(filas_por_operacion.values())
        os.replace(temporal, historial)
    except (OSError, csv.Error, ValueError):
        # La telemetría local nunca debe detener ni reclasificar la evaluación.
        return


class _BarraActividad:
    """Barra histórica si hay muestras; indeterminada en caso contrario."""

    def __init__(
        self,
        titulo: str,
        width: int = 32,
        estimacion: Optional[float] = None,
        muestras: int = 0,
    ):
        self.titulo = titulo
        self.width = max(10, int(width))
        self.estimacion = estimacion if estimacion and estimacion > 0 else None
        self.muestras = max(0, int(muestras))
        self._last_len = 0
        self._active = False

    def update(self, elapsed: float, idle: float) -> None:
        if self.estimacion is not None:
            ratio = min(0.99, max(0.0, elapsed / self.estimacion))
            completado = min(self.width - 1, int(self.width * ratio))
            bar = "#" * completado + "-" * (self.width - completado)
            percent = int(ratio * 100)
            if elapsed <= self.estimacion:
                detalle = f"faltan ~{max(0, int(self.estimacion - elapsed))}s"
            else:
                detalle = (
                    f"estimacion superada +{int(elapsed - self.estimacion)}s; "
                    "sigue activo"
                )
            self._render(
                bar,
                (
                    f"{percent:>2}%  {int(elapsed):>4}s / "
                    f"~{int(self.estimacion)}s; {detalle}; "
                    "referencia: ultima ejecucion"
                ),
            )
            return
        recorrido = max(1, (self.width - 5) * 2)
        posicion = int(elapsed) % recorrido
        if posicion >= self.width - 5:
            posicion = recorrido - posicion
        bar = ["-"] * self.width
        bar[posicion:posicion + 5] = ["#"] * 5
        self._render(
            "".join(bar),
            f"{int(elapsed):>4}s  activo; sin salida {int(idle)}s",
        )

    def finish(self, elapsed: float, status: str, code: int) -> None:
        self._render(
            "#" * self.width,
            f"{int(elapsed):>4}s  {status}; codigo {code}",
        )
        sys.stdout.write("\n")
        sys.stdout.flush()
        self._active = False

    def _render(self, bar: str, label: str) -> None:
        text = f"\r{self.titulo} [{bar}] {label}"
        padding = " " * max(0, self._last_len - len(text))
        sys.stdout.write(text + padding)
        sys.stdout.flush()
        self._last_len = len(text)
        self._active = True


def _ejecutar(
    comando: List[str],
    cwd: Path,
    timeout: Optional[int] = DEFAULT_TIMEOUT,
    mostrar_progreso: bool = False,
    etiqueta: str = "proceso",
) -> subprocess.CompletedProcess[str]:
    """
    Ejecuta un comando sin shell y conserva toda su salida. Opcionalmente
    muestra una barra de actividad en una sola linea; la salida extensa del
    proceso queda disponible en el resultado para registrarla aparte.

    Codigos sinteticos:
      127 -> ejecutable no encontrado
      124 -> timeout
    """
    try:
        comando_resuelto = [_resolver_exe(comando[0]), *comando[1:]]
        inicio = time.monotonic()
        comando_texto = " ".join(str(parte) for parte in comando)
        historial = _ruta_historial(cwd)
        estimacion, muestras = _estimacion_historica(
            historial,
            comando_texto,
        )
        if mostrar_progreso:
            print(f"INICIO [{etiqueta}]: {comando_texto}", flush=True)
            print(f"Directorio: {cwd}", flush=True)
            if estimacion is not None:
                print(
                    f"Estimacion historica: ~{int(estimacion)} s "
                    "(ultima ejecucion comparable).",
                    flush=True,
                )
            else:
                print(
                    "Estimacion historica: sin muestras comparables; "
                    "barra de actividad indeterminada.",
                    flush=True,
                )

        proceso = subprocess.Popen(
            comando_resuelto,
            cwd=str(cwd),
            env=_entorno_con_elan(),
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            encoding="utf-8",
            errors="replace",
            shell=False,
            bufsize=1,
        )
        cola: queue.Queue[Optional[str]] = queue.Queue()

        def leer_salida() -> None:
            assert proceso.stdout is not None
            for linea in iter(proceso.stdout.readline, ""):
                cola.put(linea)
            cola.put(None)

        lector = threading.Thread(target=leer_salida, daemon=True)
        lector.start()
        lineas: List[str] = []
        ultima_salida = inicio
        fin_salida = False
        barra = (
            _BarraActividad(etiqueta, estimacion=estimacion, muestras=muestras)
            if mostrar_progreso else None
        )
        if barra is not None:
            barra.update(0, 0)

        while proceso.poll() is None or not fin_salida:
            transcurrido = time.monotonic() - inicio
            if timeout is not None and transcurrido >= timeout:
                proceso.kill()
                lector.join(timeout=2)
                if barra is not None:
                    barra.finish(transcurrido, "TIMEOUT", 124)
                mensaje = (
                    f"TIMEOUT [{etiqueta}]: superados {timeout} segundos. "
                    "El proceso fue interrumpido; no es un error de demostracion.\n"
                )
                lineas.append(mensaje)
                if mostrar_progreso:
                    print(mensaje.rstrip(), flush=True)
                _registrar_evolucion(
                    historial,
                    comando_texto,
                    transcurrido,
                    124,
                )
                return subprocess.CompletedProcess(
                    comando, 124, stdout="".join(lineas), stderr=""
                )

            try:
                linea = cola.get(timeout=1)
                if linea is None:
                    fin_salida = True
                else:
                    lineas.append(linea)
                    ultima_salida = time.monotonic()
            except queue.Empty:
                ahora = time.monotonic()
                if barra is not None:
                    barra.update(ahora - inicio, ahora - ultima_salida)

        lector.join(timeout=2)
        duracion = time.monotonic() - inicio
        codigo = proceso.returncode if proceso.returncode is not None else 1
        if barra is not None:
            estado = "OK" if codigo == 0 else "FALLO"
            barra.finish(duracion, estado, codigo)
        _registrar_evolucion(
            historial,
            comando_texto,
            duracion,
            codigo,
        )
        return subprocess.CompletedProcess(
            comando, codigo, stdout="".join(lineas), stderr=""
        )
    except FileNotFoundError as exc:
        return subprocess.CompletedProcess(
            comando,
            127,
            stdout="",
            stderr=f"No se encontro el ejecutable: {comando[0]}\n{exc}",
        )
    except subprocess.TimeoutExpired as exc:
        stdout = exc.stdout or ""
        stderr = exc.stderr or ""
        if isinstance(stdout, bytes):
            stdout = stdout.decode("utf-8", errors="replace")
        if isinstance(stderr, bytes):
            stderr = stderr.decode("utf-8", errors="replace")

        return subprocess.CompletedProcess(
            comando,
            124,
            stdout=stdout,
            stderr=(
                stderr
                + f"\nTIMEOUT: el comando supero {timeout} segundos: "
                + " ".join(comando)
            ),
        )


class Demuestra:
    """
    Controlador de proyectos Lean.

    Uso principal:

        app = Demuestra()
        app = Demuestra(__file__)

        app.inspeccionar(nombre="ES_46_RV5")
        app.validar(nombre="ES_46_RV5")
        app.validar(nombre="ES_46_RV5", preparar_cache=True)
        app.validar(incluir_ya_evaluado=True)
    """

    def __init__(self, raiz: Optional[object] = None):
        origen = Path(raiz).resolve() if raiz is not None else Path.cwd().resolve()
        if origen.is_file():
            origen = origen.parent

        self.origen = origen
        self.raiz_demuestra = _buscar_raiz_demuestra(origen)
        self.raiz = self.raiz_demuestra
        self.logger = _crear_logger(self.raiz_demuestra)

    @property
    def proyectos_dir(self) -> Path:
        return self.raiz_demuestra / "Proyectos"

    @property
    def ya_evaluado_dir(self) -> Path:
        return self.raiz_demuestra / "YaEvaluado"

    def _resolver_proyecto(self, nombre: Optional[str] = None) -> Path:
        actual = self.origen.resolve()

        if nombre:
            for base in (self.proyectos_dir, self.ya_evaluado_dir):
                candidato = base / nombre
                if candidato.is_dir():
                    return candidato.resolve()

            if actual.name == nombre and (actual / "lean").is_dir():
                return actual

            return (self.proyectos_dir / nombre).resolve()

        if (actual / "lean").is_dir():
            return actual

        return self.raiz_demuestra

    def obtener_proyecto(self, nombre: str) -> Proyecto:
        return Proyecto(self._resolver_proyecto(nombre))

    def _proyectos_pendientes(self, incluir_ya_evaluado: bool = False) -> List[Path]:
        proyectos: List[Path] = []

        if self.proyectos_dir.is_dir():
            proyectos.extend(
                sorted(p.resolve() for p in self.proyectos_dir.iterdir() if p.is_dir())
            )

        if incluir_ya_evaluado and self.ya_evaluado_dir.is_dir():
            proyectos.extend(
                sorted(p.resolve() for p in self.ya_evaluado_dir.iterdir() if p.is_dir())
            )

        return proyectos

    @staticmethod
    def _archivos_lean(proyecto: Path) -> List[Path]:
        excluidos = {
            "anterior",
            "evaluaciones",
            "logs",
            "backups",
            ".anterior_nuevo",
            ".anterior_descartado",
            ".evaluacion_intercambio",
        }

        def evaluable(path: Path) -> bool:
            try:
                relativas = path.resolve().relative_to(proyecto.resolve()).parts
            except ValueError:
                return False
            return not any(parte.casefold() in excluidos for parte in relativas)

        lean_dir = proyecto / "lean"

        if lean_dir.is_dir():
            return sorted(
                p.resolve() for p in lean_dir.rglob("*.lean") if evaluable(p)
            )

        return sorted(
            p.resolve()
            for p in proyecto.rglob("*.lean")
            if (
                ".lake" not in p.parts
                and "__pycache__" not in p.parts
                and evaluable(p)
            )
        )

    def _relativo_a_raiz_lake(self, archivo: Path) -> str:
        try:
            return str(archivo.resolve().relative_to(self.raiz_demuestra))
        except ValueError:
            return str(archivo.resolve())

    def inspeccionar(self, nombre: Optional[str] = None) -> Dict[str, Any]:
        proyecto = self._resolver_proyecto(nombre)
        self.raiz = proyecto

        archivos = self._archivos_lean(proyecto) if proyecto.exists() else []

        info = {
            "nombre": nombre or proyecto.name,
            "raiz_demuestra": self.raiz_demuestra,
            "raiz": proyecto,
            "archivos_lean": archivos,
            "cantidad": len(archivos),
        }

        print(f"Proyecto: {info['nombre']}")
        print(f"Raiz DEMUESTRA/Lake: {self.raiz_demuestra}")
        print(f"Raiz proyecto: {proyecto}")
        print(f"Archivos Lean: {len(archivos)}")
        for archivo in archivos:
            print(f"  - {enlace_archivo(archivo)}")

        return info

    def comprobar_lake(self) -> bool:
        resultado = _ejecutar(["lake", "--version"], self.raiz_demuestra, timeout=30)

        if resultado.returncode != 0:
            self.logger.error(
                "No se puede ejecutar lake.\n%s",
                (resultado.stderr or resultado.stdout).strip(),
            )
            return False

        version = (resultado.stdout or resultado.stderr).strip()
        if version:
            self.logger.info("Lake disponible: %s", version.splitlines()[0])

        return True

    def preparar_cache_mathlib(self) -> int:
        self.logger.info("Preparando cache de Mathlib en la raiz compartida...")

        resultado = _ejecutar(
            ["lake", "exe", "cache", "get"],
            self.raiz_demuestra,
            timeout=CACHE_TIMEOUT,
            mostrar_progreso=True,
            etiqueta="cache Mathlib",
        )

        if resultado.returncode != 0:
            self.logger.error(
                "No se pudo preparar cache Mathlib. Codigo %s.",
                resultado.returncode,
            )
        else:
            self.logger.info("Cache Mathlib preparada correctamente.")

        return resultado.returncode

    def _compilar_archivo(self, archivo: Path) -> tuple[int, str]:
        relativo = self._relativo_a_raiz_lake(archivo)
        self.logger.info("Compilando %s desde %s", archivo, self.raiz_demuestra)
        contenido = archivo.read_text(encoding="utf-8", errors="replace")
        generado = "-- GENERADO_POR:" in contenido

        resultado = _ejecutar(
            ["lake", "env", "lean", relativo],
            self.raiz_demuestra,
            timeout=LEAN_TIMEOUT,
            mostrar_progreso=True,
            etiqueta=f"Lean {archivo.name}",
        )

        salida = (resultado.stdout or "").strip()
        error = (resultado.stderr or "").strip()
        detalle_log = (
            self.raiz_demuestra / "logs" /
            f"lean_{archivo.stem}_detalle.log"
        )
        detalle_guardado = False
        try:
            detalle_log.parent.mkdir(parents=True, exist_ok=True)
            detalle_log.write_text(
                "\n".join(parte for parte in (salida, error) if parte) + "\n",
                encoding="utf-8",
            )
            detalle_guardado = True
        except OSError as exc:
            print(f"Aviso: no se pudo guardar el detalle tecnico de Lean: {exc}")

        certificado_parcial = None
        if resultado.returncode not in {0, 124, 127} and generado:
            certificado_parcial = self._certificar_nodos_independientes(
                archivo,
                f"{salida}\n{error}",
            )
            if certificado_parcial is None:
                certificado_parcial = self._certificar_prefijo_valido(
                    archivo,
                    f"{salida}\n{error}",
                )

        if resultado.returncode == 0:
            if "DEMUESTRA_FORMALIZATION_STATUS: PARTIAL" in contenido:
                if generado:
                    self._certificar_nodos_independientes(
                        archivo,
                        f"{salida}\n{error}",
                    )
                print(
                    f"\nDEMOSTRACION PENDIENTE: {enlace_archivo(archivo)} compila, "
                    "pero su resultado principal aun no esta demostrado."
                )
                return 0, "DEMOSTRACION PENDIENTE"
            print(f"\nOK: {enlace_archivo(archivo)} compilado y demostrado correctamente.")
            return 0, "DEMOSTRACION COMPLETA"

        if resultado.returncode == 124:
            clase = "INCONCLUSO"
            print(f"\nINCONCLUSO: {enlace_archivo(archivo)} excedio el tiempo permitido.")
            print("Causa: Lean/Lake no termino; esto no demuestra un error formal.")
            print(f"Revisar: preparacion de Mathlib, cache, red y {enlace_archivo(self.raiz_demuestra / 'logs/demuestra.log')}.")
            print("Accion: preparar la cache y repetir la evaluacion.")
        elif resultado.returncode == 127:
            clase = "INCONCLUSO"
            print(f"\nINCONCLUSO: no se pudo iniciar Lean para {enlace_archivo(archivo)}.")
            print(f"Revisar: instalacion de Elan/Lake, PATH y {enlace_archivo(self.raiz_demuestra / 'logs/demuestra.log')}.")
        else:
            clase = _clasificar_error_lean(
                f"{salida}\n{error}",
                generado=generado,
            )
            if clase == "ERROR_EVALUADOR":
                print(
                    f"\nERROR_EVALUADOR: Lean rechazo el archivo generado "
                    f"{enlace_archivo(archivo)}."
                )
                print(
                    "Responsabilidad: el traductor no produjo una construccion "
                    "Lean aceptada; no se atribuye al documento una prueba ausente."
                )
                if certificado_parcial is not None:
                    nodos = ", ".join(certificado_parcial["certified_nodes"])
                    print(
                        "Certificacion parcial conservada por el kernel: "
                        f"{nodos}."
                    )
            else:
                print(f"\n{clase}: Lean encontro errores en {enlace_archivo(archivo)}.")
                print(
                    "Alcance: se rechaza el intento Lean actual, no la teoria. "
                    "Una refutacion exige contradiccion o contraejemplo demostrados."
                )
            if detalle_guardado:
                print(f"Detalle tecnico completo: {enlace_archivo(detalle_log)}")

        return resultado.returncode, clase

    def _certificar_nodos_independientes(
        self,
        archivo: Path,
        salida_lean: Optional[str] = None,
    ) -> Optional[Dict[str, Any]]:
        """Audita cada teorema generado sin depender del exito de los demas."""
        if salida_lean is not None:
            return self._certificar_nodos_desde_salida(archivo, salida_lean)
        contenido = archivo.read_text(encoding="utf-8", errors="replace")
        namespace_match = re.search(
            r"^namespace\s+([A-Za-z0-9_'.]+)\s*$",
            contenido,
            re.MULTILINE,
        )
        if namespace_match is None:
            return None
        namespace = namespace_match.group(1)
        teoremas = []
        patron_teorema = re.compile(
            r"^theorem derive_([A-Za-z0-9_]+)\b",
            re.MULTILINE,
        )
        coincidencias = list(patron_teorema.finditer(contenido))
        for indice, match in enumerate(coincidencias):
            node_id = match.group(1)
            limite = (
                coincidencias[indice + 1].start()
                if indice + 1 < len(coincidencias)
                else len(contenido)
            )
            tramo = contenido[match.start():limite]
            marcador = re.search(
                rf"^-- DEMUESTRA_ASSERTION: {re.escape(node_id)}\|"
                r"([^|]+)\|([^\r\n]+)$",
                tramo,
                re.MULTILINE,
            )
            if marcador is None:
                continue
            bloque = tramo[:marcador.end()]
            linea_inicio = contenido.count("\n", 0, match.start()) + 1
            linea_fin = linea_inicio + bloque.count("\n")
            hipotesis = sorted(set(re.findall(
                r"\((h_[A-Za-z0-9_']+)\s*:",
                bloque,
            )))
            teoremas.append({
                "node": node_id,
                "theorem": f"{namespace}.derive_{node_id}",
                "hypotheses": hipotesis,
                "construction_status": marcador.group(1),
                "generator_marker": marcador.group(2),
                "source_start_line": linea_inicio,
                "source_end_line": linea_fin,
            })
        if not teoremas:
            return None

        comprobaciones = [
            "",
            "-- DEMUESTRA_NODEWISE_AUDIT_BEGIN",
        ]
        for item in teoremas:
            comprobaciones.extend([
                f"#check {item['theorem']}",
                f"#print axioms {item['theorem']}",
            ])
        comprobaciones.append("-- DEMUESTRA_NODEWISE_AUDIT_END")
        candidato_texto = contenido.rstrip() + "\n" + "\n".join(comprobaciones) + "\n"

        toolchain_path = self.raiz_demuestra / "lean-toolchain"
        toolchain = (
            toolchain_path.read_text(encoding="utf-8", errors="replace").strip()
            if toolchain_path.is_file() else "DESCONOCIDO"
        )
        fingerprint = hashlib.sha256(
            (toolchain + "\n" + candidato_texto).encode("utf-8")
        ).hexdigest()
        evaluaciones = archivo.parent / "evaluaciones"
        evaluaciones.mkdir(parents=True, exist_ok=True)
        certificado_path = (
            evaluaciones / f"CERTIFICADO_PARCIAL_LEAN_{archivo.stem}.json"
        )
        if certificado_path.is_file():
            try:
                previo = json.loads(certificado_path.read_text(encoding="utf-8"))
                if (
                    previo.get("schema_version") == 3
                    and previo.get("fingerprint") == fingerprint
                    and previo.get("status") == "CERTIFICADO_PARCIAL"
                ):
                    copia_publicable = archivo.parent / certificado_path.name
                    copia_publicable.write_text(
                        json.dumps(previo, ensure_ascii=False, indent=2) + "\n",
                        encoding="utf-8",
                    )
                    print(
                        "Certificacion Lean por nodos reutilizada por hash: "
                        f"{certificado_path.name}"
                    )
                    return previo
            except (OSError, json.JSONDecodeError):
                pass

        carpeta = self.raiz_demuestra / "logs" / "certificacion_nodos"
        carpeta.mkdir(parents=True, exist_ok=True)
        candidato_path = carpeta / f"{archivo.stem}_auditoria_nodos.lean"
        candidato_path.write_text(candidato_texto, encoding="utf-8")
        resultado = _ejecutar(
            ["lake", "env", "lean", str(candidato_path)],
            self.raiz_demuestra,
            timeout=LEAN_TIMEOUT,
            mostrar_progreso=True,
            etiqueta=f"Lean nodos {archivo.stem}",
        )
        salida = (resultado.stdout or "") + (resultado.stderr or "")
        log_path = archivo.parent / "logs" / f"LEAN_NODOS_{archivo.stem}.log"
        log_path.parent.mkdir(parents=True, exist_ok=True)
        log_path.write_text(salida, encoding="utf-8")
        if resultado.returncode in {124, 127}:
            return None

        lineas_error = {
            int(linea)
            for linea in re.findall(r":(\d+):\d+: error:", salida)
        }
        resultados_nodo = []
        for item in teoremas:
            patron_axiomas = re.compile(
                rf"['\"]?{re.escape(item['theorem'])}['\"]? depends on axioms:\s*"
                r"\[([^\]]*)\]"
            )
            axiomas_match = patron_axiomas.search(salida)
            axiomas = []
            if axiomas_match:
                axiomas = [
                    valor.strip()
                    for valor in axiomas_match.group(1).split(",")
                    if valor.strip()
                ]
            errores_bloque = sorted(
                linea for linea in lineas_error
                if item["source_start_line"] <= linea <= item["source_end_line"]
            )
            if axiomas_match and "sorryAx" not in axiomas and not errores_bloque:
                estado = "CERTIFICADO_POR_KERNEL_CON_HIPOTESIS"
            elif errores_bloque or "sorryAx" in axiomas:
                estado = "ERROR_DE_TRADUCCION"
            else:
                estado = "NO_DETERMINADO"
            resultados_nodo.append({
                **item,
                "status": estado,
                "axioms": axiomas,
                "error_lines": errores_bloque,
            })

        certificados = [
            item for item in resultados_nodo
            if item["status"] == "CERTIFICADO_POR_KERNEL_CON_HIPOTESIS"
        ]
        if not certificados:
            return None
        fallidos = [
            item for item in resultados_nodo
            if item["status"] == "ERROR_DE_TRADUCCION"
        ]
        no_determinados = [
            item for item in resultados_nodo
            if item["status"] == "NO_DETERMINADO"
        ]
        certificado = {
            "schema_version": 3,
            "certificate_type": "LEAN_KERNEL_NODEWISE_CONDITIONAL_DECLARATIONS",
            "status": "CERTIFICADO_PARCIAL",
            "project": archivo.stem,
            "issued_on": datetime.now(timezone.utc).isoformat(timespec="seconds"),
            "kernel": "Lean 4",
            "toolchain": toolchain,
            "fingerprint": fingerprint,
            "source_file": archivo.name,
            "source_sha256": hashlib.sha256(contenido.encode("utf-8")).hexdigest(),
            "kernel_candidate_sha256": hashlib.sha256(
                candidato_texto.encode("utf-8")
            ).hexdigest(),
            "certified_nodes": [item["node"] for item in certificados],
            "failed_translation_nodes": [item["node"] for item in fallidos],
            "undetermined_nodes": [item["node"] for item in no_determinados],
            "declarations": resultados_nodo,
            "kernel_exit_code": resultado.returncode,
            "kernel_log": str(log_path.relative_to(archivo.parent)),
            "kernel_log_sha256": hashlib.sha256(
                salida.encode("utf-8")
            ).hexdigest(),
            "scope": (
                "Certifica por separado las declaraciones condicionales aceptadas "
                "por Lean sin sorryAx. Los errores de otros nodos se atribuyen a "
                "la traduccion y no invalidan los certificados conservados. No "
                "certifica por si solo el objetivo global del proyecto."
            ),
        }
        certificado_path.write_text(
            json.dumps(certificado, ensure_ascii=False, indent=2) + "\n",
            encoding="utf-8",
        )
        copia_publicable = archivo.parent / certificado_path.name
        copia_publicable.write_text(
            json.dumps(certificado, ensure_ascii=False, indent=2) + "\n",
            encoding="utf-8",
        )
        print(
            "Certificacion Lean por nodos emitida: "
            f"{enlace_archivo(copia_publicable)}; "
            f"{len(certificados)} certificados, {len(fallidos)} errores de "
            f"traduccion y {len(no_determinados)} no determinados."
        )
        return certificado

    def _certificar_nodos_desde_salida(
        self,
        archivo: Path,
        salida_lean: str,
    ) -> Optional[Dict[str, Any]]:
        """Conserva los teoremas que el kernel elaboro sin error en su bloque."""
        contenido = archivo.read_text(encoding="utf-8", errors="replace")
        namespace_match = re.search(
            r"^namespace\s+([A-Za-z0-9_'.]+)\s*$",
            contenido,
            re.MULTILINE,
        )
        if namespace_match is None:
            return None
        namespace = namespace_match.group(1)
        coincidencias = list(re.finditer(
            r"^theorem derive_([A-Za-z0-9_]+)\b",
            contenido,
            re.MULTILINE,
        ))
        if not coincidencias:
            return None
        lineas_error = {
            int(linea)
            for linea in re.findall(r":(\d+):\d+: error:", salida_lean)
        }
        resultados_nodo = []
        for indice, match in enumerate(coincidencias):
            node_id = match.group(1)
            limite = (
                coincidencias[indice + 1].start()
                if indice + 1 < len(coincidencias)
                else len(contenido)
            )
            tramo = contenido[match.start():limite]
            marcador = re.search(
                rf"^-- DEMUESTRA_ASSERTION: {re.escape(node_id)}\|"
                r"([^|]+)\|([^\r\n]+)$",
                tramo,
                re.MULTILINE,
            )
            if marcador is None:
                continue
            bloque = tramo[:marcador.end()]
            linea_inicio = contenido.count("\n", 0, match.start()) + 1
            linea_fin = linea_inicio + bloque.count("\n")
            errores_bloque = sorted(
                linea for linea in lineas_error
                if linea_inicio <= linea <= linea_fin
            )
            hipotesis = sorted(set(re.findall(
                r"\((h_[A-Za-z0-9_']+)\s*:",
                bloque,
            )))
            referencias = sorted(set(re.findall(
                r"\bderive_([A-Za-z0-9_]+)\b",
                bloque,
            )) - {node_id})
            marcador_prohibido = bool(re.search(
                r"\b(?:sorry|admit|axiom)\b",
                bloque,
            ))
            if errores_bloque:
                estado = "ERROR_DE_TRADUCCION"
            elif referencias or marcador_prohibido:
                estado = "NO_DETERMINADO"
            else:
                estado = "CERTIFICADO_POR_KERNEL_CON_HIPOTESIS"
            resultados_nodo.append({
                "node": node_id,
                "theorem": f"{namespace}.derive_{node_id}",
                "hypotheses": hipotesis,
                "construction_status": marcador.group(1),
                "generator_marker": marcador.group(2),
                "source_start_line": linea_inicio,
                "source_end_line": linea_fin,
                "status": estado,
                "axioms": [],
                "error_lines": errores_bloque,
                "derive_references": referencias,
            })
        nodos_registrados = {item["node"] for item in resultados_nodo}
        for marcador in re.finditer(
            r"^-- DEMUESTRA_ASSERTION: ([A-Za-z0-9_]+)\|"
            r"([^|]+)\|([^\r\n]+)$",
            contenido,
            re.MULTILINE,
        ):
            node_id, construction_status, generator_marker = marcador.groups()
            if node_id in nodos_registrados:
                continue
            estado_marcador = generator_marker.strip().upper()
            if estado_marcador in {"NO_DETERMINADO", "NO_DETERMINADA"}:
                estado = "NO_DETERMINADO"
            elif estado_marcador in {
                "ERROR_DE_TRADUCCION", "ERROR_TRADUCCION", "FALLO_TRADUCCION"
            }:
                estado = "ERROR_DE_TRADUCCION"
            else:
                continue
            linea = contenido.count("\n", 0, marcador.start()) + 1
            resultados_nodo.append({
                "node": node_id,
                "theorem": None,
                "hypotheses": [],
                "construction_status": construction_status,
                "generator_marker": generator_marker,
                "source_start_line": linea,
                "source_end_line": linea,
                "status": estado,
                "axioms": [],
                "error_lines": [],
                "derive_references": [],
            })
            nodos_registrados.add(node_id)
        certificados = [
            item for item in resultados_nodo
            if item["status"] == "CERTIFICADO_POR_KERNEL_CON_HIPOTESIS"
        ]
        if not certificados:
            return None
        fallidos = [
            item for item in resultados_nodo
            if item["status"] == "ERROR_DE_TRADUCCION"
        ]
        no_determinados = [
            item for item in resultados_nodo
            if item["status"] == "NO_DETERMINADO"
        ]
        toolchain_path = self.raiz_demuestra / "lean-toolchain"
        toolchain = (
            toolchain_path.read_text(encoding="utf-8", errors="replace").strip()
            if toolchain_path.is_file() else "DESCONOCIDO"
        )
        source_sha256 = hashlib.sha256(contenido.encode("utf-8")).hexdigest()
        log_sha256 = hashlib.sha256(salida_lean.encode("utf-8")).hexdigest()
        fingerprint = hashlib.sha256(
            (toolchain + "\n" + source_sha256 + "\n" + log_sha256).encode("utf-8")
        ).hexdigest()
        certificado = {
            "schema_version": 4,
            "certificate_type": "LEAN_KERNEL_NODEWISE_ELABORATION",
            "status": "CERTIFICADO_PARCIAL",
            "project": archivo.stem,
            "issued_on": datetime.now(timezone.utc).isoformat(timespec="seconds"),
            "kernel": "Lean 4",
            "toolchain": toolchain,
            "fingerprint": fingerprint,
            "source_file": archivo.name,
            "source_sha256": source_sha256,
            "kernel_log_sha256": log_sha256,
            "certified_nodes": [item["node"] for item in certificados],
            "failed_translation_nodes": [item["node"] for item in fallidos],
            "undetermined_nodes": [item["node"] for item in no_determinados],
            "declarations": resultados_nodo,
            "kernel_exit_code": 1 if lineas_error else 0,
            "kernel_log": f"logs/LEAN_{archivo.stem}_DETALLE.log",
            "trust_basis": [
                "elaboracion_real_del_archivo_completo",
                "ausencia_de_error_en_el_bloque_del_teorema",
                "ausencia_de_sorry_admit_axiom_en_el_bloque",
                "ausencia_de_referencias_a_otros_derive",
            ],
            "scope": (
                "Certifica las declaraciones condicionales que Lean elaboro sin "
                "error en la ejecucion principal. Cada cuerpo es independiente de "
                "otros derive_* y no contiene sorry, admit ni axiomas introducidos. "
                "Los errores de otros nodos no invalidan estos resultados."
            ),
        }
        evaluaciones = archivo.parent / "evaluaciones"
        evaluaciones.mkdir(parents=True, exist_ok=True)
        certificado_path = (
            evaluaciones / f"CERTIFICADO_PARCIAL_LEAN_{archivo.stem}.json"
        )
        texto = json.dumps(certificado, ensure_ascii=False, indent=2) + "\n"
        certificado_path.write_text(texto, encoding="utf-8")
        (archivo.parent / certificado_path.name).write_text(texto, encoding="utf-8")
        print(
            "Certificacion Lean por nodos conservada desde la ejecucion principal: "
            f"{enlace_archivo(archivo.parent / certificado_path.name)}; "
            f"{len(certificados)} certificados, {len(fallidos)} errores de "
            f"traduccion y {len(no_determinados)} no determinados."
        )
        return certificado

    def _certificar_prefijo_valido(
        self,
        archivo: Path,
        salida_lean: str,
    ) -> Optional[Dict[str, Any]]:
        """Certifica el prefijo completo anterior al primer error del kernel."""
        errores = [
            int(linea)
            for linea in re.findall(r":(\d+):\d+: error:", salida_lean)
        ]
        if not errores:
            return None
        primera_linea_error = min(errores)
        contenido = archivo.read_text(encoding="utf-8", errors="replace")
        lineas = contenido.splitlines()
        namespace_match = re.search(r"^namespace\s+([A-Za-z0-9_'.]+)\s*$", contenido, re.MULTILINE)
        if namespace_match is None:
            return None
        namespace = namespace_match.group(1)

        patron_assertion = re.compile(
            r"^-- DEMUESTRA_ASSERTION: ([A-Za-z0-9_]+)\|"
            r"[A-Z_]+\|(VERIFICADA|VERIFICADA_ESTRUCTURAL)$"
        )
        candidatos = []
        corte = None
        for numero, linea in enumerate(lineas, start=1):
            if numero >= primera_linea_error:
                break
            match = patron_assertion.match(linea)
            if match:
                candidatos.append((match.group(1), match.group(2)))
                corte = numero
        if not candidatos or corte is None:
            return None

        certificados = []
        for node_id, marker_status in candidatos:
            inicio = contenido.find(f"theorem derive_{node_id}")
            fin = contenido.find(f"-- DEMUESTRA_ASSERTION: {node_id}|", inicio)
            if inicio < 0 or fin < 0:
                continue
            bloque = contenido[inicio:fin]
            hipotesis = sorted(set(re.findall(
                r"\((h_[A-Za-z0-9_']+)\s*:", bloque
            )))
            certificados.append({
                "node": node_id,
                "theorem": f"{namespace}.derive_{node_id}",
                "hypotheses": hipotesis,
                "generator_marker": marker_status,
            })
        if not certificados:
            return None

        checks = []
        for item in certificados:
            checks.extend([
                f"#check {item['theorem']}",
                f"#print axioms {item['theorem']}",
            ])
        candidato_texto = "\n".join([
            *lineas[:corte],
            "",
            *checks,
            "",
            f"end {namespace}",
            "",
        ])
        prefijo_fuente = "\n".join(lineas[:corte])
        prefijo_sha256 = hashlib.sha256(
            prefijo_fuente.encode("utf-8")
        ).hexdigest()
        toolchain_path = self.raiz_demuestra / "lean-toolchain"
        toolchain = (
            toolchain_path.read_text(encoding="utf-8", errors="replace").strip()
            if toolchain_path.is_file() else "DESCONOCIDO"
        )
        fingerprint = hashlib.sha256(
            (toolchain + "\n" + candidato_texto).encode("utf-8")
        ).hexdigest()
        evaluaciones = archivo.parent / "evaluaciones"
        evaluaciones.mkdir(parents=True, exist_ok=True)
        certificado_path = (
            evaluaciones / f"CERTIFICADO_PARCIAL_LEAN_{archivo.stem}.json"
        )
        if certificado_path.is_file():
            try:
                previo = json.loads(certificado_path.read_text(encoding="utf-8"))
                if (
                    previo.get("status") == "CERTIFICADO_PARCIAL"
                    and previo.get("fingerprint") == fingerprint
                    and previo.get("certified_prefix_sha256") == prefijo_sha256
                    and previo.get("kernel_candidate_sha256")
                    and previo.get("kernel_log_sha256")
                ):
                    copia_publicable = archivo.parent / certificado_path.name
                    copia_publicable.write_text(
                        json.dumps(previo, ensure_ascii=False, indent=2) + "\n",
                        encoding="utf-8",
                    )
                    print(
                        "Certificacion parcial Lean reutilizada por hash: "
                        f"{certificado_path.name}"
                    )
                    return previo
            except (OSError, json.JSONDecodeError):
                pass

        carpeta = self.raiz_demuestra / "logs" / "certificacion_nodos"
        carpeta.mkdir(parents=True, exist_ok=True)
        candidato_path = carpeta / f"{archivo.stem}_prefijo_certificable.lean"
        candidato_path.write_text(candidato_texto, encoding="utf-8")
        resultado = _ejecutar(
            ["lake", "env", "lean", str(candidato_path)],
            self.raiz_demuestra,
            timeout=LEAN_TIMEOUT,
            mostrar_progreso=True,
            etiqueta=f"Lean prefijo {archivo.stem}",
        )
        salida = (resultado.stdout or "") + (resultado.stderr or "")
        log_path = archivo.parent / "logs" / f"LEAN_PARCIAL_{archivo.stem}.log"
        log_path.parent.mkdir(parents=True, exist_ok=True)
        log_path.write_text(salida, encoding="utf-8")
        if resultado.returncode != 0:
            return None

        certificado = {
            "schema_version": 2,
            "certificate_type": "LEAN_KERNEL_CONDITIONAL_DECLARATIONS",
            "status": "CERTIFICADO_PARCIAL",
            "project": archivo.stem,
            "issued_on": datetime.now(timezone.utc).isoformat(timespec="seconds"),
            "kernel": "Lean 4",
            "toolchain": toolchain,
            "fingerprint": fingerprint,
            "source_file": archivo.name,
            "source_sha256": hashlib.sha256(contenido.encode("utf-8")).hexdigest(),
            "certified_prefix_last_line": corte,
            "certified_prefix_sha256": prefijo_sha256,
            "kernel_candidate_sha256": hashlib.sha256(
                candidato_texto.encode("utf-8")
            ).hexdigest(),
            "first_rejected_line": primera_linea_error,
            "certified_nodes": [item["node"] for item in certificados],
            "declarations": certificados,
            "kernel_exit_code": resultado.returncode,
            "kernel_log": str(log_path.relative_to(archivo.parent)),
            "kernel_log_sha256": hashlib.sha256(
                salida.encode("utf-8")
            ).hexdigest(),
            "scope": (
                "Certifica que Lean acepto estas declaraciones condicionales "
                "con las hipotesis enumeradas. No certifica los nodos posteriores "
                "ni el objetivo global del proyecto."
            ),
        }
        certificado_path.write_text(
            json.dumps(certificado, ensure_ascii=False, indent=2) + "\n",
            encoding="utf-8",
        )
        copia_publicable = archivo.parent / certificado_path.name
        copia_publicable.write_text(
            json.dumps(certificado, ensure_ascii=False, indent=2) + "\n",
            encoding="utf-8",
        )
        print(
            "Certificacion parcial Lean emitida: "
            f"{enlace_archivo(copia_publicable)}; "
            f"{', '.join(certificado['certified_nodes'])}."
        )
        return certificado

    def _validar_un_proyecto(self, proyecto: Path) -> int:
        if not proyecto.exists():
            self.logger.error("No existe el proyecto: %s", proyecto)
            print(f"No existe el proyecto: {proyecto}")
            return 2

        if not proyecto_evaluable(proyecto):
            print(aviso_no_demostracion(fuente_principal(proyecto) or f"{proyecto.name}.md"))
            self._estado_ultimo_proyecto = "NO EVALUADO"
            return 0

        archivos = self._archivos_lean(proyecto)

        if not archivos:
            mensaje = (
                f"No hay archivos .lean en {proyecto}. "
                "No se ejecuta compilacion."
            )
            self.logger.warning(mensaje)
            print(mensaje)
            self._estado_ultimo_proyecto = "SIN CONSTRUCCION LEAN"
            return 0

        fallos = []
        estados = []
        for archivo in archivos:
            rc, clase = self._compilar_archivo(archivo)
            estados.append((archivo, clase))
            if rc != 0:
                fallos.append((archivo, rc, clase))

        if fallos:
            self.logger.error(
                "Validacion Lean terminada con %d archivo(s) fallido(s).",
                len(fallos),
            )
            print("\nValidacion Lean terminada con errores:")
            for archivo, rc, clase in fallos:
                print(f"  - {enlace_archivo(archivo)}: {clase}, codigo {rc}")
            self._estado_ultimo_proyecto = fallos[0][2]
            return fallos[0][1] or 1

        pendientes = [archivo for archivo, clase in estados if clase == "DEMOSTRACION PENDIENTE"]
        if pendientes:
            self.logger.info(
                "Construccion Lean valida con %d demostracion(es) pendiente(s).",
                len(pendientes),
            )
            print(
                f"\nConstruccion Lean valida: {len(archivos)} archivo(s) compilado(s); "
                f"{len(pendientes)} con demostracion pendiente."
            )
            self._estado_ultimo_proyecto = "DEMOSTRACION PENDIENTE"
            return 0

        self.logger.info("Validacion Lean completa: %d archivo(s).", len(archivos))
        print(f"\nValidacion Lean completa: {len(archivos)} archivo(s) demostrado(s).")
        self._estado_ultimo_proyecto = "DEMOSTRACION COMPLETA"
        return 0

    def validar(
        self,
        nombre: Optional[str] = None,
        incluir_ya_evaluado: bool = False,
        preparar_cache: bool = False,
    ) -> int:
        """
        Valida proyectos usando siempre la raiz DEMUESTRA como cwd de Lake.

        Reglas:
        - No se ejecuta lake si no hay archivos .lean.
        - La cache de Mathlib solo se prepara si preparar_cache=True.
        - Cada archivo se compila con lake env lean <ruta-relativa-a-DEMUESTRA>.
        """
        if nombre:
            proyectos = [self._resolver_proyecto(nombre)]
        else:
            proyectos = self._proyectos_pendientes(incluir_ya_evaluado)

        if not proyectos:
            print("No hay proyectos para validar.")
            return 0

        seleccionados = []
        for proyecto in proyectos:
            if not proyecto.exists() or proyecto_evaluable(proyecto):
                seleccionados.append(proyecto)
            else:
                print(aviso_no_demostracion(fuente_principal(proyecto) or f"{proyecto.name}.md"))
        proyectos = seleccionados
        if not proyectos:
            print("No hay fuentes Markdown evaluables. No se ejecuta Lean.")
            return 0

        hay_lean = any(
            self._archivos_lean(proyecto) for proyecto in proyectos if proyecto.exists()
        )
        if not hay_lean:
            print("No hay archivos .lean en los proyectos seleccionados. No se ejecuta lake.")
            return 0

        if not self.comprobar_lake():
            return 127

        if preparar_cache:
            rc_cache = self.preparar_cache_mathlib()
            if rc_cache != 0:
                return rc_cache

        fallos = []
        pendientes = []
        for proyecto in proyectos:
            print(f"\n== Proyecto: {proyecto.name} ==")
            rc = self._validar_un_proyecto(proyecto)
            estado = getattr(self, "_estado_ultimo_proyecto", "ESTADO DESCONOCIDO")
            if rc != 0:
                fallos.append((proyecto, rc, estado))
            elif estado == "DEMOSTRACION PENDIENTE":
                pendientes.append(proyecto)

        if fallos:
            print("\nValidacion global terminada con errores:")
            for proyecto, rc, estado in fallos:
                print(f"  - {proyecto.name}: {estado}, codigo {rc}")
            return fallos[0][1] or 1

        if pendientes:
            print(
                "\nConstruccion global correcta, con demostraciones pendientes en: "
                + ", ".join(proyecto.name for proyecto in pendientes)
            )
            return 0

        print("\nValidacion global completa.")
        return 0

    def nuevo_proyecto(self, nombre: str) -> Path:
        if not re.match(r"^[A-Z][A-Za-z0-9_]*$", nombre):
            raise ValueError("Usa un nombre de modulo Lean valido, por ejemplo ES_47_RV1.")

        proyecto = self.proyectos_dir / nombre
        Proyecto(proyecto).asegurar_estructura()

        main = proyecto / "Main.lean"
        lean_main = proyecto / "lean" / "Main.lean"
        launcher = proyecto / "demuestra.py"

        if not main.exists():
            main.write_text(
                "\n".join(
                    [
                        f"import Proyectos.{nombre}.lean.Main",
                        "",
                        f"namespace Proyectos.{nombre}",
                        "",
                        f"end Proyectos.{nombre}",
                        "",
                    ]
                ),
                encoding="utf-8",
            )

        if not lean_main.exists():
            lean_main.write_text(
                "\n".join(
                    [
                        "import Mathlib",
                        "",
                        f"namespace Proyectos.{nombre}",
                        "",
                        "theorem sanity_check : True := by",
                        "  trivial",
                        "",
                        f"end Proyectos.{nombre}",
                        "",
                    ]
                ),
                encoding="utf-8",
            )

        if not launcher.exists():
            launcher.write_text(_launcher_proyecto(nombre), encoding="utf-8")

        return proyecto

    def finalizar_evaluacion(self, nombre: str) -> Path:
        origen = self.proyectos_dir / nombre
        destino = self.ya_evaluado_dir / nombre

        if not origen.exists():
            raise FileNotFoundError(f"No existe el proyecto '{nombre}' en Proyectos.")
        if destino.exists():
            raise FileExistsError(f"Ya existe '{nombre}' en YaEvaluado.")

        self.ya_evaluado_dir.mkdir(parents=True, exist_ok=True)
        shutil.move(str(origen), str(destino))
        return destino


def _launcher_proyecto(nombre: str) -> str:
    return "\n".join(
        [
            "#!/usr/bin/env python3",
            f"# {nombre}/demuestra.py",
            "import sys",
            "from pathlib import Path",
            "",
            "demuestra_path = Path(__file__).resolve().parents[2]",
            "sys.path.insert(0, str(demuestra_path))",
            "",
            "from PckDemuestra.demuestra import Demuestra",
            "",
            "TEST = 1 + 2",
            f"PROYECTO = {nombre!r}",
            "INCLUIR_YA_EVALUADO = False",
            "FINALIZAR_AL_TERMINAR = False",
            "PREPARAR_CACHE_MATHLIB = False",
            "",
            "",
            "if __name__ == \"__main__\":",
            "    app = Demuestra(__file__)",
            "    exit_code = 0",
            "",
            "    if TEST & 1:",
            "        print(f\"TEST{TEST}: Inspeccionando proyecto...\")",
            "        app.inspeccionar(nombre=PROYECTO)",
            "",
            "    if TEST & 2:",
            "        print(f\"TEST{TEST}: Validando proyecto con Lean 4...\")",
            "        exit_code = app.validar(",
            "            nombre=PROYECTO,",
            "            preparar_cache=PREPARAR_CACHE_MATHLIB,",
            "        )",
            "",
            "    if TEST & 4:",
            "        print(f\"TEST{TEST}: Validando todos los proyectos pendientes...\")",
            "        exit_code = app.validar(",
            "            incluir_ya_evaluado=INCLUIR_YA_EVALUADO,",
            "            preparar_cache=PREPARAR_CACHE_MATHLIB,",
            "        )",
            "",
            "    if TEST & 8:",
            "        print(f\"TEST{TEST}: Moviendo proyecto a YaEvaluado...\")",
            "        if FINALIZAR_AL_TERMINAR:",
            "            destino = app.finalizar_evaluacion(PROYECTO)",
            "            print(f\"Proyecto archivado en: {destino}\")",
            "        else:",
            "            print(\"FINALIZAR_AL_TERMINAR=False; no se mueve el proyecto.\")",
            "",
            "    if TEST & 16:",
            "        print(f\"TEST{TEST}: Preparando cache Mathlib compartida...\")",
            "        exit_code = app.preparar_cache_mathlib()",
            "",
            "    print(\"Proceso DEMUESTRA completado.\")",
            "    raise SystemExit(exit_code)",
            "",
        ]
    )


__all__ = ["Demuestra"]

