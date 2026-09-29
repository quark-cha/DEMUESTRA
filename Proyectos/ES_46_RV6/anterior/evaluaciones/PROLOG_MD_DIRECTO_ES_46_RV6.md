# Evaluacion Prolog directa del Markdown - ES_46_RV6

## Veredicto

**TEOREMA DERIVADO DESDE PREMISAS DECLARADAS**

Entrada unica: `ES_46_RV6.md`
Nodos extraidos: `38`
Reglas Deps extraidas: `7`
Premisas declaradas: `31`
Lineas matematicas extraidas: `730`
Dependencias recuperadas del texto de prueba: `5`
SHA-256 del Markdown: `90cf88725aede8ecb78ee7ee7c5acc0f8e0ddc3c83ef5a69f2619fe37d9c71dd`
SHA-256 del auditor: `178211ec6d1327ec19c135b798d24441cf429fdf6e1b7b8e99f8e6421724d91f`

## Teoremas

- `T_ISO`: **DERIVADO**
- `T_RIEMANN`: **DERIVADO**

## Obligaciones abiertas

- Ninguna.

## Dependencias recuperadas de la prueba

- `D_LAP` usa `P_F3` en la linea `776`
- `P_VR_RHO` usa `P_VED_E` en la linea `1290`
- `P_VR_E` usa `P_VR_RHO` en la linea `1410`
- `T_RIEMANN` usa `D_RHO_R` en la linea `1502`
- `T_RIEMANN` usa `P_VR_RHO` en la linea `1502`

## Premisas usadas por el objetivo

- `D_F` declarada en la linea `1072`
- `D_FINV` declarada en la linea `1100`
- `P_Z` declarada en la linea `1454`
- `D_RHO_R` declarada en la linea `1003`
- `P_VED_E` declarada en la linea `394`

## Arbol de prueba

```text
    TEOREMA t_riemann por Deps (linea 1474)
      TEOREMA t_iso por Deps (linea 1128)
        PREMISA_MD d_f (linea 1072)
        PREMISA_MD d_finv (linea 1100)
      TEOREMA p_rho_iso por Deps (linea 1144)
        TEOREMA t_iso por Deps (linea 1128)
          PREMISA_MD d_f (linea 1072)
          PREMISA_MD d_finv (linea 1100)
      TEOREMA p_rim_s por Deps (linea 1195)
        TEOREMA t_iso por Deps (linea 1128)
          PREMISA_MD d_f (linea 1072)
          PREMISA_MD d_finv (linea 1100)
        TEOREMA p_rho_iso por Deps (linea 1144)
          TEOREMA t_iso por Deps (linea 1128)
            PREMISA_MD d_f (linea 1072)
            PREMISA_MD d_finv (linea 1100)
      PREMISA_MD p_z (linea 1454)
      PREMISA_MD d_rho_r (linea 1003)
      TEOREMA p_vr_rho por Deps (linea 1290)
        PREMISA_MD p_ved_e (linea 394)
```

## Alcance

Lee exclusivamente el Markdown y comprueba las reglas Deps, las referencias explicitas de la prueba y las premisas declaradas. Certifica la derivacion interna de T_RIEMANN en ese sistema; no convierte automaticamente cada premisa declarada en verdad matematica externa.
