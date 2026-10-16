# Evaluacion Prolog directa del Markdown - ES_52_Maquina_V_UNIHOLOG

## Veredicto

**TEOREMA DERIVADO DESDE PREMISAS DECLARADAS**

Certificados estructurales: 26/26. Refutaciones: 0.
Alcance: cierre de dependencias bajo premisas declaradas; no certificacion matematica global.

Entrada unica: `ES_52_Maquina_V_UNIHOLOG.md`
Nodos extraidos: `30`
Reglas Deps extraidas: `26`
Premisas declaradas: `4`
Lineas matematicas extraidas: `188`
Dependencias recuperadas del texto de prueba: `0`
SHA-256 del Markdown: `6c2ac8edb842e2d5ef0c7f0965f0cbaf203e974f3bcdb2acf875162cbb5467d0`
SHA-256 del auditor: `a9ad83b7361bf9b2bd40247fa7733d2fa85011c8c93cac3a506d1dc1d400b8ed`

## Teoremas

- `T_AMPLITUDECOND`: **DERIVADO**
- `T_SECUENCIACOND`: **DERIVADO**

## Obligaciones abiertas

- Ninguna.

## Dependencias recuperadas de la prueba


## Premisas usadas por el objetivo

- `D_PROTOCOLO` declarada en la linea `18`
- `D_DESCONOCIDO` declarada en la linea `246`

## Arbol de prueba

```text
    TEOREMA t_secuenciacond por Deps (linea 1110)
      PREMISA_MD d_protocolo (linea 18)
      TEOREMA d_actualizacion por Deps (linea 1005)
        TEOREMA d_circuitov por Deps (linea 539)
          TEOREMA d_amplitudes por Deps (linea 472)
            PREMISA_MD d_protocolo (linea 18)
            TEOREMA d_lectura por Deps (linea 275)
              PREMISA_MD d_desconocido (linea 246)
        TEOREMA d_comparador por Deps (linea 860)
          TEOREMA d_lectura por Deps (linea 275)
            PREMISA_MD d_desconocido (linea 246)
          TEOREMA d_protocolofase por Deps (linea 741)
            PREMISA_MD d_protocolo (linea 18)
            TEOREMA d_amplitudes por Deps (linea 472)
              PREMISA_MD d_protocolo (linea 18)
              TEOREMA d_lectura por Deps (linea 275)
                PREMISA_MD d_desconocido (linea 246)
            TEOREMA p_interferencia por Deps (linea 694)
              TEOREMA d_amplitudes por Deps (linea 472)
                PREMISA_MD d_protocolo (linea 18)
                TEOREMA d_lectura por Deps (linea 275)
                  PREMISA_MD d_desconocido (linea 246)
        TEOREMA p_lecturauniforme por Deps (linea 952)
          TEOREMA d_comparador por Deps (linea 860)
            TEOREMA d_lectura por Deps (linea 275)
              PREMISA_MD d_desconocido (linea 246)
            TEOREMA d_protocolofase por Deps (linea 741)
              PREMISA_MD d_protocolo (linea 18)
              TEOREMA d_amplitudes por Deps (linea 472)
                PREMISA_MD d_protocolo (linea 18)
                TEOREMA d_lectura por Deps (linea 275)
                  PREMISA_MD d_desconocido (linea 246)
              TEOREMA p_interferencia por Deps (linea 694)
                TEOREMA d_amplitudes por Deps (linea 472)
                  PREMISA_MD d_protocolo (linea 18)
                  TEOREMA d_lectura por Deps (linea 275)
                    PREMISA_MD d_desconocido (linea 246)
          TEOREMA d_condicionreferencia por Deps (linea 925)
            TEOREMA d_comparador por Deps (linea 860)
              TEOREMA d_lectura por Deps (linea 275)
                PREMISA_MD d_desconocido (linea 246)
              TEOREMA d_protocolofase por Deps (linea 741)
                PREMISA_MD d_protocolo (linea 18)
                TEOREMA d_amplitudes por Deps (linea 472)
                  PREMISA_MD d_protocolo (linea 18)
                  TEOREMA d_lectura por Deps (linea 275)
                    PREMISA_MD d_desconocido (linea 246)
                TEOREMA p_interferencia por Deps (linea 694)
                  TEOREMA d_amplitudes por Deps (linea 472)
                    PREMISA_MD d_protocolo (linea 18)
                    TEOREMA d_lectura por Deps (linea 275)
                      PREMISA_MD d_desconocido (linea 246)
      TEOREMA p_lecturauniforme por Deps (linea 952)
        TEOREMA d_comparador por Deps (linea 860)
          TEOREMA d_lectura por Deps (linea 275)
            PREMISA_MD d_desconocido (linea 246)
          TEOREMA d_protocolofase por Deps (linea 741)
            PREMISA_MD d_protocolo (linea 18)
            TEOREMA d_amplitudes por Deps (linea 472)
              PREMISA_MD d_protocolo (linea 18)
              TEOREMA d_lectura por Deps (linea 275)
                PREMISA_MD d_desconocido (linea 246)
            TEOREMA p_interferencia por Deps (linea 694)
              TEOREMA d_amplitudes por Deps (linea 472)
                PREMISA_MD d_protocolo (linea 18)
                TEOREMA d_lectura por Deps (linea 275)
                  PREMISA_MD d_desconocido (linea 246)
        TEOREMA d_condicionreferencia por Deps (linea 925)
          TEOREMA d_comparador por Deps (linea 860)
            TEOREMA d_lectura por Deps (linea 275)
              PREMISA_MD d_desconocido (linea 246)
            TEOREMA d_protocolofase por Deps (linea 741)
              PREMISA_MD d_protocolo (linea 18)
              TEOREMA d_amplitudes por Deps (linea 472)
                PREMISA_MD d_protocolo (linea 18)
                TEOREMA d_lectura por Deps (linea 275)
                  PREMISA_MD d_desconocido (linea 246)
              TEOREMA p_interferencia por Deps (linea 694)
                TEOREMA d_amplitudes por Deps (linea 472)
                  PREMISA_MD d_protocolo (linea 18)
                  TEOREMA d_lectura por Deps (linea 275)
                    PREMISA_MD d_desconocido (linea 246)
```

## Alcance

Lee exclusivamente el Markdown y comprueba las reglas Deps, las referencias explicitas de la prueba y las premisas declaradas. Certifica la derivacion interna de T_SECUENCIACOND en ese sistema; no convierte automaticamente cada premisa declarada en verdad matematica externa.
