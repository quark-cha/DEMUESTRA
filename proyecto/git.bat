@echo off
chcp 65001 >nul 2>&1
setlocal enabledelayedexpansion

REM ============================================================
REM GIT.BAT GENERICO PARA PROYECTOS SRC-VED
REM Ubicacion esperada:
REM   NOMBRE_PROYECTO\proyecto\git.bat
REM ============================================================

set "SCRIPT_DIR=%~dp0"
for %%A in ("%SCRIPT_DIR%..") do set "REPO_DIR=%%~fA"
for %%A in ("%REPO_DIR%") do set "REPO_NAME=%%~nxA"

cd /d "%REPO_DIR%"

title GESTOR GIT - %REPO_NAME%
color 0A

:menu
cls
echo ============================================
echo        GIT LIMPIO - %REPO_NAME%
echo ============================================
echo.
echo Carpeta detectada:
echo %REPO_DIR%
echo.
echo [1] VER estado
echo [2] CONSULTAR GitHub
echo [3] COMMIT local limpio
echo [4] SUBIR a GitHub
echo [5] INICIALIZAR repo local
echo [6] CONFIGURAR origin GitHub
echo [7] INFO
echo [8] SALIR
echo.
set /p op=">>> Opcion [1-8]: "

if "%op%"=="1" goto ver
if "%op%"=="2" goto fetch
if "%op%"=="3" goto commit
if "%op%"=="4" goto push
if "%op%"=="5" goto init
if "%op%"=="6" goto origin
if "%op%"=="7" goto info
if "%op%"=="8" exit /b 0
goto menu

:checkgit
if not exist ".git" (
  echo ERROR: Este proyecto no tiene repo Git local.
  echo.
  echo Proyecto: %REPO_NAME%
  echo Carpeta : %REPO_DIR%
  echo.
  echo Usa la opcion [5] para inicializarlo.
  exit /b 1
)
exit /b 0

:ver
cls
call :checkgit
if errorlevel 1 (
  pause
  goto menu
)
git status -sb
echo.
git remote -v
echo.
pause
goto menu

:fetch
cls
call :checkgit
if errorlevel 1 (
  pause
  goto menu
)

echo ===== CONSULTAR GITHUB =====
echo.
echo Esto solo consulta GitHub. No modifica tus archivos locales.
echo.

git remote get-url origin >nul 2>&1
if errorlevel 1 (
  echo ERROR: No hay remoto origin configurado.
  echo Usa la opcion [6].
  pause
  goto menu
)

git fetch origin
if errorlevel 1 (
  echo.
  echo ERROR: No se pudo consultar GitHub.
  pause
  goto menu
)

echo.
echo Estado local/remoto:
git status -sb
echo.
echo Si aparece [behind], GitHub tiene cambios que tu no tienes.
echo Si aparece [ahead], tu tienes commits locales sin subir.
echo Si aparece [ahead/behind], hay divergencia y debes revisar manualmente.
echo.
pause
goto menu

:commit
cls
call :checkgit
if errorlevel 1 (
  pause
  goto menu
)

echo ===== COMMIT LOCAL LIMPIO =====
echo.
echo Regla: no se anade nada que empiece por punto ni nada dentro de carpetas .*
echo.

echo [1] Limpiando staging anterior...
git reset

echo.
echo [2] Asegurando .gitignore basico...
if not exist ".gitignore" (
  (
    echo # CARPETAS OCULTAS / CACHE
    echo .*
    echo **/.*
    echo.
    echo # LEAN / LAKE
    echo .lake/
    echo **/.lake/
    echo.
    echo # PYTHON
    echo __pycache__/
    echo **/__pycache__/
    echo *.pyc
    echo.
    echo # ENTORNOS
    echo venv/
    echo env/
    echo .venv/
    echo mi_entorno_virtual/
    echo.
    echo # IDE
    echo .vs/
    echo .vscode/
    echo.
    echo # PESADOS / TEMP
    echo *.zip
    echo *.7z
    echo *.rar
    echo *.log
    echo *.tmp
    echo bck/
    echo output/
    echo outputs/
    echo .ipynb_checkpoints/
  ) > .gitignore
)

echo.
echo [3] Anadiendo archivos permitidos...
git add -A -- . ^
  ":(exclude).*" ^
  ":(exclude)**/.*" ^
  ":(exclude)**/.*/**"

