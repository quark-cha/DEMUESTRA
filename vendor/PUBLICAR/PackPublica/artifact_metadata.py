"""Set author metadata without changing the document body."""

from pathlib import Path
import tempfile
import xml.etree.ElementTree as ET
from zipfile import ZipFile

from .autoria import document_authors


def office_authors(path, document):
    authors = document_authors(document)
    path = Path(path)
    member = "docProps/core.xml" if path.suffix == ".docx" else "meta.xml"
    dc = "http://purl.org/dc/elements/1.1/"
    meta = "urn:oasis:names:tc:opendocument:xmlns:meta:1.0"
    name = "; ".join(item["name"] for item in authors)
    with ZipFile(path) as original:
        root = ET.fromstring(original.read(member))
        parent = root if path.suffix == ".docx" else root.find(
            "{urn:oasis:names:tc:opendocument:xmlns:office:1.0}meta")
        if parent is None:
            raise ValueError(f"Metadatos no encontrados en {path}")
        tags = [f"{{{dc}}}creator"]
        if path.suffix == ".odt":
            tags.append(f"{{{meta}}}initial-creator")
        for tag in tags:
            element = parent.find(tag)
            if element is None:
                element = ET.SubElement(parent, tag)
            element.text = name
        identifiers = ["ORCID: " + item["orcid"] for item in authors if item.get("orcid")]
        if identifiers:
            tag = ("{http://schemas.openxmlformats.org/package/2006/metadata/core-properties}keywords"
                   if path.suffix == ".docx" else f"{{{meta}}}keyword")
            element = parent.find(tag)
            if element is None:
                element = ET.SubElement(parent, tag)
            keywords = [part.strip() for part in (element.text or "").split(";") if part.strip()]
            element.text = "; ".join(dict.fromkeys([*keywords, *identifiers]))
        encoded = ET.tostring(root, encoding="utf-8", xml_declaration=True)
        with tempfile.NamedTemporaryFile(dir=path.parent, suffix=path.suffix, delete=False) as temp:
            temporary = Path(temp.name)
        try:
            with ZipFile(temporary, "w") as updated:
                for info in original.infolist():
                    updated.writestr(info, encoded if info.filename == member else original.read(info.filename))
        except BaseException:
            temporary.unlink(missing_ok=True)
            raise
    temporary.replace(path)
