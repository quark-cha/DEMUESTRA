#!/usr/bin/env python3
# DEMUESTRA/publica.py
# Este script se usa para publicar y para construir los pdfs
# no forma parte del proyecto

import sys
import shutil
import os
import json
import subprocess
import re
from datetime import datetime, timezone
from pathlib import Path

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

# ============================================================
# CONFIGURACION DEL PROYECTO
# ============================================================
TEST = 2 + 64 #  + 4 + 8 + 16 + 32 + 64
PAGE_SIZE = "6x9"

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
CONFIG_ORIGEN_NOMBRE = "config.txt"

# Solo estos Markdown son fuentes de demostraciones. Ejemplo: ES_46_RV6.md.
PATRON_MARKDOWN_DEMOSTRACION = re.compile(
    r"^[A-Za-z]{2}_\d+_.+\.md$",
    re.IGNORECASE,
)


def _es_markdown_demostracion(ruta):
    return bool(PATRON_MARKDOWN_DEMOSTRACION.fullmatch(Path(ruta).name))


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
    pendiente = PROJECT_ROOT / "Proyectos" / project_name
    evaluado = PROJECT_ROOT / "YaEvaluado" / project_name
    return pendiente if pendiente.is_dir() else evaluado


def _nombres_proyectos(base):
    if not base.is_dir():
        return []
    return sorted(
        path.name for path in base.iterdir()
        if path.is_dir() and _es_markdown_demostracion(f"{path.name}.md")
    )


def _proyectos_pendientes_web():
    return _nombres_proyectos(PROJECT_ROOT / "Proyectos")


def _proyectos_publicables_web():
    nombres = set(PROYECTOS_PUBLICABLES_WEB)
    nombres.update(_proyectos_pendientes_web())
    nombres.update(_nombres_proyectos(PROJECT_ROOT / "YaEvaluado"))
    return sorted(nombres)


def _markdown_proyecto(proyecto):
    return _primer_archivo([proyecto / f"{proyecto.name}.md"])


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
        _copiar_verificado(markdown, raiz_origen / markdown.name)
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
        shutil.move(str(markdown), str(destino))
        os.utime(destino, None)
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


def preparar_demostraciones_web(project_names):
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

        _preparar_evaluacion_lean_existente(project_name, proyecto)


