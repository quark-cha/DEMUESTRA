import hashlib
import json
from pathlib import Path
from types import SimpleNamespace

from traductor_support import ROOT, load_vendor

source = ROOT / "Proyectos" / "ES_52" / "ES_52_Maquina_V_UNIHOLOG.md"
before = source.read_bytes()
backups = sorted((ROOT / "documentacion" / "ES_52" / "respaldos").glob("traductor_operadores_*"))
report = {"source_sha256": hashlib.sha256(before).hexdigest(),
          "document_verdict": "NO_EMITIDO", "diagnostic_scope": "TRANSLATOR_ONLY"}
for label, vendor in (
    ("before", load_vendor("_diagnostic_before", backups[-1])),
    ("before_indices", load_vendor("_diagnostic_before_indices",
                                    ROOT / "documentacion/ES_52/respaldos/traductor_indices_20261008")),
    ("after", load_vendor("_diagnostic_after")),
):
    frontend = object.__new__(vendor.lean.Lean)
    frontend.md = SimpleNamespace(texto=source.read_text(encoding="utf-8-sig"), fichero=source)
    graph, classified = frontend._frontend()
    symbols = vendor.formal_symbols.SymbolInference().infer(classified)
    semantic_errors = []
    formulas = [formula for node in classified for formula in node.source.formulas]
    for formula in formulas:
        try:
            vendor.formal_semantic.SemanticAnalyzer(symbols, formula.location).analyze(formula.ast)
        except vendor.formal_semantic.FormalSemanticError as error:
            semantic_errors.append({"location": formula.location,
                                    "formula": formula.source, "error": str(error)})
    result = {"formula_count": len(formulas), "semantic_errors": semantic_errors}
    try:
        frontend._generar()
        result["lean_emission"] = "OK"
        result["emission_blockers"] = []
    except vendor.lean.LeanCompilationError as error:
        result["lean_emission"] = "ERROR_HERRAMIENTA"
        result["emission_error"] = str(error)
        result["emission_blockers"] = [line for line in str(error).splitlines() if line.startswith("- ")]
    report[label] = result
    print(f"{label}: {len(formulas)} formulas; {len(semantic_errors)} diagnosticos de tipos; "
          f"{len(result['emission_blockers'])} bloqueos de emision")
assert source.read_bytes() == before
output = ROOT / "documentacion" / "ES_52" / "DIAGNOSTICO_TRADUCTOR_OPERADORES.json"
output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
print("Fuente cientifica intacta; no se emite veredicto sobre el documento.")
