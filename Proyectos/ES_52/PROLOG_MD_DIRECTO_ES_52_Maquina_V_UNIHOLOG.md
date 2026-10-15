# Evaluacion Prolog directa del Markdown - ES_52_Maquina_V_UNIHOLOG

## Veredicto

**TEOREMA DERIVADO DESDE PREMISAS DECLARADAS**

Certificados estructurales: 31/31. Refutaciones: 0.
Alcance: cierre de dependencias bajo premisas declaradas; no certificacion matematica global.

Entrada unica: `ES_52_Maquina_V_UNIHOLOG.md`
Nodos extraidos: `35`
Reglas Deps extraidas: `31`
Premisas declaradas: `4`
Lineas matematicas extraidas: `235`
Dependencias recuperadas del texto de prueba: `0`
SHA-256 del Markdown: `c229d9582f8ee586afee08f2d4953662de5fdc68143a62314cac8833ecb33bfb`
SHA-256 del auditor: `a9ad83b7361bf9b2bd40247fa7733d2fa85011c8c93cac3a506d1dc1d400b8ed`

## Teoremas

- `T_AMPLITUDECOND`: **DERIVADO**
- `T_COMPOSICIONCOND`: **DERIVADO**
- `T_SECUENCIACOND`: **DERIVADO**

## Obligaciones abiertas

- Ninguna.

## Dependencias recuperadas de la prueba


## Premisas usadas por el objetivo

- `D_PROTOCOLO` declarada en la linea `18`
- `D_DESCONOCIDO` declarada en la linea `246`

## Arbol de prueba

