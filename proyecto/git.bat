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
set "REPO_DIR_NORM=%REPO_DIR:/=\%"
if "%REPO_DIR_NORM:~-1%"=="\" set "REPO_DIR_NORM=%REPO_DIR_NORM:~0,-1%"

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
echo [5] PRIMERA VEZ - crear repo local
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

:normalizar_top
set "TOP_NORM=%TOP:/=\%"
if "%TOP_NORM:~-1%"=="\" set "TOP_NORM=%TOP_NORM:~0,-1%"
exit /b 0

:repo_superior
cls
echo ERROR: Se detecta un repositorio Git superior real:
echo %TOP%
echo.
echo Este proyecto debe tener su propio repositorio:
echo %REPO_DIR%
echo.
echo QUE HACER SIN BORRAR ARCHIVOS:
echo.
echo 1. Ve a la carpeta superior detectada:
echo    cd /d "%TOP%"
echo.
echo 2. Comprueba que NO quieres que toda esa carpeta sea publica:
echo    git status
echo    git remote -v
echo.
echo 3. Si confirmas que esa carpeta superior no debe ser repo,
echo    desactiva su Git SIN borrar tus archivos:
echo    rename .git .git_DESACTIVADO_SRCVED
echo.
echo 4. Vuelve a este proyecto y usa [5] PRIMERA VEZ.
echo.
pause
exit /b 1

:checkgit
if not exist ".git" (
  echo ERROR: Este proyecto no tiene repo Git local.
  echo.
  echo Proyecto: %REPO_NAME%
  echo Carpeta : %REPO_DIR%
  echo.
  echo Usa la opcion [5] PRIMERA VEZ para crearlo.
  exit /b 1
)

set "TOP="
set "TOP_NORM="
for /f "delims=" %%r in ('git rev-parse --show-toplevel 2^>nul') do set "TOP=%%r"
if not "%TOP%"=="" call :normalizar_top

if not "%TOP_NORM%"=="" (
  if /i not "%TOP_NORM%"=="%REPO_DIR_NORM%" (
    call :repo_superior
    exit /b 1
  )
)
exit /b 0

:ensureexclude
if not exist ".git\info" exit /b 0
(
  echo # Reglas locales. No se suben a GitHub.
  echo .*
  echo **/.*
  echo .lake/
  echo **/.lake/
  echo __pycache__/
  echo **/__pycache__/
  echo *.pyc
  echo venv/
  echo env/
  echo .venv/
  echo mi_entorno_virtual/
  echo .vs/
  echo .vscode/
  echo *.zip
  echo *.7z
  echo *.rar
  echo *.log
  echo *.tmp
  echo logs/
  echo **/logs/
  echo bck/
  echo output/
  echo outputs/
  echo .ipynb_checkpoints/
) > .git\info\exclude
exit /b 0

:ver
cls
call :checkgit
if errorlevel 1 (
  pause
  goto menu
)
call :ensureexclude
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
call :ensureexclude

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
call :ensureexclude

echo ===== COMMIT LOCAL LIMPIO =====
echo.
echo Regla: no se anade nada que empiece por punto ni nada dentro de carpetas .*
echo.

echo [1] Limpiando staging anterior...
git reset

echo.
echo [2] Anadiendo archivos permitidos...
git add -A -- . ^
  ":(exclude).*" ^
  ":(exclude)**/.*" ^
  ":(exclude)**/.*/**" ^
  ":(exclude)*.zip" ^
  ":(exclude)*.7z" ^
  ":(exclude)*.rar" ^
  ":(exclude)logs/**" ^
  ":(exclude)**/logs/**" ^
  ":(exclude)output/**" ^
  ":(exclude)outputs/**" ^
  ":(exclude)bck/**" ^
  ":(exclude)**/__pycache__/**" ^
  ":(exclude)**/.lake/**" ^
  ":(exclude)mi_entorno_virtual/**" ^
  ":(exclude)venv/**" ^
  ":(exclude)env/**"

echo.
echo [3] Estado del commit:
git status --short
echo.
set /p msg=">>> Mensaje commit: "
if "%msg%"=="" set "msg=Actualizacion limpia"

echo.
echo [4] Creando commit local...
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
call :ensureexclude

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

git rev-parse --verify HEAD >nul 2>&1
if errorlevel 1 (
  echo ERROR: Todavia no hay ningun commit local.
  echo.
  echo Primero usa [3] COMMIT local limpio.
  echo Luego vuelve a [4] SUBIR a GitHub.
  pause
  goto menu
)

