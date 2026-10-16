@echo off
setlocal
if defined V_PYTHON (
  "%V_PYTHON%" "%~dp0gestor_v.py" %*
) else (
  python "%~dp0gestor_v.py" %*
)
exit /b %errorlevel%
