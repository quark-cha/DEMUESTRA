# Investigacion del cambio de resultado del 46

Comprobacion: 8 de octubre de 2026.

## Aprobacion historica

La revision Git 5020154 contiene un informe del 19 de septiembre con
APROBADO, passed true, codigo 0 y resultado
HR46_RV6.all_nontrivial_zeros_on_half_RV6. El usuario tenia razon al
recordar esa aprobacion. Revisar solo actual y anterior era insuficiente.

El criterio del evaluador entonces era:

    aprobado = codigo == 0 and bool(archivos_lean)

APROBADO significaba que Lean compilo los archivos. El teorema incluia
explicitamente hCompat : TransversalCompatibilityForZeros IsZeroRim.
El propio Lean historico indicaba que ese puente debia justificarse
independientemente. La prueba aceptada es condicional, no una demostracion
incondicional del documento actual. Ambos hechos deben conservarse.

## Cambios localizados

La revision 66ad61b contiene un informe del 20 de septiembre con RECHAZADO
y codigo 1 para otro resultado: ES_46_RV6.derive_T_RIEMANN. Entre esas
revisiones hay 33 lineas de diferencia en el MD y 1103 de cambio en Lean.
Se incorpora P_RIM_S y cambia una dependencia de T_RIEMANN. No se dispone
en Git del log de errores para aislar la causa exacta de aquel codigo 1.

La revision 7c95626 conserva un informe del 28 de septiembre que ya dice
COMPILA; TRADUCCION COMPLETA; DEMOSTRACION NO CERTIFICADA, con 17 nodos
certificados parcialmente. Actual y anterior inmediato conservan ese
alcance. El cambio de etiqueta precede a las correcciones de octubre para
hashes, seleccion forzada y publicacion del 52.

Entre 5020154 y 7c95626 se retiro la preparacion de una formalizacion Lean
previa y se paso a la traduccion generada y auditada por nodos. El Lean
historico identificaba DEMUESTRA_RESULT; el generado actual declara
PROOF_COMPLETE FALSE y FORMALIZATION_STATUS PARTIAL. Cambiaron tanto el
artefacto como el criterio de aprobacion; sus etiquetas no son directamente
comparables como si midieran lo mismo.

## Evidencia recuperada

Se recuperan sin sustituir los archivos actuales el Lean, MD e informe
de 5020154 en Proyectos/ES_46_RV6/historial/5020154, junto al archivo TAR
exportado desde Git.

La comprobacion real lake env lean sobre ese Lean historico termina con
codigo 0. Reconoce el teorema y su parametro hCompat. Informa los axiomas
propext, Classical.choice y Quot.sound, no sorryAx para ese teorema.
La demostracion condicional antigua sigue compilando con la toolchain
actual. Se conserva con su fuente y alcance originales, sin atribuirla
automaticamente al MD posterior.

## Correccion Del Auditor

El auditor actual clasificaba todo passed false como ERROR_EVALUADOR,
incluso cuando compiled y execution_passed eran true. Se corrige para
cualquier proyecto: una compilacion correcta sin certificacion global
es CERTIFICACION_GLOBAL_PENDIENTE, no un fallo tecnico. Los errores
tecnicos documentados siguen separados y no se inventan aprobaciones.

Pasan 23 pruebas locales. No se modifican los MD, certificados ni informes
de evaluacion existentes; la clasificacion corregida se aplicara en la
siguiente auditoria. No se publica nada durante esta investigacion.
