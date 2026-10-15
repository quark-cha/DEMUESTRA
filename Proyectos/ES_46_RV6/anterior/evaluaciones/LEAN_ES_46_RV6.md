# Evaluacion Lean - ES_46_RV6

## Veredicto

**COMPILA; FORMALIZACION AUTOMATICA INCOMPLETA; DEMOSTRACION NO CERTIFICADA**

Fecha UTC: `2026-10-10T14:18:29+00:00`
Codigo de salida: `0`
Compilacion integral Lean: **CORRECTA**
Cobertura de traduccion validada: **COMPLETA**
Cobertura declarada por el generador: **COMPLETA**
Salida completa: `logs\LEAN_ES_46_RV6.log`
Diagnostico: Lean comprobo la sintaxis y los tipos de la traduccion generada. La compilacion no demuestra por si sola el teorema.
Accion: Consultar las obligaciones deductivas Lean no certificadas; no interpretar la compilacion como prueba ni refutacion.
Estado matematico: **NO DETERMINADO**. Un fallo de traduccion o de prueba no es una contradiccion del Markdown.

## Archivos Lean evaluados

- `ES_46_RV6.lean`
- `anterior\ES_46_RV6.lean`
- `historial\5020154\ES_46_RV6.lean`

## Teorema resultado

No identificado.

Construccion validada completa: **si**
Construccion declarada completa por el generador: **si**
Demostracion validada completa: **no**

## Certificacion parcial del kernel

**CERTIFICADO PARCIAL POR EL KERNEL DE LEAN**

- `P_COORD` como `ES_46_RV6.derive_P_COORD`; hipotesis: `h_D_U`
- `P_VED_Inv` como `ES_46_RV6.derive_P_VED_Inv`; hipotesis: `h_D_L`, `h_D_R_VED`, `h_D_lambda`
- `T_ISO` como `ES_46_RV6.derive_T_ISO`; hipotesis: `h_D_f`, `h_D_fInv`
- `P_ST` como `ES_46_RV6.derive_P_ST`; hipotesis: `h_A_L`, `h_D_t_prime`, `h_P_COORD`
- `P_VED_E` como `ES_46_RV6.derive_P_VED_E`; hipotesis: `h_D_L`, `h_D_k`, `h_D_lambda`, `h_D_rho`, `h_P_VED_Inv`
- `P_RHO_ISO` como `ES_46_RV6.derive_P_RHO_ISO`; hipotesis: `h_D_f`, `h_T_ISO`
- `P_v` como `ES_46_RV6.derive_P_v`; hipotesis: `h_A_L`, `h_D_t_prime`, `h_P_ST`
- `P_ST_2` como `ES_46_RV6.derive_P_ST_2`; hipotesis: `h_A_L`, `h_P_ST`
- `P_VED_I` como `ES_46_RV6.derive_P_VED_I`; hipotesis: `h_D_k`, `h_D_rho`, `h_P_VED_E`
- `P_VED_E_2` como `ES_46_RV6.derive_P_VED_E_2`; hipotesis: `h_D_rho`, `h_P_VED_E`
- `P_RIM_S` como `ES_46_RV6.derive_P_RIM_S`; hipotesis: `h_D_f`, `h_P_RHO_ISO`, `h_T_ISO`
- `P_a` como `ES_46_RV6.derive_P_a`; hipotesis: `h_A_L`, `h_P_ST`, `h_P_v`
- `P_VED_K_E` como `ES_46_RV6.derive_P_VED_K_E`; hipotesis: `h_D_mathcal_E_VED`, `h_D_rho`, `h_P_VED_E`, `h_P_VED_I`
- `P_VR_E` como `ES_46_RV6.derive_P_VR_E`; hipotesis: `h_P_VED_E`, `h_P_VR_rho`
- `P_Z` como `ES_46_RV6.derive_P_Z`; hipotesis: `h_D_Rim`, `h_P_VR_rho`
- `P_VED_R_C` como `ES_46_RV6.derive_P_VED_R_C`; hipotesis: `h_D_Particion`, `h_D_rho`, `h_P_VED_K_E`
- `P_VS` como `ES_46_RV6.derive_P_VS`; hipotesis: `h_A_7`, `h_P_VED_Completo`, `h_P_VED_R_C`
- `P_F1` como `ES_46_RV6.derive_P_F1`; hipotesis: `h_A_L`, `h_P_F`, `h_P_ST_2`, `h_P_VS`
- `P_F3` como `ES_46_RV6.derive_P_F3`; hipotesis: `h_P_F1`, `h_P_F2`, `h_P_W`
- `P_F3_2` como `ES_46_RV6.derive_P_F3_2`; hipotesis: `h_P_F3`
- `P_Lap_Z` como `ES_46_RV6.derive_P_Lap_Z`; hipotesis: `h_D_Lap`, `h_P_F2`, `h_P_F3`
- `P_Lap_Z_2` como `ES_46_RV6.derive_P_Lap_Z_2`; hipotesis: `h_D_Lap`, `h_P_Lap_Z`

