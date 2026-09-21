import os

def get_zenodo_token(sandbox=False):
    """Obtiene el token de Zenodo desde la variable de entorno."""
    var_name = "ZENODO_SANDBOX_TOKEN" if sandbox else "ZENODO_TOKEN"
    token = os.getenv(var_name)

    if token:
        return token

    # Si no existe, mostrar instrucciones claras y salir
    print(f"""
    ❌ Variable de entorno '{var_name}' no definida.

    Para obtener un token de Zenodo:

    1. Ve a https://zenodo.org/account/settings/applications/
       (o https://sandbox.zenodo.org/account/settings/applications/ si usas sandbox)

    2. Crea un nuevo token con estos permisos:
       - deposit:actions
       - deposit:files
       - deposit:write

    3. Copia el token generado.

    4. Define la variable de entorno en tu terminal ANTES de ejecutar este script:

       En Windows (CMD):
           set {var_name}=tu_token_aqui

       En Windows (PowerShell):
           $env:{var_name}="tu_token_aqui"

       En Linux / Mac:
           export {var_name}=tu_token_aqui

    5. Vuelve a ejecutar el script.

    ⚠️ No guardes el token en el código ni en ficheros. Solo en tu entorno.
    """)
    raise SystemExit(1)

