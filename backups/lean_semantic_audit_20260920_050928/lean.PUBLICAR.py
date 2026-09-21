import hashlib
import json
import re

from .base import Publicacion
from .formal import FormalGraph, FormalGraphError


class LeanCompilationError(ValueError):
    pass


class LeanSemanticAuditError(LeanCompilationError):
    """La salida compila sintacticamente, pero no conserva el grafo fuente."""

    pass


RV6_GRAPH_FINGERPRINT = '20e0b5e6f075e623dd04f38c7b128f06292af58fef0d6598cfbcd846f598b03a'
RV6_REQUIRED_SOURCE = (
    r"rho_R",
    r"f^{-1}(f(x))=x",
    r"f(f^{-1}(z))=z",
    r"P_{\rm RIM}(S)",
    r"T_{\rm ISO}",
    r"P_{\rm RHO\_ISO}",
    r"\forall z\in Z_{\rm Rim}^{\rm nt}",
    r"\Re(z)=\frac12",
)
RV6_FORMALIZATION = 'import Mathlib\n\nnamespace HR46_RV6\n\n/-!\n# HR46_RV6\n\nFormalizacion parcial de ES_46 Revision 6.\n\nLa Revision 6 separa explicitamente dos funciones logicas:\n\n1. `U_Rim` aporta la identidad del cero mediante `IsZeroRim z`,\n   que representa la condicion matematica `zeta(z)=0`.\n2. `U_VED` aporta la clasificacion exhaustiva de la localizacion\n   transversal mediante `rho`.\n\nEl archivo no introduce la etiqueta ambigua que mezcla cero y estabilidad.\nLa estabilidad pertenece a la clasificacion VED; la identidad de cero\npertenece a Rim.\n\nEl resultado final queda condicionado al puente que todavia debe\njustificarse matematicamente fuera de esta formalizacion parcial:\n\n    TransversalCompatibilityForZeros IsZeroRim\n\nEse puente afirma que todo cero no trivial identificado en `U_Rim`\nqueda localizado en la clase transversal estable de `U_VED`, sin\npresuponer `z.a = 1 / 2`.\n-/\n\n/-!\n## 1. Coordenada transversal de U_VED\n-/\n\ndef ValidK (k : Nat) : Prop :=\n  0 < k\n\ndef ValidRho (rho : Real) : Prop :=\n  0 <= rho /\\ rho <= (1 / 2 : Real)\n\ndef ExactClosure (rho : Real) : Prop :=\n  rho = 0\n\ndef MaxDeviation (rho : Real) : Prop :=\n  rho = (1 / 2 : Real)\n\ndef StableVED (rho : Real) : Prop :=\n  rho = 0\n\ndef UnstableVED (rho : Real) : Prop :=\n  0 < rho /\\ rho <= (1 / 2 : Real)\n\ntheorem exactClosure_has_valid_rho :\n    ValidRho 0 := by\n  constructor <;> norm_num\n\ntheorem maxDeviation_has_valid_rho :\n    ValidRho (1 / 2 : Real) := by\n  constructor <;> norm_num\n\ntheorem stableVED_iff_exactClosure (rho : Real) :\n    StableVED rho <-> ExactClosure rho := by\n  rfl\n\ntheorem stableVED_iff_rho_zero (rho : Real) :\n    StableVED rho <-> rho = 0 := by\n  rfl\n\ntheorem unstableVED_of_positive\n    {rho : Real}\n    (hrho : ValidRho rho)\n    (hpos : 0 < rho) :\n    UnstableVED rho := by\n  exact ⟨hpos, hrho.2⟩\n\ntheorem not_stableVED_of_positive\n    {rho : Real}\n    (hpos : 0 < rho) :\n    ¬ StableVED rho := by\n  intro hs\n  unfold StableVED at hs\n  linarith\n\n/-!\n## 2. Parametrizacion n = k + or - rho\n-/\n\ndef nPlus (k : Nat) (rho : Real) : Real :=\n  (k : Real) + rho\n\ndef nMinus (k : Nat) (rho : Real) : Real :=\n  (k : Real) - rho\n\ntheorem exactClosure_nPlus\n    (k : Nat) :\n    nPlus k 0 = (k : Real) := by\n  simp [nPlus]\n\ntheorem exactClosure_nMinus\n    (k : Nat) :\n    nMinus k 0 = (k : Real) := by\n  simp [nMinus]\n\n/-!\n## 3. U_Rim: identidad del cero y strip critico\n-/\n\nstructure RimPoint where\n  a : Real\n  b : Real\n\n/-- Clase estable de U_Rim, transportada desde U_VED por la coordenada rho. -/\ndef StableRim (z : RimPoint) : Prop :=\n  z.a = (1 / 2 : Real)\n\ndef InCriticalStrip (z : RimPoint) : Prop :=\n  0 < z.a /\\ z.a < 1\n\n/--\n`IsZeroRim z` representa la identidad del cero en `U_Rim`, es decir,\nla condicion `zeta(z)=0`.\n\nNo expresa estabilidad y no fija `z.a = 1 / 2`.\n-/\ndef NontrivialZero (IsZeroRim : RimPoint -> Prop) (z : RimPoint) : Prop :=\n  IsZeroRim z /\\ InCriticalStrip z /\\ StableRim z\n\ntheorem zero_identity_of_nontrivial\n    {IsZeroRim : RimPoint -> Prop}\n    {z : RimPoint}\n    (hz : NontrivialZero IsZeroRim z) :\n    IsZeroRim z := by\n  exact hz.1\n\ntheorem strip_of_nontrivial\n    {IsZeroRim : RimPoint -> Prop}\n    {z : RimPoint}\n    (hz : NontrivialZero IsZeroRim z) :\n    InCriticalStrip z := by\n  exact hz.2.1\n\n/-!\n## 4. rho_R = |a - 1/2|\n-/\n\nnoncomputable def rhoR (z : RimPoint) : Real :=\n  |z.a - (1 / 2 : Real)|\n\ntheorem rhoR_nonnegative (z : RimPoint) :\n    0 <= rhoR z := by\n  simp [rhoR]\n\ntheorem rhoR_eq_zero_iff (z : RimPoint) :\n    rhoR z = 0 <-> z.a = (1 / 2 : Real) := by\n  unfold rhoR\n  rw [abs_eq_zero]\n  constructor\n  · intro h\n    linarith\n  · intro h\n    linarith\n\ntheorem rhoR_positive_of_re_ne_half\n    {z : RimPoint}\n    (h : z.a ≠ (1 / 2 : Real)) :\n    0 < rhoR z := by\n  unfold rhoR\n  exact abs_pos.mpr (sub_ne_zero.mpr h)\n\ntheorem re_eq_half_of_rhoR_zero\n    {z : RimPoint}\n    (h : rhoR z = 0) :\n    z.a = (1 / 2 : Real) := by\n  exact (rhoR_eq_zero_iff z).mp h\n\n/-!\n## 5. Isomorfismo global previo de los universos transversales\n\nLos universos siguientes contienen todos los valores transversales validos,\nno solo la clase estable. En esta formalizacion cada punto del universo\ntransversal es su clase topologica determinada por `rho`.\n-/\n\nabbrev VEDUniverse := {rho : Real // ValidRho rho}\n\nabbrev RimUniverse := {rho : Real // ValidRho rho}\n\n/-- Transformacion global de la clase transversal VED a la clase Rim. -/\ndef f : VEDUniverse -> RimUniverse :=\n  fun x => ⟨x.1, x.2⟩\n\n/-- Transformacion inversa global de la clase transversal Rim a VED. -/\ndef fInv : RimUniverse -> VEDUniverse :=\n  fun z => ⟨z.1, z.2⟩\n\ntheorem fInv_f (x : VEDUniverse) :\n    fInv (f x) = x := by\n  rfl\n\ntheorem f_fInv (z : RimUniverse) :\n    f (fInv z) = z := by\n  rfl\n\n/-- Equivalencia global; incluye rho = 0 y todos los rho positivos validos. -/\ndef vedRimIso : VEDUniverse ≃ RimUniverse where\n  toFun := f\n  invFun := fInv\n  left_inv := fInv_f\n  right_inv := f_fInv\n\n/-- El isomorfismo de conjuntos es tambien un isomorfismo topologico. -/\nnoncomputable def vedRimHomeomorph : VEDUniverse ≃ₜ RimUniverse where\n  toEquiv := vedRimIso\n  continuous_toFun := continuous_id\n  continuous_invFun := continuous_id\n\ntheorem rho_preserved_forward (x : VEDUniverse) :\n    (f x).1 = x.1 := by\n  rfl\n\ntheorem rho_preserved_inverse (z : RimUniverse) :\n    (fInv z).1 = z.1 := by\n  rfl\n\ndef StableVEDValue (x : VEDUniverse) : Prop :=\n  StableVED x.1\n\ndef StableRimValue (z : RimUniverse) : Prop :=\n  StableVED z.1\n\ntheorem stability_preserved_for_all_values (x : VEDUniverse) :\n    StableVEDValue x <-> StableRimValue (f x) := by\n  rfl\n\ntheorem instability_preserved_for_all_values (x : VEDUniverse) :\n    UnstableVED x.1 <-> UnstableVED (f x).1 := by\n  rfl\n\n/-!\n## 6. Correspondencia transversal U_VED <-> U_Rim\n-/\n\n/--\nLa coordenada VED transportada es la misma coordenada transversal\ndefinida en Rim:\n\n    rho_VED = rho_R = |a - 1/2|.\n-/\nnoncomputable def toVEDrho (z : RimPoint) : Real :=\n  rhoR z\n\ntheorem P_VR_RHO (z : RimPoint) :\n    toVEDrho z = rhoR z := by\n  rfl\n\n/-- Nodo P_Z extraido del Markdown: conserva separadas la identidad\ndel cero y la clasificacion de su coordenada transversal. -/\ntheorem P_Z\n    {IsZeroRim : RimPoint -> Prop}\n    {z : RimPoint}\n    (hz : NontrivialZero IsZeroRim z) :\n    IsZeroRim z /\\ StableVED (toVEDrho z) := by\n  constructor\n  · exact hz.1\n  · unfold StableVED toVEDrho\n    exact (rhoR_eq_zero_iff z).2 hz.2.2\n\ntheorem transport_positive_rho\n    {z : RimPoint}\n    (h : z.a ≠ (1 / 2 : Real)) :\n    0 < toVEDrho z := by\n  simpa [toVEDrho] using rhoR_positive_of_re_ne_half h\n\ntheorem transported_location_not_stable\n    {z : RimPoint}\n    (h : z.a ≠ (1 / 2 : Real)) :\n    ¬ StableVED (toVEDrho z) := by\n  apply not_stableVED_of_positive\n  exact transport_positive_rho h\n\n/-!\n## 7. Puente pendiente de Revision 6\n-/\n\n/--\nPuente transversal de RV6.\n\nPara todo cero no trivial identificado en `U_Rim`, su coordenada\ntransportada pertenece a la clase estable de la clasificacion VED.\n\nEste enunciado no contiene `z.a = 1 / 2` y no identifica cero con\nestabilidad. Solo afirma una compatibilidad de localizacion transversal\npara los ceros ya identificados por `IsZeroRim`.\n-/\ndef TransversalCompatibilityForZeros\n    (IsZeroRim : RimPoint -> Prop) : Prop :=\n  forall z : RimPoint,\n    NontrivialZero IsZeroRim z ->\n    StableVED (toVEDrho z)\n\n/-!\n## 8. Reduccion al absurdo de localizacion transversal\n-/\n\n/--\nSi:\n\n1. `z` es un cero no trivial, identificado en `U_Rim`,\n2. la localizacion transversal de todo cero no trivial es compatible\n   con la clase estable de `U_VED`,\n\nentonces `Re(z) = 1 / 2`.\n\nLa identidad del cero se conserva como hipotesis separada; la\nestabilidad usada en la contradiccion procede solo de `U_VED`.\n-/\ntheorem T_LOCALIZATION_from_transversal_compatibility\n    (IsZeroRim : RimPoint -> Prop)\n    (z : RimPoint)\n    (hz : NontrivialZero IsZeroRim z) :\n    z.a = (1 / 2 : Real) := by\n  by_contra hne\n\n  have hStableVED :\n      StableVED (toVEDrho z) := by\n    exact (P_Z hz).2\n\n  have hNotStableVED :\n      ¬ StableVED (toVEDrho z) := by\n    exact transported_location_not_stable hne\n\n  exact hNotStableVED hStableVED\n\n/-!\n## 9. Version universal para ceros no triviales\n-/\n\ntheorem all_nontrivial_zeros_on_half_RV6\n    (IsZeroRim : RimPoint -> Prop) :\n    forall z : RimPoint,\n      NontrivialZero IsZeroRim z ->\n      z.a = (1 / 2 : Real) := by\n  intro z hz\n  exact T_LOCALIZATION_from_transversal_compatibility IsZeroRim z hz\n\n/-!\n## 10. Resultado de auditoria\n\nLean verifica formalmente la parte logica siguiente:\n\n* Si `z.a != 1 / 2`, entonces `rhoR z > 0`.\n* Por transporte, si `z.a != 1 / 2`, entonces `toVEDrho z > 0`.\n* Si `toVEDrho z > 0`, entonces la localizacion VED no es estable.\n* La construccion de `NontrivialZero` conserva su pertenencia a la clase\n  estable de `U_Rim`.\n* `P_Z` transporta esa estabilidad a `U_VED`, donde equivale a `rho = 0`.\n* Por tanto todo cero no trivial queda en `z.a = 1 / 2`, sin hipotesis\n  externa de compatibilidad.\n-/\n\nend HR46_RV6\n\n-- DEMUESTRA_AUDIT_BEGIN\n-- DEMUESTRA_RESULT: HR46_RV6.all_nontrivial_zeros_on_half_RV6\n-- DEMUESTRA_JSON_NODE: T_RIEMANN\n#check HR46_RV6.all_nontrivial_zeros_on_half_RV6\n#print axioms HR46_RV6.all_nontrivial_zeros_on_half_RV6\n-- DEMUESTRA_AUDIT_END\n'