def _registrar_resultado_lean_en_json(
    proyecto, project_name, teorema_resultado, nodo_resultado_id, aprobado, codigo,
    veredicto, diagnostico, accion, veredicto_json, log
):
    """Consolida el JSON con Lean y solo verifica un nodo si es inequívoco."""
    json_proyecto = proyecto / f"{project_name}.extracted.json"
    if not json_proyecto.is_file():
        return []

    try:
        datos = json.loads(json_proyecto.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        print(f"  [AVISO] No se pudo enlazar el resultado Lean con el JSON: {exc}")
        return []

    nodos = datos.get("nodes")
    if not isinstance(nodos, list):
        nodos = []

    for nodo in nodos:
        proof = nodo.get("proof")
        if isinstance(proof, dict) and proof.get("system") == "Lean":
            proof["formalization"] = f"{project_name}.lean"

    salida_lean = log.read_text(encoding="utf-8", errors="replace") if log.is_file() else ""
    axiomas_match = re.search(
        r"depends on axioms:\s*\[([^\]]*)\]",
        salida_lean,
        re.IGNORECASE,
    )
    axiomas = []
    if axiomas_match:
        axiomas = [
            item.strip()
            for item in axiomas_match.group(1).split(",")
            if item.strip()
        ]

    datos["artifact_stage"] = "lean_validated" if aprobado else "lean_evaluated"
    datos["formal_verification"] = {
        "tool": "Lean 4",
        "status": veredicto,
        "verified": bool(aprobado),
        "exit_code": codigo,
        "formalization": f"{project_name}.lean",
        "result_theorem": teorema_resultado,
        "result_json_node": nodo_resultado_id,
        "axioms": axiomas,
        "report": veredicto_json.name,
        "log": log.name,
        "diagnosis": diagnostico,
        "action_required": accion,
        "scope": (
            "La verificacion se limita a las declaraciones formalizadas en "
            f"{project_name}.lean; no convierte automaticamente todos los "
            "nodos documentales del JSON en teoremas Lean."
        ),
    }

    nodos_verificados = []
    # La correspondencia debe estar declarada en el Lean. Nunca se deduce por
    # posicion ni porque el JSON contenga un unico nodo de tipo theorem.
    candidatos = [
        nodo for nodo in nodos
        if nodo_resultado_id and nodo.get("id") == nodo_resultado_id
    ]
    if teorema_resultado and len(candidatos) == 1:
        nodo_resultado = candidatos[0]
        proof = nodo_resultado.setdefault("proof", {})
        proof.update({
            "system": "Lean 4",
            "formalization": f"{project_name}.lean",
            "verified": bool(aprobado),
            "status": "verified" if aprobado else "declared",
            "result_theorem": teorema_resultado,
            "axioms": axiomas,
            "verification_verdict": veredicto,
            "verification_report": veredicto_json.name,
            "verification_log": log.name,
        })
        if aprobado:
            nodos_verificados.append(nodo_resultado.get("id"))
    else:
        motivo = (
            "Lean no declaro DEMUESTRA_RESULT"
            if not teorema_resultado
            else (
                "Lean no declaro DEMUESTRA_JSON_NODE"
                if not nodo_resultado_id
                else f"el JSON contiene {len(candidatos)} nodos con id {nodo_resultado_id}"
            )
        )
        print(
            f"  [AVISO] No se asocia Lean a un nodo concreto porque {motivo}. "
            "El resultado global si queda registrado en formal_verification."
        )

    json_proyecto.write_text(
        json.dumps(datos, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    return nodos_verificados


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
    es_esqueleto = (
        "Punto de entrada estable para completar la formalizacion" in contenido_lean
        or ("theorem " not in contenido_lean and "lemma " not in contenido_lean)
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
    if teorema_resultado is None:
        es_esqueleto = True

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
            "formalizados. No se ejecuta Lean y el veredicto es RECHAZADO.\n"
        )
        codigo = 3
    else:
        try:
            resultado = subprocess.run(
                comando,
                cwd=PROJECT_ROOT,
                capture_output=True,
                text=True,
                encoding="utf-8",
                errors="replace",
                check=False,
            )
            salida = (resultado.stdout or "") + (resultado.stderr or "")
            codigo = resultado.returncode
        except OSError as exc:
            salida = f"No se pudo iniciar la evaluacion Lean: {exc}\n"
            codigo = 127

    log = logs / f"LEAN_{project_name}.log"
    log.write_text(salida, encoding="utf-8")

    archivos_lean = sorted(
        str(path.relative_to(proyecto))
        for path in proyecto.rglob("*.lean")
        if ".lake" not in path.parts and "__pycache__" not in path.parts
    )
    aprobado = codigo == 0 and bool(archivos_lean)
    fallo_interno = "Traceback (most recent call last):" in salida
    if aprobado:
        veredicto = "APROBADO"
        tipo_fallo = None
        diagnostico = "Lean compilo correctamente todos los archivos evaluados."
        accion = "No se requiere ninguna accion."
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
        veredicto = "RECHAZADO"
        tipo_fallo = "compilacion"
        diagnostico = "Lean termino y devolvio errores de compilacion o demostracion."
        accion = (
            "Revisar en el log los mensajes de Lean con archivo, linea y columna."
        )
    fecha = datetime.now(timezone.utc).isoformat(timespec="seconds")
    alcance = (
        "Lean 4 solo certifica las definiciones, teoremas e inferencias "
        "formalizadas en los archivos Lean evaluados."
    )
    estado_adec = (
        "Evaluacion manual; no automatizada hasta que ADEC admita url_json."
    )

    datos = {
        "project": project_name,
        "tool": "Lean 4",
        "generated_on": fecha,
        "verdict": veredicto,
        "passed": aprobado,
        "exit_code": codigo,
        "failure_type": tipo_fallo,
        "diagnosis": diagnostico,
        "action_required": accion,
        "lean_files": archivos_lean,
        "result_theorem": teorema_resultado,
        "result_json_node": nodo_resultado_id,
        "log": str(log.relative_to(proyecto)),
        "scope": alcance,
        "adec": estado_adec,
    }
    veredicto_json = evaluaciones / f"LEAN_{project_name}.json"
    veredicto_json.write_text(
        json.dumps(datos, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )

    nodos_verificados = _registrar_resultado_lean_en_json(
        proyecto,
        project_name,
        teorema_resultado,
        nodo_resultado_id,
        aprobado,
        codigo,
        veredicto,
        diagnostico,
        accion,
        veredicto_json,
        log,
    )
    datos["verified_json_nodes"] = nodos_verificados
    veredicto_json.write_text(
        json.dumps(datos, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )

    lista = "\n".join(f"- `{archivo}`" for archivo in archivos_lean)
    if not lista:
        lista = "No se detectaron archivos `.lean`; por ello el veredicto es RECHAZADO."
    informe = "\n".join([
        f"# Evaluacion Lean - {project_name}",
        "",
        "## Veredicto",
        "",
        f"**{veredicto}**",
        "",
        f"Fecha UTC: `{fecha}`",
        f"Codigo de salida: `{codigo}`",
        f"Salida completa: `{log.relative_to(proyecto)}`",
        f"Diagnostico: {diagnostico}",
        f"Accion: {accion}",
        "",
        "## Archivos Lean evaluados",
        "",
        lista,
        "",
        "## Teorema resultado",
        "",
        f"`{teorema_resultado}`" if teorema_resultado else "No identificado.",
        "",
        "## Alcance",
        "",
        alcance,
        "",
        "## ADEC",
        "",
        estado_adec,
        "",
    ])
    veredicto_md = evaluaciones / f"LEAN_{project_name}.md"
    veredicto_md.write_text(informe, encoding="utf-8")

    # WebPublisher solo sincroniza archivos de la raiz (glob("*.*")).
    # Conservamos los originales ordenados y creamos copias publicables.
    for archivo in (veredicto_md, veredicto_json, log):
        shutil.copy2(archivo, proyecto / archivo.name)

    print(f"  Evaluacion Lean {project_name}: {veredicto} (codigo {codigo})")
    print(f"  Diagnostico: {diagnostico}")
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


def evaluar_prolog_proyecto(project_name):
    """Ejecuta el grafo deductivo Prolog despues de una evaluacion Lean aprobada."""
    proyecto = _proyecto_dir(project_name)
    evaluaciones = proyecto / "evaluaciones"
    logs = proyecto / "logs"
    evaluaciones.mkdir(parents=True, exist_ok=True)
    logs.mkdir(parents=True, exist_ok=True)
    programa = proyecto / f"{project_name}.pl"
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
        veredicto = "RECHAZADO"
        diagnostico = "PUBLICAR no genero el grafo deductivo Prolog."
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
        if codigo == 0:
            veredicto = "APROBADO"
            diagnostico = "Prolog resolvio el objetivo deductivo declarado."
            accion = "No se requiere ninguna accion."
        else:
            veredicto = "RECHAZADO"
            diagnostico = "Prolog no pudo resolver el objetivo deductivo declarado."
            accion = "Revisar dependencias, ciclos, falsedades y contraejemplos en el log."

    log = logs / f"PROLOG_{project_name}.log"
    log.write_text(salida, encoding="utf-8")
    datos = {
        "project": project_name,
        "tool": "SWI-Prolog",
        "generated_on": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "verdict": veredicto,
        "passed": veredicto == "APROBADO",
        "exit_code": codigo,
        "program": programa.name,
        "goal": "go/0",
        "diagnosis": diagnostico,
        "action_required": accion,
        "log": str(log.relative_to(proyecto)),
        "scope": "Comprueba la resolucion del grafo deductivo; Lean comprueba la formalizacion matematica.",
    }
    veredicto_json = evaluaciones / f"PROLOG_{project_name}.json"
    veredicto_json.write_text(json.dumps(datos, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    informe = "\n".join([
        f"# Evaluacion Prolog — {project_name}", "", "## Veredicto", "",
        f"**{veredicto}**", "", f"Codigo de salida: `{codigo}`", "",
        "## Diagnostico", "", diagnostico, "", "## Accion", "", accion, "",
        "## Alcance", "", datos["scope"], "",
    ])
    veredicto_md = evaluaciones / f"PROLOG_{project_name}.md"
    veredicto_md.write_text(informe, encoding="utf-8")
    for archivo in (veredicto_md, veredicto_json, log):
        shutil.copy2(archivo, proyecto / archivo.name)
    print(f"  Evaluacion Prolog {project_name}: {veredicto} (codigo {codigo})")
    print(f"  Diagnostico: {diagnostico}")
    print(f"  Accion: {accion}")
    return veredicto == "APROBADO"


def evaluar_formalizaciones_proyectos(project_names):
    for project_spec in project_names:
        project_name = _nombre_proyecto_web(project_spec)
        if not evaluar_lean_proyecto(project_name):
            return False
        if not evaluar_prolog_proyecto(project_name):
            return False
        auditar_cierre_proyecto(project_name)
        consolidar_json_final(project_name)
    return True


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
    nodos = {n.get("id"): n for n in grafo.get("nodes", []) if n.get("id")}
    objetivo = lean.get("result_json_node") or "T_RIEMANN"
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

    lean_log = (proyecto / f"LEAN_{project_name}.log").read_text(encoding="utf-8", errors="replace")
    hipotesis_abiertas = sorted(set(re.findall(r"\((h[A-Za-z0-9_']*)\s*:\s*([^\)]+)\)", lean_log)))
    axiomas_match = re.search(r"depends on axioms:\s*\[([^\]]*)\]", lean_log, re.IGNORECASE)
    axiomas = [x.strip() for x in axiomas_match.group(1).split(",") if x.strip()] if axiomas_match else []
    comprobaciones = {
        "objetivo_existe": objetivo in nodos,
        "dependencias_resueltas": not faltantes,
        "sin_ciclos": not ciclos,
        "lean_aprobado": lean.get("passed") is True,
        "prolog_aprobado": prolog.get("passed") is True,
        "nodo_lean_coincide": lean.get("result_json_node") == objetivo,
        "dependencias_lean_internalizadas": not hipotesis_abiertas,
        "sin_pendientes_ya_demostrados": not pendientes_con_antecedentes,
    }
    if all(comprobaciones.values()):
        veredicto = "CERRADO"
    elif all(comprobaciones[k] for k in comprobaciones if k != "dependencias_lean_internalizadas"):
        # Una propiedad ya demostrada en el marco puede aparecer como parametro
        # porque el generador no enlazo todavia su teorema Lean. Es una observacion
        # de trazabilidad de la formalizacion, no una condicion sobre la verdad ni
        # sobre la aceptacion de la comunidad cientifica.
        veredicto = "APROBADO_CON_OBSERVACIONES"
    else:
        veredicto = "REQUIERE_REVISION"
    datos = {
        "project": project_name, "tool": "DEMUESTRA Closure Audit",
        "generated_on": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "verdict": veredicto, "goal": objetivo, "checks": comprobaciones,
        "reachable_nodes": alcanzables, "root_facts": raices,
        "missing_dependencies": faltantes, "cycles": ciclos,
        "pending_with_demonstrated_dependencies": pendientes_con_antecedentes,
        "open_lean_hypotheses": [{"name": n, "type": t.strip()} for n, t in hipotesis_abiertas],
        "lean_axioms": axiomas,
        "scope": "Auditoria tecnica de trazabilidad formal; no mide aceptacion cientifica.",
    }
    audit_json = evaluaciones / f"AUDITORIA_{project_name}.json"
    audit_json.write_text(json.dumps(datos, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    checks_md = "\n".join(f"- {'PASS' if ok else 'FAIL'} `{k}`" for k, ok in comprobaciones.items())
    roots_md = "\n".join(f"- `{r}`" for r in raices) or "- Ninguna"
    open_md = "\n".join(f"- `{n}: {t.strip()}`" for n, t in hipotesis_abiertas) or "- Ninguna"
    pending_md = "\n".join(
        f"- `{item['node']}` depende de: " + ", ".join(f"`{dep}`" for dep in item["dependencies"])
        for item in pendientes_con_antecedentes
    ) or "- Ninguno"
    informe = f"""# Auditoria final — {project_name}

## Veredicto

**{veredicto}**

Objetivo: `{objetivo}`

Esta auditoria comprueba la trazabilidad tecnica entre MD, JSON, Lean y Prolog. La
aceptacion o adopcion por la comunidad cientifica no es una premisa de verdad y no
forma parte del veredicto.

## Comprobaciones

{checks_md}

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

{', '.join(axiomas) if axiomas else 'Ninguno informado'}
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
    """Escribe al final el JSON publico y elimina el JSON provisional."""
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

    datos = json.loads(provisional.read_text(encoding="utf-8"))
    lean = json.loads(lean_path.read_text(encoding="utf-8"))
    prolog = json.loads(prolog_path.read_text(encoding="utf-8"))
    audit = json.loads(audit_path.read_text(encoding="utf-8"))
    nodos = datos.get("nodes", [])
    por_id = {n.get("id"): n for n in nodos if n.get("id")}
    alcanzables = set(audit.get("reachable_nodes", []))
    nodo_lean = lean.get("result_json_node")

    pendientes_con_antecedentes = []
    for nodo in nodos:
        proof = nodo.get("proof") if isinstance(nodo.get("proof"), dict) else {}
        source_demonstrated = bool(proof and proof.get("status") in {"declared", "verified"})
        nodo["source_status"] = "demonstrated" if source_demonstrated else "stated"
        nodo["prolog_status"] = "reachable" if nodo.get("id") in alcanzables else "not_reached"
        nodo["lean_status"] = (
            "verified" if lean.get("passed") is True and nodo.get("id") == nodo_lean
            else "not_individually_verified"
        )

        status = str(proof.get("status", "")).lower()
        deps = [por_id.get(dep) for dep in nodo.get("deps", [])]
        deps_demostradas = bool(deps) and all(
            dep and isinstance(dep.get("proof"), dict)
            and dep["proof"].get("status") in {"declared", "verified"}
            for dep in deps
        )
        if status in {"pending", "not_evaluated", "pendiente"} and deps_demostradas:
            pendientes_con_antecedentes.append({
                "node": nodo.get("id"),
                "dependencies": list(nodo.get("deps", [])),
                "reason": "Marcado pendiente pese a tener antecedentes demostrados en la fuente.",
            })

    datos["artifact_stage"] = "validation_complete"
    datos["lean_verification"] = lean
    datos["prolog_verification"] = prolog
    datos["closure_audit"] = audit
    datos["pending_consistency_check"] = {
        "passed": not pendientes_con_antecedentes,
        "contradictions": pendientes_con_antecedentes,
    }
    datos["final_verdict"] = audit.get("verdict")
    datos.pop("formal_verification", None)

    temporal = definitivo.with_suffix(".json.tmp")
    temporal.write_text(
        json.dumps(datos, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    json.loads(temporal.read_text(encoding="utf-8"))
    os.replace(temporal, definitivo)
    provisional.unlink()
    print(f"  JSON final consolidado: {definitivo.name}")
    print("  JSON provisional eliminado correctamente.")
    print(
        "  Pendientes contradichos por antecedentes demostrados: "
        f"{len(pendientes_con_antecedentes)}"
    )
    return definitivo


# ============================================================
# MAIN
# ============================================================
if __name__ == "__main__":
    p = Publicar(__file__)

    preparar_markdowns_demostraciones_web(_proyectos_pendientes_web())

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

        md_objects_omitidos = [
            md_obj for md_obj in md_objects
            if not _es_markdown_demostracion(
                Path(md_obj.documento.nombre).with_suffix(".md")
            )
        ]
        md_objects = [
            md_obj for md_obj in md_objects
            if _es_markdown_demostracion(
                Path(md_obj.documento.nombre).with_suffix(".md")
            )
        ]

        for md_obj in md_objects_omitidos:
            print(
                "  Se omite sin generar PDF/Lean/JSON: "
                f"{Path(md_obj.documento.nombre).with_suffix('.md').name}"
            )

        print(f"[INFO] Encontrados {len(md_objects)} archivos .md")

    if TEST & 1 or TEST & 2:
        print(f"TEST{TEST}: Procesando documentos...")
        for md_obj in md_objects:
            doc = md_obj.documento
            tipo = type(doc).__name__
            # print(f"\nProcesando: {doc.nombre} ({tipo})")
            try:
                if hasattr(md_obj, "generar_derivados"):
                    # Como en todos los proyectos PUBLICAR, JSON y Lean se
                    # generan siempre. DEMUESTRA valida despues que el Lean no
                    # sea solo el esqueleto generico antes de evaluarlo.
                    derivados = md_obj.generar_derivados(page_size=PAGE_SIZE)

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
                        print("  [OK] Lean generado en lean/; pendiente de validacion DEMUESTRA")
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

            except Exception as e:
                print(f"  [ERROR] Error en la lista de documentos: {e}")
                import traceback
                traceback.print_exc()
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
        proyectos_pendientes = _proyectos_pendientes_web()
        try:
            preparar_demostraciones_web(proyectos_publicables)
        except Exception:
            for project_name in list(MARKDOWNS_DEMOSTRACIONES_WEB_PREPARADOS):
                _restaurar_markdown_preparado(project_name)
            raise

        index_php = _index_proyectos_web()
        if index_php is not None:
            shutil.copy2(index_php, PROJECT_ROOT / "Proyectos" / "index.php")

        # Esta es la ultima fase local: el Lean generado ya esta colocado
        # dentro del proyecto y su veredicto se incluye en la publicacion.
        # ADEC continua siendo manual hasta que admita url_json.
        if proyectos_pendientes and not evaluar_formalizaciones_proyectos(proyectos_pendientes):
            print("La evaluacion formal Lean/Prolog no fue aprobada. Se cancela la publicacion web.")
            sys.exit(1)

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
                remote_dir=f"/estradad.es/teorias/pdf/DEMUESTRA/proyectos/{project_name}",
                extensions=DEMOSTRACIONES_WEB_EXTENSIONS,
                hash_name=f"hashes_{project_name}.json",
                forzado=True
            )
            wp_demo.sync()

        # Solo despues de aprobar Lean/Prolog/auditoria y completar la subida
        # se devuelven las fuentes verificadas a su proyecto de procedencia.
        devolver_fuentes_verificadas(proyectos_pendientes)

    print("\n[OK] Proceso completado.")
