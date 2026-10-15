import importlib
import importlib.util
from pathlib import Path
import sys
import re
from types import ModuleType

ROOT = Path(__file__).resolve().parents[1]
VENDOR = ROOT / "vendor" / "PUBLICAR" / "PackPublica"


def legacy_stability_source(text):
    """Frozen parsers predate mixed intervals; test the new prose separately."""
    # The mixed-coordinate stable-set definition has its own current regression tests.
    text = re.sub(r"\$D_\{\\mathcal E_\{\\rm VED\}\}\$.*?(?=\$P_\{\\rm VED\}\(K_E\)\$)",
                  "", text, count=1, flags=re.DOTALL)
    text = re.sub(r"Aquí \$\\rho\$ es la \*\*distancia mínima.*?\n\n", "", text, count=1, flags=re.DOTALL)
    return re.sub(
        r"## 6\.2\. Concepto primordial: estabilidad de la materia como onda cerrada\n.*?\nSi\n",
        "## 6.2. Estabilidad\n\nSi\n", text, count=1, flags=re.DOTALL,
    )


def normalize_legacy_distance(lines):
    """Allow only the intentional native-distance migration in frozen baselines."""
    old = "(ctx.dist_fn_2 ctx.n {x : ℕ | 0 < x})"
    new = "(Metric.infDist (ctx.n) (((fun distance_element : ℕ => (distance_element : ℝ)) '' ({x : ℕ | 0 < x}))))"
    return [line.replace(old, new) for line in lines]


def without_integer_closure(lines):
    """Keep historical snapshots strict outside the separately tested new proof."""
    result = []
    in_closure = False
    in_new_derivation = False
    for line in lines:
        if line.startswith("theorem stable_closure_iff_integer "):
            in_closure = True
        elif in_closure and not line.strip():
            in_closure = False
            continue
        if line.startswith(("theorem derive_P_VED_E_part_", "theorem derive_P_VED_I ")):
            in_new_derivation = True
        elif in_new_derivation and not line.strip():
            in_new_derivation = False
        if not in_closure and not in_new_derivation:
            result.append(line)
    return result


def load_vendor(name, overrides=None):
    if name in sys.modules:
        return sys.modules[name]
    package = ModuleType(name)
    package.__path__ = [str(VENDOR)]
    sys.modules[name] = package
    # El frontend aislado no necesita el logger ni guardar publicaciones.
    base = ModuleType(name + ".base")
    base.Publicacion = object
    sys.modules[base.__name__] = base
    if overrides:
        for module in ("formal_ast", "formal_semantic", "formal_symbols"):
            path = Path(overrides) / (module + ".py")
            spec = importlib.util.spec_from_file_location(name + "." + module, path)
            instance = importlib.util.module_from_spec(spec)
            sys.modules[spec.name] = instance
            spec.loader.exec_module(instance)
    for module in ("formal_ast", "formal_semantic", "formal_symbols", "lean"):
        setattr(package, module, importlib.import_module(name + "." + module))
    return package
