# Q3/V3: programas y alcance

Los archivos estan en DEMUESTRA/comparacion. No modifican certificados,
evaluaciones previas ni el documento durante una ejecucion.

| Archivo | Funcion |
| --- | --- |
| protocolo_q3.py | Protocolo comun, puertas y huella del circuito |
| q3.py | Referencia ideal local mediante Qiskit |
| v3.py | Candidata V3_ref con componentes reales y captura determinista |
| comparar_q3_v3.py | Contraste local, exportacion e importacion de muestras |
| tests/test_q3_v3.py | Pruebas de distribuciones, lectura y validacion |

## Ejecucion local

Desde DEMUESTRA, con las dependencias de comparacion/requirements.txt:

```powershell
.\.venv-comparacion\Scripts\python.exe -B comparacion/comparar_q3_v3.py --qubits 4 8 12 16 --cycles 6 --report documentacion/ES_52/Q3_V3_RESULTADOS_20261008.json --export-circuits documentacion/ES_52/Q3_CIRCUITOS
.\.venv-comparacion\Scripts\python.exe -B -m unittest discover -s comparacion/tests -p "test_*.py"
```

Los circuitos son instancias locales de una familia de muestreo, con
H, Rx, Rz y CZ sobre una cadena. No son el circuito publicado de Willow.
El diseno aleatorio se fija antes de ejecutar: no se generan valores
aleatorios durante la evolucion de V3 ni durante la captura.

Ambos modelos locales se limitan a 16 unidades. Las probabilidades completas
se calculan por separado y se comparan a tolerancia 1e-10. La fase explicita
de captura es un dato del comprobador, no una certificacion de fase desconocida.
Los tiempos son una ejecucion local, no una comparacion de hardware ni una
medicion estadistica de rendimiento. No se ha probado ventaja cuantica.

## Muestras externas

La importacion requiere un circuito JSON en el formato exportado y dos
objetos JSON con estos campos:

```json
{
  "circuit_sha256": "HUELLA_DEL_CIRCUITO_EXPORTADO",
  "backend": "IDENTIFICADOR_DE_LA_REALIZACION",
  "bit_order": "q0_lsb",
  "shots": 1000,
  "elapsed_seconds": 5.0,
  "counts": {"0000": 500, "1111": 500}
}
```

Este bloque es un ejemplo de formato, NO datos experimentales. La longitud
de cada cadena debe coincidir con el registro; q0 es el bit de la derecha.
Las multiplicidades deben sumar shots. Los dos conjuntos deben tener el
mismo circuito, orden y numero de muestras. La huella se obtiene mediante
protocolo_q3.circuit_hash, no mediante el hash bruto del fichero JSON.

```powershell
.\.venv-comparacion\Scripts\python.exe -B comparacion/comparar_q3_v3.py --circuit circuito.json --q-samples Q3_muestras.json --v-samples V3_muestras.json --report contraste_externo.json
```

La importacion NO ejecuta V3 para producir esas muestras. Acepta y describe
datos proporcionados por otras realizaciones; identidades y tiempos no se
autentican. Para datos externos el programa calcula solo una distancia entre
histogramas y conserva el estado IMPORTED_DESCRIPTIVE_ONLY, sin veredicto.
Incluso histogramas iguales no certifican equivalencia ni ventaja.

En registros grandes, dos muestras finitas de una misma distribucion pueden
tener histogramas muy distintos. Hace falta el procedimiento de calidad y
sus incertidumbres definido para el benchmark elegido, no un umbral ad hoc
aplicado a esa distancia. XEB no esta implementado en este importador.

## Objetivo publicado pendiente

Q3 objetivo es el muestreo de circuitos de Willow reportado por Google en
menos de cinco minutos. El coste clasico divulgado es una estimacion del
equipo de Google, no una ejecucion convencional medida aqui:

https://blog.google/innovation-and-ai/technology/research/google-willow-quantum-chip/

Para ese contraste faltan la instancia publicada exacta, muestras y criterio
de calidad verificable, y una realizacion V que pueda ejecutarla sin el
registro explicito exponencial. V3_ref no es todavia la arquitectura compacta
de generadores binarios del autor. No se imponen a V criterios fisicos que
se den por verificados en Q: ninguna construccion fisica se verifica aqui.