```text
    TEOREMA t_composicioncond por Deps (linea 1781)
      TEOREMA d_registroref por Deps (linea 1479)
        TEOREMA d_amplitudes por Deps (linea 472)
          PREMISA_MD d_protocolo (linea 18)
          TEOREMA d_lectura por Deps (linea 275)
            PREMISA_MD d_desconocido (linea 246)
        TEOREMA d_distribucionconjunta por Deps (linea 1291)
          TEOREMA d_frecuencias por Deps (linea 1227)
            TEOREMA d_lectura por Deps (linea 275)
              PREMISA_MD d_desconocido (linea 246)
            PREMISA_MD d_protocolo (linea 18)
      TEOREMA d_conexionref por Deps (linea 1673)
        TEOREMA d_registroref por Deps (linea 1479)
          TEOREMA d_amplitudes por Deps (linea 472)
            PREMISA_MD d_protocolo (linea 18)
            TEOREMA d_lectura por Deps (linea 275)
              PREMISA_MD d_desconocido (linea 246)
          TEOREMA d_distribucionconjunta por Deps (linea 1291)
            TEOREMA d_frecuencias por Deps (linea 1227)
              TEOREMA d_lectura por Deps (linea 275)
                PREMISA_MD d_desconocido (linea 246)
              PREMISA_MD d_protocolo (linea 18)
        TEOREMA d_generadorconjunto por Deps (linea 664)
          TEOREMA d_amplitudes por Deps (linea 472)
            PREMISA_MD d_protocolo (linea 18)
            TEOREMA d_lectura por Deps (linea 275)
              PREMISA_MD d_desconocido (linea 246)
          TEOREMA d_circuitov por Deps (linea 539)
            TEOREMA d_amplitudes por Deps (linea 472)
              PREMISA_MD d_protocolo (linea 18)
              TEOREMA d_lectura por Deps (linea 275)
                PREMISA_MD d_desconocido (linea 246)
      TEOREMA p_lecturauniforme por Deps (linea 1007)
        TEOREMA d_comparador por Deps (linea 915)
          TEOREMA d_lectura por Deps (linea 275)
            PREMISA_MD d_desconocido (linea 246)
          TEOREMA d_protocolofase por Deps (linea 796)
            PREMISA_MD d_protocolo (linea 18)
            TEOREMA d_amplitudes por Deps (linea 472)
              PREMISA_MD d_protocolo (linea 18)
              TEOREMA d_lectura por Deps (linea 275)
                PREMISA_MD d_desconocido (linea 246)
            TEOREMA p_interferencia por Deps (linea 749)
              TEOREMA d_amplitudes por Deps (linea 472)
                PREMISA_MD d_protocolo (linea 18)
                TEOREMA d_lectura por Deps (linea 275)
                  PREMISA_MD d_desconocido (linea 246)
        TEOREMA d_condicionreferencia por Deps (linea 980)
          TEOREMA d_comparador por Deps (linea 915)
            TEOREMA d_lectura por Deps (linea 275)
              PREMISA_MD d_desconocido (linea 246)
            TEOREMA d_protocolofase por Deps (linea 796)
              PREMISA_MD d_protocolo (linea 18)
              TEOREMA d_amplitudes por Deps (linea 472)
                PREMISA_MD d_protocolo (linea 18)
                TEOREMA d_lectura por Deps (linea 275)
                  PREMISA_MD d_desconocido (linea 246)
              TEOREMA p_interferencia por Deps (linea 749)
                TEOREMA d_amplitudes por Deps (linea 472)
                  PREMISA_MD d_protocolo (linea 18)
                  TEOREMA d_lectura por Deps (linea 275)
                    PREMISA_MD d_desconocido (linea 246)
      TEOREMA t_secuenciacond por Deps (linea 1165)
        PREMISA_MD d_protocolo (linea 18)
        TEOREMA d_actualizacion por Deps (linea 1060)
          TEOREMA d_circuitov por Deps (linea 539)
            TEOREMA d_amplitudes por Deps (linea 472)
              PREMISA_MD d_protocolo (linea 18)
              TEOREMA d_lectura por Deps (linea 275)
                PREMISA_MD d_desconocido (linea 246)
          TEOREMA d_comparador por Deps (linea 915)
            TEOREMA d_lectura por Deps (linea 275)
              PREMISA_MD d_desconocido (linea 246)
            TEOREMA d_protocolofase por Deps (linea 796)
              PREMISA_MD d_protocolo (linea 18)
              TEOREMA d_amplitudes por Deps (linea 472)
                PREMISA_MD d_protocolo (linea 18)
                TEOREMA d_lectura por Deps (linea 275)
                  PREMISA_MD d_desconocido (linea 246)
              TEOREMA p_interferencia por Deps (linea 749)
                TEOREMA d_amplitudes por Deps (linea 472)
                  PREMISA_MD d_protocolo (linea 18)
                  TEOREMA d_lectura por Deps (linea 275)
                    PREMISA_MD d_desconocido (linea 246)
          TEOREMA p_lecturauniforme por Deps (linea 1007)
            TEOREMA d_comparador por Deps (linea 915)
              TEOREMA d_lectura por Deps (linea 275)
                PREMISA_MD d_desconocido (linea 246)
              TEOREMA d_protocolofase por Deps (linea 796)
                PREMISA_MD d_protocolo (linea 18)
                TEOREMA d_amplitudes por Deps (linea 472)
                  PREMISA_MD d_protocolo (linea 18)
                  TEOREMA d_lectura por Deps (linea 275)
                    PREMISA_MD d_desconocido (linea 246)
                TEOREMA p_interferencia por Deps (linea 749)
                  TEOREMA d_amplitudes por Deps (linea 472)
                    PREMISA_MD d_protocolo (linea 18)
                    TEOREMA d_lectura por Deps (linea 275)
                      PREMISA_MD d_desconocido (linea 246)
            TEOREMA d_condicionreferencia por Deps (linea 980)
              TEOREMA d_comparador por Deps (linea 915)
                TEOREMA d_lectura por Deps (linea 275)
                  PREMISA_MD d_desconocido (linea 246)
                TEOREMA d_protocolofase por Deps (linea 796)
                  PREMISA_MD d_protocolo (linea 18)
                  TEOREMA d_amplitudes por Deps (linea 472)
                    PREMISA_MD d_protocolo (linea 18)
                    TEOREMA d_lectura por Deps (linea 275)
                      PREMISA_MD d_desconocido (linea 246)
                  TEOREMA p_interferencia por Deps (linea 749)
                    TEOREMA d_amplitudes por Deps (linea 472)
                      PREMISA_MD d_protocolo (linea 18)
                      TEOREMA d_lectura por Deps (linea 275)
                        PREMISA_MD d_desconocido (linea 246)
        TEOREMA p_lecturauniforme por Deps (linea 1007)
          TEOREMA d_comparador por Deps (linea 915)
            TEOREMA d_lectura por Deps (linea 275)
              PREMISA_MD d_desconocido (linea 246)
            TEOREMA d_protocolofase por Deps (linea 796)
              PREMISA_MD d_protocolo (linea 18)
              TEOREMA d_amplitudes por Deps (linea 472)
                PREMISA_MD d_protocolo (linea 18)
                TEOREMA d_lectura por Deps (linea 275)
                  PREMISA_MD d_desconocido (linea 246)
              TEOREMA p_interferencia por Deps (linea 749)
                TEOREMA d_amplitudes por Deps (linea 472)
                  PREMISA_MD d_protocolo (linea 18)
                  TEOREMA d_lectura por Deps (linea 275)
                    PREMISA_MD d_desconocido (linea 246)
          TEOREMA d_condicionreferencia por Deps (linea 980)
            TEOREMA d_comparador por Deps (linea 915)
              TEOREMA d_lectura por Deps (linea 275)
                PREMISA_MD d_desconocido (linea 246)
              TEOREMA d_protocolofase por Deps (linea 796)
                PREMISA_MD d_protocolo (linea 18)
                TEOREMA d_amplitudes por Deps (linea 472)
                  PREMISA_MD d_protocolo (linea 18)
                  TEOREMA d_lectura por Deps (linea 275)
                    PREMISA_MD d_desconocido (linea 246)
                TEOREMA p_interferencia por Deps (linea 749)
                  TEOREMA d_amplitudes por Deps (linea 472)
                    PREMISA_MD d_protocolo (linea 18)
                    TEOREMA d_lectura por Deps (linea 275)
                      PREMISA_MD d_desconocido (linea 246)
```

## Alcance

Lee exclusivamente el Markdown y comprueba las reglas Deps, las referencias explicitas de la prueba y las premisas declaradas. Certifica la derivacion interna de T_COMPOSICIONCOND en ese sistema; no convierte automaticamente cada premisa declarada en verdad matematica externa.