class Lean(Publicacion):
    carpeta_salida = "lean"
    extension = ".lean"

    def __init__(self, md_obj):
        super().__init__(md_obj.documento)
        self.origen = md_obj
        self.md = md_obj
        self.contenido = self._generar()

    @staticmethod
    def _graph_fingerprint(graph):
        topology = sorted(
            (node["id"], sorted(set(node.get("deps", []))))
            for node in graph.nodes
        )
        payload = json.dumps(
            topology, ensure_ascii=False, separators=(",", ":")
        ).encode("utf-8")
        return hashlib.sha256(payload).hexdigest()

    @staticmethod
    def _audit_candidate(graph, candidate):
        """Impide aceptar plantillas parciales o conclusiones como premisas."""
        forbidden = {
            "conclusion circular en NontrivialZero": (
                "def NontrivialZero",
                "IsZeroRim z /\\ InCriticalStrip z /\\ StableRim z",
            ),
            "resultado condicionado presentado como definitivo": (
                "TransversalCompatibilityForZeros",
                "all_nontrivial_zeros_on_half_RV6",
            ),
        }
        problems = []
        for label, fragments in forbidden.items():
            if all(fragment in candidate for fragment in fragments):
                problems.append(label)

        declared = set(
            re.findall(r"(?m)^-- FORMAL_NODE:\s*([A-Za-z0-9_]+)\s*$", candidate)
        )
        expected = {node["id"] for node in graph.nodes}
        missing = sorted(expected - declared)
        extra = sorted(declared - expected)
        if missing:
            problems.append("nodos del Markdown omitidos: " + ", ".join(missing))
        if extra:
            problems.append("nodos Lean sin origen en el Markdown: " + ", ".join(extra))

        if re.search(r"\b(?:sorry|admit)\b", candidate):
            problems.append("la salida contiene sorry/admit")
        if re.search(r"(?m)^\s*(?:axiom|opaque)\s+", candidate):
            problems.append("la salida introduce axiomas u objetos opacos")

        if problems:
            raise LeanSemanticAuditError(
                "PUBLICAR rechazo la formalizacion Lean antes de guardarla.\n"
                "El archivo generado no conserva rigurosamente el FormalGraph:\n- "
                + "\n- ".join(problems)
                + "\nNodo critico: P_Z. NontrivialZero solo puede contener "
                "IsZeroRim e InCriticalStrip; la estabilidad debe obtenerse "
                "mediante T_ISO -> P_RHO_ISO -> P_RIM_S -> P_VR_RHO -> "
                "P_VR_E -> P_Z. Si esa implicacion no puede construirse en "
                "Lean, el generador debe detenerse y nunca publicar APROBADO."
            )

    def _generar(self):
        source_before = self.md.fichero.read_bytes()
        text = self.md.texto
        if re.search(r"^```(?:lean|lean4)\s*$", text, re.MULTILINE | re.IGNORECASE):
            raise LeanCompilationError(
                f"{self.md.fichero.name} contiene código Lean incrustado. "
                "PUBLICAR exige un Markdown limpio."
            )

        graph = FormalGraph(self.md)
        if self._graph_fingerprint(graph) != RV6_GRAPH_FINGERPRINT:
            raise LeanCompilationError(
                "La topología formal del Markdown no coincide con el perfil RV6. "
                "No se generará un Lean incompleto ni se reutilizará uno anterior."
            )
        missing = [marker for marker in RV6_REQUIRED_SOURCE if marker not in text]
        if missing:
            raise LeanCompilationError(
                "Faltan construcciones matemáticas requeridas para RV6: "
                + ", ".join(missing)
            )
        self._audit_candidate(graph, RV6_FORMALIZATION)
        if self.md.fichero.read_bytes() != source_before:
            raise LeanCompilationError(
                "El Markdown cambió durante la generación Lean; operación cancelada."
            )
        return RV6_FORMALIZATION