**Nodos no determinados**

- `P_VR_rho`
- `T_RIEMANN`
- `P_F`
- `P_W`
- `P_F2`

Los resultados positivos se conservan aunque fallen otras declaraciones. No certifican todavia el objetivo global.

## Aseveraciones

- `D_U`: construccion **COMPLETA**; demostracion **NO APLICA**
- `D_t_prime`: construccion **COMPLETA**; demostracion **NO APLICA**
- `A_L`: construccion **COMPLETA**; demostracion **NO APLICA**
- `D_lambda`: construccion **COMPLETA**; demostracion **NO APLICA**
- `D_L`: construccion **COMPLETA**; demostracion **NO APLICA**
- `D_R_VED`: construccion **COMPLETA**; demostracion **NO APLICA**
- `D_k`: construccion **COMPLETA**; demostracion **NO APLICA**
- `D_rho`: construccion **COMPLETA**; demostracion **NO APLICA**
- `D_mathcal_E_VED`: construccion **COMPLETA**; demostracion **NO APLICA**
- `D_Particion`: construccion **COMPLETA**; demostracion **NO APLICA**
- `A_7`: construccion **COMPLETA**; demostracion **NO APLICA**
- `D_Rim`: construccion **COMPLETA**; demostracion **NO APLICA**
- `D_rho_R`: construccion **COMPLETA**; demostracion **NO APLICA**
- `D_f`: construccion **COMPLETA**; demostracion **NO APLICA**
- `D_fInv`: construccion **COMPLETA**; demostracion **NO APLICA**
- `P_COORD`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_VED_Inv`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `T_ISO`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_ST`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_VED_E`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_RHO_ISO`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_v`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_ST_2`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_VED_I`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_VED_E_2`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_RIM_S`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_a`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_VED_K_E`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_VR_rho`: construccion **COMPLETA**; demostracion **NO DETERMINADA**
- `P_VED_K_I`: construccion **DOCUMENTAL**; demostracion **NO APLICA**
- `P_VED_K_E_2`: construccion **DOCUMENTAL**; demostracion **NO APLICA**
- `P_VR_E`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_Z`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_VED_R_C`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `T_RIEMANN`: construccion **COMPLETA**; demostracion **NO DETERMINADA**
- `P_VED_Completo`: construccion **COMPLETA**; demostracion **VERIFICADA**
- `P_VS`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_VED_Completo_2`: construccion **DOCUMENTAL**; demostracion **NO APLICA**
- `P_F`: construccion **COMPLETA**; demostracion **NO DETERMINADA**
- `P_F1`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_W`: construccion **COMPLETA**; demostracion **NO DETERMINADA**
- `P_F2`: construccion **COMPLETA**; demostracion **NO DETERMINADA**
- `P_F3`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `D_Lap`: construccion **COMPLETA**; demostracion **NO APLICA**
- `P_F3_2`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_Lap_Z`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**
- `P_Lap_Z_2`: construccion **COMPLETA**; demostracion **CERTIFICADA POR KERNEL CON HIPOTESIS**

## Pendientes del generador

Estos registros localizan pruebas que el generador no ha construido. No significan que el contenido falte en el Markdown ni constituyen una refutacion.

- `P_VR_rho`: origen `ES_46_RV6.md:1623`; no se ha generado la derivacion completa. Pruebas parciales emitidas: `transversal_map_preserves_distance`, `transversal_maps_are_inverse`, `derive_P_VR_rho_forward_coordinate`, `derive_P_VR_rho_inverse_coordinate`.
- `T_RIEMANN`: origen `ES_46_RV6.md:1823`; no se ha generado la derivacion completa. Pruebas parciales emitidas: ninguna.
- `P_F`: origen `ES_46_RV6.md:683`; no se ha generado la derivacion completa. Pruebas parciales emitidas: ninguna.
- `P_W`: origen `ES_46_RV6.md:721`; no se ha generado la derivacion completa. Pruebas parciales emitidas: ninguna.
- `P_F2`: origen `ES_46_RV6.md:794`; no se ha generado la derivacion completa. Pruebas parciales emitidas: ninguna.

## Afirmaciones traducidas y estado de certificacion

- `T_ISO` formula 1 (ES_46_RV6.md:1469:T_ISO:formula-1): **FORMALIZED_UNPROVEN**; origen: `\boxed{ U_{\rm VED}^{\rho}\cong U_{\rm Rim}^{\rho}. }`
- `P_ST` formula 1 (ES_46_RV6.md:114:P_ST:formula-1): **FORMALIZED_UNPROVEN**; origen: `\boxed{ P_{\rm ST}: \qquad ds^2=dt^2-dt'^2. }`
- `P_VED_E` formula 4 (ES_46_RV6.md:417:P_VED_E:formula-4): **FORMALIZED_UNPROVEN**; origen: `\boxed{ P_{\rm VED}(E): \qquad \rho=0 \iff n=k\in\mathbb N^+ \iff L=k\lambda \iff \text{cierre exacto en fase} \iff \text{estado estable}. }`
- `P_RHO_ISO` formula 1 (ES_46_RV6.md:1484:P_RHO_ISO:formula-1): **FORMALIZED_UNPROVEN**; origen: `\boxed{ \rho_R(f(x))=\rho_{\rm VED}(x), \qquad \rho_{\rm VED}(f^{-1}(z))=\rho_R(z). }`
- `P_v` formula 1 (ES_46_RV6.md:138:P_v:formula-1): **FORMALIZED_UNPROVEN**; origen: `\boxed{ P_v: \qquad \frac{ds}{dt}=v. }`
- `P_ST_2` formula 1 (ES_46_RV6.md:674:P_ST_2:formula-1): **FORMALIZED_UNPROVEN**; origen: `P_{\rm ST}: \qquad ds^2=dt^2-dt'^2.`
- `P_VED_I` formula 1 (ES_46_RV6.md:441:P_VED_I:formula-1): **FORMALIZED_UNPROVEN**; origen: `\boxed{ P_{\rm VED}(I): \qquad 0<\rho\le\frac12 \iff \text{cierre no estable}. }`
- `P_VED_E_2` formula 1 (ES_46_RV6.md:1217:P_VED_E_2:formula-1): **FORMALIZED_UNPROVEN**; origen: `P_{\rm VED}(E): \quad \rho=0 \iff \text{estado estable}.`
- `P_RIM_S` formula 1 (ES_46_RV6.md:1520:P_RIM_S:formula-1): **FORMALIZED_UNPROVEN**; origen: `\boxed{ \forall z\in U_{\rm Rim}, \qquad \operatorname{Stable}_{\rm Rim}(z) \iff \rho_R(z)=0. }`
- `P_a` formula 1 (ES_46_RV6.md:154:P_a:formula-1): **FORMALIZED_UNPROVEN**; origen: `\boxed{ P_a: \qquad \frac{d^2s}{dt^2} = \frac{dv}{dt} = a. }`
- `P_VED_K_E` formula 1 (ES_46_RV6.md:493:P_VED_K_E:formula-1): **FORMALIZED_UNPROVEN**; origen: `\boxed{ \mathcal E_{\rm VED} = \{(k,0):k\in\mathbb N^+\}. }`
- `P_VR_rho` formula 9 (ES_46_RV6.md:1623:P_VR_rho:formula-9): **FORMALIZED_UNPROVEN**; origen: `\boxed{ P_{\rm VR}(\rho): \qquad \rho_{\rm VED} = \rho_R = \left| a-\frac12 \right|. }`
- `P_VR_E` formula 3 (ES_46_RV6.md:1663:P_VR_E:formula-3): **FORMALIZED_UNPROVEN**; origen: `\boxed{ P_{\rm VR}(E): \qquad \text{estado estable} \iff \left| a-\frac12 \right| = 0. }`
- `P_Z` formula 11 (ES_46_RV6.md:1805:P_Z:formula-11): **FORMALIZED_UNPROVEN**; origen: `\boxed{ P_Z: \qquad z\in Z_{\rm Rim}^{\rm nt} \Rightarrow \left[ \zeta(z)=0 \ \text{en }U_{\rm Rim} \ \text{y } \rho_R=\rho_{\rm VED} \ \text{clasifica su localización transversal} \right]. }`
- `P_VED_R_C` formula 1 (ES_46_RV6.md:564:P_VED_R_C:formula-1): **FORMALIZED_UNPROVEN**; origen: `0\le\rho\le\frac12`
- `T_RIEMANN` formula 14 (ES_46_RV6.md:1823:T_RIEMANN:formula-14): **FORMALIZED_UNPROVEN**; origen: `\boxed{ \forall z\in Z_{\rm Rim}^{\rm nt}, \qquad \Re(z)=\frac12. }`
- `P_VED_Completo` formula 1 (ES_46_RV6.md:576:P_VED_Completo:formula-1): **FORMALIZED_UNPROVEN**; origen: `\boxed{ P_{\rm VED}(\mathrm{Completo}): \quad U_{\rm VED}^{\rm cerrado} = \mathcal E_{\rm VED} \sqcup \mathcal I_{\rm VED}, }`
- `P_VS` formula 1 (ES_46_RV6.md:639:P_VS:formula-1): **FORMALIZED_UNPROVEN**; origen: `\boxed{ P_{\rm VS}: \qquad U_{\rm VED}\cong U_{\rm Sch}. }`
- `P_F` formula 1 (ES_46_RV6.md:683:P_F:formula-1): **FORMALIZED_UNPROVEN**; origen: `\boxed{ P_F: \qquad F = (dt^2-dt'^2) + \frac{d}{dt}(dt^2-dt'^2). }`
- `P_F1` formula 1 (ES_46_RV6.md:699:P_F1:formula-1): **FORMALIZED_UNPROVEN**; origen: `\boxed{ P_{F1}: \qquad F = dt^2-dt'^2 + 2dt - 2dt'\frac{dt'}{dt}. }`
- `P_W` formula 1 (ES_46_RV6.md:721:P_W:formula-1): **FORMALIZED_UNPROVEN**; origen: `\boxed{ P_W: \qquad v_{\rm onda}=c. }`
- `P_F2` formula 1 (ES_46_RV6.md:794:P_F2:formula-1): **FORMALIZED_UNPROVEN**; origen: `\boxed{ P_{F2}: \qquad F=dt^2+2dt. }`
- `P_F3` formula 1 (ES_46_RV6.md:815:P_F3:formula-1): **FORMALIZED_UNPROVEN**; origen: `\boxed{ P_{F3}: \qquad F = 2dt \left( 1+\frac12dt \right). }`
- `P_F3_2` formula 1 (ES_46_RV6.md:1239:P_F3_2:formula-1): **FORMALIZED_UNPROVEN**; origen: `P_{F3}: \quad F = 2dt \left( 1+\frac12dt \right).`
- `P_Lap_Z` formula 1 (ES_46_RV6.md:1202:P_Lap_Z:formula-1): **FORMALIZED_UNPROVEN**; origen: `\Re(s)=\frac12.`
- `P_Lap_Z_2` formula 1 (ES_46_RV6.md:1250:P_Lap_Z_2:formula-1): **FORMALIZED_UNPROVEN**; origen: `P_{\rm Lap}(Z): \quad Z_{\rm VED\to Lap} \subset \{s:\Re(s)=1/2\}.`

## Obligaciones deductivas Lean

- `D_Rim` formula 8: papel **CONTEXTUAL_RESULT**, 1 antecedentes enlazados, estado **NO_CERTIFICADO**
- `P_COORD` formula 1: papel **PROOF_STEP**, 1 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_COORD` formula 2: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_VED_Inv` formula 1: papel **PROOF_STEP**, 3 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_VED_Inv` formula 2: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_VED_Inv` formula 3: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_VED_Inv` formula 4: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_VED_Inv` formula 5: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `T_ISO` formula 1: papel **CLAIM**, 2 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_ST` formula 1: papel **CLAIM**, 3 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_ST` formula 2: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_VED_E` formula 1: papel **PROOF_STEP**, 3 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_VED_E` formula 2: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_VED_E` formula 3: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_VED_E` formula 4: papel **CLAIM**, 4 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_VED_E` formula 5: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_RHO_ISO` formula 1: papel **CLAIM**, 1 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_RHO_ISO` formula 2: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_RHO_ISO` formula 3: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_v` formula 1: papel **CLAIM**, 3 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_v` formula 2: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_ST_2` formula 1: papel **CLAIM**, 1 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_VED_I` formula 1: papel **CLAIM**, 3 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_VED_I` formula 2: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_VED_E_2` formula 1: papel **CLAIM**, 1 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_RIM_S` formula 1: papel **CLAIM**, 2 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_RIM_S` formula 2: papel **PROOF_STEP**, 3 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_a` formula 1: papel **CLAIM**, 3 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_VED_K_E` formula 1: papel **CLAIM**, 3 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_VED_K_E` formula 2: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_VED_K_E` formula 3: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_VR_rho` formula 1: papel **PROOF_STEP**, 3 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_VR_rho` formula 2: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_VR_rho` formula 3: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_VR_rho` formula 4: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_VR_rho` formula 5: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_VR_rho` formula 6: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_VR_rho` formula 7: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_VR_rho` formula 8: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_VR_rho` formula 9: papel **CLAIM**, 4 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_VR_E` formula 1: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_VR_E` formula 2: papel **PROOF_STEP**, 3 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_VR_E` formula 3: papel **CLAIM**, 3 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_VR_E` formula 4: papel **PROOF_STEP**, 3 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_Z` formula 1: papel **PROOF_STEP**, 1 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_Z` formula 2: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_Z` formula 3: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_Z` formula 4: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_Z` formula 5: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_Z` formula 6: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_Z` formula 7: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_Z` formula 8: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_Z` formula 9: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_Z` formula 10: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_Z` formula 11: papel **CLAIM**, 2 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_VED_R_C` formula 1: papel **CLAIM**, 3 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `T_RIEMANN` formula 1: papel **PROOF_STEP**, 6 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 2: papel **GOAL**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 3: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 4: papel **DERIVED_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 5: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 6: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 8: papel **DERIVED_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 9: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 10: papel **DERIVED_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 11: papel **DERIVED_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 12: papel **CONCLUSION**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 13: papel **CONCLUSION**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 14: papel **CLAIM**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 15: papel **EQUIVALENT_CONCLUSION**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 16: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 17: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 18: papel **DERIVED_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 19: papel **CONCLUSION**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 20: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 21: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 22: papel **DERIVED_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 23: papel **DERIVED_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 24: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 25: papel **CONCLUSION**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 26: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 27: papel **DERIVED_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 28: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 29: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 30: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 31: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 32: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 33: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 34: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 35: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 36: papel **DERIVED_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 37: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 38: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 39: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 40: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 41: papel **DERIVED_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 42: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 43: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 45: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 46: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 47: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 48: papel **CONCLUSION**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 49: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 50: papel **CONCLUSION**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 71: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 103: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 104: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `T_RIEMANN` formula 121: papel **PROOF_STEP**, 7 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_VED_Completo` formula 1: papel **CLAIM**, 3 antecedentes enlazados, estado **NO_CERTIFICADO**
- `P_VS` formula 1: papel **CLAIM**, 3 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_VS` formula 2: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_VS` formula 3: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F` formula 1: papel **CLAIM**, 3 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_F1` formula 1: papel **CLAIM**, 3 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_W` formula 1: papel **CLAIM**, 1 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_W` formula 2: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_W` formula 3: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_W` formula 4: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_W` formula 5: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_W` formula 6: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_W` formula 7: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_W` formula 8: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_W` formula 9: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_W` formula 10: papel **PROOF_STEP**, 2 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_F2` formula 1: papel **CLAIM**, 3 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_F2` formula 2: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_DETERMINADO**
- `P_F3` formula 1: papel **CLAIM**, 3 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_F3` formula 3: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 4: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 5: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 6: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 7: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 9: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 10: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 11: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 12: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 13: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 14: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 15: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 16: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 17: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 18: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 19: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 20: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 21: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 22: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 23: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 24: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 25: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3` formula 26: papel **PROOF_STEP**, 4 antecedentes enlazados, estado **NO_CERTIFICADO_INDIVIDUALMENTE**
- `P_F3_2` formula 1: papel **CLAIM**, 1 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_Lap_Z` formula 1: papel **CLAIM**, 3 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**
- `P_Lap_Z_2` formula 1: papel **CLAIM**, 1 antecedentes enlazados, estado **CERTIFICADO_COMO_CONCLUSION_DEL_TEOREMA**

## Condiciones logicas no certificadas

No se detectaron implicaciones condicionales adicionales sin certificar.

## Alcance

Lean 4 solo certifica las definiciones, teoremas e inferencias formalizadas en los archivos Lean evaluados.

La ausencia de verificacion no equivale a refutacion. Este evaluador distingue la compilacion global del estado individual de cada aseveracion; no presenta como falsas las que no haya podido comprobar.

## ADEC

Compatible con ADEC mediante carga desde URL publica o archivo JSON.
## Trazas de obligaciones

### T_ISO, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 1469.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 834.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_ST, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 114.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 885.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_VED_E, formula 4: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 417.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 937.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_RHO_ISO, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 1484.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 1050.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_v, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 138.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 1085.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_ST_2, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 674.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 1110.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_VED_I, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 441.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 1126.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_VED_E_2, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 1217.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 1144.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_RIM_S, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 1520.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 1164.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_a, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 154.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 1204.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_VED_K_E, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 493.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 1244.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_VR_rho, formula 9: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 1623.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 1354.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_VR_E, formula 3: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 1663.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 1435.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_Z, formula 11: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 1805.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 1508.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_VED_R_C, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 564.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 1567.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### T_RIEMANN, formula 14: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 1823.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 1748.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_VED_Completo, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 576.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 2148.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_VS, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 639.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 2191.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_F, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 683.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 2236.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_F1, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 699.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 2255.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_W, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 721.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 2286.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_F2, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 794.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 2341.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_F3, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 815.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 2391.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_F3_2, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 1239.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 2595.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_Lap_Z, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 1202.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 2610.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.

### P_Lap_Z_2, formula 1: FORMALIZED_UNPROVEN
Origen: [ES_46_RV6.md](../ES_46_RV6.md), linea 1250.
Salida: [ES_46_RV6.lean](../ES_46_RV6.lean), linea 2636.
Compilacion: [LEAN_ES_46_RV6.log](../LEAN_ES_46_RV6.log).
Responsabilidad: `prueba_no_certificada`. Modulo a revisar: `DEMUESTRA/publica.py`. La formula se represento por separado, sin prueba certificada.
