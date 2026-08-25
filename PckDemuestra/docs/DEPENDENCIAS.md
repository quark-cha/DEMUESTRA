# Dependencias de DEMUESTRA

## Python

El motor `PckDemuestra` usa Python y, por ahora, solo librerias estandar.

Comprueba Python:

```powershell
python --version
```

En Anaconda:

```powershell
conda --version
python --version
```

Si en el futuro se anaden dependencias Python, se instalaran con:

```powershell
pip install nombre_paquete
```

o con Anaconda:

```powershell
conda install nombre_paquete
```

## Lean 4 y Lake

Lean 4 no se instala con `pip`. Se instala con `elan`.

Instalacion en PowerShell:

```powershell
Invoke-WebRequest -Uri https://raw.githubusercontent.com/leanprover/elan/master/elan-init.ps1 -OutFile elan-init.ps1
powershell -ExecutionPolicy Bypass -File .\elan-init.ps1 -NoPrompt $true -DefaultToolchain stable
```

Si ya esta instalado pero Anaconda no encuentra `lean` o `lake`, anade `.elan\bin` al `PATH` de la terminal actual.

PowerShell:

```powershell
$env:PATH="$env:USERPROFILE\.elan\bin;$env:PATH"
```

Anaconda Prompt / CMD:

```cmd
set PATH=%USERPROFILE%\.elan\bin;%PATH%
```

Comprueba:

```powershell
lean --version
lake --version
```

## Mathlib

Desde la raiz de `DEMUESTRA`:

```powershell
lake exe cache get
lake build
```

Si aparece:

```text
curl exited with code 7
Reservoir lookup failed
could not materialize package
```

entonces Lean/Lake ya estan encontrados, pero falta conectividad hacia Reservoir/GitHub o hay un bloqueo de red/proxy/firewall.

Comprueba:

```powershell
curl https://reservoir.lean-lang.org
curl https://github.com
```

Y repite:

```powershell
lake update
lake exe cache get
lake build
```

Si falla la cache, repite:

```powershell
lake exe cache get
```

Despues ejecuta la validacion:

```powershell
python -m PckDemuestra.cli validar --proyecto ES_46_RV5
```
