param(
    [string]$Markdown,
    [string]$LeanOutput,
    [string]$PythonExe,
    [string]$LeanExe,
    [string]$SwiplExe
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ProjectDir = $PSScriptRoot
$ProjectName = Split-Path $ProjectDir -Leaf
$DemuestraRoot = [System.IO.Path]::GetFullPath((Join-Path $ProjectDir "..\.."))

if (-not $Markdown) {
    $Markdown = Join-Path $ProjectDir "$ProjectName.md"
}
if (-not $LeanOutput) {
    $LeanOutput = Join-Path $ProjectDir "$ProjectName.lean"
}

$Markdown = [System.IO.Path]::GetFullPath($Markdown)
$LeanOutput = [System.IO.Path]::GetFullPath($LeanOutput)
$Auditor = Join-Path $DemuestraRoot "PckDemuestra\audita_lean.pl"

foreach ($RequiredFile in @($Markdown, $Auditor)) {
    if (-not (Test-Path -LiteralPath $RequiredFile -PathType Leaf)) {
        throw "No existe el archivo requerido: $RequiredFile"
    }
}

function Find-Executable {
    param(
        [string]$Explicit,
        [string[]]$Candidates,
        [string]$CommandName
    )

    if ($Explicit) {
        if (Test-Path -LiteralPath $Explicit -PathType Leaf) {
            return [System.IO.Path]::GetFullPath($Explicit)
        }
        throw "No existe el ejecutable indicado: $Explicit"
    }

    foreach ($Candidate in $Candidates) {
        if ($Candidate -and (Test-Path -LiteralPath $Candidate -PathType Leaf)) {
            return [System.IO.Path]::GetFullPath($Candidate)
        }
    }

    $Command = Get-Command $CommandName -ErrorAction SilentlyContinue
    if ($Command) {
        return $Command.Source
    }
    throw "No se encontro $CommandName. Puede indicarlo mediante el parametro correspondiente."
}

$CondaPython = if ($env:CONDA_PREFIX) {
    Join-Path $env:CONDA_PREFIX "python.exe"
} else {
    $null
}
$PythonExe = Find-Executable $PythonExe @(
    $CondaPython,
    (Join-Path $env:USERPROFILE "anaconda3\python.exe")
) "python"
$InstalledLean = Get-ChildItem `
    -LiteralPath (Join-Path $env:USERPROFILE ".elan\toolchains") `
    -Filter "lean.exe" `
    -Recurse `
    -ErrorAction SilentlyContinue |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 1 -ExpandProperty FullName
$LeanExe = Find-Executable $LeanExe @($InstalledLean) "lean"
$SwiplExe = Find-Executable $SwiplExe @(
    "C:\Program Files\swipl\bin\swipl.exe",
    "C:\Program Files (x86)\swipl\bin\swipl.exe"
) "swipl"

$PythonCode = @'
import sys
from pathlib import Path

from vendor.PUBLICAR.PackPublica.documento import Documento
from vendor.PUBLICAR.PackPublica.lean import Lean
from vendor.PUBLICAR.PackPublica.md import Md

source = Path(sys.argv[1])
target = Path(sys.argv[2])
Lean(Md(Documento(source))).save(target)
'@

$PreviousPythonPath = $env:PYTHONPATH
$PreviousNoBytecode = $env:PYTHONDONTWRITEBYTECODE
$PreviousLeanPath = $env:LEAN_PATH

try {
    $env:PYTHONPATH = $DemuestraRoot
    $env:PYTHONDONTWRITEBYTECODE = "1"

    $LeanLibraries = @(
        (Join-Path $DemuestraRoot ".lake\build\lib\lean")
    )
    $PackageRoot = Join-Path $DemuestraRoot ".lake\packages"
    if (Test-Path -LiteralPath $PackageRoot -PathType Container) {
        $LeanLibraries += Get-ChildItem -LiteralPath $PackageRoot -Directory |
            ForEach-Object { Join-Path $_.FullName ".lake\build\lib\lean" }
    }
    $LeanLibraries = @(
        $LeanLibraries |
        Where-Object { Test-Path -LiteralPath $_ -PathType Container }
    )
    $env:LEAN_PATH = $LeanLibraries -join [System.IO.Path]::PathSeparator

    Write-Host "[1/3] Generando Lean desde: $Markdown"
    & $PythonExe -c $PythonCode $Markdown $LeanOutput
    if ($LASTEXITCODE -ne 0) {
        throw "La traduccion Markdown-a-Lean fallo con codigo $LASTEXITCODE."
    }

    Write-Host "[2/3] Compilando Lean: $LeanOutput"
    & $LeanExe $LeanOutput
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[3/3] Clasificando el fallo de la traduccion con Prolog"
        & $SwiplExe -q -s $Auditor -- --lean-failed $LeanOutput
        $AuditExit = $LASTEXITCODE
        exit $AuditExit
    }

    Write-Host "[3/3] Auditando la traduccion con Prolog"
    & $SwiplExe -q -s $Auditor -- --skip-lean $LeanOutput
    $AuditExit = $LASTEXITCODE
    if ($AuditExit -ne 0) {
        throw "La auditoria detecto un fallo con codigo $AuditExit."
    }

    Write-Host "PRUEBA COMPLETA: Markdown traducido, Lean compilado y traduccion auditada."
} finally {
    $env:PYTHONPATH = $PreviousPythonPath
    $env:PYTHONDONTWRITEBYTECODE = $PreviousNoBytecode
    $env:LEAN_PATH = $PreviousLeanPath
}
