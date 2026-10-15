import os
import shutil
import subprocess
import platform

class KDP:
    r"""
    Clase que convierte un DOCX a PDF listo para KDP (6x11 pulgadas).
    Usa LibreOffice para generar el PDF y Ghostscript para redimensionar.

    Modo de uso:
        kdp = KDP(r"C:\ruta\a\mi_libro.docx")
    """

    def __init__(self, docx_path, target_size=(6, 9), output_dir='.\\KDP'):
        """
        Inicializa y ejecuta todo el proceso.

        :param docx_path: Ruta al archivo .docx de origen (debe existir).
        :param target_size: Tupla (ancho, alto) en pulgadas para el PDF final.
        :param output_dir: Carpeta donde se almacenarán los archivos (por defecto .\\KDP).
        """
        self.docx_path = os.path.abspath(docx_path)
        self.target_width, self.target_height = target_size
        self.output_dir = output_dir

        # --- VALIDACIONES INICIALES ---
        self._check_docx_exists()
        self._check_ghostscript()

        # --- PROCESO ---
        self._ensure_output_dir()
        self._copy_docx()
        self._convert_to_pdf()
        self._resize_pdf()
        self._show_success_message()

    def _check_docx_exists(self):
        """Verifica que el archivo DOCX exista. Si no, lanza un error con instrucciones."""
        if not os.path.isfile(self.docx_path):
            raise FileNotFoundError(
                f"\n❌ ERROR: No se encontró el archivo DOCX.\n"
                f"   Ruta proporcionada: {self.docx_path}\n\n"
                f"👉 Debes pasar un archivo .docx válido con su ruta completa.\n"
                f"   Ejemplo: KDP(r'C:\\Users\\TuUsuario\\Documentos\\mi_libro.docx')\n\n"
                f"   El objeto KDP producirá un PDF listo para KDP en la carpeta .\\KDP\n"
                f"   con el mismo nombre base y extensión .pdf.\n"
            )

    def _check_ghostscript(self):
        """Verifica si Ghostscript está instalado y accesible. Si no, da instrucciones."""
        # Determinar el comando según el sistema operativo
        if platform.system() == 'Windows':
            gs_cmd = 'gswin64c'  # o 'gswin32c' si es de 32 bits
        else:
            gs_cmd = 'gs'

        try:
            subprocess.run(
                [gs_cmd, '--version'],
                capture_output=True,
                check=True,
                timeout=30,
            )
            self.gs_cmd = gs_cmd
        except (subprocess.CalledProcessError, FileNotFoundError):
            # Si no está, lanzamos un error con instrucciones detalladas
            raise RuntimeError(
                f"\n⚠️  ¡Ghostscript no está instalado o no es accesible!\n"
                f"   Para que la clase KDP pueda redimensionar tu PDF a {self.target_width}x{self.target_height} pulgadas,\n"
                f"   necesitas tener Ghostscript en tu sistema. No te preocupes, es gratuito y fácil de instalar.\n\n"
                f"   --- INSTRUCCIONES DE INSTALACIÓN ---\n"
                f"   🔹 Si estás en WINDOWS:\n"
                f"       1. Ve a: https://ghostscript.com/download/gsdnld.html\n"
                f"       2. Descarga el instalador para tu arquitectura (generalmente 'gsXXXXw64.exe' para 64 bits).\n"
                f"       3. Ejecútalo y sigue los pasos del asistente.\n"
                f"       4. IMPORTANTE: Añade la carpeta de instalación (ej. C:\\Program Files\\gs\\gs10.03.1\\bin) al PATH:\n"
                f"          - Panel de Control > Sistema > Configuración avanzada > Variables de entorno.\n"
                f"          - Edita la variable 'Path' y añade la ruta.\n"
                f"       5. Verifica: abre una terminal y escribe 'gswin64c --version'.\n\n"
                f"   🔹 Si estás en WSL (Linux) o Linux nativo:\n"
                f"       Abre tu terminal y ejecuta:\n"
                f"           sudo apt update\n"
                f"           sudo apt install -y ghostscript ghostscript-fonts\n"
                f"       Luego verifica con: gs --version\n\n"
                f"   🔄 Una vez instalado, vuelve a ejecutar tu script (la clase lo detectará automáticamente).\n"
            )
        except subprocess.TimeoutExpired as e:
            raise TimeoutError("Ghostscript no respondió al comprobar la versión.") from e

    def _ensure_output_dir(self):
        """Crea la carpeta de salida si no existe."""
        if not os.path.exists(self.output_dir):
            os.makedirs(self.output_dir)

    def _copy_docx(self):
        """Copia el DOCX a la carpeta de salida si no está ya allí."""
        filename = os.path.basename(self.docx_path)
        self.docx_copy = os.path.join(self.output_dir, filename)

        if os.path.abspath(self.docx_path) != os.path.abspath(self.docx_copy):
            shutil.copy2(self.docx_path, self.docx_copy)
        else:
            self.docx_copy = self.docx_path  # ya está en la carpeta

        print(f"📄 DOCX copiado a: {self.docx_copy}")

    def _convert_to_pdf(self):
        """Convierte el DOCX copiado a PDF usando LibreOffice headless."""
        base = os.path.splitext(os.path.basename(self.docx_copy))[0]
        self.pdf_path = os.path.join(self.output_dir, base + '.pdf')

        print(f"🔄 Convirtiendo DOCX → PDF con LibreOffice...")

        cmd = [
            'soffice', '--headless', '--convert-to', 'pdf',
            '--outdir', self.output_dir, self.docx_copy
        ]

        try:
            subprocess.run(
                cmd,
                check=True,
                capture_output=True,
                text=True,
                timeout=300,
            )
        except subprocess.CalledProcessError as e:
            raise RuntimeError(f"❌ Error al convertir DOCX a PDF: {e.stderr}")
        except subprocess.TimeoutExpired as e:
            raise TimeoutError(
                f"LibreOffice superó el tiempo máximo al convertir DOCX a PDF: {self.docx_copy}"
            ) from e

        # Verificar que se haya generado el PDF
        generated = os.path.join(self.output_dir, base + '.pdf')
        if not os.path.exists(generated):
            raise FileNotFoundError(f"No se generó el PDF esperado: {generated}")

        # Si el PDF generado tiene otro nombre (por ejemplo, si ya existía uno), lo renombramos
        if generated != self.pdf_path:
            os.rename(generated, self.pdf_path)

        print(f"✅ PDF intermedio generado: {self.pdf_path}")

    def _resize_pdf(self):
        """Redimensiona el PDF al tamaño objetivo usando Ghostscript."""
        width_pt = int(self.target_width * 72)
        height_pt = int(self.target_height * 72)

        print(f"🔄 Redimensionando PDF a {self.target_width}x{self.target_height} pulgadas con Ghostscript...")

        temp_pdf = self.pdf_path + '.tmp'

        cmd = [
            self.gs_cmd, '-sDEVICE=pdfwrite',
            '-dPDFFitPage',
            '-dFIXEDMEDIA',
            f'-dDEVICEWIDTHPOINTS={width_pt}',
            f'-dDEVICEHEIGHTPOINTS={height_pt}',
            '-dCompatibilityLevel=1.4',
            '-dNOPAUSE', '-dBATCH',
            f'-sOutputFile={temp_pdf}',
            self.pdf_path
        ]

        try:
            subprocess.run(
                cmd,
                check=True,
                capture_output=True,
                text=True,
                timeout=300,
            )
        except subprocess.CalledProcessError as e:
            raise RuntimeError(f"❌ Error en Ghostscript: {e.stderr}")
        except subprocess.TimeoutExpired as e:
            raise TimeoutError(
                f"Ghostscript superó el tiempo máximo al redimensionar PDF: {self.pdf_path}"
            ) from e

        os.replace(temp_pdf, self.pdf_path)
        print(f"✅ PDF redimensionado guardado: {self.pdf_path}")

    def _show_success_message(self):
        """Muestra un mensaje final con la ubicación del PDF generado."""
        print(f"\n🎉 ¡PROCESO COMPLETADO CON ÉXITO!")
        print(f"📖 PDF listo para KDP: {self.pdf_path}")
        print(f"📏 Tamaño: {self.target_width} x {self.target_height} pulgadas")
        print(f"📂 Carpeta: {self.output_dir}\n")

    def get_pdf(self):
        """Devuelve la ruta al PDF final generado."""
        return self.pdf_path

