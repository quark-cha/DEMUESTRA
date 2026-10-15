"""Candidate V3_ref with real signal components and deterministic t0 capture."""

import math
import numpy as np

from protocolo_q3 import ensure_local
from q1_v1 import PhaseOscillator


class V3:
    def __init__(self, spec, phase_ticks=None):
        ensure_local(spec)
        self.__qubits = spec['qubits']
        self.__gates = [dict(g, qubits=list(g['qubits'])) for g in spec['gates']]
        self.__oscillator = PhaseOscillator(phase_ticks)
        self.__weights = None
        self.__latched = None

    def execute(self):
        if self.__weights is not None:
            raise RuntimeError('Prepare a new register for another execution')
        real = np.zeros(1 << self.__qubits)
        imag = np.zeros_like(real)
        real[0] = 1.
        indexes = np.arange(len(real))
        for gate in self.__gates:
            name, qs = gate['name'], gate['qubits']
            if name == 'cz':
                mask = ((indexes & (1 << qs[0])) != 0) & ((indexes & (1 << qs[1])) != 0)
                real[mask] *= -1
                imag[mask] *= -1
                continue
            stride = 1 << qs[0]
            r = real.reshape(-1, 2, stride)
            i = imag.reshape(-1, 2, stride)
            r0, r1 = r[:, 0].copy(), r[:, 1].copy()
            i0, i1 = i[:, 0].copy(), i[:, 1].copy()
            if name == 'h':
                scale = math.sqrt(.5)
                r[:, 0], r[:, 1] = (r0+r1)*scale, (r0-r1)*scale
                i[:, 0], i[:, 1] = (i0+i1)*scale, (i0-i1)*scale
            else:
                c, s = math.cos(gate['angle']/2), math.sin(gate['angle']/2)
                if name == 'rx':
                    r[:, 0], r[:, 1] = c*r0+s*i1, c*r1+s*i0
                    i[:, 0], i[:, 1] = c*i0-s*r1, c*i1-s*r0
                else:
                    r[:, 0], r[:, 1] = c*r0+s*i0, c*r1-s*i1
                    i[:, 0], i[:, 1] = c*i0-s*r0, c*i1+s*r1
        self.__weights = real*real + imag*imag
        if abs(float(self.__weights.sum()) - 1) > 1e-10:
            raise RuntimeError('Register normalization lost')

    def capture_t0(self, t0_ticks=0):
        if self.__weights is None:
            raise RuntimeError('Complete execution before t0')
        if self.__latched is None:
            cumulative = np.cumsum(self.__weights)
            threshold = self.__oscillator.capture_phase(t0_ticks) * cumulative[-1]
            index = min(int(np.searchsorted(cumulative, threshold, side='right')), len(cumulative)-1)
            self.__latched = format(index, f'0{self.__qubits}b')
        return self.__latched

    def read(self):
        if self.__latched is None:
            raise RuntimeError('Readout blocked before t0')
        return self.__latched

    def probabilities_after_t0(self):
        self.read()
        return self.__weights.copy()
