#!/usr/bin/env python3
# DEMUESTRA/publica.py
# Este script se usa para publicar y para construir los pdfs
# no forma parte del proyecto

import sys
import shutil
import os
import json
import hashlib
import subprocess
import re
from datetime import datetime, timezone
from pathlib import Path

# Windows puede abrir Python con CP1252 aunque los modulos de PUBLICAR emitan
# mensajes Unicode. Fijamos la salida antes de importar PackPublica.
for _stream in (sys.stdout, sys.stderr):
    if hasattr(_stream, "reconfigure"):
        _stream.reconfigure(encoding="utf-8", errors="replace")

# Usar primero la copia versionada de PUBLICAR incluida en DEMUESTRA.
PROJECT_ROOT = Path(__file__).resolve().parent
os.chdir(PROJECT_ROOT)
publicar_incluido = PROJECT_ROOT / "vendor" / "PUBLICAR"
publicar_externo = PROJECT_ROOT.parent / "PUBLICAR"
publicar_path = publicar_incluido if publicar_incluido.is_dir() else publicar_externo
sys.path.insert(0, str(publicar_path))

# Imports desde PackPublica
from PackPublica.env import env
from PackPublica.publicar import Publicar, Libro
from PackPublica.articulo import Articulo
from PackPublica.md import Md
from PackPublica.KDP import KDP
from PackPublica.FTPClient import FTPClient
from PackPublica.ZenodoClient import ZenodoClient
from PackPublica.ZenodoPublisher import ZenodoPublisher
from PackPublica.WebPublisher import WebPublisher
from PackPublica.formal_ast import parse_formula

# ============================================================
# CONFIGURACION DEL PROYECTO
# ============================================================
TEST = 2 + 64 #  + 4 + 8 + 16 + 32 + 64
PAGE_SIZE = "6x9"
LOCAL_ONLY = os.environ.get("DEMUESTRA_LOCAL_ONLY", "").strip().lower() in {
    "1", "true", "yes", "si", "sí",
}
PROYECTOS_FORZADOS_WEB = {
    nombre.strip()
    for nombre in re.split(r"[,;]", os.environ.get("DEMUESTRA_FORZAR_PROYECTOS", ""))
    if nombre.strip()
}

#ZENODO_TITLE = "The theory that will reconcile Quantum Mechanics with Einstein's Relativity"
#ZENODO_PDF_DIR = "zenodo"
#ZENODO_STATE_FILE = "zenodo/zenodo_state.json"
INIT_LOCAL = False

# Proyectos que DEMUESTRA decide publicar expresamente en la web.
# Se publican siempre con el nombre completo de su carpeta para no mezclar revisiones.
PROYECTOS_DEMOSTRADOS_WEB = [
    "ES_46_RV6",
]

PROYECTOS_CONFIRMADOS_WEB = [
]

PROYECTOS_PUBLICABLES_WEB = [
    *PROYECTOS_DEMOSTRADOS_WEB,
    *PROYECTOS_CONFIRMADOS_WEB,
]

DEMOSTRACIONES_WEB_EXTENSIONS = {".json", ".lean", ".pl", ".md", ".pdf", ".log", ".php", ".html", ".jpg", ".jpeg", ".png", ".webp", ".svg", ".ico", ".abstract", ".es", ".en", ".bat"}
MARKDOWNS_DEMOSTRACIONES_WEB_PREPARADOS = {}
DIRECTORIOS_PROYECTOS = {}
CONFIG_ORIGEN_NOMBRE = "config.txt"

# Solo estos Markdown son fuentes de demostraciones. Ejemplo: ES_46_RV6.md.
PATRON_MARKDOWN_DEMOSTRACION = re.compile(
    r"^[A-Za-z]{2}_\d+(?:_.+)?\.md$",
    re.IGNORECASE,
)
PATRON_BARRA_ACTIVIDAD = re.compile(
    r"\r[^\r\n]*\[[#-]{10,}\][^\r\n]*"
)


def _es_markdown_demostracion(ruta):
    return bool(PATRON_MARKDOWN_DEMOSTRACION.fullmatch(Path(ruta).name))


def _limpiar_barras_actividad(salida):
    """Retira del log los fotogramas de barras ya mostrados en consola."""
    return PATRON_BARRA_ACTIVIDAD.sub("", salida)


def _nombre_proyecto_web(project_spec):
    if isinstance(project_spec, tuple):
        project_spec = project_spec[0]
    return Path(project_spec).name


def _primer_archivo(candidatos):
    for candidato in candidatos:
        if candidato.exists():
            return candidato
    return None


def _index_proyectos_web():
    return _primer_archivo([PROJECT_ROOT / "web-base" / "index.php"])


def _proyecto_dir(project_name):
    if project_name in DIRECTORIOS_PROYECTOS:
        return DIRECTORIOS_PROYECTOS[project_name]
    pendiente = PROJECT_ROOT / "Proyectos" / project_name
    evaluado = PROJECT_ROOT / "YaEvaluado" / project_name
    return pendiente if pendiente.is_dir() else evaluado


def _extraer_proyectos_forzados_cli(argv):
    """Retira de argv la seleccion explicita de proyectos a reevaluar."""
    forzados = []
    restantes = [argv[0]]
    index = 1
    while index < len(argv):
        argumento = argv[index]
        if argumento in {"--forzar-proyecto", "--proyecto"}:
            index += 1
            if index >= len(argv):
                raise SystemExit(f"{argumento} exige al menos un nombre de proyecto.")
            while index < len(argv) and not argv[index].startswith("-"):
                forzados.append(argv[index])
                index += 1
            continue
        if argumento.startswith("--forzar-proyecto="):
            valor = argumento.split("=", 1)[1]
            forzados.extend(nombre for nombre in re.split(r"[,;]", valor) if nombre)
            index += 1
            continue
        if argumento.startswith("--proyecto="):
            valor = argumento.split("=", 1)[1]
            forzados.extend(nombre for nombre in re.split(r"[,;]", valor) if nombre)
            index += 1
            continue
        restantes.append(argumento)
        index += 1
    return {nombre.strip() for nombre in forzados if nombre.strip()}, restantes


def _validar_nodos_adec(datos):
    """Comprueba el contrato de nodos que consume ADEC v0.8.6."""
    nodes = datos.get("nodes")
    if not isinstance(nodes, list) or not nodes:
        raise ValueError("ADEC exige un atributo nodes no vacio.")

    ids = []
    for index, node in enumerate(nodes):
        if not isinstance(node, dict):
            raise ValueError(f"ADEC nodes[{index}] no es un objeto.")
        for field in ("id", "kind", "name", "description"):
            if not str(node.get(field) or "").strip():
                raise ValueError(
                    f"ADEC nodes[{index}] carece del campo obligatorio {field}."
                )
        if not isinstance(node.get("deps"), list):
            raise ValueError(f"ADEC nodes[{index}].deps debe ser una lista.")
        ids.append(str(node["id"]))

    if len(ids) != len(set(ids)):
        raise ValueError("ADEC no admite identificadores de nodo duplicados.")

    conocidos = set(ids)
    for node in nodes:
        desconocidas = [dep for dep in node["deps"] if str(dep) not in conocidos]
        if desconocidas:
            raise ValueError(
                f"ADEC: {node['id']} referencia dependencias inexistentes: "
                + ", ".join(map(str, desconocidas))
            )
        if len(node["deps"]) >= 2 and node.get("measurement_relationship") not in {
            "additive", "substitutive", "overlapping", "unclear"
        }:
            raise ValueError(
                f"ADEC: {node['id']} necesita measurement_relationship."
            )
        proof = node.get("proof")
        if proof is not None and (
            not isinstance(proof, dict)
            or not str(proof.get("status") or "").strip()
            or not isinstance(proof.get("steps"), list)
            or not proof["steps"]
        ):
            raise ValueError(f"ADEC: proof incompleto en {node['id']}.")
    return len(nodes)


def _adec_compatibilizar(
    project_name,
    datos,
    artifact_stage,
    result_id,
    result_name,
    result_description,
    result_deps=None,
):
    """Añade una envoltura ADEC sin eliminar campos propios del informe."""
    proyecto = _proyecto_dir(project_name)
    fuente = proyecto / f"{project_name}.extracted.json"
    base = {}
    if fuente.is_file():
        try:
            base = json.loads(fuente.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError):
            base = {}

    if not isinstance(datos.get("nodes"), list):
        datos["nodes"] = json.loads(json.dumps(base.get("nodes", [])))
    datos["nodes"] = [
        node for node in datos["nodes"]
        if not (
            isinstance(node, dict)
            and node.get("id") == result_id
            and node.get("kind") == "meta_validation"
        )
    ]
    ids = {
        str(node.get("id"))
        for node in datos["nodes"]
        if isinstance(node, dict) and node.get("id")
    }
    deps = [dep for dep in (result_deps or []) if dep in ids]
    summary_id = result_id
    suffix = 2
    while summary_id in ids:
        summary_id = f"{result_id}_{suffix}"
        suffix += 1
    passed = (
        datos.get("passed") is True
        or datos.get("certificate_eligible") is True
        or datos.get("status") in {"CERTIFICADO_PARCIAL", "EMITIDO"}
    )
    datos["nodes"].append({
        "id": summary_id,
        "kind": "meta_validation",
        "name": result_name,
        "description": result_description,
        "deps": deps,
        "measurement_relationship": "additive",
        "proof": {
            "method": str(datos.get("tool") or "DEMUESTRA"),
            "status": "verified" if passed else "unverified",
            "steps": [result_description],
            "verification_scope": artifact_stage,
        },
    })
    datos["schema"] = "ADEC_nodes_input_v1"
    datos["title"] = base.get("title") or datos.get("title") or project_name
    datos["version"] = str(base.get("version") or datos.get("version") or "1.0")
    datos["validation_mode"] = "article_analysis"
    datos["artifact_stage"] = artifact_stage
    datos["source"] = base.get("source") or datos.get("source") or f"{project_name}.md"
    datos["authors"] = base.get("authors") or datos.get("authors") or []
    node_count = _validar_nodos_adec(datos)
    datos["adec_compatible"] = True
    datos["adec_node_count"] = node_count
    datos["adec_access"] = {
        "engine": "ADEC v0.8.6",
        "mode": "remote_url_or_file_upload",
        "automatic_url_json": False,
        "reason": (
            "La web copia la URL publica y descarga el JSON para cargarlo "
            "desde el selector de archivos de ADEC."
        ),
    }
    datos.pop("adec_query_parameter", None)
    return datos


def _objetivo_formal_desde_nodos(datos):
    """Devuelve el ultimo teorema declarado sin asumir nombres de proyecto."""
    for nodo in reversed(datos.get("nodes") or []):
        if isinstance(nodo, dict) and nodo.get("kind") == "theorem" and nodo.get("id"):
            return str(nodo["id"])
    return None


def normalizar_informes_adec_proyecto(project_name):
    """Normaliza los JSON publicos existentes sin recalcular evaluaciones."""
    proyecto = _proyecto_dir(project_name)
    evaluaciones = proyecto / "evaluaciones"
    nombres_base = (f"{project_name}.json", f"{project_name}.extracted.json")
    normalizados = []
    for nombre in nombres_base:
        path = proyecto / nombre
        if not path.is_file():
            continue
        datos = json.loads(path.read_text(encoding="utf-8"))
        datos.setdefault("schema", "ADEC_nodes_input_v1")
        node_count = _validar_nodos_adec(datos)
        datos["adec_compatible"] = True
        datos["adec_node_count"] = node_count
        datos["adec_access"] = {
            "engine": "ADEC v0.8.6",
            "mode": "remote_url_or_file_upload",
            "automatic_url_json": False,
            "reason": (
                "La web copia la URL publica y descarga el JSON para cargarlo "
                "desde el selector de archivos de ADEC."
            ),
        }
        datos.pop("adec_query_parameter", None)
        path.write_text(
            json.dumps(datos, ensure_ascii=False, indent=2) + "\n",
            encoding="utf-8",
        )
        normalizados.append(nombre)

    especificaciones = (
        (
            f"LEAN_{project_name}.json",
            "lean_kernel_evaluation",
            f"EVAL_LEAN_{project_name}",
            "Resultado del evaluador Lean",
        ),
        (
            f"PROLOG_{project_name}.json",
            "prolog_structural_evaluation",
            f"EVAL_PROLOG_{project_name}",
            "Resultado del evaluador Prolog estructural",
        ),
        (
            f"PROLOG_MD_DIRECTO_{project_name}.json",
            "prolog_direct_markdown_derivation",
            f"EVAL_PROLOG_MD_DIRECTO_{project_name}",
            "Resultado del evaluador Prolog directo del Markdown",
        ),
        (
            f"AUDITORIA_{project_name}.json",
            "demuestra_closure_audit",
            f"AUDITORIA_FINAL_{project_name}",
            "Resultado de la auditoria final DEMUESTRA",
        ),
        (
            f"CERTIFICADO_PARCIAL_LEAN_{project_name}.json",
            "lean_partial_kernel_certificate",
            f"CERTIFICADO_PARCIAL_LEAN_{project_name}",
            "Certificado parcial independiente del kernel Lean",
        ),
        (
            f"CERTIFICADO_{project_name}.json",
            "demuestra_formal_certificate",
            f"CERTIFICADO_FINAL_{project_name}",
            "Certificado formal final DEMUESTRA",
        ),
    )
    for nombre, etapa, result_id, titulo in especificaciones:
        path = proyecto / nombre
        if not path.is_file():
            continue
        datos = json.loads(path.read_text(encoding="utf-8"))
        descripcion = str(
            datos.get("diagnosis")
            or datos.get("scope")
            or datos.get("verdict")
            or datos.get("status")
            or titulo
        )
        objetivo = (
            datos.get("result_json_node")
            or datos.get("goal")
            or _objetivo_formal_desde_nodos(datos)
        )
        deps = [objetivo] if objetivo else []
        _adec_compatibilizar(
            project_name,
            datos,
            etapa,
            result_id,
            titulo,
            descripcion,
            deps,
        )
        contenido = json.dumps(datos, ensure_ascii=False, indent=2) + "\n"
        path.write_text(contenido, encoding="utf-8")
        copia_evaluacion = evaluaciones / nombre
        if copia_evaluacion.is_file():
            copia_evaluacion.write_text(contenido, encoding="utf-8")
        normalizados.append(nombre)
    return normalizados


def _rutas_estado_evaluacion(proyecto, project_name):
    """Devuelve solo artefactos reproducibles que forman una evaluacion."""
    nombres = {
        f"{project_name}.json",
        f"{project_name}.extracted.json",
        f"{project_name}.lean",
        f"{project_name}.pl",
    }
    prefijos = (
        f"LEAN_{project_name}",
        f"PROLOG_{project_name}",
        f"PROLOG_MD_DIRECTO_{project_name}",
        f"AUDITORIA_{project_name}",
        f"CERTIFICADO_{project_name}",
        f"CERTIFICADO_PARCIAL_LEAN_{project_name}",
    )
    rutas = []
    for path in proyecto.iterdir():
        if path.is_file() and (
            path.name in nombres or path.name.startswith(prefijos)
        ):
            rutas.append(path.relative_to(proyecto))
    for subdir in ("evaluaciones", "logs"):
        base = proyecto / subdir
        if not base.is_dir():
            continue
        for path in base.iterdir():
            if path.is_file() and path.name.startswith(prefijos):
                rutas.append(path.relative_to(proyecto))
    return sorted(set(rutas), key=lambda path: str(path).lower())


def _leer_json_opcional(path):
    if not path.is_file():
        return {}
    try:
        datos = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError):
        return {}
    return datos if isinstance(datos, dict) else {}


def _metricas_evaluacion(base, project_name):
    lean = _leer_json_opcional(base / f"LEAN_{project_name}.json")
    prolog = _leer_json_opcional(base / f"PROLOG_{project_name}.json")
    directo = _leer_json_opcional(base / f"PROLOG_MD_DIRECTO_{project_name}.json")
    auditoria = _leer_json_opcional(base / f"AUDITORIA_{project_name}.json")
    parcial = _leer_json_opcional(
        base / f"CERTIFICADO_PARCIAL_LEAN_{project_name}.json"
    )
    clasificaciones = auditoria.get("classifications") or []
    return {
        "certificate_eligible": auditoria.get("certificate_eligible") is True,
        "lean_passed": lean.get("passed") is True,
        "prolog_structural_passed": prolog.get("passed") is True,
        "prolog_direct_passed": directo.get("passed") is True,
        "formal_refutations": sum(
            1 for item in clasificaciones
            if isinstance(item, dict) and item.get("category") == "refuted"
        ),
        "tool_errors": sum(
            1 for item in clasificaciones
            if isinstance(item, dict) and item.get("category") == "tool_error"
        ),
        "certified_partial_nodes": len(parcial.get("certified_nodes") or []),
        "translation_error_nodes": len(
            lean.get("translation_error_json_nodes") or []
        ),
        "open_obligations": len(directo.get("open_obligations") or []),
        "certificate_blockers": len(auditoria.get("certificate_blockers") or []),
    }


