from pathlib import Path
import os
import subprocess
import shutil
import tempfile
from .base import Publicacion

class Odt(Publicacion):
    carpeta_salida = "odts"
    extension = ".odt"

    def __init__(self, docx_path=None, documento=None):
        super().__init__(documento)
        self.docx_path = Path(docx_path).resolve() if docx_path else None

    def _escribir(self, fichero):
        if not self.docx_path or not self.docx_path.exists():
            raise FileNotFoundError(
                f"No se encontró el DOCX para convertir a ODT: {self.docx_path}"
            )

        print(f"  🔍 Convertir DOCX a ODT: {self.docx_path} -> {fichero}")

        # Crear carpeta de salida
        fichero.parent.mkdir(parents=True, exist_ok=True)

        # En Windows se prioriza soffice.com porque espera a que termine la
        # conversion y devuelve un codigo de salida util para automatizacion.
        possible = []
        if os.name == "nt":
            possible = [
                r"C:\Program Files\LibreOffice\program\soffice.com",
                r"C:\Program Files (x86)\LibreOffice\program\soffice.com",
            ]
        soffice_path = next((p for p in possible if Path(p).is_file()), None)
        if not soffice_path:
            soffice_path = shutil.which("soffice")
        if not soffice_path:
            raise RuntimeError(
                "No se encontro LibreOffice (soffice).\n"
                "Windows: winget install TheDocumentFoundation.LibreOffice\n"
                "Debian/Ubuntu: sudo apt install libreoffice\n"
                "macOS: brew install --cask libreoffice\n"
                "Comprobacion: soffice --version"
            )

        soffice_path = str(Path(soffice_path).resolve())
        program_dir = Path(soffice_path).parent
        fundamental = program_dir / "fundamental.ini"
        if os.name == "nt" and not fundamental.is_file():
            raise RuntimeError(
                "La instalacion de LibreOffice esta incompleta: falta "
                f"{fundamental}. Repara o reinstala LibreOffice con: "
                "winget install --force TheDocumentFoundation.LibreOffice"
            )

        entorno = os.environ.copy()
        for variable in ("PYTHONHOME", "PYTHONPATH", "PYTHONSTARTUP"):
            entorno.pop(variable, None)
        python_cores = [
            path for path in program_dir.glob("python-core-*")
            if path.is_dir() and (path / "lib").is_dir()
        ]
        if python_cores:
            python_home = max(python_cores, key=lambda path: path.stat().st_mtime)
            entorno["PYTHONHOME"] = str(python_home)
        else:
            python_home = None

        try:
            with tempfile.TemporaryDirectory(prefix="publicar_libreoffice_") as perfil:
                cmd = [
                    soffice_path,
                    f"-env:UserInstallation={Path(perfil).as_uri()}",
                    "--headless",
                    "--convert-to", "odt",
                    "--outdir", str(fichero.parent),
                    str(self.docx_path)
                ]
                print(f"  🔍 Ejecutando: {' '.join(cmd)}")
                result = subprocess.run(
                    cmd,
                    check=True,
                    capture_output=True,
                    text=True,
                    timeout=300,
                    env=entorno,
                )
            if result.stderr:
                aviso = result.stderr.strip()
                if "Could not find platform independent libraries" in aviso:
                    print(
                        "  [AVISO] LibreOffice no encontro su Python interno en "
                        f"{program_dir / 'python-core-*'}. La conversion puede "
                        "funcionar, pero conviene reparar la instalacion con: "
                        "winget install --force TheDocumentFoundation.LibreOffice"
                    )
                else:
                    print(f"  ⚠️ soffice stderr: {aviso}")

            # Verificar que se generó el ODT
            odt_generado = fichero.parent / f"{self.docx_path.stem}.odt"
            if odt_generado.exists():
                if odt_generado != fichero:
                    shutil.move(str(odt_generado), str(fichero))
                print(f"  ✅ ODT generado desde DOCX con soffice: {fichero.resolve()}")
            else:
                # Buscar cualquier .odt en la carpeta de salida (por si el nombre cambió)
                posibles = list(fichero.parent.glob("*.odt"))
                if posibles:
                    # Tomar el más reciente
                    ultimo = max(posibles, key=lambda p: p.stat().st_mtime)
                    if ultimo != fichero:
                        shutil.move(str(ultimo), str(fichero))
                    print(f"  ✅ ODT generado (renombrado) desde DOCX con soffice: {fichero.resolve()}")
                else:
                    raise FileNotFoundError(f"No se encontró el ODT generado en {fichero.parent}")

        except subprocess.CalledProcessError as e:
            print(f"  ❌ Error en soffice (código {e.returncode})")
            print(f"  stderr: {e.stderr}")
            raise RuntimeError(f"Error al convertir DOCX a ODT con soffice:\n{e.stderr}")
        except subprocess.TimeoutExpired as e:
            raise TimeoutError(
                f"LibreOffice superó el tiempo máximo al convertir a ODT: {self.docx_path}"
            ) from e