echo.
echo [4] Estado del commit:
git status --short
echo.
set /p msg=">>> Mensaje commit: "
if "%msg%"=="" set "msg=Actualizacion limpia"

echo.
echo [5] Creando commit local...
git commit -m "%msg%"
if errorlevel 1 (
  echo.
  echo No se creo commit. Puede que no haya cambios.
  pause
  goto menu
)

echo.
echo [OK] Commit local creado. Usa [4] para subirlo a GitHub.
pause
goto menu

:push
cls
call :checkgit
if errorlevel 1 (
  pause
  goto menu
)

git remote get-url origin >nul 2>&1
if errorlevel 1 (
  echo ERROR: No hay remoto origin configurado.
  echo Usa la opcion [6].
  pause
  goto menu
)

for /f "delims=" %%b in ('git branch --show-current') do set "BRANCH=%%b"
if "%BRANCH%"=="" set "BRANCH=main"

echo ===== SUBIR A GITHUB =====
echo.
echo Proyecto: %REPO_NAME%
echo Rama    : %BRANCH%
echo.
echo Primero se consultara GitHub sin modificar local.
echo.
git fetch origin
if errorlevel 1 (
  echo ERROR: No se pudo consultar GitHub.
  pause
  goto menu
)

echo.
git status -sb
echo.

set /p conf="Subir tus commits locales a GitHub? (si/no): "
if /i "%conf%" neq "si" goto menu

git push origin %BRANCH%
if errorlevel 1 (
  echo.
  echo ERROR: No se pudo subir.
  echo Puede faltar crear la rama remota o existir divergencia.
  echo Revisa con git status -sb.
  pause
  goto menu
)

echo.
echo [OK] Subida completada.
pause
goto menu

:init
cls
if exist ".git" (
  echo Este proyecto ya tiene repo Git local.
  pause
  goto menu
)

echo ===== INICIALIZAR REPO LOCAL =====
echo.
echo Proyecto: %REPO_NAME%
echo Carpeta : %REPO_DIR%
echo.
set /p conf="Inicializar Git aqui? (si/no): "
if /i "%conf%" neq "si" goto menu

git init
git branch -M main

echo.
echo [OK] Repo local inicializado.
echo Ahora usa [6] para configurar origin.
pause
goto menu

:origin
cls
call :checkgit
if errorlevel 1 (
  pause
  goto menu
)

set "DEFAULT_REMOTE=https://github.com/quark-cha/%REPO_NAME%.git"

echo ===== CONFIGURAR ORIGIN =====
echo.
echo Remoto sugerido:
echo %DEFAULT_REMOTE%
echo.
set /p remote="URL origin [Enter = sugerido]: "
if "%remote%"=="" set "remote=%DEFAULT_REMOTE%"

git remote get-url origin >nul 2>&1
if errorlevel 1 (
  git remote add origin "%remote%"
) else (
  git remote set-url origin "%remote%"
)

echo.
echo Origin actual:
git remote -v
echo.
pause
goto menu

:info
cls
echo ===== INFO =====
echo Proyecto detectado:
echo %REPO_NAME%
echo.
echo Carpeta repo:
echo %REPO_DIR%
echo.
echo Ubicacion esperada del BAT:
echo %REPO_NAME%\proyecto\git.bat
echo.
echo Reglas de seguridad:
echo - No modifica tu trabajo local al consultar GitHub.
echo - No hace reset --hard.
echo - No borra archivos.
echo - No anade carpetas ni archivos que empiecen por punto.
echo - No anade nada dentro de carpetas .*
echo - Subir a GitHub requiere confirmacion.
echo.
pause
echo QUE HACER:
echo.
echo 1. Ve a la carpeta superior detectada:
echo    cd /d "%TOP%"
echo.
echo 2. Comprueba que NO quieres que toda esa carpeta sea publica:
echo    git status
echo    git remote -v
echo.
echo 3. Si confirma que SRC-VED no debe ser repo, desactivalo SIN borrar archivos:
echo    rename .git .git_DESACTIVADO_SRCVED
echo.
echo 4. Luego vuelve al proyecto:
echo    cd /d "%REPO_DIR%"
echo.
echo 5. Usa [5] PRIMERA VEZ para crear el repo solo dentro de este proyecto.
pause
goto menu