# Evaluacion del control temporal de V

**Estado: CONTROL_TEMPORAL_VERIFICADO.**

Pruebas ejecutadas y superadas: 44. Pruebas del modelo retirado omitidas: 14.

En V1, V2 y V3, $t=t_0$ identifica el evento de disparo. No es una
etiqueta proporcionada a un calculo de salidas. La preparacion configura
las conexiones sin leer resultados. La medida llama una sola vez a
`disparar(t0)` de la realizacion conectada, y registra sus bits.

El controlador no recorre estados, caminos ni el plan de puertas durante
el disparo. La validacion y el registro de los bits recibidos no son una
busqueda de posibles salidas. Las llamadas repetidas devuelven el registro
existente y no vuelven a disparar.

## Alcance pendiente

Se ha corregido el control temporal, no se ha construido ni verificado
la dinamica fisica de las tres maquinas. Un detector de prueba no
demuestra H, fase, Fourier ni los algoritmos completos. El reloj del
programa registra la llamada; un sensor real requiere su propia calibracion.

El ensayo por caminos es independiente y no aplicable a V. Sus 74 segundos
y su resultado $15=3\times5$ no describen el coste o los resultados de V.

No hay evidencia de mejor orden temporal que la programacion convencional
ni tiempos de hardware Q. No se altera Lean, Prolog o un certificado.

[Registro estructurado](TEMPORAL_ES_52_Maquina_V_UNIHOLOG.json)
