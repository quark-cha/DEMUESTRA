"""Interface fixture, never shipped as a realization of V gate dynamics."""


def crear_realizacion():
    class DetectorEnsayo:
        def preparar(self, plan):
            assert plan.operaciones == (('h', 0), ('cnot', 0, 1))
        def disparar(self, t0):
            assert t0 > 0
            return (1, 0)
    return DetectorEnsayo()
