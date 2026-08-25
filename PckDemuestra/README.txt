DEMUESTRA/
├── Proyectos/                 ← Proyectos pendientes o en evaluacion
├── YaEvaluado/                ← Proyectos ya evaluados y archivados
├── logs/                      ← Logs generales del motor
└── PckDemuestra/              ← Biblioteca de demostracion/verificacion
    ├── __init__.py
    ├── config.py              ← Rutas base del sistema
    ├── logging.py             ← Logger compartido
    ├── proyecto.py            ← Modelo de proyecto evaluable
    ├── lean.py                ← Ejecucion de Lean/Lake
    ├── demuestra.py           ← Clase principal Demuestra
    ├── cli.py                 ← Interfaz de linea de comandos
    ├── Basic.lean             ← Modulo Lean comun
    ├── scripts/               ← Wrappers PowerShell
    └── docs/                  ← Documentacion tecnica y dependencias

Comandos principales:

python -m PckDemuestra.cli validar
python -m PckDemuestra.cli validar --proyecto ES_46_RV5
python -m PckDemuestra.cli nuevo ES_47_RV1
python -m PckDemuestra.cli finalizar ES_46_RV5

Si falta una dependencia, DEMUESTRA debe mostrar:

1. que herramienta falta,
2. como instalarla,
3. el comando para comprobarla.
