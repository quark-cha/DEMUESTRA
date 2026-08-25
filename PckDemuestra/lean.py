import os
import subprocess
from pathlib import Path
from shutil import which


def instrucciones_instalacion(nombre: str) -> str:
    elan_bin = Path.home() / ".elan" / "bin"

    if nombre in {"lake", "lean", "elan"}:
        return f"""
No se encuentra '{nombre}'.

Lean 4 se instala con elan, no con pip.

Si ya instalaste elan, anade esta ruta al PATH de esta terminal:

PowerShell:
  $env:PATH="{elan_bin};$env:PATH"

Anaconda Prompt / CMD:
  set PATH={elan_bin};%PATH%

Si aun no instalaste Lean 4, en PowerShell ejecuta:

  Invoke-WebRequest -Uri https://raw.githubusercontent.com/leanprover/elan/master/elan-init.ps1 -OutFile elan-init.ps1
  powershell -ExecutionPolicy Bypass -File .\\elan-init.ps1 -NoPrompt $true -DefaultToolchain stable

Despues comprueba:

  lean --version
  lake --version
"""

    return f"""
No se encuentra '{nombre}'.

Comprueba que esta instalado y disponible en PATH.
Si es una dependencia Python, instalala con:

  pip install {nombre}

o desde Anaconda:

  conda install {nombre}
"""


def resolver_exe(nombre: str) -> str:
    encontrado = which(nombre)
    if encontrado:
        return encontrado

    candidatos = [
        Path.home() / ".elan" / "bin" / f"{nombre}.exe",
        Path.home() / ".elan" / "bin" / nombre,
    ]

    for candidato in candidatos:
        if candidato.exists():
            return str(candidato)

    raise FileNotFoundError(instrucciones_instalacion(nombre))


def resolver_raiz_lake(desde: Path) -> Path:
    p = desde.resolve()
    if p.is_file():
        p = p.parent

    for candidato in [p, *p.parents]:
        if (candidato / "lakefile.toml").is_file() and (candidato / "lean-toolchain").is_file():
            return candidato

    return p


def relativo_a_raiz_lake(archivo: Path, repo_root: Path) -> str:
    try:
        return str(archivo.resolve().relative_to(repo_root.resolve()))
    except ValueError:
        return str(archivo.resolve())


def ejecutar(cmd: list[str], cwd: Path) -> subprocess.CompletedProcess[str]:
    try:
        repo_root = resolver_raiz_lake(cwd)
        cmd_resuelto = [resolver_exe(cmd[0]), *cmd[1:]]
        env = os.environ.copy()
        elan_home = Path.home() / ".elan"
        elan_bin = elan_home / "bin"

        if elan_home.exists():
            env.setdefault("ELAN_HOME", str(elan_home))
        if elan_bin.exists():
            env["PATH"] = f"{elan_bin}{os.pathsep}{env.get('PATH', '')}"

        return subprocess.run(
            cmd_resuelto,
            cwd=repo_root,
            env=env,
            text=True,
            capture_output=True,
            check=False,
        )
    except FileNotFoundError as exc:
        return subprocess.CompletedProcess(
            args=cmd,
            returncode=127,
            stdout="",
            stderr=str(exc),
        )


def compilar_lean(archivo: Path, repo_root: Path) -> subprocess.CompletedProcess[str]:
    raiz_lake = resolver_raiz_lake(repo_root)
    archivo_relativo = relativo_a_raiz_lake(archivo, raiz_lake)
    return ejecutar(["lake", "env", "lean", archivo_relativo], raiz_lake)


def cache_mathlib(repo_root: Path) -> subprocess.CompletedProcess[str]:
    return ejecutar(["lake", "exe", "cache", "get"], resolver_raiz_lake(repo_root))


def build(repo_root: Path) -> subprocess.CompletedProcess[str]:
    return ejecutar(["lake", "build"], resolver_raiz_lake(repo_root))