def guardar_evaluacion_anterior(project_name):
    """Rota la evaluacion actual al unico registro anterior permitido."""
    proyecto = _proyecto_dir(project_name)
    if not (proyecto / f"AUDITORIA_{project_name}.json").is_file():
        return False
    anterior = proyecto / "anterior"
    nuevo = proyecto / ".anterior_nuevo"
    descartado = proyecto / ".anterior_descartado"
    for temporal in (nuevo, descartado):
        if temporal.exists():
            shutil.rmtree(temporal)
    nuevo.mkdir(parents=True)
    rutas = _rutas_estado_evaluacion(proyecto, project_name)
    hashes = {}
    for relativa in rutas:
        origen = proyecto / relativa
        destino = nuevo / relativa
        destino.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(origen, destino)
        hashes[str(relativa).replace("\\", "/")] = _sha256_archivo(destino)
    registro = {
        "project": project_name,
        "captured_on": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "slot": "anterior",
        "metrics": _metricas_evaluacion(nuevo, project_name),
        "files_sha256": hashes,
    }
    _adec_compatibilizar(
        project_name,
        registro,
        "previous_evaluation_record",
        f"REGISTRO_ANTERIOR_{project_name}",
        "Registro de la evaluacion anterior",
        "Instantanea integra usada para comparar o restaurar la evaluacion.",
    )
    (nuevo / f"REGISTRO_EVALUACION_{project_name}.json").write_text(
        json.dumps(registro, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    if anterior.exists():
        anterior.replace(descartado)
    nuevo.replace(anterior)
    if descartado.exists():
        shutil.rmtree(descartado)
    return True


def actualizar_semaforo_evaluacion(project_name):
    """Compara actual y anterior sin compensar una regresion con otra mejora."""
    proyecto = _proyecto_dir(project_name)
    anterior = proyecto / "anterior"
    actual = _metricas_evaluacion(proyecto, project_name)
    previa = _metricas_evaluacion(anterior, project_name) if anterior.is_dir() else None
    regresiones = []
    mejoras = []
    if previa is None:
        color = "yellow"
        estado = "SIN_REFERENCIA_ANTERIOR"
    else:
        booleanas = (
            ("certificate_eligible", "certificacion final"),
            ("lean_passed", "aprobacion Lean"),
            ("prolog_structural_passed", "aprobacion Prolog estructural"),
            ("prolog_direct_passed", "aprobacion Prolog directo"),
        )
        for clave, etiqueta in booleanas:
            if previa[clave] and not actual[clave]:
                regresiones.append(f"Se perdio {etiqueta}.")
            elif actual[clave] and not previa[clave]:
                mejoras.append(f"Se obtuvo {etiqueta}.")
        menores_mejor = (
            ("formal_refutations", "refutaciones formales"),
            ("tool_errors", "errores de evaluador"),
            ("translation_error_nodes", "nodos con error de traduccion"),
            ("open_obligations", "obligaciones abiertas"),
        )
        for clave, etiqueta in menores_mejor:
            if actual[clave] > previa[clave]:
                regresiones.append(
                    f"Aumentan {etiqueta}: {previa[clave]} -> {actual[clave]}."
                )
            elif actual[clave] < previa[clave]:
                mejoras.append(
                    f"Disminuyen {etiqueta}: {previa[clave]} -> {actual[clave]}."
                )
        if actual["certified_partial_nodes"] < previa["certified_partial_nodes"]:
            regresiones.append(
                "Disminuyen los nodos certificados parcialmente: "
                f"{previa['certified_partial_nodes']} -> "
                f"{actual['certified_partial_nodes']}."
            )
        elif actual["certified_partial_nodes"] > previa["certified_partial_nodes"]:
            mejoras.append(
                "Aumentan los nodos certificados parcialmente: "
                f"{previa['certified_partial_nodes']} -> "
                f"{actual['certified_partial_nodes']}."
            )
        if regresiones:
            color, estado = "red", "REGRESION"
        elif mejoras:
            color, estado = "green", "MEJORA"
        else:
            color, estado = "yellow", "SIN_CAMBIO_RELEVANTE"
    indicadores_comparables = (
        len(booleanas) + len(menores_mejor) + 1
        if previa is not None else 0
    )
    porcentaje_mejora = (
        round(100 * len(mejoras) / indicadores_comparables, 1)
        if indicadores_comparables else 0.0
    )
    porcentaje_empeora = (
        round(100 * len(regresiones) / indicadores_comparables, 1)
        if indicadores_comparables else 0.0
    )
    balance_porcentual = round(porcentaje_mejora - porcentaje_empeora, 1)
    datos = {
        "project": project_name,
        "generated_on": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "color": color,
        "state": estado,
        "current_metrics": actual,
        "previous_metrics": previa,
        "improvements": mejoras,
        "regressions": regresiones,
        "comparison_percentages": {
            "improves": porcentaje_mejora,
            "worsens": porcentaje_empeora,
            "balance": balance_porcentual,
            "indicator_count": indicadores_comparables,
            "method": "Porcentaje de los indicadores probatorios comparables que cambian en cada sentido.",
        },
        "rollback_available": color == "red" and anterior.is_dir(),
        "rollback_command": (
            f"python publica.py --restaurar-anterior {project_name}"
            if color == "red" and anterior.is_dir() else None
        ),
        "policy": (
            "Rojo ante cualquier regresion; verde solo si hay mejora sin regresiones; "
            "amarillo si no hay cambio probatorio relevante."
        ),
    }
    _adec_compatibilizar(
        project_name,
        datos,
        "evaluation_comparison",
        f"SEMAFORO_{project_name}",
        "Comparacion entre la evaluacion actual y la anterior",
        f"{estado}. Mejoras: {len(mejoras)}; regresiones: {len(regresiones)}.",
    )
    path = proyecto / f"SEMAFORO_{project_name}.json"
    path.write_text(
        json.dumps(datos, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    return datos


def restaurar_evaluacion_anterior(project_name, confirmar=False):
    """Intercambia actual y anterior solo cuando el semaforo confirma regresion."""
    if not confirmar:
        raise RuntimeError("La restauracion exige confirmacion explicita.")
    proyecto = _proyecto_dir(project_name)
    anterior = proyecto / "anterior"
    semaforo = _leer_json_opcional(proyecto / f"SEMAFORO_{project_name}.json")
    if semaforo.get("color") != "red" or not anterior.is_dir():
        raise RuntimeError(
            "La marcha atras solo esta habilitada cuando el semaforo es rojo."
        )
    intercambio = proyecto / ".evaluacion_intercambio"
    if intercambio.exists():
        shutil.rmtree(intercambio)
    intercambio.mkdir(parents=True)
    rutas_actuales = _rutas_estado_evaluacion(proyecto, project_name)
    for relativa in rutas_actuales:
        destino = intercambio / relativa
        destino.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(proyecto / relativa, destino)
    rutas_anteriores = _rutas_estado_evaluacion(anterior, project_name)
    for relativa in rutas_actuales:
        (proyecto / relativa).unlink(missing_ok=True)
    for relativa in rutas_anteriores:
        destino = proyecto / relativa
        destino.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(anterior / relativa, destino)
    shutil.rmtree(anterior)
    intercambio.replace(anterior)
    registro = {
        "project": project_name,
        "captured_on": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "slot": "anterior",
        "metrics": _metricas_evaluacion(anterior, project_name),
        "origin": "evaluation_replaced_by_rollback",
    }
    _adec_compatibilizar(
        project_name,
        registro,
        "previous_evaluation_record",
        f"REGISTRO_ANTERIOR_{project_name}",
        "Registro de la evaluacion anterior",
        "Evaluacion sustituida mediante una marcha atras explicita.",
    )
    (anterior / f"REGISTRO_EVALUACION_{project_name}.json").write_text(
        json.dumps(registro, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    resultado = actualizar_semaforo_evaluacion(project_name)
    resultado["rollback_performed"] = True
    resultado["rollback_performed_on"] = datetime.now(timezone.utc).isoformat(
        timespec="seconds"
    )
    (proyecto / f"SEMAFORO_{project_name}.json").write_text(
        json.dumps(resultado, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    return resultado


def _nombres_proyectos(base):
    if not base.is_dir():
        return []
    nombres = []
    for path in sorted(base.iterdir()):
        if not path.is_dir():
            continue
        markdown = _markdown_proyecto(path)
        nombre = markdown.stem if markdown is not None else path.name
        anterior = DIRECTORIOS_PROYECTOS.get(nombre)
        if anterior is not None and anterior != path and anterior.is_dir():
            raise ValueError(f"Fuente duplicada {nombre}: {anterior} y {path}")
        DIRECTORIOS_PROYECTOS[nombre] = path
        nombres.append(nombre)
    return nombres


def _proyectos_pendientes_web():
    pendientes = []
    for project_name in _nombres_proyectos(PROJECT_ROOT / "Proyectos"):
        if {project_name, _proyecto_dir(project_name).name} & PROYECTOS_FORZADOS_WEB:
            pendientes.append(project_name)
            print(
                f"  {project_name}: seleccion forzada; se reevaluara aunque "
                "tenga certificado vigente."
            )
            continue
        if _proyecto_completado_con_hash_vigente(project_name):
            print(
                f"  {project_name}: evaluacion terminada con hash de fuente "
                "coincidente; se omite en esta ejecucion."
            )
            continue
        pendientes.append(project_name)
    return pendientes


def _proyectos_publicables_web():
    nombres = set(PROYECTOS_PUBLICABLES_WEB)
    nombres.update(_nombres_proyectos(PROJECT_ROOT / "Proyectos"))
    nombres.update(_nombres_proyectos(PROJECT_ROOT / "YaEvaluado"))
    return sorted(nombres)


def _markdown_proyecto(proyecto):
    esperado = proyecto / f"{proyecto.name}.md"
    if esperado.is_file():
        return esperado
    fuentes = sorted(path for path in proyecto.glob("*.md")
                     if _es_markdown_demostracion(path))
    if len(fuentes) > 1:
        raise ValueError(f"Varias fuentes cientificas en {proyecto}: {fuentes}")
    return fuentes[0] if fuentes else None


def _proyecto_completado_con_hash_vigente(project_name):
    proyecto = _proyecto_dir(project_name)
    if not proyecto.is_dir():
        return False

    markdown = _markdown_proyecto(proyecto)
    if markdown is None or not markdown.is_file():
        return False

    semaforo = _leer_json_opcional(proyecto / f"SEMAFORO_{project_name}.json")
    marcado = semaforo.get("evaluation_processing")
    if isinstance(marcado, dict):
        informes = marcado.get("reports_sha256")
        return (
            marcado.get("completed") is True
            and marcado.get("source_sha256") == _sha256_archivo(markdown)
            and isinstance(informes, dict)
            and set(informes) == set(_nombres_informes_evaluacion(project_name))
            and all((proyecto / nombre).is_file()
                    and _sha256_archivo(proyecto / nombre) == sha
                    for nombre, sha in informes.items())
        )

    certificado = _leer_json_opcional(proyecto / f"CERTIFICADO_{project_name}.json")
    if (
        certificado.get("project") != project_name
        or certificado.get("certificate_type") != "DEMUESTRA_FORMAL_VERIFICATION"
        or certificado.get("status") != "EMITIDO"
    ):
        return False

    evidencias = certificado.get("evidence_sha256")
    if not isinstance(evidencias, dict):
        return False

    hash_guardado = evidencias.get(f"{project_name}.md")
    if not hash_guardado:
        return False
    return hash_guardado == _sha256_archivo(markdown)


def _nombres_informes_evaluacion(project_name):
    return [f"{prefijo}_{project_name}.json" for prefijo in
            ("LEAN", "PROLOG", "PROLOG_MD_DIRECTO", "AUDITORIA")]


def _marcar_evaluacion_terminada(project_name, hash_fuente, cerrado):
    proyecto = _proyecto_dir(project_name)
    markdown = proyecto / f"{project_name}.md"
    if not markdown.is_file() or _sha256_archivo(markdown) != hash_fuente:
        return False
    informes = _nombres_informes_evaluacion(project_name)
    if not all((proyecto / nombre).is_file() for nombre in informes):
        return False
    archivo = proyecto / f"SEMAFORO_{project_name}.json"
    semaforo = _leer_json_opcional(archivo)
    if not semaforo:
        return False
    semaforo["evaluation_processing"] = {
        "completed": True,
        "source_sha256": hash_fuente,
        "formally_certified": bool(cerrado),
        "reports_sha256": {nombre: _sha256_archivo(proyecto / nombre)
                           for nombre in informes},
    }
    temporal = archivo.with_suffix(".json.tmp")
    temporal.write_text(json.dumps(semaforo, ensure_ascii=False, indent=2) + "\n",
                         encoding="utf-8")
    os.replace(temporal, archivo)
    return True


def _documento_raiz_vigente(nombre, hash_fuente):
    estado = _leer_json_opcional(PROJECT_ROOT / "hashes_documentos_raiz.json")
    registro = estado.get(nombre, {})
    return (isinstance(registro, dict)
            and registro.get("completed") is True
            and registro.get("source_sha256") == hash_fuente
            and (PROJECT_ROOT / "pdfs" / f"{Path(nombre).stem}.pdf").is_file())


def _marcar_documento_raiz(nombre, hash_fuente):
    archivo = PROJECT_ROOT / "hashes_documentos_raiz.json"
    estado = _leer_json_opcional(archivo)
    estado[nombre] = {"completed": True, "source_sha256": hash_fuente}
    temporal = archivo.with_suffix(".tmp")
    temporal.write_text(json.dumps(estado, indent=2) + "\n", encoding="utf-8")
    os.replace(temporal, archivo)


def _leer_proyecto_origen(proyecto, preguntar=False):
    """Obtiene y, si hace falta, registra el proyecto al que vuelven MD y PDF."""
    config = proyecto / CONFIG_ORIGEN_NOMBRE
    nombre = None
    if config.is_file():
        for linea in config.read_text(encoding="utf-8-sig", errors="replace").splitlines():
            clave, separador, valor = linea.partition("=")
            if separador and clave.strip().lower() == "proyecto_origen":
                nombre = valor.strip()
                break

    if not nombre and preguntar:
        try:
            respuesta = input(
                f"De que proyecto procede {proyecto.name}.md? [UNIHOLOG]: "
            ).strip()
        except EOFError:
            respuesta = ""
        nombre = respuesta or "UNIHOLOG"
        config.write_text(f"proyecto_origen={nombre}\n", encoding="utf-8")
        print(f"  Configuracion de origen guardada: {config}")

    if not nombre:
        return None
    if nombre in {".", ".."} or Path(nombre).name != nombre or "/" in nombre or "\\" in nombre:
        raise ValueError(
            f"Proyecto de origen no valido en {config}: {nombre!r}. "
            "Debe ser el nombre de un directorio hermano, por ejemplo UNIHOLOG."
        )

    origen = (PROJECT_ROOT.parent / nombre).resolve()
    if origen.parent != PROJECT_ROOT.parent.resolve():
        raise ValueError(f"El proyecto de origen queda fuera de SRC-VED: {origen}")
    return origen


def _copiar_verificado(origen, destino):
    """Copia al destino sin retirar la evidencia conservada en DEMUESTRA."""
    if not origen.is_file():
        raise FileNotFoundError(f"No existe el artefacto verificado: {origen}")
    destino.parent.mkdir(parents=True, exist_ok=True)
    temporal = destino.with_name(f".{destino.name}.demuestra.tmp")
    if temporal.exists():
        temporal.unlink()
    shutil.copy2(origen, temporal)
    if temporal.read_bytes() != origen.read_bytes():
        temporal.unlink(missing_ok=True)
        raise OSError(f"Fallo de integridad al devolver {origen.name} a {destino.parent}")
    os.replace(temporal, destino)


def _copiar_markdown_verificado_sin_lean(origen, destino):
    """Devuelve el documento científico sin reinsertar el derivado Lean."""
    texto = origen.read_text(encoding="utf-8-sig")
    marcador = "# Apéndice formal Lean 4"
    posicion = texto.find(marcador)
    if posicion >= 0:
        texto = texto[:posicion].rstrip() + "\n"

    destino.parent.mkdir(parents=True, exist_ok=True)
    temporal = destino.with_name(f".{destino.name}.demuestra.tmp")
    temporal.write_text(texto, encoding="utf-8")
    if marcador in temporal.read_text(encoding="utf-8") or "```lean" in temporal.read_text(encoding="utf-8"):
        temporal.unlink(missing_ok=True)
        raise OSError(f"No se pudo retirar el apendice Lean de {origen.name}")
    os.replace(temporal, destino)


def devolver_fuentes_verificadas(project_names):
    """Cierra el ciclo copiando el MD y PDF al proyecto que los origino."""
    for project_spec in project_names:
        project_name = _nombre_proyecto_web(project_spec)
        proyecto = _proyecto_dir(project_name)
        raiz_origen = _leer_proyecto_origen(proyecto, preguntar=True)
        if not raiz_origen.is_dir():
            raise FileNotFoundError(
                f"No existe el proyecto de origen configurado: {raiz_origen}"
            )

        markdown = proyecto / f"{project_name}.md"
        pdf = proyecto / f"{project_name}.pdf"
        _copiar_markdown_verificado_sin_lean(markdown, raiz_origen / markdown.name)
        _copiar_verificado(pdf, raiz_origen / "pdfs" / pdf.name)
        print(f"  [OK] {markdown.name} copiado a {raiz_origen}")
        print(f"  [OK] {pdf.name} copiado a {raiz_origen / 'pdfs'}")


def preparar_markdowns_demostraciones_web(project_names):
    MARKDOWNS_DEMOSTRACIONES_WEB_PREPARADOS.clear()

    for project_spec in project_names:
        project_name = _nombre_proyecto_web(project_spec)
        if not _es_markdown_demostracion(f"{project_name}.md"):
            print(
                f"Se omite {project_name}: el nombre no cumple "
                "<idioma>_<numero>_<nombre>.md."
            )
            continue
        markdown = _markdown_proyecto(_proyecto_dir(project_name))
        if markdown is None:
            proyecto = _proyecto_dir(project_name)
            raiz_origen = _leer_proyecto_origen(proyecto, preguntar=False)
            candidato = (
                raiz_origen / f"{project_name}.md"
                if raiz_origen is not None else None
            )
            if candidato is not None and candidato.is_file():
                markdown_destino = proyecto / candidato.name
                shutil.copy2(candidato, markdown_destino)
                markdown = markdown_destino
                print(f"  {project_name}.md copiado temporalmente desde {raiz_origen}")
        if markdown is None:
            print(f"[AVISO] Falta {project_name}.md; no se preparara para generar PDF.")
            continue

        destino = PROJECT_ROOT / f"{project_name}.md"
        if destino.exists() and destino.resolve() != markdown.resolve():
            if destino.read_bytes() != markdown.read_bytes():
                print(f"[AVISO] Ya existe {destino.name} en la raiz y no coincide con {markdown}; no se reemplaza.")
                continue

        if destino.exists() and destino.resolve() != markdown.resolve():
            destino.unlink()
        shutil.copy2(markdown, destino)
        MARKDOWNS_DEMOSTRACIONES_WEB_PREPARADOS[project_name] = markdown

def _restaurar_markdown_preparado(public_name):
    preparado = PROJECT_ROOT / f"{public_name}.md"
    source = MARKDOWNS_DEMOSTRACIONES_WEB_PREPARADOS.get(public_name)
    if source is None:
        return
    if not preparado.exists():
        return
    source.parent.mkdir(parents=True, exist_ok=True)
    if source.exists() and source.resolve() != preparado.resolve():
        source.unlink()
    shutil.move(str(preparado), str(source))
    MARKDOWNS_DEMOSTRACIONES_WEB_PREPARADOS.pop(public_name, None)


def _mover_pdf_generado_al_proyecto(project_name, proyecto):
    pdf_generado = PROJECT_ROOT / "pdfs" / f"{project_name}.pdf"
    pdf_proyecto = proyecto / f"{project_name}.pdf"
    if not pdf_generado.exists():
        return _primer_archivo([pdf_proyecto])
    if pdf_generado.resolve() != pdf_proyecto.resolve():
        if pdf_proyecto.exists():
            pdf_proyecto.unlink()
        shutil.move(str(pdf_generado), str(pdf_proyecto))
    return pdf_proyecto


def _mover_derivados_generados_al_proyecto(project_name, proyecto):
    destinos = {}
    for carpeta, extension in (("json", ".json"), ("lean", ".lean"), ("prolog", ".pl")):
        origen = PROJECT_ROOT / carpeta / f"{project_name}{extension}"
        nombre_destino = (
            f"{project_name}.extracted.json"
            if extension == ".json" else f"{project_name}{extension}"
        )
        destino = proyecto / nombre_destino
        if not origen.is_file():
            raise FileNotFoundError(
                f"PUBLICAR no genero el archivo esperado: {origen}"
            )
        if destino.exists():
            destino.unlink()
        shutil.move(str(origen), str(destino))
        destinos[extension] = destino
        print(f"  {destino.name} devuelto al proyecto desde {carpeta}/")
    return destinos


def _preparar_evaluacion_lean_existente(project_name, proyecto):
    """Expone en la raiz las evidencias conservadas en evaluaciones/ y logs/."""
    candidatos = [
        proyecto / "evaluaciones" / f"LEAN_{project_name}.md",
        proyecto / "evaluaciones" / f"LEAN_{project_name}.json",
        proyecto / "logs" / f"LEAN_{project_name}.log",
        proyecto / "evaluaciones" / f"PROLOG_{project_name}.md",
        proyecto / "evaluaciones" / f"PROLOG_{project_name}.json",
        proyecto / "logs" / f"PROLOG_{project_name}.log",
        proyecto / "evaluaciones" / f"AUDITORIA_{project_name}.md",
        proyecto / "evaluaciones" / f"AUDITORIA_{project_name}.json",
        proyecto / "logs" / f"AUDITORIA_{project_name}.log",
    ]
    for origen in candidatos:
        if origen.is_file():
            shutil.copy2(origen, proyecto / origen.name)


def _generar_derivados_publicables(md_obj, fuente, project_name):
    from PackPublica.lean import LeanCompilationError

    hash_antes = _sha256_archivo(fuente)
    diagnostico = None
    try:
        derivados = md_obj.generar_derivados(page_size=PAGE_SIZE)
    except LeanCompilationError as error:
        if _sha256_archivo(fuente) != hash_antes:
            raise RuntimeError("La fuente cambio durante la traduccion; se cancela la publicacion.") from error
        # Reintenta solo los formatos editoriales; no reutiliza Lean como prueba.
        derivados = md_obj.generar_derivados(
            page_size=PAGE_SIZE, generar_lean=False, generar_prolog=False,
        )
        diagnostico = {
            "project": project_name,
            "source_sha256": hash_antes,
            "status": "ERROR_HERRAMIENTA_TRADUCCION_LEAN",
            "category": "tool_error",
            "document_verdict": "NO_EMITIDO",
            "formal_certification": "PENDIENTE",
            "publication_blocked_by_translation": False,
            "detail": str(error),
            "message": (
                "Fallo de traduccion de PUBLICAR hacia Lean, no un error cientifico "
                "demostrado del MD ni una refutacion. Se publica el documento; "
                "los certificados y evaluaciones anteriores son historicos y no "
                "certifican esta ejecucion."
            ),
        }
    if _sha256_archivo(fuente) != hash_antes:
        raise RuntimeError("La fuente cambio durante la generacion; se cancela la publicacion.")
    reporte = _proyecto_dir(project_name) / f"TRADUCCION_{project_name}.json"
    if diagnostico is not None or reporte.exists():
        estado = diagnostico or {
            "project": project_name, "source_sha256": hash_antes,
            "status": "TRADUCCION_GENERADA", "formal_certification": "PENDIENTE",
            "document_verdict": "NO_EMITIDO",
        }
        reporte.write_text(json.dumps(estado, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    return derivados, diagnostico


def preparar_demostraciones_web(project_names, sin_evaluacion=()):
    index_php = _index_proyectos_web()

    for project_spec in project_names:
        project_name = _nombre_proyecto_web(project_spec)
        proyecto = _proyecto_dir(project_name)

        if index_php is None:
            print("[AVISO] Falta proyectos/index.php; no se publicara el indice web.")
        else:
            shutil.copy2(index_php, proyecto / "index.php")

        _mover_derivados_generados_al_proyecto(project_name, proyecto)

        # El Markdown se movio temporalmente a la raiz para PUBLICAR. Debe
        # regresar antes de comprobar y publicar los artefactos del proyecto.
        _restaurar_markdown_preparado(project_name)

        if not (proyecto / f"{project_name}.md").exists():
            print(f"[AVISO] Falta {project_name}.md; no se publicara ese artefacto.")

        if _mover_pdf_generado_al_proyecto(project_name, proyecto) is None:
            print(f"[AVISO] Falta {project_name}.pdf; no se publicara ese artefacto.")

        if project_name not in sin_evaluacion:
            _preparar_evaluacion_lean_existente(project_name, proyecto)


def _nodos_verificados_por_lean(aseveraciones, compilacion_correcta):
    """Resume Lean sin leer ni modificar el artefacto JSON independiente."""
    if not compilacion_correcta:
        return []
    return [
        item.get("id")
        for item in aseveraciones
        if item.get("id")
        and item.get("proof_status") in {"VERIFICADA", "VERIFICADA_ESTRUCTURAL"}
    ]


def _leer_auditoria_lean(contenido_lean):
    """Lee marcadores auditables sin inferir pruebas que Lean no certifico."""
    compatibilidad = {
        "TRADUCCION_AMBIGUA": ("AMBIGUA", "NO_INICIADA"),
        "INCOMPLETA": ("INCOMPLETA", "NO_INICIADA"),
        "NO_COMPROBADA": ("COMPLETA", "PENDIENTE"),
        "FORMALIZADA_SIN_PRUEBA": ("COMPLETA", "PENDIENTE"),
        "COMPROBADA_ESTRUCTURAL": ("COMPLETA", "VERIFICADA_ESTRUCTURAL"),
        "COMPROBADA": ("COMPLETA", "VERIFICADA"),
    }
    aseveraciones = []
    source_claims = []
    obligaciones_deductivas = []
    for match in re.finditer(r"^-- DEMUESTRA_SOURCE_CLAIM: (.+)$", contenido_lean, re.MULTILINE):
        try:
            source_claims.append(json.loads(match.group(1)))
        except json.JSONDecodeError:
            source_claims.append({"status": "INVALID_AUDIT_MARKER", "source": match.group(1)})
    patron_enlace = re.compile(
        r"^-- DEMUESTRA_DEDUCTIVE_LINK: "
        r"([A-Za-z0-9_]+)\|(\d+)\|([A-Z_]+)\|([^|]+)\|([^|]+)\|([A-Z_]+)$",
        re.MULTILINE,
    )
    for match in patron_enlace.finditer(contenido_lean):
        dependencias = [] if match.group(5) == "-" else match.group(5).split(",")
        obligaciones_deductivas.append({
            "node": match.group(1),
            "formula": int(match.group(2)),
            "role": match.group(3),
            "previous_formula": (
                None if match.group(4) == "-" else int(match.group(4))
            ),
            "dependencies": dependencias,
            "antecedents": len(dependencias) + (match.group(4) != "-"),
            "status": match.group(6),
        })
    patron = re.compile(
        r"^\s*--\s*DEMUESTRA_ASSERTION\s*:\s*"
        r"([A-Za-z0-9_]+)\|([A-Z_]+)(?:\|([A-Z_]+))?\s*$",
        re.MULTILINE,
    )
    for match in patron.finditer(contenido_lean):
        if match.group(3):
            construccion, demostracion = match.group(2), match.group(3)
        else:
            construccion, demostracion = compatibilidad.get(
                match.group(2), ("DESCONOCIDA", "NO_INICIADA")
            )
        aseveraciones.append({
            "id": match.group(1),
            "construction_status": construccion,
            "proof_status": demostracion,
        })
    estado_match = re.search(
        r"^\s*--\s*DEMUESTRA_FORMALIZATION_STATUS\s*:\s*"
        r"([A-Z_]+)\s*$",
        contenido_lean,
        re.MULTILINE,
    )
    pendiente_match = re.search(
        r"^\s*--\s*DEMUESTRA_RESULT_(?:UNVERIFIED|PENDING)\s*:\s*"
        r"([A-Za-z0-9_'.]+)\s*$",
        contenido_lean,
        re.MULTILINE,
    )
    construccion_match = re.search(
        r"^\s*--\s*DEMUESTRA_CONSTRUCTION_COMPLETE\s*:\s*(TRUE|FALSE)\s*$",
        contenido_lean,
        re.MULTILINE,
    )
    demostracion_match = re.search(
        r"^\s*--\s*DEMUESTRA_PROOF_COMPLETE\s*:\s*(TRUE|FALSE)\s*$",
        contenido_lean,
        re.MULTILINE,
    )
    cobertura_deductiva_match = re.search(
        r"^\s*--\s*DEMUESTRA_DEDUCTIVE_COVERAGE_COMPLETE\s*:\s*"
        r"(TRUE|FALSE)\s*$",
        contenido_lean,
        re.MULTILINE,
    )
    return {
        "assertions": aseveraciones,
        "source_claims": source_claims,
        "deductive_obligations": obligaciones_deductivas,
        "formalization_status": estado_match.group(1) if estado_match else None,
        "pending_result": pendiente_match.group(1) if pendiente_match else None,
        "construction_complete": (
            construccion_match.group(1) == "TRUE" if construccion_match else None
        ),
        "proof_complete": (
            demostracion_match.group(1) == "TRUE" if demostracion_match else None
        ),
        "deductive_coverage_complete": (
            cobertura_deductiva_match.group(1) == "TRUE"
            if cobertura_deductiva_match else None
        ),
    }


def _es_fallo_de_demostracion_lean(salida):
    """Distingue un intento de prueba rechazado de un Lean mal construido."""
    patrones = (
        r"\bunsolved goals?\b",
        r"\btactic\b.*\bfailed\b",
        r"\bno goals to be solved\b",
        r"\bfailed to synthesize\b.*\bproof\b",
    )
    return any(re.search(patron, salida, re.IGNORECASE | re.DOTALL) for patron in patrones)


def _premisas_condicionales_pendientes(source_claims):
    """No infiere carencias del MD a partir de formulas aisladas.

    Una implicacion puede estar resuelta por otra formula o por las dependencias
    del mismo nodo. Solo una prueba Lean enlazada puede declarar una premisa
    pendiente; la forma sintactica A -> B -> C no basta para hacerlo.
    """
    return []


def _trazas_afirmaciones_lean(project_name, contenido_lean, source_claims):
    """Relaciona cada obligacion con su marcador exacto en el Lean generado."""
    lineas = {}
    for numero, linea in enumerate(contenido_lean.splitlines(), start=1):
        if not linea.startswith("-- DEMUESTRA_SOURCE_CLAIM: "):
            continue
        try:
            marcador = json.loads(linea.split(": ", 1)[1])
        except json.JSONDecodeError:
            continue
        lineas[(marcador.get("node"), marcador.get("formula"))] = numero

    trazas = []
    for claim in source_claims:
        origen = re.fullmatch(
            r"([^:/\\]+\.md):(\d+):[^:]+:formula-\d+",
            str(claim.get("location", "")),
        )
        estado = claim.get("status", "DESCONOCIDO")
        trazas.append({
            "node": claim.get("node"),
            "formula": claim.get("formula"),
            "status": estado,
            "source_file": origen.group(1) if origen else None,
            "source_line": int(origen.group(2)) if origen else None,
            "lean_file": f"{project_name}.lean",
            "lean_line": lineas.get((claim.get("node"), claim.get("formula"))),
            "compiler_log": f"LEAN_{project_name}.log",
            "responsibility": (
                "traduccion_formal_pendiente" if estado == "UNTRANSLATED"
                else "prueba_no_certificada" if estado == "FORMALIZED_UNPROVEN"
                else "auditoria_del_generador"
            ),
            "module_to_inspect": (
                "PUBLICAR/PackPublica/formal_lean_backend.py"
                if estado == "UNTRANSLATED" else "DEMUESTRA/publica.py"
            ),
            "note": (
                "La formula no se tradujo; el log solo acredita la compilacion "
                "del archivo generado, no la fidelidad de esta formula."
                if estado == "UNTRANSLATED" else
                "La formula se represento por separado, sin prueba certificada."
                if estado == "FORMALIZED_UNPROVEN" else
                "La formula se represento y dispone de un teorema Lean generado desde el MD."
            ),
        })
    return trazas


def _trazas_markdown(trazas, prefix):
    if not trazas:
        return "No hay obligaciones de origen registradas.\n"
    lineas = []
    for item in trazas:
        nodo = item["node"] or "?"
        formula = item["formula"] or "?"
        lineas.append(f"### {nodo}, formula {formula}: {item['status']}")
        if item["source_file"]:
            lineas.append(
                f"Origen: [{item['source_file']}]({prefix}{item['source_file']})"
                f", linea {item['source_line']}."
            )
        if item["lean_line"]:
            lineas.append(
                f"Salida: [{item['lean_file']}]({prefix}{item['lean_file']})"
                f", linea {item['lean_line']}."
            )
        lineas.append(
            f"Compilacion: [{item['compiler_log']}]({prefix}{item['compiler_log']})."
        )
        lineas.append(
            f"Responsabilidad: `{item['responsibility']}`. Modulo a revisar: "
            f"`{item['module_to_inspect']}`. {item['note']}"
        )
        lineas.append("")
    return "\n".join(lineas)


def evaluar_lean_proyecto(project_name):
    """Ejecuta Lean y deja su salida y veredicto dentro del proyecto."""
    proyecto = _proyecto_dir(project_name)
    evaluaciones = proyecto / "evaluaciones"
    logs = proyecto / "logs"
    evaluaciones.mkdir(parents=True, exist_ok=True)
    logs.mkdir(parents=True, exist_ok=True)

    lean_principal = proyecto / f"{project_name}.lean"
    contenido_lean = (
        lean_principal.read_text(encoding="utf-8", errors="replace")
        if lean_principal.is_file() else ""
    )
    lean_generado = "-- GENERADO_POR:" in contenido_lean
    es_esqueleto = (
        "Punto de entrada estable para completar la formalizacion" in contenido_lean
        or not any(
            token in contenido_lean
            for token in ("def Node_", "theorem ", "lemma ")
        )
    )
    auditoria_lean = _leer_auditoria_lean(contenido_lean)
    aseveraciones = auditoria_lean["assertions"]
    source_claims = auditoria_lean["source_claims"]
    obligaciones_deductivas = auditoria_lean["deductive_obligations"]
    problemas_traduccion = [
        item for item in source_claims
        if item.get("status") != "FORMALIZED_UNPROVEN"
    ]
    obligaciones_prueba = [
        item for item in source_claims
        if item.get("status") == "FORMALIZED_UNPROVEN"
    ]
    cobertura_traduccion_completa = not problemas_traduccion
    trazas = _trazas_afirmaciones_lean(project_name, contenido_lean, source_claims)
    premisas_condicionales = _premisas_condicionales_pendientes(source_claims)
    estado_formalizacion = auditoria_lean["formalization_status"]
    resultado_pendiente = auditoria_lean["pending_result"]
    construccion_completa = auditoria_lean["construction_complete"]
    demostracion_completa = auditoria_lean["proof_complete"]
    cobertura_deductiva_completa = auditoria_lean["deductive_coverage_complete"]
    if cobertura_deductiva_completa is not True:
        problemas_traduccion.append({
            "status": "DEDUCTIVE_ROLES_NOT_LINKED",
            "source": (
                "PUBLICAR represento las formulas, pero aun no enlazo todos "
                "sus papeles deductivos y alcances en teoremas Lean."
            ),
        })
    cobertura_traduccion_completa = (
        not problemas_traduccion and cobertura_deductiva_completa is True
    )
    resultado_match = re.search(
        r"^\s*--\s*DEMUESTRA_RESULT\s*:\s*([A-Za-z0-9_'.]+)\s*$",
        contenido_lean,
        re.MULTILINE,
    )
    teorema_resultado = resultado_match.group(1) if resultado_match else None
    nodo_match = re.search(
        r"^\s*--\s*DEMUESTRA_JSON_NODE\s*:\s*([A-Za-z0-9_]+)\s*$",
        contenido_lean,
        re.MULTILINE,
    )
    nodo_resultado_id = nodo_match.group(1) if nodo_match else None
    comando = [
        sys.executable,
        "-m",
        "PckDemuestra.cli",
        "validar",
        "--proyecto",
        project_name,
    ]
    if es_esqueleto:
        salida = (
            f"{lean_principal.name} es un esqueleto sin teoremas ni lemas "
            "formalizados. No se ejecuta Lean y el veredicto es NO VERIFICADO.\n"
        )
        codigo = 3
    else:
        try:
            proceso = subprocess.Popen(
                comando,
                cwd=PROJECT_ROOT,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
                text=True,
                encoding="utf-8",
                errors="replace",
                bufsize=1,
            )
            fragmentos_salida = []
            assert proceso.stdout is not None
            proceso.stdout.reconfigure(newline="")
            for caracter in iter(lambda: proceso.stdout.read(1), ""):
                fragmentos_salida.append(caracter)
                print(caracter, end="", flush=True)
            proceso.stdout.close()
            codigo = proceso.wait()
            salida = "".join(fragmentos_salida)
            salida = _limpiar_barras_actividad(salida)
            salida = salida.replace("\r\n", "\n").replace("\r", "\n")
        except OSError as exc:
            salida = f"No se pudo iniciar la evaluacion Lean: {exc}\n"
            codigo = 127

    log = logs / f"LEAN_{project_name}.log"
    log.write_text(salida, encoding="utf-8")
    detalle_lean_origen = PROJECT_ROOT / "logs" / f"lean_{project_name}_detalle.log"
    detalle_lean = logs / f"LEAN_{project_name}_DETALLE.log"
    if detalle_lean_origen.is_file():
        shutil.copy2(detalle_lean_origen, detalle_lean)

    archivos_lean = sorted(
        str(path.relative_to(proyecto))
        for path in proyecto.rglob("*.lean")
        if ".lake" not in path.parts and "__pycache__" not in path.parts
    )
    compilacion_correcta = codigo == 0 and bool(archivos_lean)
    aprobado = bool(
        compilacion_correcta
        and teorema_resultado
        and estado_formalizacion == "COMPLETE"
        and construccion_completa is True
        and demostracion_completa is True
        and not problemas_traduccion
        and not obligaciones_prueba
    )
    fallo_interno = "Traceback (most recent call last):" in salida
    if aprobado:
        veredicto = "APROBADO"
        tipo_fallo = None
        diagnostico = "Lean compilo correctamente todos los archivos evaluados."
        accion = "No se requiere ninguna accion."
    elif compilacion_correcta and problemas_traduccion:
        veredicto = "COMPILA; TRADUCCION PARCIAL"
        tipo_fallo = "cobertura_traduccion_parcial"
        diagnostico = (
            "Lean compilo el archivo generado sin errores, pero PUBLICAR aun "
            "no integro todas las formulas con su papel deductivo y su alcance. "
            "Esto es un fallo de traduccion y no un juicio sobre el Markdown."
        )
        accion = (
            "Corregir PUBLICAR hasta enlazar precondiciones, resultados previos, "
            "supuestos locales, pasos derivados y conclusion; no pedir datos "
            "adicionales al Markdown a partir de esta salida."
        )
    elif compilacion_correcta:
        veredicto = (
            "COMPILA; TRADUCCION COMPLETA"
            if demostracion_completa is True else
            "COMPILA; TRADUCCION COMPLETA; DEMOSTRACION NO CERTIFICADA"
        )
        tipo_fallo = None
        diagnostico = (
            "Lean comprobo la sintaxis y los tipos de la traduccion generada. "
            "La compilacion no demuestra por si sola el teorema."
        )
        accion = (
            "Consultar las obligaciones deductivas Lean no certificadas; "
            "no interpretar la compilacion como prueba ni refutacion."
        )
    elif codigo == 124:
        veredicto = "INCONCLUSO"
        tipo_fallo = "timeout"
        diagnostico = (
            "Lean/Lake no termino dentro del tiempo permitido. No consta un "
            "error formal de la demostracion."
        )
        accion = (
            "Revisar la preparacion de Mathlib y la cache, consultar el log "
            "completo y repetir la evaluacion."
        )
    elif codigo == 127 or fallo_interno:
        veredicto = "INCONCLUSO"
        tipo_fallo = "evaluador" if fallo_interno else "entorno"
        diagnostico = (
            "El evaluador fallo internamente antes de producir un veredicto Lean."
            if fallo_interno else
            "No se pudo iniciar correctamente Lean/Lake."
        )
        accion = (
            "Revisar Elan, Lake, PATH, lean-toolchain y el log completo antes "
            "de repetir la evaluacion."
        )
    else:
        if lean_generado:
            veredicto = "ERROR EVALUADOR"
            tipo_fallo = "traduccion_generada_no_compilable"
            diagnostico = (
                "Lean rechazo el artefacto producido por PUBLICAR. Esto indica "
                "que el traductor no traslado de forma ejecutable todas las "
                "interpretaciones, relaciones o pasos necesarios; no que el "
                "Markdown dejara de aportar una prueba exigida."
            )
            accion = (
                "Corregir el traductor y regenerar el archivo Lean sin modificar "
                "ni completar artificialmente el Markdown."
            )
        elif _es_fallo_de_demostracion_lean(salida):
            veredicto = "DEMOSTRACION FALLIDA"
            tipo_fallo = "demostracion_fallida"
            diagnostico = (
                "Lean rechazo al menos un intento concreto de demostracion. "
                "Esto invalida ese intento, no refuta por si solo la aseveracion."
            )
            accion = "Corregir el paso de prueba indicado por Lean y volver a evaluarlo."
        else:
            veredicto = "CONSTRUCCION LEAN INCORRECTA"
            tipo_fallo = "construccion_formal_incorrecta"
            diagnostico = (
                "Lean no pudo compilar la construccion formal. No llego a emitir "
                "un juicio sobre la demostracion ni sobre la teoria."
            )
            accion = (
                "Corregir sintaxis, tipos, simbolos o traduccion matematica antes "
                "de intentar la demostracion."
            )
    fecha = datetime.now(timezone.utc).isoformat(timespec="seconds")
    alcance = (
        "Lean 4 solo certifica las definiciones, teoremas e inferencias "
        "formalizadas en los archivos Lean evaluados."
    )
    estado_adec = (
        "Compatible con ADEC mediante carga desde URL publica o archivo JSON."
    )

    aseveraciones_informadas = []
    for aseveracion in aseveraciones:
        informada = dict(aseveracion)
        estado_generador = informada.get("proof_status")
        if not compilacion_correcta and estado_generador != "NO_APLICA":
            informada["generator_proof_status"] = estado_generador
            informada["proof_status"] = "NO_VERIFICADA_POR_KERNEL"
        aseveraciones_informadas.append(informada)

    cobertura_traduccion_validada = bool(
        cobertura_traduccion_completa and compilacion_correcta
    )
    construccion_validada = bool(
        construccion_completa and compilacion_correcta
    )
    demostracion_validada = bool(
        demostracion_completa and compilacion_correcta
    )
    cobertura_texto = (
        "COMPLETA" if cobertura_traduccion_validada else
        "NO VALIDADA" if cobertura_traduccion_completa else
        "PARCIAL"
    )

    datos = {
        "project": project_name,
        "tool": "Lean 4",
        "generated_on": fecha,
        "verdict": veredicto,
        "passed": aprobado,
        "compiled": compilacion_correcta,
        "execution_passed": compilacion_correcta,
        "translation_coverage_complete": cobertura_traduccion_validada,
        "translation_coverage_declared_by_generator": cobertura_traduccion_completa,
        "refuted": False,
        "mathematical_status": "VERIFICADO" if aprobado else "NO DETERMINADO",
        "verification_complete": bool(aprobado),
        "assessment_capability": "per_assertion_markers",
        "exit_code": codigo,
        "failure_type": tipo_fallo,
        "diagnosis": diagnostico,
        "action_required": accion,
        "lean_files": archivos_lean,
        "result_theorem": teorema_resultado,
        "pending_result": resultado_pendiente,
        "result_json_node": nodo_resultado_id,
        "log": str(log.relative_to(proyecto)),
        "technical_log": (
            str(detalle_lean.relative_to(proyecto))
            if detalle_lean.is_file() else None
        ),
        "scope": alcance,
        "adec": estado_adec,
        "formalization_status": estado_formalizacion,
        "construction_complete": construccion_validada,
        "construction_complete_declared_by_generator": construccion_completa,
        "proof_complete": demostracion_validada,
        "proof_complete_declared_by_generator": demostracion_completa,
        "assertions": aseveraciones_informadas,
        "source_claims": source_claims,
        "evidence_traces": trazas,
        "conditional_premises": premisas_condicionales,
        "deductive_obligations": obligaciones_deductivas,
    }
    certificado_parcial_path = (
        evaluaciones / f"CERTIFICADO_PARCIAL_LEAN_{project_name}.json"
    )
    certificado_parcial_valido = None
    if certificado_parcial_path.is_file():
        try:
            certificado_parcial = json.loads(
                certificado_parcial_path.read_text(encoding="utf-8")
            )
            ultima_linea = certificado_parcial.get("certified_prefix_last_line")
            huella_esperada = certificado_parcial.get("certified_prefix_sha256")
            prefijo_actual = None
            if isinstance(ultima_linea, int) and ultima_linea > 0:
                prefijo_actual = "\n".join(
                    contenido_lean.splitlines()[:ultima_linea]
                )
            huella_actual = (
                hashlib.sha256(prefijo_actual.encode("utf-8")).hexdigest()
                if prefijo_actual is not None else None
            )
            certificado_por_nodos = (
                certificado_parcial.get("certificate_type")
                in {
                    "LEAN_KERNEL_NODEWISE_CONDITIONAL_DECLARATIONS",
                    "LEAN_KERNEL_NODEWISE_ELABORATION",
                }
            )
            fuente_actual_sha256 = hashlib.sha256(
                contenido_lean.encode("utf-8")
            ).hexdigest()
            coincide_fuente = (
                certificado_parcial.get("source_sha256") == fuente_actual_sha256
                if certificado_por_nodos else
                bool(huella_esperada and huella_actual == huella_esperada)
            )
            if (
                certificado_parcial.get("status") == "CERTIFICADO_PARCIAL"
                and coincide_fuente
            ):
                _adec_compatibilizar(
                    project_name,
                    certificado_parcial,
                    "lean_partial_kernel_certificate",
                    f"CERTIFICADO_PARCIAL_LEAN_{project_name}",
                    "Certificado parcial independiente del kernel Lean",
                    (
                        "Conserva las declaraciones aceptadas por el kernel y "
                        "separa los errores de traduccion y los nodos no determinados."
                    ),
                    certificado_parcial.get("certified_nodes", []),
                )
                contenido_certificado = (
                    json.dumps(certificado_parcial, ensure_ascii=False, indent=2) + "\n"
                )
                certificado_parcial_path.write_text(
                    contenido_certificado,
                    encoding="utf-8",
                )
                (proyecto / certificado_parcial_path.name).write_text(
                    contenido_certificado,
                    encoding="utf-8",
                )
                certificado_parcial_valido = certificado_parcial
                datos["partial_kernel_certificate"] = certificado_parcial
            else:
                datos["partial_kernel_certificate"] = {
                    "status": "DESCARTADO_DESACTUALIZADO",
                    "diagnosis": (
                        "El certificado parcial no coincide con el prefijo Lean "
                        "actual y no se usa como evidencia."
                    ),
                }
        except (OSError, json.JSONDecodeError):
            datos["partial_kernel_certificate"] = {
                "status": "ERROR_EVALUADOR",
                "diagnosis": "El certificado parcial no contiene JSON valido.",
            }
    nodos_certificados_parciales = set(
        certificado_parcial_valido.get("certified_nodes", [])
        if certificado_parcial_valido else []
    )
    nodos_error_traduccion = set(
        certificado_parcial_valido.get("failed_translation_nodes", [])
        if certificado_parcial_valido else []
    )
    nodos_no_determinados = set(
        certificado_parcial_valido.get("undetermined_nodes", [])
        if certificado_parcial_valido else []
    )
    nodos_no_determinados.update(
        item.get("id")
        for item in aseveraciones_informadas
        if item.get("proof_status") == "NO_DETERMINADO"
    )
    nodos_no_determinados.discard(None)
    for informada in aseveraciones_informadas:
        if informada.get("id") in nodos_certificados_parciales:
            informada["proof_status"] = "CERTIFICADA_POR_KERNEL_CON_HIPOTESIS"
            informada["kernel_certificate"] = "CERTIFICADO_PARCIAL"
        elif informada.get("id") in nodos_error_traduccion:
            informada["proof_status"] = "ERROR_DE_TRADUCCION"
        elif informada.get("id") in nodos_no_determinados:
            informada["proof_status"] = "NO_DETERMINADA"
    datos["assertions"] = aseveraciones_informadas
    datos["conditionally_verified_json_nodes"] = sorted(
        nodos_certificados_parciales
    )
    datos["translation_error_json_nodes"] = sorted(nodos_error_traduccion)
    datos["undetermined_json_nodes"] = sorted(nodos_no_determinados)
    obligaciones_informadas = []
    for obligacion in obligaciones_deductivas:
        informada = dict(obligacion)
        nodo = informada.get("node")
        if nodo in nodos_certificados_parciales:
            informada["status"] = (
                "CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA"
                if informada.get("role") == "CLAIM" else
                "NO_CERTIFICADO_INDIVIDUALMENTE"
            )
        elif nodo in nodos_error_traduccion:
            informada["status"] = "ERROR_DE_TRADUCCION"
        elif nodo in nodos_no_determinados:
            informada["status"] = "NO_DETERMINADO"
        obligaciones_informadas.append(informada)
    datos["deductive_obligations"] = obligaciones_informadas
    veredicto_json = evaluaciones / f"LEAN_{project_name}.json"
    veredicto_json.write_text(
        json.dumps(datos, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )

    nodos_verificados = _nodos_verificados_por_lean(
        aseveraciones,
        compilacion_correcta,
    )
    datos["verified_json_nodes"] = nodos_verificados
    _adec_compatibilizar(
        project_name,
        datos,
        "lean_kernel_evaluation",
        f"EVAL_LEAN_{project_name}",
        "Resultado del evaluador Lean",
        f"{veredicto}. {diagnostico}",
        [nodo_resultado_id] if nodo_resultado_id else [],
    )
    veredicto_json.write_text(
        json.dumps(datos, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )

    lista = "\n".join(f"- `{archivo}`" for archivo in archivos_lean)
    if not lista:
        lista = "No se detectaron archivos `.lean`; por ello el veredicto es NO VERIFICADO."
    lista_aseveraciones = "\n".join(
        f"- `{item['id']}`: construccion **{item['construction_status'].replace('_', ' ')}**; "
        f"demostracion **{item['proof_status'].replace('_', ' ')}**"
        for item in aseveraciones_informadas
    ) or "No hay marcadores individuales; la evaluacion disponible es global."
    if certificado_parcial_valido:
        lista_certificada = "\n".join(
            f"- `{item['node']}` como `{item['theorem']}`; hipotesis: "
            + (
                ", ".join(f"`{hipotesis}`" for hipotesis in item["hypotheses"])
                if item.get("hypotheses") else "ninguna"
            )
            for item in certificado_parcial_valido.get("declarations", [])
            if item.get("status") == "CERTIFICADO_POR_KERNEL_CON_HIPOTESIS"
        )
        lista_errores_traduccion = "\n".join(
            f"- `{item['node']}`; lineas con error: "
            + (
                ", ".join(str(linea) for linea in item.get("error_lines", []))
                or "no identificadas"
            )
            for item in certificado_parcial_valido.get("declarations", [])
            if item.get("status") == "ERROR_DE_TRADUCCION"
        )
        lista_no_determinada = "\n".join(
            f"- `{item['node']}`"
            for item in certificado_parcial_valido.get("declarations", [])
            if item.get("status") == "NO_DETERMINADO"
        )
        resumen_certificacion_parcial = (
            "**CERTIFICADO PARCIAL POR EL KERNEL DE LEAN**\n\n"
            + lista_certificada
            + (
                "\n\n**Errores de traduccion aislados por nodo**\n\n"
                + lista_errores_traduccion
                if lista_errores_traduccion else ""
            )
            + (
                "\n\n**Nodos no determinados**\n\n" + lista_no_determinada
                if lista_no_determinada else ""
            )
            + "\n\nLos resultados positivos se conservan aunque fallen otras "
            "declaraciones. No certifican todavia el objetivo global."
        )
    else:
        resumen_certificacion_parcial = (
            "No se obtuvo en esta ejecucion un certificado parcial reutilizable."
        )
    lista_fuente = "\n".join(
        f"- `{item.get('node', '?')}` formula {item.get('formula', '?')} "
        f"({item.get('location', '?')}): **{item.get('status', '?')}**; "
        f"origen: `{item.get('source', '')}`"
        for item in source_claims
    ) or "No se detectaron afirmaciones de origen omitidas por el selector."
    lista_premisas = "\n".join(
        f"- `{item['node']}` ({item['location']}): "
        f"`{item['source']}`. {item['diagnosis']}"
        for item in premisas_condicionales
    ) or "No se detectaron implicaciones condicionales adicionales sin certificar."
    lista_obligaciones = "\n".join(
        f"- `{item.get('node', '?')}` formula {item.get('formula', '?')}: "
        f"papel **{item.get('role', '?')}**, "
        f"{item.get('antecedents', 0)} antecedentes enlazados, "
        f"estado **{item.get('status', '?')}**"
        for item in obligaciones_informadas
    ) or "No se registraron pasos deductivos independientes."
    informe = "\n".join([
        f"# Evaluacion Lean - {project_name}",
        "",
        "## Veredicto",
        "",
        f"**{veredicto}**",
        "",
        f"Fecha UTC: `{fecha}`",
        f"Codigo de salida: `{codigo}`",
        f"Compilacion integral Lean: **{'CORRECTA' if compilacion_correcta else 'NO CORRECTA'}**",
        f"Cobertura de traduccion validada: **{cobertura_texto}**",
        f"Cobertura declarada por el generador: **{'COMPLETA' if cobertura_traduccion_completa else 'PARCIAL'}**",
        f"Salida completa: `{log.relative_to(proyecto)}`",
        f"Diagnostico: {diagnostico}",
        f"Accion: {accion}",
        f"Estado matematico: **{'VERIFICADO' if aprobado else 'NO DETERMINADO'}**. "
        "Un fallo de traduccion o de prueba no es una contradiccion del Markdown.",
        "",
        "## Archivos Lean evaluados",
        "",
        lista,
        "",
        "## Teorema resultado",
        "",
        f"`{teorema_resultado}`" if teorema_resultado else "No identificado.",
        f"Resultado no certificado: `{resultado_pendiente}`" if resultado_pendiente else "",
        f"Construccion validada completa: **{'si' if construccion_validada else 'no'}**",
        f"Construccion declarada completa por el generador: **{'si' if construccion_completa else 'no'}**",
        f"Demostracion validada completa: **{'si' if demostracion_validada else 'no'}**",
        "",
        "## Certificacion parcial del kernel",
        "",
        resumen_certificacion_parcial,
        "",
        "## Aseveraciones",
        "",
        lista_aseveraciones,
        "",
        "## Afirmaciones traducidas y estado de certificacion",
        "",
        lista_fuente,
        "",
        "## Obligaciones deductivas Lean",
        "",
        lista_obligaciones,
        "",
        "## Condiciones logicas no certificadas",
        "",
        lista_premisas,
        "",
        "## Alcance",
        "",
        alcance,
        "",
        "La ausencia de verificacion no equivale a refutacion. Este evaluador "
        "distingue la compilacion global del estado individual de cada "
        "aseveracion; no presenta como falsas las que no haya podido comprobar.",
        "",
        "## ADEC",
        "",
        estado_adec,
        "",
    ])
    veredicto_md = evaluaciones / f"LEAN_{project_name}.md"
    veredicto_md.write_text(
        informe + "## Trazas de obligaciones\n\n" + _trazas_markdown(trazas, "../"),
        encoding="utf-8",
    )

    # WebPublisher solo sincroniza archivos de la raiz (glob("*.*")).
    # Conservamos los originales ordenados y creamos copias publicables.
    (proyecto / veredicto_md.name).write_text(
        informe + "## Trazas de obligaciones\n\n" + _trazas_markdown(trazas, ""),
        encoding="utf-8",
    )
    for archivo in (veredicto_json, log):
        shutil.copy2(archivo, proyecto / archivo.name)

    print(f"  Evaluacion Lean {project_name}: {veredicto} (codigo {codigo})")
    print(
        f"  Compilacion: {'CORRECTA' if compilacion_correcta else 'NO CORRECTA'}; "
        f"cobertura validada: {cobertura_texto}"
    )
    if cobertura_traduccion_completa and not cobertura_traduccion_validada:
        print("  Cobertura declarada por el generador: COMPLETA; no confirmada por Lean.")
    print(f"  Diagnostico: {diagnostico}")
    print(f"  Estado matematico: {'VERIFICADO' if aprobado else 'NO DETERMINADO'}; no hay refutacion formal.")
    if certificado_parcial_valido:
        print(
            "  Certificacion parcial Lean conservada: "
            + ", ".join(sorted(nodos_certificados_parciales))
            + "."
        )
        print(
            "  Alcance: declaraciones condicionales aceptadas por el kernel; "
            "el objetivo global sigue no determinado."
        )
    for item in premisas_condicionales:
        print(f"  Premisa condicional pendiente: {item['node']} ({item['location']}); A y B son necesarios para concluir C.")
    print(f"  Accion: {accion}")
    print(f"  Veredicto: {veredicto_md}")
    print(
        "  Evidencias preparadas para la web: "
        f"LEAN_{project_name}.md, LEAN_{project_name}.json y LEAN_{project_name}.log"
    )
    return aprobado


def evaluar_lean_proyectos(project_names):
    resultados = []
    for project_spec in project_names:
        project_name = _nombre_proyecto_web(project_spec)
        resultados.append(evaluar_lean_proyecto(project_name))
    return all(resultados)


def _trazas_enlaces_prolog(proyecto, project_name, enlaces, salida):
    fuente = proyecto / f"{project_name}.extracted.json"
    programa = proyecto / f"{project_name}.pl"
    grafo = json.loads(fuente.read_text(encoding="utf-8")) if fuente.is_file() else {}
    nodos = {
        re.sub(r"[^a-z0-9_]+", "_", str(node.get("id", "")).lower()).strip("_"): node
        for node in grafo.get("nodes", [])
    }
    lineas_programa = programa.read_text(encoding="utf-8").splitlines() if programa.is_file() else []
    lineas_log = salida.splitlines()
    trazas = []
    for item in enlaces:
        node, provider, symbol = (item[key].strip() for key in ("node", "provider", "symbol"))
        source = (nodos.get(node, {}).get("source") or {})
        usado = f"uses_defined_set({node}, {symbol})."
        definido = f"defines_set({provider}, {symbol})."
        error = f"missing_definition_dependency({node},{provider},{symbol})"
        trazas.append({
            **item,
            "source_file": source.get("file"),
            "source_line": source.get("start_line"),
            "program_file": programa.name,
            "use_line": next((i for i, line in enumerate(lineas_programa, 1) if line == usado), None),
            "definition_line": next((i for i, line in enumerate(lineas_programa, 1) if line == definido), None),
            "log_file": f"PROLOG_{project_name}.log",
            "log_line": next((i for i, line in enumerate(lineas_log, 1) if error in line), None),
            "responsibility": "construccion_del_grafo_deductivo",
            "modules_to_inspect": [
                "PUBLICAR/PackPublica/json.py",
                "PUBLICAR/PackPublica/prolog.py",
            ],
        })
    return trazas


def _trazas_prolog_markdown(trazas, prefix):
    if not trazas:
        return "No se detectaron enlaces ausentes.\n"
    lineas = []
    for item in trazas:
        lineas.append(f"### {item['node']} -> {item['provider']} ({item['symbol']})")
        if item["source_file"]:
            lineas.append(
                f"Origen: [{item['source_file']}]({prefix}{item['source_file']})"
                f", linea {item['source_line']}."
            )
        for etiqueta, key in (("Uso", "use_line"), ("Definicion", "definition_line")):
            if item[key]:
                lineas.append(
                    f"{etiqueta}: [{item['program_file']}]({prefix}{item['program_file']})"
                    f", linea {item[key]}."
                )
        lineas.append(
            f"Ejecucion: [{item['log_file']}]({prefix}{item['log_file']})"
            + (f", linea {item['log_line']}." if item["log_line"] else ".")
        )
        lineas.append(
            "Responsabilidad: construccion del grafo deductivo. Modulos a revisar: "
            + ", ".join(f"`{name}`" for name in item["modules_to_inspect"])
            + ". No se infiere un error matematico del MD."
        )
        lineas.append("")
    return "\n".join(lineas)


def evaluar_prolog_proyecto(project_name):
    """Audita en Prolog el arbol declarado, independientemente de Lean."""
    proyecto = _proyecto_dir(project_name)
    evaluaciones = proyecto / "evaluaciones"
    logs = proyecto / "logs"
    evaluaciones.mkdir(parents=True, exist_ok=True)
    logs.mkdir(parents=True, exist_ok=True)
    programa = proyecto / f"{project_name}.pl"
    lean_principal = proyecto / f"{project_name}.lean"
    auditor_lean = PROJECT_ROOT / "PckDemuestra" / "audita_lean.pl"
    auditoria_lean_codigo = None
    auditoria_lean_salida = ""
    auditoria_lean_estado = None
    auditoria_lean_error = False
    ejecutable = shutil.which("swipl")
    if ejecutable is None:
        for candidato in (
            Path(r"C:\Program Files\swipl\bin\swipl.exe"),
            Path(r"C:\Program Files\SWI-Prolog\bin\swipl.exe"),
            Path.home() / "AppData" / "Local" / "Programs" / "swipl" / "bin" / "swipl.exe",
        ):
            if candidato.is_file():
                ejecutable = str(candidato)
                break

    if not programa.is_file():
        codigo = 3
        salida = f"No existe el programa Prolog esperado: {programa}\n"
        veredicto = "NO VERIFICADO"
        diagnostico = "PUBLICAR no genero el grafo deductivo Prolog; no existe evaluacion."
        accion = "Revisar PackPublica.prolog y volver a generar los derivados."
    elif ejecutable is None:
        codigo = 127
        salida = (
            "SWI-Prolog no esta instalado o swipl no esta disponible en PATH.\n"
            "Windows: winget install SWI-Prolog.SWI-Prolog\n"
            "Comprobar: swipl --version\n"
        )
        veredicto = "INCONCLUSO"
        diagnostico = "No se pudo ejecutar la auditoria deductiva Prolog."
        accion = "Instalar SWI-Prolog, abrir una terminal nueva y repetir publica.py."
    else:
        resultado = subprocess.run(
            [ejecutable, "-q", "-s", str(programa)],
            cwd=proyecto,
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            check=False,
        )
        codigo = resultado.returncode
        salida = (resultado.stdout or "") + (resultado.stderr or "")
        if codigo == 0 and "RESULTADO PROLOG: ARBOL COMPLETO" in salida:
            veredicto = "ARBOL COMPLETO"
            diagnostico = "Prolog cerro el arbol declarado y comprobo la cobertura de formulas extraidas."
            accion = "No se requiere ninguna accion."
        elif codigo == 0:
            veredicto = "INCONCLUSO"
            diagnostico = "Prolog termino sin el marcador de cierre del arbol esperado."
            accion = "Revisar el generador y el registro Prolog."
        else:
            veredicto = "ARBOL INCOMPLETO"
            diagnostico = (
                "Prolog encontro un problema en la estructura o cobertura del arbol. "
                "Esto no refuta las formulas matematicas del Markdown."
            )
            accion = (
                "Revisar los enlaces y formulas indicados en el registro; "
                "distinguir dependencias omitidas de errores del extractor."
            )

    if (
        ejecutable is not None
        and auditor_lean.is_file()
        and lean_principal.is_file()
    ):
        auditoria = subprocess.run(
            [
                ejecutable, "-q", "-s", str(auditor_lean), "--",
                "--skip-lean", str(lean_principal),
            ],
            cwd=proyecto,
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            check=False,
        )
        auditoria_lean_codigo = auditoria.returncode
        auditoria_lean_salida = (
            (auditoria.stdout or "") + (auditoria.stderr or "")
        )
        estado_match = re.search(
            r"^RESULTADO AUDITOR LEAN: ([A-Z_]+)$",
            auditoria_lean_salida,
            re.MULTILINE,
        )
        auditoria_lean_estado = estado_match.group(1) if estado_match else None
        salida += "\n--- AUDITORIA DEL RECORRIDO LEAN ---\n" + auditoria_lean_salida
        if veredicto == "ARBOL COMPLETO":
            if auditoria_lean_estado == "CERTIFICADO_ESTRUCTURAL":
                diagnostico = (
                    "Prolog cerro independientemente el arbol declarado. La "
                    "auditoria estatica del archivo Lean certifico su estructura "
                    "y sus conteos, sin ejecutar el kernel de Lean en esta ruta."
                )
                accion = (
                    "Consultar por separado el informe del evaluador Lean para "
                    "conocer el estado de compilacion y prueba."
                )
            elif auditoria_lean_estado == "CERTIFICADO":
                diagnostico = (
                    "Prolog cerro independientemente el arbol declarado. En su "
                    "propia ejecucion, el auditor Lean compilo y certifico el "
                    "archivo evaluado."
                )
            elif auditoria_lean_estado == "TRADUCCION_COMPLETA":
                diagnostico = (
                    "PUBLICAR traslado a codigo Lean los nodos y relaciones "
                    "deductivas reconocidos en el Markdown, y Lean compilo esa "
                    "representacion. La auditoria deductiva corresponde al "
                    "Prolog independiente; este estado no inventa una prueba Lean."
                )
                accion = "No se requiere reparar la traduccion MD-a-Lean."
            elif auditoria_lean_estado == "ERROR_PROPIO_DEL_AUDITOR":
                auditoria_lean_error = True
                diagnostico = (
                    "Prolog cerro el arbol declarado. El auditor Lean registro un "
                    "error propio aislado; se conserva como ERROR_EVALUADOR y no "
                    "refuta el Markdown ni degrada el resultado estructural Prolog."
                )
                accion = (
                    "Revisar el auditor Lean y repetir esa auditoria; mantener "
                    "las evaluaciones independientes ya producidas."
                )
            elif auditoria_lean_estado in {"INCOMPLETO", "NO_DECIDIBLE"}:
                veredicto = auditoria_lean_estado.replace("_", " ")
                diagnostico = (
                    "El archivo Lean compila, pero el auditor no encontro una "
                    "certificacion completa de todas sus consecuencias. Esto no "
                    "declara incorrecta ninguna formula."
                )
                accion = (
                    "Revisar los enlaces que el auditor identifica sin derivacion "
                    "o fuera de su fragmento decidible."
                )
            else:
                veredicto = "INCONCLUSO"
                diagnostico = (
                    "El auditor independiente no produjo un estado reconocible."
                )
                accion = (
                    "Revisar el entorno y el propio auditor; no emitir ningun "
                    "juicio sobre la entrada."
                )

    enlaces_ausentes = [
        {"node": node, "provider": provider, "symbol": symbol}
        for node, provider, symbol in re.findall(
            r"missing_definition_dependency\(([^,]+),([^,]+),([^\)]+)\)", salida
        )
    ]
    log = logs / f"PROLOG_{project_name}.log"
    log.write_text(salida, encoding="utf-8")
    trazas = _trazas_enlaces_prolog(proyecto, project_name, enlaces_ausentes, salida)
    datos = {
        "project": project_name,
        "tool": "SWI-Prolog",
        "generated_on": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "verdict": veredicto,
        "passed": veredicto == "ARBOL COMPLETO",
        "mathematical_status": "NO DETERMINADO",
        "refuted": False,
        "missing_definition_dependencies": enlaces_ausentes,
        "evidence_traces": trazas,
        "exit_code": codigo,
        "program": programa.name,
        "goal": "go/0",
        "lean_route_audit_program": auditor_lean.name,
        "lean_route_audit_exit_code": auditoria_lean_codigo,
        "lean_route_audit_status": auditoria_lean_estado,
        "lean_route_audit_classification": (
            "ERROR_EVALUADOR" if auditoria_lean_error
            else "CERTIFICADO_INDEPENDIENTE" if auditoria_lean_estado == "CERTIFICADO"
            else "CERTIFICADO_ESTRUCTURAL_INDEPENDIENTE"
            if auditoria_lean_estado == "CERTIFICADO_ESTRUCTURAL"
            else "NO_DETERMINADO" if auditoria_lean_estado in {"INCOMPLETO", "NO_DECIDIBLE", None}
            else "RESULTADO_AUDITOR"
        ),
        "lean_route_audit_output": auditoria_lean_salida,
        "diagnosis": diagnostico,
        "action_required": accion,
        "log": str(log.relative_to(proyecto)),
        "scope": (
            "Comprueba hechos estructurales, formulas extraidas, dependencias "
            "declaradas y referencias a conjuntos con definicion unica. No "
            "sustituye el veredicto del kernel de Lean. Un error propio del "
            "auditor se registra como ERROR_EVALUADOR y no refuta la entrada."
        ),
    }
    _adec_compatibilizar(
        project_name,
        datos,
        "prolog_structural_evaluation",
        f"EVAL_PROLOG_{project_name}",
        "Resultado del evaluador Prolog estructural",
        f"{veredicto}. {diagnostico}",
        [_objetivo_formal_desde_nodos(datos)] if _objetivo_formal_desde_nodos(datos) else [],
    )
    veredicto_json = evaluaciones / f"PROLOG_{project_name}.json"
    veredicto_json.write_text(json.dumps(datos, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    informe = "\n".join([
        f"# Evaluacion Prolog — {project_name}", "", "## Veredicto", "",
        f"**{veredicto}**", "", f"Codigo de salida: `{codigo}`", "",
        "## Diagnostico", "", diagnostico, "", "## Enlaces ausentes", "",
        "\n".join(
            f"- `{item['node']}` usa `{item['symbol']}` definido en `{item['provider']}` sin enlazarlo."
            for item in enlaces_ausentes
        ) or "Ninguno detectado.", "", "## Accion", "", accion, "",
        "## Alcance", "", datos["scope"], "",
    ])
    veredicto_md = evaluaciones / f"PROLOG_{project_name}.md"
    veredicto_md.write_text(
        informe + "\n## Trazas de enlaces\n\n" + _trazas_prolog_markdown(trazas, "../"),
        encoding="utf-8",
    )
    (proyecto / veredicto_md.name).write_text(
        informe + "\n## Trazas de enlaces\n\n" + _trazas_prolog_markdown(trazas, ""),
        encoding="utf-8",
    )
    for archivo in (veredicto_json, log):
        shutil.copy2(archivo, proyecto / archivo.name)
    print(f"  Evaluacion Prolog {project_name}: {veredicto} (codigo {codigo})")
    for item in enlaces_ausentes:
        print(f"  Enlace ausente: {item['node']} -> {item['provider']} ({item['symbol']})")
    print(f"  Diagnostico: {diagnostico}")
    print(f"  Accion: {accion}")
    # Un error de este auditor pertenece exclusivamente a este auditor.
    # Se conserva en sus informes/logs, pero NO debe impedir que las demas
    # herramientas independientes ejecuten y emitan su propio resultado.
    if auditoria_lean_estado == "ERROR_PROPIO_DEL_AUDITOR":
        print(
            "  [AVISO] El auditor Lean registro ERROR_PROPIO_DEL_AUDITOR; "
            "se conserva el resultado y continuan las evaluaciones independientes."
        )
    return veredicto == "ARBOL COMPLETO"


def evaluar_prolog_md_directo(project_name):
    """Demuestra el objetivo usando solo hechos y reglas leidos del Markdown."""
    proyecto = _proyecto_dir(project_name)
    evaluaciones = proyecto / "evaluaciones"
    logs = proyecto / "logs"
    evaluaciones.mkdir(parents=True, exist_ok=True)
    logs.mkdir(parents=True, exist_ok=True)
    markdown = proyecto / f"{project_name}.md"
    auditor = PROJECT_ROOT / "PckDemuestra" / "audita_md.pl"
    ejecutable = shutil.which("swipl")
    if ejecutable is None:
        for candidato in (
            Path(r"C:\Program Files\swipl\bin\swipl.exe"),
            Path(r"C:\Program Files\SWI-Prolog\bin\swipl.exe"),
            Path.home() / "AppData" / "Local" / "Programs" / "swipl" / "bin" / "swipl.exe",
        ):
            if candidato.is_file():
                ejecutable = str(candidato)
                break

    if not markdown.is_file():
        codigo = 3
        salida = f"No existe el Markdown esperado: {markdown}\n"
    elif not auditor.is_file():
        codigo = 3
        salida = f"No existe el auditor Prolog directo: {auditor}\n"
    elif ejecutable is None:
        codigo = 127
        salida = "SWI-Prolog no esta disponible.\n"
    else:
        resultado = subprocess.run(
            [ejecutable, "-q", "-s", str(auditor), "--", str(markdown)],
            cwd=proyecto,
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            check=False,
        )
        codigo = resultado.returncode
        salida = (resultado.stdout or "") + (resultado.stderr or "")

    marcador = "RESULTADO PROLOG MD: TEOREMA_DERIVADO_DESDE_PREMISAS_DECLARADAS"
    aprobado = codigo == 0 and marcador in salida
    veredicto = (
        "TEOREMA DERIVADO DESDE PREMISAS DECLARADAS"
        if aprobado else
        "NO DEMOSTRADO" if codigo not in {40, 127} else
        "ERROR EVALUADOR"
    )

    def numero(campo):
        match = re.search(rf"^{re.escape(campo)}: (\d+)$", salida, re.MULTILINE)
        return int(match.group(1)) if match else None

    teoremas = {
        nombre.upper(): estado
        for nombre, estado in re.findall(
            r"^TEOREMA_MD\|([^|]+)\|([^\r\n]+)$",
            salida,
            re.MULTILINE,
        )
    }
    prueba_match = re.search(
        r"^(?:ARBOL_DE_PRUEBA|ARBOL_PARCIAL_DE_DEPENDENCIAS):\s*\n(?P<tree>[\s\S]+)$",
        salida,
        re.MULTILINE,
    )
    arbol = prueba_match.group("tree").strip() if prueba_match else ""
    obligaciones_abiertas = [
        {"id": obligation_id, "status": status, "detail": detail.strip()}
        for obligation_id, status, detail in re.findall(
            r"^OBLIGACION\|([^|]+)\|([^|]+)\|([^\r\n]+)$",
            salida,
            re.MULTILINE,
        )
    ]
    dependencias_recuperadas = [
        {"theorem": theorem.upper(), "dependency": dependency.upper(), "line": int(line)}
        for theorem, dependency, line in re.findall(
            r"^DEPENDENCIA_PRUEBA\|([^|]+)\|([^|]+)\|(\d+)$",
            salida,
            re.MULTILINE,
        )
    ]
    premisas_usadas = [
        {"node": node.upper(), "declaration_line": int(line)}
        for node, line in dict(re.findall(
            r"PREMISA_MD\s+([A-Za-z0-9_]+)\s+\(linea\s+(\d+)\)",
            arbol,
        )).items()
    ]
    markdown_text = (
        markdown.read_text(encoding="utf-8", errors="replace")
        if markdown.is_file() else ""
    )
    markdown_lines = markdown_text.splitlines()
    adec_records = re.findall(
        r"^ADEC_NODE\|([^|]+)\|([^|]+)\|(\d+)\|(.*)$",
        salida,
        re.MULTILINE,
    )
    adec_nodes = []

    def adec_proof_steps(fragment):
        steps = []
        for chunk in re.split(
            r"\n\s*\n|(?<=[.!?])\s+(?=[A-ZÁÉÍÓÚÑ])",
            fragment,
        ):
            step = " ".join(chunk.split()).strip()
            if not step or step in {"---", "$$", "\\boxed{"}:
                continue
            steps.append(step)
            if len(steps) >= 8:
                break
        return steps

    for index, (node_id, kind, source_line, dependency_text) in enumerate(adec_records):
        canonical_id = node_id.upper()
        start_line = int(source_line)
        end_line = (
            int(adec_records[index + 1][2]) - 1
            if index + 1 < len(adec_records)
            else len(markdown_lines)
        )
        fragment = "\n".join(markdown_lines[start_line - 1:end_line]).strip()
        first_line = next(
            (line.strip() for line in fragment.splitlines() if line.strip()),
            canonical_id,
        )
        dependencies = [
            dependency.strip().upper()
            for dependency in dependency_text.split(",")
            if dependency.strip()
        ]
        node = {
            "id": canonical_id,
            "kind": kind,
            "name": first_line[:140],
            "description": fragment,
            "deps": dependencies,
            "source": {
                "file": markdown.name,
                "start_line": start_line,
                "end_line": end_line,
            },
        }
        if kind in {"proposition", "theorem"}:
            estado = teoremas.get(canonical_id)
            node["proof"] = {
                "method": "prolog_direct_markdown_derivation",
                "status": (
                    "verified" if estado == "DERIVADO" else
                    "unverified" if estado == "NO_DEMOSTRADO" else
                    "declared"
                ),
                "steps": adec_proof_steps(fragment),
                "verification_scope": (
                    "internal_deduction_from_declared_markdown_premises"
                    if estado == "DERIVADO" else
                    "open_semantic_obligation_prevents_certification"
                    if estado == "NO_DEMOSTRADO" else
                    "declared_in_markdown_not_independently_verified"
                ),
            }
            if len(dependencies) >= 2:
                node["measurement_relationship"] = "additive"
        adec_nodes.append(node)

    title_match = re.search(r"^#\s+(.+?)\s*$", markdown_text, re.MULTILINE)
    author_match = re.search(
        r"^\*\*Autor:\*\*\s*(.+?)\s*$",
        markdown_text,
        re.MULTILINE,
    )
    framework_match = re.search(
        r"^\*\*Marco:\*\*\s*(.+?)\s*$",
        markdown_text,
        re.MULTILINE,
    )
    authors = []
    if author_match:
        author = {
            "name": author_match.group(1).strip(),
            "conflict_of_interest": "none",
        }
        if framework_match:
            author["affiliation"] = framework_match.group(1).strip()
        authors.append(author)

    def linea(campo):
        match = re.search(rf"^{re.escape(campo)}: (\d+)$", salida, re.MULTILINE)
        return int(match.group(1)) if match else None

    def texto(campo):
        match = re.search(rf"^{re.escape(campo)}: ([^\r\n]+)$", salida, re.MULTILINE)
        return match.group(1).strip() if match else None

    objetivo = texto("OBJETIVO")
    objetivo = objetivo.upper() if objetivo else None

    md_sha256 = (
        hashlib.sha256(markdown.read_bytes()).hexdigest()
        if markdown.is_file() else None
    )
    auditor_sha256 = (
        hashlib.sha256(auditor.read_bytes()).hexdigest()
        if auditor.is_file() else None
    )
    proof_tree_sha256 = (
        hashlib.sha256(arbol.encode("utf-8")).hexdigest()
        if arbol else None
    )
    log = logs / f"PROLOG_MD_DIRECTO_{project_name}.log"
    log.write_text(salida, encoding="utf-8")
    datos = {
        "schema": "ADEC_nodes_input_v1",
        "title": title_match.group(1).strip() if title_match else project_name,
        "version": "1.0",
        "validation_mode": "article_analysis",
        "artifact_stage": "prolog_direct_markdown_derivation",
        "source": markdown.name,
        "authors": authors,
        "nodes": adec_nodes,
        "schema_version": 1,
        "certificate_type": "SWI_PROLOG_DIRECT_MARKDOWN_DERIVATION",
        "project": project_name,
        "tool": "SWI-Prolog Direct Markdown Auditor",
        "generated_on": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "verdict": veredicto,
        "passed": aprobado,
        "refuted": False,
        "mathematical_status": (
            "DERIVADO_EN_EL_SISTEMA_DECLARADO_POR_EL_MD"
            if aprobado else "NO_DETERMINADO"
        ),
        "exit_code": codigo,
        "input": markdown.name,
        "input_sha256": md_sha256,
        "auditor": str(auditor.relative_to(PROJECT_ROOT)),
        "auditor_sha256": auditor_sha256,
        "uses_generated_prolog": False,
        "uses_lean": False,
        "goal": objetivo,
        "goal_declaration_line": linea("DECLARACION_MD_LINEA"),
        "goal_rule_line": linea("REGLA_MD_LINEA"),
        "goal_qed_line": linea("QED_MD_LINEA"),
        "goal_conclusion": texto("CONCLUSION_OBJETIVO"),
        "nodes_extracted_from_md": numero("NODOS_EXTRAIDOS_MD"),
        "dependency_rules_extracted_from_md": numero("REGLAS_DEPS_EXTRAIDAS_MD"),
        "declared_premises_from_md": numero("PREMISAS_DECLARADAS_MD"),
        "formula_lines_extracted_from_md": numero("LINEAS_FORMULA_EXTRAIDAS_MD"),
        "dependencies_recovered_from_proof": numero(
            "DEPENDENCIAS_RECUPERADAS_DE_LA_PRUEBA"
        ),
        "recovered_dependencies": dependencias_recuperadas,
        "open_obligations": obligaciones_abiertas,
        "premises_used_by_goal_proof": premisas_usadas,
        "theorems": teoremas,
        "proof_tree": arbol.splitlines() if arbol else [],
        "proof_tree_sha256": proof_tree_sha256,
        "log": str(log.relative_to(proyecto)),
        "scope": (
            "Lee exclusivamente el Markdown y comprueba las reglas Deps, las "
            "referencias explicitas de la prueba y las premisas declaradas. "
            + (
                f"Certifica la derivacion interna de {objetivo or 'el objetivo'} "
                "en ese sistema; "
                "no convierte automaticamente cada premisa declarada en verdad "
                "matematica externa."
                if aprobado else
                "Conserva el cierre parcial alcanzado, pero no certifica "
                f"{objetivo or 'el objetivo'} mientras existan obligaciones "
                "de declaracion o dependencias abiertas. "
                "El resultado es no demostrado, no refutado."
            )
        ),
    }
    _adec_compatibilizar(
        project_name,
        datos,
        "prolog_direct_markdown_derivation",
        f"EVAL_PROLOG_MD_DIRECTO_{project_name}",
        "Resultado del evaluador Prolog directo del Markdown",
        (
            f"{veredicto}. "
            + (
                "; ".join(item["detail"] for item in obligaciones_abiertas)
                if obligaciones_abiertas else datos["scope"]
            )
        ),
        [objetivo] if objetivo else [],
    )
    veredicto_json = evaluaciones / f"PROLOG_MD_DIRECTO_{project_name}.json"
    veredicto_json.write_text(
        json.dumps(datos, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    arbol_md = "\n".join(f"    {linea}" for linea in arbol.splitlines())
    informe = "\n".join([
        f"# Evaluacion Prolog directa del Markdown - {project_name}",
        "",
        "## Veredicto",
        "",
        f"**{veredicto}**",
        "",
        f"Entrada unica: `{markdown.name}`",
        f"Nodos extraidos: `{datos['nodes_extracted_from_md']}`",
        f"Reglas Deps extraidas: `{datos['dependency_rules_extracted_from_md']}`",
        f"Premisas declaradas: `{datos['declared_premises_from_md']}`",
        f"Lineas matematicas extraidas: `{datos['formula_lines_extracted_from_md']}`",
        f"Dependencias recuperadas del texto de prueba: `{datos['dependencies_recovered_from_proof']}`",
        f"SHA-256 del Markdown: `{datos['input_sha256']}`",
        f"SHA-256 del auditor: `{datos['auditor_sha256']}`",
        "",
        "## Teoremas",
        "",
        *[f"- `{nombre}`: **{estado.replace('_', ' ')}**" for nombre, estado in sorted(teoremas.items())],
        "",
        "## Obligaciones abiertas",
        "",
        *(
            [
                f"- `{item['id']}`: **{item['status']}** - {item['detail']}"
                for item in obligaciones_abiertas
            ]
            or ["- Ninguna."]
        ),
        "",
        "## Dependencias recuperadas de la prueba",
        "",
        *[
            f"- `{item['theorem']}` usa `{item['dependency']}` en la linea `{item['line']}`"
            for item in dependencias_recuperadas
        ],
        "",
        "## Premisas usadas por el objetivo",
        "",
        *[
            f"- `{item['node']}` declarada en la linea `{item['declaration_line']}`"
            for item in premisas_usadas
        ],
        "",
        "## Arbol de prueba",
        "",
        "```text",
        arbol_md,
        "```",
        "",
        "## Alcance",
        "",
        datos["scope"],
        "",
    ])
    veredicto_md = evaluaciones / f"PROLOG_MD_DIRECTO_{project_name}.md"
    veredicto_md.write_text(informe, encoding="utf-8")
    (proyecto / veredicto_md.name).write_text(informe, encoding="utf-8")
    for archivo in (veredicto_json, log):
        shutil.copy2(archivo, proyecto / archivo.name)
    print(
        f"  Evaluacion Prolog directa MD {project_name}: "
        f"{veredicto} (codigo {codigo})"
    )
    if aprobado:
        print(
            f"  Objetivo {objetivo} derivado desde las premisas y reglas "
            "leidas directamente del Markdown."
        )
    print(f"  Alcance: {datos['scope']}")
    return aprobado


def evaluar_formalizaciones_proyectos(project_names):
    """Ejecuta cada evaluador de forma independiente.

    Un fallo interno de Lean, Prolog o del auditor de cierre se registra como
    resultado negativo de ESA herramienta, pero no impide ejecutar las demas.
    Solo la consolidacion final exige que todos los resultados requeridos sean
    satisfactorios.
    """
    resultados = []
    for project_spec in project_names:
        project_name = _nombre_proyecto_web(project_spec)

        lean_ok = False
        prolog_ok = False
        prolog_md_ok = False
        cierre = "ERROR_INTERNO"
        ejecucion_completa = True
        fuente = _proyecto_dir(project_name) / f"{project_name}.md"
        hash_fuente = _sha256_archivo(fuente) if fuente.is_file() else None

        try:
            lean_ok = evaluar_lean_proyecto(project_name)
        except Exception as exc:
            ejecucion_completa = False
            print(
                f"  [ERROR Lean {project_name}] {type(exc).__name__}: {exc}. "
                "Se continua con los evaluadores independientes."
            )

        try:
            prolog_ok = evaluar_prolog_proyecto(project_name)
        except Exception as exc:
            ejecucion_completa = False
            print(
                f"  [ERROR Prolog {project_name}] {type(exc).__name__}: {exc}. "
                "Se continua con los evaluadores independientes."
            )

        try:
            prolog_md_ok = evaluar_prolog_md_directo(project_name)
        except Exception as exc:
            ejecucion_completa = False
            print(
                f"  [ERROR Prolog MD {project_name}] {type(exc).__name__}: {exc}. "
                "Se continua con los evaluadores independientes."
            )

        try:
            cierre = auditar_cierre_proyecto(project_name)
        except Exception as exc:
            ejecucion_completa = False
            print(
                f"  [ERROR Auditoria {project_name}] {type(exc).__name__}: {exc}. "
                "El error queda aislado en esta evaluacion."
            )

        try:
            normalizados = normalizar_informes_adec_proyecto(project_name)
            print(
                f"  Compatibilidad estructural ADEC {project_name}: "
                f"{len(normalizados)} JSON validados con nodes. "
                "ADEC v0.8.6 requiere pegado o carga de archivo."
            )
        except Exception as exc:
            ejecucion_completa = False
            print(
                f"  [ERROR ADEC {project_name}] {type(exc).__name__}: {exc}. "
                "Los veredictos independientes se conservan sin alteracion."
            )

        try:
            semaforo = actualizar_semaforo_evaluacion(project_name)
            print(
                f"  Semaforo {project_name}: {semaforo['color'].upper()} "
                f"({semaforo['state']})."
            )
            porcentajes = semaforo.get("comparison_percentages") or {}
            balance = float(porcentajes.get("balance", 0.0))
            print(
                "  Comparacion porcentual: "
                f"mejora {float(porcentajes.get('improves', 0.0)):.1f}% | "
                f"empeora {float(porcentajes.get('worsens', 0.0)):.1f}% | "
                f"balance {balance:+.1f}%."
            )
        except Exception as exc:
            ejecucion_completa = False
            print(
                f"  [ERROR Semaforo {project_name}] {type(exc).__name__}: {exc}. "
                "Los informes actuales y anteriores permanecen separados."
            )

        cerrado = (
            lean_ok
            and prolog_ok
            and prolog_md_ok
            and cierre == "CERRADO"
        )
        if cerrado:
            consolidar_json_final(project_name)
            emitir_certificado_proyecto(project_name)
        if ejecucion_completa and hash_fuente and cierre != "ERROR_INTERNO":
            _marcar_evaluacion_terminada(project_name, hash_fuente, cerrado)
        resultados.append(cerrado)

    return all(resultados)


def preparar_json_publico_no_certificado(project_name):
    proyecto = _proyecto_dir(project_name)
    fuentes = {
        "documento": proyecto / f"{project_name}.extracted.json",
        "lean": proyecto / f"LEAN_{project_name}.json",
        "prolog": proyecto / f"PROLOG_{project_name}.json",
        "auditoria": proyecto / f"AUDITORIA_{project_name}.json",
    }
    faltantes = [str(path) for path in fuentes.values() if not path.is_file()]
    if faltantes:
        raise FileNotFoundError("No se publica una evaluacion incompleta sin informes: " + ", ".join(faltantes))
    contenido = fuentes["documento"].read_text(encoding="utf-8")
    json.loads(contenido)
    definitivo = proyecto / f"{project_name}.json"
    if definitivo.is_file():
        backup_dir = PROJECT_ROOT / "backups" / "json_publico_anterior"
        backup_dir.mkdir(parents=True, exist_ok=True)
        backup = backup_dir / f"{project_name}.json"
        if not backup.exists():
            shutil.copy2(definitivo, backup)
    temporal = definitivo.with_suffix(".json.tmp")
    temporal.write_text(contenido.rstrip() + "\n", encoding="utf-8")
    os.replace(temporal, definitivo)
    print(f"  JSON publico independiente: {definitivo.name}")


def _clasificar_fallos_lean_por_nodo(lean_source, lean_log, failed_nodes):
    """Distingue fallos tecnicos de obligaciones que Lean no pudo cerrar."""
    markers = []
    for line_number, line in enumerate(lean_source.splitlines(), start=1):
        match = re.match(r"-- FORMAL_NODE:\s*(\S+)", line)
        if match:
            markers.append((line_number, match.group(1)))

    ranges = {}
    total_lines = len(lean_source.splitlines())
    for index, (start, node) in enumerate(markers):
        end = markers[index + 1][0] - 1 if index + 1 < len(markers) else total_lines
        ranges[node] = (start, end)

    messages = []
    error_pattern = re.compile(r"^.*?:(\d+):(\d+):\s+error:\s*(.*)$", re.MULTILINE)
    for match in error_pattern.finditer(lean_log):
        messages.append((int(match.group(1)), match.group(3).strip()))

    diagnostics = []
    for node in failed_nodes:
        start, end = ranges.get(node, (0, -1))
        node_messages = [message for line, message in messages if start <= line <= end]
        joined = " | ".join(node_messages)
        technical = any(
            token in joined.lower()
            for token in (
                "maximum recursion depth",
                "tactic `simp` failed with a nested error",
                "type mismatch",
                "failed to synthesize",
                "invalid field",
                "unknown identifier",
                "application type mismatch",
            )
        )
        if technical:
            state = "ERROR_EVALUADOR"
            category = "tool_error"
            color = "blue"
            detail = joined or "Lean rechazo la construccion tecnica del nodo."
        elif node_messages:
            state = "NO_DEMOSTRADO"
            category = "undetermined"
            color = "gray"
            detail = (
                "Las premisas formalizadas no cerraron el objetivo: " + joined
            )
        else:
            state = "NO_DETERMINADO"
            category = "undetermined"
            color = "gray"
            detail = "No se pudo asociar un diagnostico tecnico concluyente al nodo."
        diagnostics.append({
            "node": node,
            "state": state,
            "category": category,
            "color": color,
            "detail": detail,
        })
    return diagnostics


def auditar_cierre_proyecto(project_name):
    """Audita cierre, raices y correspondencia MD/JSON/Prolog/Lean."""
    proyecto = _proyecto_dir(project_name)
    evaluaciones = proyecto / "evaluaciones"
    logs = proyecto / "logs"
    evaluaciones.mkdir(parents=True, exist_ok=True)
    logs.mkdir(parents=True, exist_ok=True)
    grafo = json.loads((proyecto / f"{project_name}.extracted.json").read_text(encoding="utf-8"))
    lean = json.loads((proyecto / f"LEAN_{project_name}.json").read_text(encoding="utf-8"))
    prolog = json.loads((proyecto / f"PROLOG_{project_name}.json").read_text(encoding="utf-8"))
    prolog_md_path = proyecto / f"PROLOG_MD_DIRECTO_{project_name}.json"
    prolog_md = (
        json.loads(prolog_md_path.read_text(encoding="utf-8"))
        if prolog_md_path.is_file() else {}
    )
    nodos = {n.get("id"): n for n in grafo.get("nodes", []) if n.get("id")}
    objetivo = (
        lean.get("result_json_node")
        or prolog_md.get("goal")
        or _objetivo_formal_desde_nodos(grafo)
    )
    faltantes = sorted({d for n in nodos.values() for d in n.get("deps", []) if d not in nodos})

    # Recorrido iterativo: evita desbordar la pila con proyectos extensos.
    visitados = set()
    pendientes = [objetivo]
    while pendientes:
        node_id = pendientes.pop()
        if node_id in visitados or node_id not in nodos:
            continue
        visitados.add(node_id)
        pendientes.extend(nodos[node_id].get("deps", []))

    # Kahn sobre el subgrafo alcanzable. Si quedan nodos, existe un ciclo.
    grados = {
        node_id: sum(1 for dep in nodos[node_id].get("deps", []) if dep in visitados)
        for node_id in visitados
    }
    dependientes = {node_id: [] for node_id in visitados}
    for node_id in visitados:
        for dep in nodos[node_id].get("deps", []):
            if dep in visitados:
                dependientes[dep].append(node_id)
    cola = [node_id for node_id, grado in grados.items() if grado == 0]
    procesados = set()
    while cola:
        node_id = cola.pop()
        if node_id in procesados:
            continue
        procesados.add(node_id)
        for dependiente in dependientes[node_id]:
            grados[dependiente] -= 1
            if grados[dependiente] == 0:
                cola.append(dependiente)
    ciclo_nodos = sorted(visitados - procesados)
    ciclos = [ciclo_nodos] if ciclo_nodos else []
    alcanzables = sorted(visitados)
    raices = sorted(n for n in alcanzables if not nodos[n].get("deps"))

    pendientes_con_antecedentes = []
    for node_id, nodo in nodos.items():
        proof = nodo.get("proof") if isinstance(nodo.get("proof"), dict) else {}
        estados = {
            str(proof.get("status", "")).lower(),
            str(nodo.get("formalization_status", "")).lower(),
            str(nodo.get("verification_status", "")).lower(),
        }
        esta_pendiente = bool(estados & {"pending", "not_evaluated", "pendiente"})
        deps = [nodos.get(dep) for dep in nodo.get("deps", [])]
        deps_demostradas = bool(deps) and all(
            dep and isinstance(dep.get("proof"), dict)
            and dep["proof"].get("status") in {"declared", "verified"}
            for dep in deps
        )
        if esta_pendiente and deps_demostradas:
            pendientes_con_antecedentes.append({
                "node": node_id,
                "dependencies": list(nodo.get("deps", [])),
            })

    detalle_lean = proyecto / "logs" / f"LEAN_{project_name}_DETALLE.log"
    resumen_lean = proyecto / f"LEAN_{project_name}.log"
    lean_log_path = detalle_lean if detalle_lean.is_file() else resumen_lean
    lean_log = lean_log_path.read_text(encoding="utf-8", errors="replace")
    hipotesis_abiertas = sorted(set(re.findall(r"\((h[A-Za-z0-9_']*)\s*:\s*([^\)]+)\)", lean_log)))
    axiomas_match = re.search(r"depends on axioms:\s*\[([^\]]*)\]", lean_log, re.IGNORECASE)
    axiomas = [x.strip() for x in axiomas_match.group(1).split(",") if x.strip()] if axiomas_match else []
    lean_source = (proyecto / f"{project_name}.lean").read_text(
        encoding="utf-8", errors="replace"
    )
    codigo_lean = "\n".join(
        linea.split("--", 1)[0] for linea in lean_source.splitlines()
    )
    marcadores_no_certificables = sorted(set(re.findall(
        r"\b(?:sorry|admit|sorryAx|axiom)\b",
        codigo_lean,
    )))
    nodos_verificados = set(lean.get("verified_json_nodes") or [])
    obligaciones_semanticas = list(prolog_md.get("open_obligations") or [])
    comprobaciones = {
        "objetivo_existe": objetivo in nodos,
        "dependencias_resueltas": not faltantes,
        "sin_ciclos": not ciclos,
        "lean_aprobado": lean.get("passed") is True,
        "verificacion_lean_completa": lean.get("verification_complete") is True,
        "traduccion_validada_completa": lean.get("translation_coverage_complete") is True,
        "construccion_validada_completa": lean.get("construction_complete") is True,
        "prueba_validada_completa": lean.get("proof_complete") is True,
        "objetivo_verificado_por_kernel": objetivo in nodos_verificados,
        "prolog_aprobado": prolog.get("passed") is True,
        "prolog_md_directo_aprobado": prolog_md.get("passed") is True,
        "obligaciones_semanticas_cerradas": not obligaciones_semanticas,
        "nodo_lean_coincide": lean.get("result_json_node") == objetivo,
        "dependencias_lean_internalizadas": not hipotesis_abiertas,
        "sin_pendientes_ya_demostrados": not pendientes_con_antecedentes,
        "sin_marcadores_no_certificables": not marcadores_no_certificables,
    }
    if all(comprobaciones.values()):
        veredicto = "CERRADO"
    else:
        veredicto = "REQUIERE_REVISION"
    bloqueos_certificado = [
        nombre for nombre, correcto in comprobaciones.items() if not correcto
    ]
    certificados_parciales = list(
        lean.get("conditionally_verified_json_nodes") or []
    )
    errores_traduccion = list(lean.get("translation_error_json_nodes") or [])
    diagnosticos_lean = _clasificar_fallos_lean_por_nodo(
        lean_source, lean_log, errores_traduccion
    )
    errores_tecnicos_lean = [
        item for item in diagnosticos_lean if item["category"] == "tool_error"
    ]
    no_demostrados_lean = [
        item for item in diagnosticos_lean if item["category"] == "undetermined"
    ]
    clasificaciones = [
        {
            "evaluator": "Lean",
            "state": "CERTIFICADO" if lean.get("passed") is True else "ERROR_EVALUADOR",
            "category": "certified" if lean.get("passed") is True else "tool_error",
            "color": "green" if lean.get("passed") is True else "blue",
            "detail": lean.get("diagnosis") or lean.get("verdict"),
        },
        {
            "evaluator": "Lean parcial",
            "state": "CERTIFICADO_PARCIAL" if certificados_parciales else "SIN_CERTIFICADO",
            "category": "certified" if certificados_parciales else "inconclusive",
            "color": "green" if certificados_parciales else "gray",
            "detail": (
                f"{len(certificados_parciales)} nodos aceptados individualmente por el kernel."
                if certificados_parciales else "No hay nodos certificados parcialmente."
            ),
        },
        {
            "evaluator": "Prolog estructural",
            "state": "CERTIFICADO_ESTRUCTURAL" if prolog.get("passed") is True else "INCONCLUSO",
            "category": "certified" if prolog.get("passed") is True else "inconclusive",
            "color": "green" if prolog.get("passed") is True else "gray",
            "detail": prolog.get("diagnosis") or prolog.get("verdict"),
        },
        {
            "evaluator": "Prolog directo del MD",
            "state": (
                "REFUTADO" if prolog_md.get("refuted") is True else
                "CERTIFICADO" if prolog_md.get("passed") is True else
                "PREMISA_FALTANTE" if obligaciones_semanticas else
                "INCONCLUSO"
            ),
            "category": (
                "refuted" if prolog_md.get("refuted") is True else
                "certified" if prolog_md.get("passed") is True else
                "missing_premise" if obligaciones_semanticas else
                "inconclusive"
            ),
            "color": (
                "red" if prolog_md.get("refuted") is True else
                "green" if prolog_md.get("passed") is True else
                "yellow" if obligaciones_semanticas else "gray"
            ),
            "detail": (
                "; ".join(item.get("detail", "") for item in obligaciones_semanticas)
                if obligaciones_semanticas else prolog_md.get("scope")
            ),
        },
    ]
    if errores_tecnicos_lean:
        numero_tecnicos = len(errores_tecnicos_lean)
        etiqueta_tecnicos = "nodo" if numero_tecnicos == 1 else "nodos"
        recomendacion_primaria = (
            "Corregir primero los errores tecnicos localizados del traductor Lean "
            "sin modificar el Markdown ni alterar los nodos ya certificados."
        )
        impacto = (
            f"Hay {numero_tecnicos} {etiqueta_tecnicos} con error tecnico y "
            f"{len(no_demostrados_lean)} no demostrados con las premisas formalizadas. "
            "Corregir los errores tecnicos puede aumentar los positivos sin presentar "
            "las obligaciones abiertas como fallos del Markdown."
        )
    elif no_demostrados_lean:
        recomendacion_primaria = (
            "Completar o enlazar las premisas formales de los nodos no demostrados, "
            "sin convertir sus propias conclusiones en hipotesis."
        )
        impacto = (
            f"Aclara y permite cerrar hasta {len(no_demostrados_lean)} obligaciones "
            "actualmente no determinadas, conservando los certificados existentes."
        )
    elif obligaciones_semanticas:
        recomendacion_primaria = (
            "Resolver las obligaciones informadas por el evaluador directo usando "
            "unicamente nodos y premisas declarados en el Markdown."
        )
        impacto = "Puede completar la derivacion sin inventar nodos ni hipotesis."
    else:
        recomendacion_primaria = "Repetir la auditoria completa y emitir el certificado final."
        impacto = "Confirma que todos los evaluadores independientes permanecen en verde."
    recomendacion = {
        "priority": "MAXIMIZAR_POSITIVOS_SIN_PERDER_EVIDENCIA",
        "primary_action": recomendacion_primaria,
        "expected_impact": impacto,
        "preserve": [
            f"{len(certificados_parciales)} nodos certificados parcialmente por Lean",
            "resultado estructural Prolog",
            "informes y hashes ya emitidos",
            "independencia entre evaluadores",
        ],
        "next_mathematical_action": (
            "Resolver las obligaciones declarativas o deductivas informadas."
            if obligaciones_semanticas else "No quedan obligaciones semanticas registradas."
        ),
        "do_not": [
            "No modificar el MD para ocultar errores del traductor.",
            "No convertir una hipotesis abierta en teorema por declaracion.",
            "No invalidar certificados parciales por fallos de otros evaluadores.",
        ],
    }
    datos = {
        "project": project_name, "tool": "DEMUESTRA Closure Audit",
        "generated_on": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "verdict": veredicto, "goal": objetivo, "checks": comprobaciones,
        "certificate_eligible": veredicto == "CERRADO",
        "certificate_blockers": bloqueos_certificado,
        "classifications": clasificaciones,
        "recommendation": recomendacion,
        "reachable_nodes": alcanzables, "root_facts": raices,
        "missing_dependencies": faltantes, "cycles": ciclos,
        "pending_with_demonstrated_dependencies": pendientes_con_antecedentes,
        "open_lean_hypotheses": [{"name": n, "type": t.strip()} for n, t in hipotesis_abiertas],
        "lean_axioms": axiomas,
        "lean_axioms_status": (
            "INFORMADOS" if axiomas else
            "NINGUNO" if lean.get("passed") is True else
            "NO_DETERMINADOS_POR_ERROR_EVALUADOR"
        ),
        "prolog_direct_markdown": {
            "report": f"PROLOG_MD_DIRECTO_{project_name}.md",
            "json": f"PROLOG_MD_DIRECTO_{project_name}.json",
            "log": f"PROLOG_MD_DIRECTO_{project_name}.log",
            "verdict": prolog_md.get("verdict", "SIN_EVALUAR"),
            "passed": prolog_md.get("passed"),
            "refuted": prolog_md.get("refuted"),
            "open_obligations": obligaciones_semanticas,
        },
        "non_certifiable_lean_markers": marcadores_no_certificables,
        "lean_node_diagnostics": diagnosticos_lean,
        "lean_evidence_log": str(lean_log_path.relative_to(proyecto)),
        "scope": "Auditoria tecnica de trazabilidad formal; no mide aceptacion cientifica.",
    }
    _adec_compatibilizar(
        project_name,
        datos,
        "demuestra_closure_audit",
        f"AUDITORIA_FINAL_{project_name}",
        "Resultado de la auditoria final DEMUESTRA",
        f"{veredicto}. Bloqueos: {', '.join(bloqueos_certificado) or 'ninguno'}.",
        [objetivo],
    )
    audit_json = evaluaciones / f"AUDITORIA_{project_name}.json"
    audit_json.write_text(json.dumps(datos, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    checks_md = "\n".join(f"- {'PASS' if ok else 'FAIL'} `{k}`" for k, ok in comprobaciones.items())
    roots_md = "\n".join(f"- `{r}`" for r in raices) or "- Ninguna"
    open_md = "\n".join(f"- `{n}: {t.strip()}`" for n, t in hipotesis_abiertas) or "- Ninguna"
    pending_md = "\n".join(
        f"- `{item['node']}` depende de: " + ", ".join(f"`{dep}`" for dep in item["dependencies"])
        for item in pendientes_con_antecedentes
    ) or "- Ninguno"
    clasificaciones_md = "\n".join(
        f"- **{item['state']}** — `{item['evaluator']}`: {item['detail']}"
        for item in clasificaciones
    )
    obligaciones_md = "\n".join(
        f"- `{item.get('id', '?')}`: **{item.get('status', '?')}**. {item.get('detail', '')}"
        for item in obligaciones_semanticas
    ) or "- Ninguna"
    preservar_md = "\n".join(
        f"- {item}" for item in recomendacion["preserve"]
    )
    no_hacer_md = "\n".join(
        f"- {item}" for item in recomendacion["do_not"]
    )
    informe = f"""# Auditoria final — {project_name}

## Veredicto

**{veredicto}**

Objetivo: `{objetivo}`

Esta auditoria comprueba la trazabilidad tecnica entre MD, JSON, Lean y Prolog. La
aceptacion o adopcion por la comunidad cientifica no es una premisa de verdad y no
forma parte del veredicto.

## Comprobaciones

{checks_md}

## Clasificacion visual y semantica

{clasificaciones_md}

## Prolog directo del Markdown

- Informe: `PROLOG_MD_DIRECTO_{project_name}.md`
- JSON ADEC: `PROLOG_MD_DIRECTO_{project_name}.json`
- Veredicto: **{prolog_md.get('verdict', 'SIN EVALUAR')}**
- Refutacion formal: **{'si' if prolog_md.get('refuted') is True else 'no'}**

### Obligaciones abiertas

{obligaciones_md}

## Raices utilizadas

{roots_md}

## Dependencias declaradas como parametros en Lean

{open_md}

Si una propiedad ya esta demostrada en el proyecto, su presencia aqui indica que
el generador debe enlazar el teorema correspondiente en vez de volver a pedirla
como parametro. No convierte por si misma el resultado cientifico en condicional.

## Pendientes contradichos por antecedentes demostrados

{pending_md}

Todo elemento de esta lista es un error de construccion: debe reutilizar sus
antecedentes demostrados antes de poder publicarse como pendiente.

## Axiomas informados por Lean

{', '.join(axiomas) if axiomas else ('Ninguno informado' if lean.get('passed') is True else 'No determinados: Lean no completo una verificacion global valida.')}

## Recomendacion prioritaria

**Accion:** {recomendacion['primary_action']}

**Impacto esperado:** {recomendacion['expected_impact']}

**Siguiente objetivo matematico:** {recomendacion['next_mathematical_action']}

### Conservar

{preservar_md}

### No hacer

{no_hacer_md}
"""
    audit_md = evaluaciones / f"AUDITORIA_{project_name}.md"
    audit_md.write_text(informe, encoding="utf-8")
    audit_log = logs / f"AUDITORIA_{project_name}.log"
    audit_log.write_text(json.dumps(datos, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    for archivo in (audit_md, audit_json, audit_log):
        shutil.copy2(archivo, proyecto / archivo.name)
    print(f"  Auditoria final {project_name}: {veredicto}")
    print(f"  Raices: {len(raices)} | Enlaces Lean por internalizar: {len(hipotesis_abiertas)}")
    print(f"  Pendientes con antecedentes demostrados: {len(pendientes_con_antecedentes)}")
    return veredicto


def consolidar_json_final(project_name):
    """Publica sin mezclar en el JSON resultados de Lean o Prolog."""
    proyecto = _proyecto_dir(project_name)
    provisional = proyecto / f"{project_name}.extracted.json"
    definitivo = proyecto / f"{project_name}.json"
    lean_path = proyecto / f"LEAN_{project_name}.json"
    prolog_path = proyecto / f"PROLOG_{project_name}.json"
    audit_path = proyecto / f"AUDITORIA_{project_name}.json"

    requeridos = (provisional, lean_path, prolog_path, audit_path)
    faltantes = [str(path) for path in requeridos if not path.is_file()]
    if faltantes:
        raise FileNotFoundError(
            "No se puede consolidar el JSON final; faltan: " + ", ".join(faltantes)
        )

    contenido = provisional.read_text(encoding="utf-8")
    json.loads(contenido)
    temporal = definitivo.with_suffix(".json.tmp")
    temporal.write_text(contenido.rstrip() + "\n", encoding="utf-8")
    json.loads(temporal.read_text(encoding="utf-8"))
    os.replace(temporal, definitivo)
    print(f"  JSON final independiente: {definitivo.name}")
    print("  Los informes Lean, Prolog y de auditoria permanecen separados.")
    return definitivo


def _sha256_archivo(path):
    digest = hashlib.sha256()
    with path.open("rb") as flujo:
        for bloque in iter(lambda: flujo.read(1024 * 1024), b""):
            digest.update(bloque)
    return digest.hexdigest()


def emitir_certificado_proyecto(project_name):
    """Emite un certificado solo después de superar todas las puertas formales."""
    proyecto = _proyecto_dir(project_name)
    auditoria_path = proyecto / f"AUDITORIA_{project_name}.json"
    lean_path = proyecto / f"LEAN_{project_name}.json"
    prolog_path = proyecto / f"PROLOG_{project_name}.json"
    fuente_path = proyecto / f"{project_name}.md"
    artefacto_lean = proyecto / f"{project_name}.lean"
    artefacto_prolog = proyecto / f"{project_name}.pl"
    requeridos = (
        auditoria_path, lean_path, prolog_path, fuente_path,
        artefacto_lean, artefacto_prolog,
    )
    faltantes = [str(path) for path in requeridos if not path.is_file()]
    if faltantes:
        raise FileNotFoundError(
            "No se puede emitir el certificado; faltan evidencias: "
            + ", ".join(faltantes)
        )

    auditoria = json.loads(auditoria_path.read_text(encoding="utf-8"))
    lean = json.loads(lean_path.read_text(encoding="utf-8"))
    prolog = json.loads(prolog_path.read_text(encoding="utf-8"))
    if auditoria.get("verdict") != "CERRADO" or auditoria.get("certificate_eligible") is not True:
        raise RuntimeError(
            "CERTIFICADO NO EMITIDO: la auditoria final no esta cerrada."
        )
    if lean.get("passed") is not True or prolog.get("passed") is not True:
        raise RuntimeError(
            "CERTIFICADO NO EMITIDO: Lean y Prolog no aprobaron independientemente."
        )

    evidencias = {}
    for path in requeridos:
        evidencias[str(path.relative_to(proyecto))] = _sha256_archivo(path)
    fecha = datetime.now(timezone.utc).isoformat(timespec="seconds")
    certificado = {
        "schema_version": 1,
        "certificate_type": "DEMUESTRA_FORMAL_VERIFICATION",
        "status": "EMITIDO",
        "project": project_name,
        "issued_on": fecha,
        "goal": auditoria.get("goal"),
        "kernel": "Lean 4",
        "lean_verdict": lean.get("verdict"),
        "prolog_verdict": prolog.get("verdict"),
        "closure_verdict": auditoria.get("verdict"),
        "root_facts": auditoria.get("root_facts", []),
        "checks": auditoria.get("checks", {}),
        "evidence_sha256": evidencias,
        "scope": (
            "Certifica que los artefactos formales identificados por estos hashes "
            "superaron el kernel Lean, la auditoria estructural Prolog y la puerta "
            "de cierre DEMUESTRA sin hipotesis deductivas abiertas."
        ),
    }
    _adec_compatibilizar(
        project_name,
        certificado,
        "demuestra_formal_certificate",
        f"CERTIFICADO_FINAL_{project_name}",
        "Certificado formal final DEMUESTRA",
        certificado["scope"],
        [auditoria.get("goal")] if auditoria.get("goal") else [],
    )
    certificado_json = proyecto / f"CERTIFICADO_{project_name}.json"
    certificado_md = proyecto / f"CERTIFICADO_{project_name}.md"
    certificado_json.write_text(
        json.dumps(certificado, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    hashes_md = "\n".join(
        f"- `{nombre}`: `{digest}`"
        for nombre, digest in evidencias.items()
    )
    certificado_md.write_text(
        "\n".join([
            f"# Certificado DEMUESTRA - {project_name}", "",
            "**EMITIDO**", "", f"Fecha UTC: `{fecha}`", "",
            f"Objetivo: `{auditoria.get('goal')}`", "",
            "Lean, Prolog y la auditoria de cierre aprobaron de forma independiente.",
            "No quedan hipotesis deductivas abiertas ni marcadores no certificables.",
            "", "## Evidencias SHA-256", "", hashes_md, "",
            "## Alcance", "", certificado["scope"], "",
        ]),
        encoding="utf-8",
    )
    print(f"  Certificado formal emitido: {certificado_json.name}")
    return certificado_json


# ============================================================
# MAIN
# ============================================================
if __name__ == "__main__":
    if len(sys.argv) == 3 and sys.argv[1] == "--restaurar-anterior":
        resultado = restaurar_evaluacion_anterior(sys.argv[2], confirmar=True)
        print(
            f"Evaluacion anterior restaurada para {sys.argv[2]}. "
            f"Semaforo resultante: {resultado['color'].upper()}."
        )
        sys.exit(0)

    _forzados_cli, _argv_limpio = _extraer_proyectos_forzados_cli(sys.argv)
    PROYECTOS_FORZADOS_WEB.update(_forzados_cli)
    sys.argv[:] = _argv_limpio
    proyectos_pendientes_ejecucion = _proyectos_pendientes_web()
    errores_derivados = []
    fallos_traduccion = {}

    if TEST & 64:
        for _project_name in proyectos_pendientes_ejecucion:
            if guardar_evaluacion_anterior(_project_name):
                print(
                    f"  Evaluacion anterior conservada: "
                    f"{_project_name}\\anterior"
                )

    p = Publicar(__file__)

    preparar_markdowns_demostraciones_web(proyectos_pendientes_ejecucion)

    # Procesar documentos (TEST & 1, 2...)
    if TEST & 1:
        print(f"TEST{TEST}: Procesando documentos...")
        md_obj = p.test(ARCHIVO_PRUEBA)
        if md_obj is None:
            print("[ERROR] Documento de prueba no encontrado.")
            sys.exit(1)
        print(f"[INFO] Modo prueba: {md_obj.documento.nombre}")
        md_objects = (
            [md_obj]
            if _es_markdown_demostracion(Path(md_obj.documento.nombre).with_suffix(".md"))
            else []
        )

    if TEST & 2:
        print(f"TEST{TEST}: Procesando documentos...")
        print("[INFO] Explorando todos los documentos...")
        p.FORZADO = False

        md_objects = p.explorar()

        seleccionados = []
        proyectos_conocidos = set(_proyectos_publicables_web())
        for md_obj in md_objects:
            nombre = Path(md_obj.documento.nombre).with_suffix(".md").name
            fuente = PROJECT_ROOT / nombre
            proyecto = Path(nombre).stem
            if proyecto in proyectos_conocidos:
                if proyecto not in proyectos_pendientes_ejecucion:
                    print(f"  Se omite proyecto ya evaluado sin cambios: {nombre}")
                    continue
            elif _documento_raiz_vigente(nombre, _sha256_archivo(fuente)):
                print(f"  Se omite documento raiz sin cambios: {nombre}")
                continue
            seleccionados.append(md_obj)
        md_objects = seleccionados

        print(f"[INFO] Encontrados {len(md_objects)} archivos .md")

    if TEST & 1 or TEST & 2:
        print(f"TEST{TEST}: Procesando documentos...")
        errores_derivados = []
        for md_obj in md_objects:
            doc = md_obj.documento
            tipo = type(doc).__name__
            # print(f"\nProcesando: {doc.nombre} ({tipo})")
            try:
                nombre_fuente = Path(doc.nombre).with_suffix(".md").name
                fuente = PROJECT_ROOT / nombre_fuente
                hash_fuente = _sha256_archivo(fuente)
                es_proyecto = Path(nombre_fuente).stem in proyectos_pendientes_ejecucion
                if hasattr(md_obj, "generar_derivados"):
                    # Como en todos los proyectos PUBLICAR, JSON y Lean se
                    # generan siempre. DEMUESTRA valida despues que el Lean no
                    # sea solo el esqueleto generico antes de evaluarlo.
                    if es_proyecto:
                        project_name = Path(nombre_fuente).stem
                        derivados, diagnostico = _generar_derivados_publicables(
                            md_obj, fuente, project_name,
                        )
                        if diagnostico is not None:
                            fallos_traduccion[project_name] = diagnostico
                            print(
                                f"  [ERROR HERRAMIENTA] {project_name}: fallo de traduccion Lean. "
                                "No es un error cientifico demostrado del MD. "
                                "La publicacion continua; certificacion pendiente."
                            )
                    else:
                        derivados = md_obj.generar_derivados(
                            page_size=PAGE_SIZE, generar_json=False,
                            generar_lean=False, generar_prolog=False,
                        )

                    if derivados.get("html") is not None:
                        print("  [OK] HTML guardado en htmls/")
                    else:
                        print("  [OK] HTML ya actualizado; no se regenera.")

                    if derivados.get("pdf") is not None:
                        print("  [OK] PDF guardado en pdfs/")

                    if derivados.get("docx") is not None:
                        print("  [OK] DOCX guardado en docxs/ (y ODT generado automaticamente)")

                    if derivados.get("json") is not None:
                        print("  [OK] JSON generado en json/")

                    if derivados.get("lean") is not None:
                        print(
                            "  [OK] Lean generado en lean/; DEMUESTRA comprobara "
                            "su compilacion en la siguiente fase"
                        )
                    if derivados.get("prolog") is not None:
                        print("  [OK] Prolog deductivo generado en prolog/")
                else:
                    html_obj = md_obj.html()
                    if html_obj is None:
                        continue

                    html_obj.save()
                    print("  [OK] HTML guardado en htmls/")

                    if html_obj.contenido:
                        html_obj.pdf(page_size=PAGE_SIZE).save()
                        print("  [OK] PDF guardado en pdfs/")
                        html_obj.docx().save()
                        print("  [OK] DOCX guardado en docxs/ (y ODT generado automaticamente)")
                    else:
                        print("  [AVISO] HTML vacio, no se generan formatos derivados.")

                if isinstance(doc, Libro):
                    print("  [INFO] Generando articulos individuales...")
                    doc.generar_articulos_individuales(
                        output_dir="articulos",
                        abstract_lang=None,
                        page_size=PAGE_SIZE
                    )

                if not es_proyecto and (PROJECT_ROOT / "pdfs" / f"{fuente.stem}.pdf").is_file():
                    if _sha256_archivo(fuente) != hash_fuente:
                        raise RuntimeError(f"La fuente cambio durante la generacion: {nombre_fuente}")
                    _marcar_documento_raiz(nombre_fuente, hash_fuente)

            except Exception as e:
                print(f"  [ERROR] Error en la lista de documentos: {e}")
                import traceback
                traceback.print_exc()
                nombre_fallido = Path(doc.nombre).with_suffix("").name
                errores_derivados.append((nombre_fallido, e))

        if errores_derivados:
            for nombre_fallido, _ in errores_derivados:
                _restaurar_markdown_preparado(nombre_fallido)
            fallidos = {nombre for nombre, _ in errores_derivados}
            proyectos_pendientes_ejecucion = [
                nombre for nombre in proyectos_pendientes_ejecucion
                if nombre not in fallidos
            ]
            print(
                "\n[FALLO DE GENERACION] No se han preparado todos los formatos editoriales. "
                "Se conservan sus archivos y se continua con los demas proyectos."
            )

        print(f"\n[OK] Procesamiento de documentos completado. Total: {len(md_objects)} archivos.")

    # KDP
    if TEST & 4:
        print(f"TEST{TEST}: Procesando documentos...")
        if KDP is not None:
            print("\n[INFO] Publicando en KDP...")
            KDP(r"C:\Users\vedq\Desktop\publicado\KDP\ES_KDP_EINSTEINVED-Tomo2_libro.docx")
            KDP(r"C:\Users\vedq\Desktop\publicado\KDP\ES_KDP_EINSTEINVED-Tomo1_libro.docx")
        else:
            print("[AVISO] KDP no disponible.")

    # ============================================================
    # ZENODO - Publicacion (Fase 1 + Fase 2)
    # ============================================================
    if TEST & 8:
        print("\n[INFO] Publicando en Zenodo...")
        try:
            publisher = ZenodoPublisher()

            # Fase 1: Generar archivos de estado (lectura, sin modificar Zenodo)
            publisher.generate_state_files(conceptrecid=17172925, pdf_dir=ZENODO_PDF_DIR)

            # Fase 2: Comparar y publicar (si hay cambios)
            result = publisher.publish_from_state(init_local=INIT_LOCAL, pdf_dir=ZENODO_PDF_DIR)

            if result["success"]:
                print(f"[OK] {result['message']}")
                if result.get("published"):
                    print(f"   Publicado en: {result['url']}")
                else:
                    if result.get("url"):
                        print(f"   Deposito en: {result['url']}")
            else:
                print(f"[ERROR] {result['message']}")

            # Listar borradores para revision manual
            drafts = publisher.list_drafts()
            if drafts:
                print("\n[AVISO] Borradores no publicados encontrados (revisar y eliminar manualmente):")
                for d in drafts:
                    print(f"   - ID: {d['id']} | Estado: {d['state']} | URL: {d['url']}")

        except Exception as e:
            print(f"[ERROR] Error: {e}")
            import traceback
            traceback.print_exc()

    # ============================================================
    # ZENODO - Verificacion
    # ============================================================
    if TEST & 16:
        print(f"TEST{TEST}: Procesando documentos...")
        print("\n[INFO] Verificando estado en Zenodo...")
        try:
            publisher = ZenodoPublisher()
            info = publisher.verify()
            if info.get("error"):
                print(f"[AVISO] {info['error']}")
            else:
                print(f"[OK] Deposito {info['deposition_id']}: {info['title']}")
                print(f"   Estado: {info['state']}")
                lista = info.get("files", [])
                print(f"   Archivos:{len(lista)}")
                for f in lista:
                    size = f.get('filesize', f.get('size', 'desconocido'))
                    #print(f"     - {f['filename']} ({size} bytes)")
        except Exception as e:
            print(f"[ERROR] Error al verificar: {e}")
            import traceback
            traceback.print_exc()

    # ============================================================
    # VERIFICACION DE TRADUCCIONES
    # ============================================================
    if TEST & 32:
        print(f"TEST{TEST}: Procesando documentos...")
        print("\n[INFO] Verificando cobertura de traducciones en PDFs...")
        print("  [AVISO] Funcion verificar_traducciones no implementada.")

    if TEST & 64:
        print(f"TEST{TEST}: Procesando documentos...")

        # ============================================================
        # DEMOSTRACIONES FIJADAS PARA WEB
        # ============================================================
        proyectos_publicables = _proyectos_publicables_web()
        fallidos = {nombre for nombre, _ in errores_derivados}
        proyectos_publicables = [nombre for nombre in proyectos_publicables
                                if nombre not in fallidos]
        proyectos_pendientes = proyectos_pendientes_ejecucion
        try:
            preparar_demostraciones_web(proyectos_pendientes, sin_evaluacion=fallos_traduccion)
        except Exception:
            for project_name in list(MARKDOWNS_DEMOSTRACIONES_WEB_PREPARADOS):
                _restaurar_markdown_preparado(project_name)
            raise

        index_php = _index_proyectos_web()
        if index_php is not None:
            shutil.copy2(index_php, PROJECT_ROOT / "Proyectos" / "index.php")

        # Esta es la ultima fase local: el Lean generado ya esta colocado
        # dentro del proyecto y su veredicto se incluye en la publicacion.
        # Los JSON publicos incluyen esquema ADEC y acceso por URL o archivo.
        proyectos_evaluables = [nombre for nombre in proyectos_pendientes
                               if nombre not in fallos_traduccion]
        proyectos_cerrados = []
        for project_name in proyectos_evaluables:
            if evaluar_formalizaciones_proyectos([project_name]):
                proyectos_cerrados.append(project_name)
            else:
                preparar_json_publico_no_certificado(project_name)
        cerrado = len(proyectos_cerrados) == len(proyectos_pendientes)
        if not cerrado:
            print(
                "Se publicara el dossier completo con los resultados formales "
                "declarados en sus informes independientes."
            )

        if LOCAL_ONLY:
            print("[OK] Preparacion local terminada; publicacion web omitida.")
            sys.exit(1 if errores_derivados else 0)

        ftp = FTPClient()

        # El mismo index.php sirve como listado raiz y como ficha individual.
        wp_projects_index = WebPublisher(
            ftp,
            local_dir=PROJECT_ROOT / "Proyectos",
            remote_dir="/estradad.es/teorias/pdf/DEMUESTRA/proyectos",
            extensions={".php"},
            hash_name="hashes_index.json",
            forzado=True
        )
        wp_projects_index.sync()

        # ============================================================
        # PDFs
        # ============================================================
        wp_pdf = WebPublisher(
            ftp,
            local_dir="./pdfs",
            remote_dir="/estradad.es/teorias/pdf/DEMUESTRA",
            extensions={".pdf"},
            hash_name="hashes.json",
            forzado=True
        )
        wp_pdf.sync()

        # ============================================================
        # MARKDOWN DEL PROYECTO DEMUESTRA
        # ============================================================
        wp_md = WebPublisher(
            ftp,
            local_dir="./",
            remote_dir="/estradad.es/teorias/pdf/DEMUESTRA/md",
            extensions={".md"},
            hash_name="hashes_md.json",
            forzado=True
        )
        wp_md.sync()

        for project_spec in proyectos_publicables:
            project_name = _nombre_proyecto_web(project_spec)
            wp_demo = WebPublisher(
                ftp,
                local_dir=_proyecto_dir(project_name),
                remote_dir=f"/estradad.es/teorias/pdf/DEMUESTRA/proyectos/{_proyecto_dir(project_name).name}",
                extensions=DEMOSTRACIONES_WEB_EXTENSIONS,
                hash_name=f"hashes_{project_name}.json",
                forzado=True
            )
            wp_demo.sync()

        # Solo despues de aprobar Lean/Prolog/auditoria y completar la subida
        # se devuelven las fuentes verificadas a su proyecto de procedencia.
        if proyectos_cerrados:
            devolver_fuentes_verificadas(proyectos_cerrados)

    if errores_derivados:
        print("\n[CON ERRORES] Proceso terminado; documentos pendientes: "
              + ", ".join(nombre for nombre, _ in errores_derivados))
        sys.exit(1)
    if fallos_traduccion:
        print("\n[AVISO] Publicacion preparada sin certificacion Lean actual: "
              + ", ".join(fallos_traduccion)
              + ". Fallos de la herramienta, no errores cientificos demostrados del MD.")
    print("\n[OK] Proceso completado.")
