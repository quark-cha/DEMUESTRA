param(
  [Parameter(Mandatory = $true)]
  [string] $Nombre
)

$ErrorActionPreference = "Stop"
$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")
Set-Location $RepoRoot

$origen = Join-Path "Proyectos" $Nombre
$destino = Join-Path "YaEvaluado" $Nombre

if (-not (Test-Path $origen)) {
  throw "No existe el proyecto '$Nombre' en Proyectos."
}

if (Test-Path $destino) {
  throw "Ya existe '$Nombre' en YaEvaluado. Revisa antes de sobrescribir."
}

Move-Item -LiteralPath $origen -Destination $destino

Write-Host "Proyecto movido a YaEvaluado: $Nombre"
Write-Host "El proyecto ya no sera evaluado por defecto con VALIDAR.ps1."
Write-Host "Para incluir YaEvaluado en una comprobacion, usa: .\\PckDemuestra\\scripts\\VALIDAR.ps1 -IncluirYaEvaluado"
