param(
    [string]$SwiplExe = "C:\Program Files\swipl\bin\swipl.exe"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$Root = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot "..\.."))
$Auditor = Join-Path $Root "PckDemuestra\audita_lean.pl"
$Fixtures = Join-Path $Root "PckDemuestra\tests\lean_auditor"

if (-not (Test-Path -LiteralPath $SwiplExe -PathType Leaf)) {
    throw "No existe SWI-Prolog en: $SwiplExe"
}

function Invoke-Audit {
    param(
        [string]$Fixture,
        [int]$ExpectedExit,
        [string]$ExpectedStatus,
        [string[]]$ExpectedText = @(),
        [string[]]$ForbiddenText = @()
    )

    $Path = Join-Path $Fixtures $Fixture
    $Output = & $SwiplExe -q -s $Auditor -- --skip-lean $Path 2>&1
    $Exit = $LASTEXITCODE
    $Text = ($Output | Out-String)

    if ($Exit -ne $ExpectedExit) {
        throw "$Fixture devolvio codigo $Exit; se esperaba $ExpectedExit.`n$Text"
    }
    if ($Text -notmatch "RESULTADO AUDITOR LEAN: $ExpectedStatus") {
        throw "$Fixture no produjo estado $ExpectedStatus.`n$Text"
    }
    foreach ($Needle in $ExpectedText) {
        if ($Text -notmatch [regex]::Escape($Needle)) {
            throw "$Fixture no contiene '$Needle'.`n$Text"
        }
    }
    foreach ($Needle in $ForbiddenText) {
        if ($Text -match [regex]::Escape($Needle)) {
            throw "$Fixture contiene texto prohibido '$Needle'.`n$Text"
        }
    }
}

Invoke-Audit `
    -Fixture "neutral_comments.lean" `
    -ExpectedExit 0 `
    -ExpectedStatus "CERTIFICADO" `
    -ForbiddenText @("NO_DECIDIBLE", "ProseOnly")

Invoke-Audit `
    -Fixture "formal_opaque_detected.lean" `
    -ExpectedExit 40 `
    -ExpectedStatus "ERROR_PROPIO_DEL_AUDITOR" `
    -ExpectedText @("PREDICADO_OPACO_INTRODUCIDO")

Write-Host "Regresiones audita_lean.pl: OK"
