# Auditoria final — ES_46_RV6

## Veredicto

**CERRADO**

Objetivo: `T_RIEMANN`

Esta auditoria comprueba la trazabilidad tecnica entre MD, JSON, Lean y Prolog. La
aceptacion o adopcion por la comunidad cientifica no es una premisa de verdad y no
forma parte del veredicto.

## Comprobaciones

- PASS `objetivo_existe`
- PASS `dependencias_resueltas`
- PASS `sin_ciclos`
- PASS `lean_aprobado`
- PASS `prolog_aprobado`
- PASS `nodo_lean_coincide`
- PASS `dependencias_lean_internalizadas`
- PASS `sin_pendientes_ya_demostrados`

## Raices utilizadas

- `A_L`
- `D_L`
- `D_U`
- `D_f`
- `D_fInv`
- `D_k`
- `D_lambda`
- `D_rho`
- `D_rho_R`
- `D_t_prime`

## Dependencias declaradas como parametros en Lean

- Ninguna

Si una propiedad ya esta demostrada en el proyecto, su presencia aqui indica que
el generador debe enlazar el teorema correspondiente en vez de volver a pedirla
como parametro. No convierte por si misma el resultado cientifico en condicional.

## Pendientes contradichos por antecedentes demostrados

- Ninguno

Todo elemento de esta lista es un error de construccion: debe reutilizar sus
antecedentes demostrados antes de poder publicarse como pendiente.

## Axiomas informados por Lean

propext, Classical.choice, Quot.sound
