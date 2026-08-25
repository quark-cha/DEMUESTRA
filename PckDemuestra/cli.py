import argparse
import sys

from .demuestra import Demuestra


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(prog="demuestra")
    sub = parser.add_subparsers(dest="cmd", required=True)

    validar = sub.add_parser("validar")
    validar.add_argument("--proyecto", default=None)
    validar.add_argument("--incluir-ya-evaluado", action="store_true")
    validar.add_argument("--preparar-cache", action="store_true")

    nuevo = sub.add_parser("nuevo")
    nuevo.add_argument("nombre")

    finalizar = sub.add_parser("finalizar")
    finalizar.add_argument("nombre")

    args = parser.parse_args(argv)
    app = Demuestra()

    if args.cmd == "validar":
        return app.validar(
            nombre=args.proyecto,
            incluir_ya_evaluado=args.incluir_ya_evaluado,
            preparar_cache=args.preparar_cache,
        )

    if args.cmd == "nuevo":
        destino = app.nuevo_proyecto(args.nombre)
        print(f"Proyecto creado en {destino}")
        return 0

    if args.cmd == "finalizar":
        destino = app.finalizar_evaluacion(args.nombre)
        print(f"Proyecto archivado en {destino}")
        return 0

    return 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
