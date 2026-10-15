"""One preparation and one joint measurement; no reference Q supplied to V."""

import time

from v_relacional import ReglaVPendiente


def ejecutar(machine, t0=None, *, oracle=None):
    start = time.perf_counter()
    stage = 'preparacion'
    preparation_seconds = None
    try:
        if oracle is None:
            machine.execute()
        else:
            machine.execute(oracle)
        preparation_seconds = time.perf_counter() - start
        stage = 'medida'
        measure_start = time.perf_counter()
        if getattr(machine, 'medida_por_disparo', False):
            if t0 is not None:
                raise ValueError('V registra el instante del disparo; no recibe un t0 sintetico')
            bits = machine.capture_t0()
            captured_t0 = machine.instante_medida()
        else:
            bits = machine.capture_t0(0 if t0 is None else t0)
            captured_t0 = 0 if t0 is None else t0
        report = {'status': 'MEDIDO', 'bits_q0_lsb': list(bits), 't0': captured_t0,
                'preparacion_seconds': preparation_seconds,
                'medida_seconds': time.perf_counter() - measure_start,
                'resources': machine.resources()}
        if callable(getattr(machine, 'auditoria_realizacion', None)):
            report['realizacion'] = machine.auditoria_realizacion()
        report['modalidad'] = ('MODELO_NUMERICO_PROPUESTO'
                              if report.get('realizacion', {}).get('tipo') == 'PROPUESTA_NUMERICA_POR_CAMINOS'
                              else 'REALIZACION_NO_VERIFICADA')
        return report
    except ReglaVPendiente as error:
        report = {'status': getattr(error, 'estado', 'PENDIENTE_REALIZACION'), 'etapa': stage,
                'motivo': str(error), 'bits_q0_lsb': None, 't0': t0,
                'preparacion_seconds': preparation_seconds,
                'medida_seconds': None, 'resources': machine.resources()}
        try:
            report['realizacion'] = machine.auditoria_realizacion()
        except RuntimeError:
            pass
        return report


def comparar_tiempos(q_seconds, v_report):
    # A pending capture cannot be a completed run or a speedup measurement.
    if v_report['status'] != 'MEDIDO':
        return None
    return {'q_modelo_local_seconds': q_seconds,
            'v_preparacion_y_medida_seconds':
                v_report['preparacion_seconds'] + v_report['medida_seconds'],
            'comparables_para_ventaja': False,
            'alcance': 'Q calcula una distribucion simulada; V registra una medida. '
                      'Son cargas distintas, no una prueba de igualdad de orden temporal'}
