import os
import sys
import re
import requests
from pathlib import Path

class ENV:
    def __init__(self, env_filename=None):
        # PUBLICAR puede ejecutarse desde su repositorio o desde la copia
        # versionada DEMUESTRA/vendor/PUBLICAR. En ambos casos las credenciales
        # permanecen fuera de la biblioteca, en la raiz SRC-VED o en una ruta
        # indicada expresamente por PUBLICAR_CONFIG_ROOT.
        raiz_configurada = os.getenv("PUBLICAR_CONFIG_ROOT")
        if raiz_configurada:
            self._base_dir = Path(raiz_configurada).expanduser().resolve()
        else:
            self._base_dir = Path(__file__).resolve().parent.parent.parent
            if self._base_dir.name.lower() == "vendor":
                self._base_dir = self._base_dir.parent.parent
        self._vars = {}
        self._loaded = False
        self._idioma = None
        self.licencia = None  # <--- AQUÍ SE GUARDARÁ LA LICENCIA AUTOMÁTICAMENTE

        # Si se pasa un nombre concreto, usarlo
        if env_filename:
            self._env_path = self._base_dir / env_filename
            self._idioma = self._detectar_idioma_desde_nombre(env_filename)
            print(f"🔍 Usando archivo especificado: {self._env_path} (idioma: {self._idioma})")
        else:
            # Buscar archivos .conf o .env que empiecen con dos letras (mayús/minús) + '_'
            patron = re.compile(r'^([A-Za-z]{2})_.*\.(conf|env)$')
            archivos = list(self._base_dir.glob('*.conf')) + list(self._base_dir.glob('*.env'))
            self._env_path = None
            for f in archivos:
                m = patron.match(f.name)
                if m:
                    self._idioma = m.group(1).lower()  # Siempre minúsculas
                    self._env_path = f
                    break

            # Si no se encontró, usar .env o .conf por defecto
            if self._env_path is None:
                posibles = [self._base_dir / ".env", self._base_dir / ".conf"]
                for p in posibles:
                    if p.exists():
                        self._env_path = p
                        break
                if self._env_path is None:
                    self._env_path = self._base_dir / ".env"
                self._idioma = 'es'  # Español por defecto
                print(f"🔍 Usando archivo por defecto: {self._env_path} (idioma: {self._idioma})")
            else:
                print(f"🔍 Archivo detectado: {self._env_path} (idioma: {self._idioma})")

        # 1. Cargar las variables del archivo
        self._ensure_env_exists()

        # 2. 🔥 NUEVO: Obtener la licencia automáticamente al cargar la clase
        self.licencia = self._obtener_licencia_auto()

    # ============================================================
    # MÉTODO INTERNO PARA OBTENER LICENCIA (se llama solo al iniciar)
    # ============================================================
    def _obtener_licencia_auto(self):
        """
        Llama a la URL con el idioma detectado y devuelve el texto.
        Si falla, devuelve None y muestra un aviso.
        """
        idioma = self._idioma or "es"
        url = "https://estradad.es/licencia.php"

        try:
            response = requests.get(
                url,
                params={
                    "idioma": idioma,
                    "formato": "md",
                },
                headers={
                    "User-Agent": (
                        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
                        "AppleWebKit/537.36 (KHTML, like Gecko) "
                        "Chrome/140.0.0.0 Safari/537.36"
                    ),
                    "Accept": "text/markdown,text/plain;q=0.9,*/*;q=0.8",
                    "Accept-Language": "es-ES,es;q=0.9,en;q=0.7",
                    "Referer": "https://estradad.es/",
                },
                timeout=10,
            )

            if response.status_code == 200:
                print(
                    f"✅ Licencia cargada correctamente "
                    f"para idioma '{idioma}'"
                )
                return response.text.strip()

            print(
                f"⚠️ La web devolvió error {response.status_code} "
                f"para idioma '{idioma}': {response.url}"
            )
            return None

        except requests.RequestException as e:
            print(f"⚠️ No se pudo conectar a la web de licencias: {e}")
            return None

    # ============================================================
    # MÉTODOS ORIGINALES (sin cambios)
    # ============================================================
    def _detectar_idioma_desde_nombre(self, nombre):
        match = re.match(r'^([A-Za-z]{2})_', nombre)
        return match.group(1).lower() if match else 'es'

    def _ensure_env_exists(self):
        if not self._env_path.exists():
            self._show_manual_instructions()
            respuesta = input("\n¿Deseas crearlo automáticamente ahora? (S/n): ").strip().lower()
            if respuesta in ('', 's', 'si', 'sí'):
                self._create_env_file()
            else:
                print("\n❌ No se puede continuar sin el archivo .env.")
                sys.exit(1)
        self._load_env_file()

    def _load_env_file(self):
        with open(self._env_path) as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith("#") and "=" in line:
                    key, value = line.split("=", 1)
                    self._vars[key.strip()] = value.strip()

    def require(self, *keys):
        missing = [k for k in keys if k not in self._vars]
        if missing:
            self._show_manual_update_instructions(missing)
            respuesta = input("\n¿Deseas añadirlas automáticamente ahora? (S/n): ").strip().lower()
            if respuesta in ('', 's', 'si', 'sí'):
                self._complete_env(missing)
                self._load_env_file()
                still_missing = [k for k in keys if k not in self._vars]
                if still_missing:
                    raise RuntimeError(f"No se pudieron añadir: {still_missing}")
            else:
                raise RuntimeError(f"No se puede continuar sin: {missing}")
        for key in keys:
            if key in self._vars:
                value = self._vars[key]
                setattr(self, key, value)
                os.environ[key] = value
        return True

    def _show_manual_instructions(self):
        print("\n" + "="*70)
        print("📁 No se encontró el archivo de configuración.")
        print("="*70)
        print(f"\nRuta esperada: {self._env_path}")
        print("\nPuedes crearlo manualmente ejecutando estos comandos:\n")
        if os.name == 'nt':
            print(f'  New-Item -Path "{self._env_path}" -Force')
            for var in ['ZENODO_TOKEN', 'FTP_USER', 'FTP_PASSWORD', 'FTP_HOST']:
                print(f'  "{var}=tu_valor" | Out-File -Append "{self._env_path}"')
        else:
            print(f'  touch {self._env_path}')
            for var in ['ZENODO_TOKEN', 'FTP_USER', 'FTP_PASSWORD', 'FTP_HOST']:
                print(f'  echo "{var}=tu_valor" >> {self._env_path}')
        print("="*70)

    def _show_manual_update_instructions(self, missing_vars):
        print("\n" + "="*70)
        print(f"⚠️  Faltan variables en {self._env_path}:")
        for var in missing_vars:
            print(f"   - {var}")
        print("\nPuedes añadirlas con estos comandos:\n")
        if os.name == 'nt':
            for var in missing_vars:
                print(f'  "{var}=tu_valor" | Out-File -Append "{self._env_path}"')
        else:
            for var in missing_vars:
                print(f'  echo "{var}=tu_valor" >> {self._env_path}')
        print("="*70)

    def _create_env_file(self):
        print("\n🔐 Configuración inicial del entorno")
        print("Introduce los siguientes datos (puedes pegar desde el portapapeles):\n")
        data = {}
        base_vars = ['ZENODO_TOKEN', 'FTP_USER', 'FTP_PASSWORD', 'FTP_HOST']
        for var in base_vars:
            value = input(f"{var}: ").strip()
            data[var] = value
        self._save_env(data)
        self._vars.update(data)
        print(f"\n✅ Archivo .env creado en {self._env_path}")

    def _complete_env(self, missing_vars):
        print("\n🔐 Completando configuración (puedes pegar los valores)")
        for var in missing_vars:
            value = input(f"{var}: ").strip()
            self._vars[var] = value
        self._save_env(self._vars)
        print(f"\n✅ Archivo .env actualizado en {self._env_path}")

    def _save_env(self, data):
        with open(self._env_path, 'w') as f:
            for key, value in data.items():
                if value:
                    f.write(f"{key}={value}\n")

    def get(self, key, default=None):
        return self._vars.get(key, default)

    def __getattr__(self, name):
        if name in self._vars:
            return self._vars[name]
        raise AttributeError(f"Variable '{name}' no encontrada. Usa env.require('{name}') para añadirla.")

    def __contains__(self, key):
        return key in self._vars

    def __repr__(self):
        return f"<ENV loaded={self._loaded}, vars={list(self._vars.keys())}>"

# ============================================================
# INSTANCIA GLOBAL (al importar esto, YA tiene la licencia cargada)
# ============================================================
env = ENV()
__all__ = ['ENV', 'env']
