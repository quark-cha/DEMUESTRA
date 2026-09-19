@echo off
setlocal EnableDelayedExpansion

set "ELAN_HOME=C:\Users\vedq\.elan"
set "PATH=C:\Users\vedq\.elan\bin;%PATH%"

cd /d "%~dp0"

echo.
echo === Carpeta inicial ===
echo %CD%

set "PROJECT_DIR=%CD%"
set "LAKE_ROOT=%CD%"

:buscar_lake_root
if exist "%LAKE_ROOT%\lakefile.toml" goto lake_root_encontrado
if exist "%LAKE_ROOT%\lakefile.lean" goto lake_root_encontrado
for %%I in ("%LAKE_ROOT%\..") do set "PARENT=%%~fI"
if /I "%PARENT%"=="%LAKE_ROOT%" (
  echo No se encontro lakefile.toml ni lakefile.lean en esta carpeta ni en sus superiores.
  pause
  exit /b 1
)
set "LAKE_ROOT=%PARENT%"
goto buscar_lake_root

:lake_root_encontrado
echo.
echo === Raiz Lake ===
echo %LAKE_ROOT%

echo.
echo === Lean ===
lean --version
if errorlevel 1 (
  echo No se encontro Lean. Revisa la instalacion de elan en "%ELAN_HOME%".
  pause
  exit /b 1
)

echo.
echo === Preparando cache de Mathlib ===
echo Esto puede tardar. Si ya esta preparada, terminara mucho antes.
cd /d "%LAKE_ROOT%"
lake exe cache get
if errorlevel 1 (
  echo Error preparando la cache de Mathlib.
  pause
  exit /b 1
)

set "LEAN_FILE="
set "LEAN_MODULE="

if exist "%LAKE_ROOT%\Proyectos\Main.lean" (
  set "LEAN_FILE=%LAKE_ROOT%\Proyectos\Main.lean"
  set "LEAN_MODULE=Proyectos.Main"
)

if "%LEAN_FILE%"=="" (
  for %%I in ("%PROJECT_DIR%") do set "PROJECT_NAME=%%~nxI"
  if exist "%PROJECT_DIR%\%PROJECT_NAME%.lean" (
    set "LEAN_FILE=%PROJECT_DIR%\%PROJECT_NAME%.lean"
  )
)

if "%LEAN_FILE%"=="" (
  for %%F in ("%PROJECT_DIR%\*.lean") do (
    if /I not "%%~nxF"=="Main.lean" (
      if "%LEAN_FILE%"=="" set "LEAN_FILE=%%~fF"
    )
  )
)

if "%LEAN_FILE%"=="" (
  echo No se encontro ningun archivo .lean para comprobar.
  pause
  exit /b 1
)

echo.
echo === Comprobando %LEAN_FILE% ===
if not "%LEAN_MODULE%"=="" (
  lake build "%LEAN_MODULE%"
) else (
  lake env lean "%LEAN_FILE%"
)
if errorlevel 1 (
  echo Error al comprobar "%LEAN_FILE%".
  pause
  exit /b 1
)

echo.
echo === Resultado ===
if not "%LEAN_MODULE%"=="" (
  echo No he podido encontrar ningun error en las deducciones y el desarrollo matematico declarado en "%LEAN_MODULE%".
  echo.
  echo Evolucion deductiva/proyectos incluidos desde Proyectos\Main.lean:
  for /f "tokens=2 delims= " %%M in ('findstr /b /c:"import " "%LEAN_FILE%"') do (
    set "MODULE_PATH=%%M"
    set "MODULE_PATH=!MODULE_PATH:.=\!"
    echo   - !MODULE_PATH!.lean
  )
) else (
  echo No he podido encontrar ningun error en las deducciones y el desarrollo matematico declarado en "%LEAN_FILE%".
)
pause
