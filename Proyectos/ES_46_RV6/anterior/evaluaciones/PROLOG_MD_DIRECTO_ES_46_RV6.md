# Evaluacion Prolog directa del Markdown - ES_46_RV6

## Veredicto

**TEOREMA DERIVADO DESDE PREMISAS DECLARADAS**

Certificados estructurales: 7/7. Refutaciones: 0.
Alcance: cierre de dependencias bajo premisas declaradas; no certificacion matematica global.

Entrada unica: `ES_46_RV6.md`
Nodos extraidos: `39`
Reglas Deps extraidas: `7`
Premisas declaradas: `32`
Lineas matematicas extraidas: `845`
Dependencias recuperadas del texto de prueba: `5`
SHA-256 del Markdown: `1a6347bb2e7f67f2a27d7f20b27cb3b3b2d45af25a58bfc8bdf6bc5c8e817000`
SHA-256 del auditor: `a9ad83b7361bf9b2bd40247fa7733d2fa85011c8c93cac3a506d1dc1d400b8ed`

## Teoremas

- `T_ISO`: **DERIVADO**
- `T_RIEMANN`: **DERIVADO**

## Obligaciones abiertas

- Ninguna.

## Dependencias recuperadas de la prueba

- `D_LAP` usa `P_F3` en la linea `1127`
- `P_VR_RHO` usa `P_VED_E` en la linea `1641`
- `P_VR_E` usa `P_VR_RHO` en la linea `1761`
- `T_RIEMANN` usa `D_RHO_R` en la linea `1853`
- `T_RIEMANN` usa `P_VR_RHO` en la linea `1853`

## Premisas usadas por el objetivo

- `D_F` declarada en la linea `1423`
- `D_FINV` declarada en la linea `1451`
- `P_Z` declarada en la linea `1805`
- `D_RHO_R` declarada en la linea `1354`
- `P_VED_E` declarada en la linea `417`

## Arbol de prueba

```text
    TEOREMA t_riemann por Deps (linea 1825)
      TEOREMA t_iso por Deps (linea 1479)
        PREMISA_MD d_f (linea 1423)
        PREMISA_MD d_finv (linea 1451)
      TEOREMA p_rho_iso por Deps (linea 1495)
        TEOREMA t_iso por Deps (linea 1479)
          PREMISA_MD d_f (linea 1423)
          PREMISA_MD d_finv (linea 1451)
      TEOREMA p_rim_s por Deps (linea 1546)
        TEOREMA t_iso por Deps (linea 1479)
          PREMISA_MD d_f (linea 1423)
          PREMISA_MD d_finv (linea 1451)
        TEOREMA p_rho_iso por Deps (linea 1495)
          TEOREMA t_iso por Deps (linea 1479)
            PREMISA_MD d_f (linea 1423)
            PREMISA_MD d_finv (linea 1451)
      PREMISA_MD p_z (linea 1805)
      PREMISA_MD d_rho_r (linea 1354)
      TEOREMA p_vr_rho por Deps (linea 1641)
        PREMISA_MD p_ved_e (linea 417)
```

## Alcance

Lee exclusivamente el Markdown y comprueba las reglas Deps, las referencias explicitas de la prueba y las premisas declaradas. Certifica la derivacion interna de T_RIEMANN en ese sistema; no convierte automaticamente cada premisa declarada en verdad matematica externa.
