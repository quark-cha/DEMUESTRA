param(
  [string] $Proyecto = "",
  [switch] $IncluirYaEvaluado,
  [switch] $PrepararCacheMathlib
)

$ErrorActionPreference = "Stop"
$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")
Set-Location $RepoRoot

if ($PrepararCacheMathlib) {
  Write-Host "Preparando cache de Mathlib en la raiz compartida..."
  lake exe cache get
}

function Invoke-ProyectoLean {
  param([string] $ProyectoPath)

  $leanRoot = Join-Path $ProyectoPath "lean"
  if (-not (Test-Path $leanRoot)) {
    return
  }

  $leanFiles = Get-ChildItem -Path $leanRoot -Filter "*.lean" -File -Recurse -ErrorAction SilentlyContinue |
    Sort-Object FullName

  foreach ($leanFile in $leanFiles) {
    $relativePath = Resolve-Path -LiteralPath $leanFile.FullName -Relative
    $relativePath = $relativePath.TrimStart(".", "\")
    Write-Host "Compilando $relativePath"
    lake env lean $relativePath
  }
}

if ($Proyecto -ne "") {
  $proyectoPath = Join-Path "Proyectos" $Proyecto
  if (-not (Test-Path $proyectoPath)) {
    $proyectoPath = Join-Path "YaEvaluado" $Proyecto
  }
  if (-not (Test-Path $proyectoPath)) {
    throw "No existe el proyecto '$Proyecto' en Proyectos ni en YaEvaluado."
  }
  Invoke-ProyectoLean $proyectoPath
} else {
  Get-ChildItem -Path "Proyectos" -Directory | Sort-Object FullName | ForEach-Object {
    Invoke-ProyectoLean $_.FullName
  }

  if ($IncluirYaEvaluado -and (Test-Path "YaEvaluado")) {
    Get-ChildItem -Path "YaEvaluado" -Directory | Sort-Object FullName | ForEach-Object {
      Invoke-ProyectoLean $_.FullName
    }
  }
}

Write-Host "Validacion terminada."
