from pathlib import Path
import shutil
import re
import sys

ROOT = Path(__file__).resolve().parent
TARGET = "demuestra.py"
BACKUP = TARGET.with_suffix(".py.bak")

if not TARGET.exists():
    print(f"ERROR: No existe {TARGET}")
    sys.exit(1)

text = TARGET.read_text(encoding="utf-8")

if "DEMUESTRA_GUARD_NO_LEAN" in text:
    print("El parche ya está aplicado.")
    sys.exit(0)

shutil.copy2(TARGET, BACKUP)
print(f"Backup: {BACKUP}")

m_def = re.search(r"(?m)^(?P<indent>[ \t]*)def\s+validar\s*\([^)]*\)\s*:\s*$", text)
if not m_def:
    print("ERROR: No se encontró def validar(...).")
    sys.exit(2)

func_indent = m_def.group("indent")
start = m_def.end()

m_next = re.search(rf"(?m)^(?:{re.escape(func_indent)}def\s+|{re.escape(func_indent)}class\s+)", text[start:])
end = start + m_next.start() if m_next else len(text)
func = text[start:end]

danger = re.search(
    r"(?m)^(?P<indent>[ \t]*)(?:cache\s*=\s*cache_mathlib\s*\(\s*self\.raiz\s*\)|resultado_build\s*=\s*build\s*\(\s*self\.raiz\s*\))",
    func
)

if not danger:
    print("ERROR: No se encontró cache_mathlib(self.raiz) ni build(self.raiz) dentro de validar().")
    sys.exit(3)

insert_at = start + danger.start()
indent = danger.group("indent")

guard_lines = [
    "",
    f"{indent}# DEMUESTRA_GUARD_NO_LEAN",
    f"{indent}# No ejecutar cache/build si el proyecto no contiene archivos Lean.",
    f"{indent}archivos_lean = sorted(self.raiz.rglob(\"*.lean\"))",
    f"{indent}if not archivos_lean:",
    f"{indent}    try:",
    f"{indent}        self.logger.warning(\"No hay archivos .lean para validar. Se omite cache/build.\")",
    f"{indent}    except Exception:",
    f"{indent}        print(\"No hay archivos .lean para validar. Se omite cache/build.\")",
    f"{indent}    return 0",
    ""
]
guard = "\n".join(guard_lines)

new_text = text[:insert_at] + guard + text[insert_at:]
TARGET.write_text(new_text, encoding="utf-8")

print(f"Parche aplicado correctamente a: {TARGET}")
print("Con 0 archivos .lean, validar() devolverá 0 sin ejecutar lake.")
print(f"Copia de seguridad: {BACKUP}")
