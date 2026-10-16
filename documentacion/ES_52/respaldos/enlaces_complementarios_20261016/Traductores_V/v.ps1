$ErrorActionPreference = 'Stop'
$python = if ($env:V_PYTHON) { $env:V_PYTHON } else { 'python' }
& $python (Join-Path $PSScriptRoot 'gestor_v.py') @args
exit $LASTEXITCODE
