"""Document authors take precedence over private installation metadata."""

import html
import os
from pathlib import Path
import re


def config_root():
    override = os.environ.get("PUBLICAR_CONFIG_ROOT")
    if override:
        return Path(override).resolve()
    root = Path(__file__).resolve().parents[2]
    return root.parent.parent if root.name == "vendor" else root


def local_author():
    values = {}
    for filename in (".env", "author.env"):
        path = config_root() / filename
        if path.is_file():
            for line in path.read_text(encoding="utf-8-sig").splitlines():
                key, separator, value = line.partition("=")
                if separator and key.strip().startswith("AUTHOR_"):
                    values[key.strip()] = value.strip().strip("\"'")
    values.update({key: value for key, value in os.environ.items()
                   if key.startswith("AUTHOR_")})
    return {field: values[key].strip() for key, field in (
        ("AUTHOR_NAME", "name"), ("AUTHOR_ORCID", "orcid"),
        ("AUTHOR_AFFILIATION", "affiliation"),
        ("AUTHOR_CONFLICT_OF_INTEREST", "conflict_of_interest"),
    ) if values.get(key, "").strip()}


def resolve_authors(text="", authors=None):
    local = local_author()
    if authors is not None and authors != []:
        if not isinstance(authors, list) or any(
            not isinstance(item, dict) or not isinstance(item.get("name"), str)
            or not item["name"].strip() for item in authors
        ):
            raise ValueError("authors debe contener objetos con name no vacio.")
        result = [dict(item) for item in authors]
        for item in result:
            if item["name"].casefold() == local.get("name", "").casefold():
                for key, value in local.items():
                    item.setdefault(key, value)
        return result
    matches = re.findall(
        r"(?im)^[ \t]*(?:\*\*)?(?:autor(?:a|es)?|authors?)[ \t]*:[ \t]*(?:\*\*)?([^\r\n]*)", text)
    names = [re.split(
        r"(?i)[.;\u00b7|]\s*(?:marco|framework|orcid|afiliaci[o\u00f3]n|affiliation)\s*:",
        value, maxsplit=1)[0].strip().strip("*\\ ").rstrip(".") for value in matches]
    if names and any(not name for name in names):
        raise ValueError("La declaracion Autor: esta vacia; indique el nombre del autor.")
    if not names:
        # An unlabelled byline directly followed by the framework, not a heading.
        match = re.search(
            r"(?im)^\*\*([^*\r\n]+)\*\*\\?\s*\n\*\*[^\r\n]*(?:VED|UNIHOLOG)[^\r\n]*\*\*", text)
        if match:
            names = [match.group(1).strip()]
    if not names:
        if not local.get("name"):
            raise ValueError(
                "Falta autoria: declare Autor: en el documento o configure "
                "AUTHOR_NAME en author.env (privado). "
                "Ejecute python -m PackPublica.autoria para configurarla.")
        return [local]
    result = []
    for name in names:
        item = dict(local) if name.casefold() == local.get("name", "").casefold() else {}
        item["name"] = name
        result.append(item)
    header = "\n".join(text.splitlines()[:30])
    orcid = re.search(r"(?i)\bORCID\s*:?\s*(?:https?://orcid.org/)?(\d{4}-\d{4}-\d{4}-\d{3}[\dX])", header)
    if orcid and len(result) == 1:
        result[0]["orcid"] = orcid.group(1)
    return result


def document_authors(document):
    text = document.obtener_contenido_completo() if document is not None else ""
    return resolve_authors(text)


def author_html(authors):
    return "\n".join(
        f'<meta name="{key}" content="{html.escape(value, quote=True)}">'
        for author in authors for key, value in (
            ("author", author["name"]), ("author-orcid", author.get("orcid", "")))
        if value)


def author_comment(authors, prefix):
    return "\n".join(f"{prefix} Autor: " + " ".join(
        (item["name"] + (" | ORCID: " + item["orcid"] if item.get("orcid") else "")).splitlines())
        for item in authors) + "\n"


if __name__ == "__main__":
    path = config_root() / "author.env"
    if path.exists():
        raise SystemExit(f"La configuracion ya existe: {path}. Editela para modificarla.")
    name = input("Nombre del autor: ").strip()
    orcid = input("ORCID (opcional): ").strip()
    if not name:
        raise SystemExit("El nombre no puede quedar vacio.")
    path.write_text(f"AUTHOR_NAME={name}\nAUTHOR_ORCID={orcid}\n", encoding="utf-8")
    print(f"Configuracion privada creada: {path}")