set "REMOTE_EXISTS=0"
git rev-parse --verify origin/%BRANCH% >nul 2>&1
if not errorlevel 1 set "REMOTE_EXISTS=1"

if "%REMOTE_EXISTS%"=="1" (
  git merge-base --is-ancestor origin/%BRANCH% HEAD >nul 2>&1
  if errorlevel 1 (
    echo GitHub ya contiene commits que no estan en tu local.
    echo.
    echo Si el remoto solo tiene README/LICENCIA inicial, puedes integrarlo.
    echo Si quieres que local sea la autoridad, puedes descartar remoto.
    echo No se hara nada automatico.
    echo.
    echo Decide:
    echo [1] CANCELAR
    echo [2] INTEGRAR remoto inicial en local
    echo [3] RECUPERAR remoto completo en local
    echo [4] DESCARTAR remoto y publicar mi local como autoridad
    echo.
    set /p remop=">>> Opcion [1-4]: "

    if "!remop!"=="1" goto menu

    if "!remop!"=="2" (
      git pull origin %BRANCH% --allow-unrelated-histories --no-rebase
      if errorlevel 1 (
        echo.
        echo ERROR: La integracion se detuvo. Revisa conflictos.
        pause
        goto menu
      )
    )

    if "!remop!"=="3" (
      git pull origin %BRANCH% --allow-unrelated-histories --no-rebase
      if errorlevel 1 (
        echo.
        echo ERROR: La recuperacion se detuvo. Revisa conflictos.
        pause
        goto menu
      )
    )

    if "!remop!"=="4" (
      echo.
      echo ATENCION: GitHub sera reemplazado por tu estado local.
      echo No se usa --force simple; se usa --force-with-lease.
      echo.
      set /p confForce="Escribe PUBLICAR LOCAL para confirmar: "
      if /i not "!confForce!"=="PUBLICAR LOCAL" goto menu
      git push --force-with-lease origin %BRANCH%
      if errorlevel 1 (
        echo.
        echo ERROR: No se pudo publicar local como autoridad.
        pause
        goto menu
      )
      echo.
      echo [OK] GitHub reemplazado por tu estado local.
      pause
      goto menu
    )
  )
)

echo.
set /p conf="Subir tus commits locales a GitHub? (si/no): "
if /i "%conf%" neq "si" goto menu

git push origin %BRANCH%
if errorlevel 1 (
  echo.
  echo ERROR: No se pudo subir. No se ha forzado nada.
  echo Revisa con: git status -sb
  pause
  goto menu
)

echo.
echo [OK] Subida completada.
pause
goto menu

:init
cls
set "TOP="
set "TOP_NORM="
for /f "delims=" %%r in ('git rev-parse --show-toplevel 2^>nul') do set "TOP=%%r"
if not "%TOP%"=="" call :normalizar_top

if exist ".git" (
  echo Este proyecto ya tiene repo Git local.
  echo No hace falta usar PRIMERA VEZ.
  pause
  goto menu
)

if not "%TOP_NORM%"=="" (
  if /i not "%TOP_NORM%"=="%REPO_DIR_NORM%" (
    call :repo_superior
    goto menu
  )
)

echo ===== PRIMERA VEZ - CREAR REPO LOCAL =====
echo.
echo Proyecto: %REPO_NAME%
echo Carpeta : %REPO_DIR%
echo.
echo AVISO:
echo Esto NO borra tus archivos locales.
echo Solo crea un repositorio Git dentro de este proyecto.
echo Despues podras conectarlo con tu remoto en GitHub.
echo.
set /p conf="Crear repositorio local para este proyecto? (si/no): "
if /i "%conf%" neq "si" goto menu

git init
git branch -M main
call :ensureexclude

echo.
echo [OK] Repo local creado.
echo Ahora usa [6] para configurar origin GitHub.
pause
goto menu

:origin
cls
call :checkgit
if errorlevel 1 (
  pause
  goto menu
)
call :ensureexclude

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
echo Proyecto detectado: %REPO_NAME%
echo Carpeta repo     : %REPO_DIR%
echo BAT esperado     : %REPO_NAME%\proyecto\git.bat
echo.
echo Reglas de seguridad:
echo - No modifica tu trabajo local al consultar GitHub.
echo - No hace reset --hard.
echo - No hace force push simple.
echo - No borra archivos.
echo - No anade carpetas ni archivos que empiecen por punto.
echo - No anade nada dentro de carpetas .*
echo - Subir a GitHub requiere confirmacion.
echo - Recuperar desde GitHub requiere confirmacion separada.
echo.
pause
goto menu
