"""ADEC v0.8.6 structure checks; never change mathematical proof status."""

KINDS = {
    "foundation", "definition", "constant", "axiom", "postulate",
    "proposition", "lemma", "theorem", "corollary", "concept", "experiment",
    "self_validation", "meta_validation",
}
RELATIONSHIPS = {"additive", "substitutive", "overlapping", "unclear"}


def _string(value, location):
    if not isinstance(value, str) or not value.strip():
        raise ValueError(f"ADEC: {location} debe ser texto no vacio.")


def validate_nodes(data):
    if not isinstance(data, dict):
        raise ValueError("ADEC exige un objeto JSON.")
    nodes = data.get("nodes")
    if not isinstance(nodes, list) or not nodes:
        raise ValueError("ADEC exige un atributo nodes no vacio.")
    ids = set()
    for index, node in enumerate(nodes):
        if not isinstance(node, dict):
            raise ValueError(f"ADEC nodes[{index}] no es un objeto.")
        for field in ("id", "kind", "name", "description"):
            _string(node.get(field), f"nodes[{index}].{field}")
        if node["kind"] not in KINDS:
            raise ValueError(f"ADEC: kind desconocido en {node['id']}.")
        if node["id"] in ids:
            raise ValueError("ADEC no admite identificadores de nodo duplicados.")
        ids.add(node["id"])
        deps = node.get("deps")
        if not isinstance(deps, list):
            raise ValueError(f"ADEC: {node['id']}.deps debe ser una lista.")
        for dep in deps:
            _string(dep, f"{node['id']}.deps")
        if "measurement_relationship" in node and (
            not isinstance(node["measurement_relationship"], str)
            or node["measurement_relationship"] not in RELATIONSHIPS
        ):
            raise ValueError(f"ADEC: {node['id']} necesita measurement_relationship valido.")
        if len(deps) >= 2 and not node.get("measurement_relationship"):
            raise ValueError(f"ADEC: {node['id']} necesita measurement_relationship.")
        if "claim_scope" in node and (
            not isinstance(node["claim_scope"], str)
            or node["claim_scope"] not in {"existence", "magnitude", "prediction"}
        ):
            raise ValueError(f"ADEC: claim_scope invalido en {node['id']}.")
        if "peer_reviewed" in node and not isinstance(node["peer_reviewed"], bool):
            raise ValueError(f"ADEC: peer_reviewed debe ser booleano en {node['id']}.")
        if "funding" in node:
            funding = node["funding"]
            for item in funding if isinstance(funding, list) else [funding]:
                _string(item, f"{node['id']}.funding")
        if "funder_relationship_to_claim" in node and (
            not isinstance(node["funder_relationship_to_claim"], str)
            or node["funder_relationship_to_claim"] not in {
            "independent", "funder_manufactures_tested_product",
            "funder_has_financial_stake", "unclear",
        }):
            raise ValueError(f"ADEC: funder_relationship_to_claim invalido en {node['id']}.")
        if "proof" in node:
            proof = node["proof"]
            if not isinstance(proof, dict):
                raise ValueError(f"ADEC: proof incompleto en {node['id']}.")
            _string(proof.get("status"), f"{node['id']}.proof.status")
            if "method" in proof:
                _string(proof["method"], f"{node['id']}.proof.method")
            steps = proof.get("steps")
            if not isinstance(steps, list) or not steps:
                raise ValueError(f"ADEC: proof incompleto en {node['id']}.")
            for step in steps:
                _string(step, f"{node['id']}.proof.steps")
        for field, keys in (
            ("competitive_hypotheses", ("hypothesis", "distinguishing_test")),
            ("rejected_alternative_specifications", ("specification", "reason_rejected")),
        ):
            if field not in node:
                continue
            if not isinstance(node[field], list):
                raise ValueError(f"ADEC: {node['id']}.{field} debe ser una lista.")
            for entry in node[field]:
                if not isinstance(entry, dict):
                    raise ValueError(f"ADEC: {node['id']}.{field} exige objetos.")
                for key in keys:
                    _string(entry.get(key), f"{node['id']}.{field}.{key}")
    for node in nodes:
        unknown = set(node["deps"]) - ids
        if unknown:
            raise ValueError(f"ADEC: {node['id']} referencia dependencias inexistentes: " + ", ".join(sorted(unknown)))
    return len(nodes)


def validate_artifact(data):
    if not isinstance(data, dict):
        raise ValueError("ADEC exige un objeto JSON.")
    for field in ("title", "version"):
        _string(data.get(field), field)
    if "authors" in data:
        if not isinstance(data["authors"], list):
            raise ValueError("ADEC: authors debe ser una lista.")
        for author in data["authors"]:
            if not isinstance(author, dict):
                raise ValueError("ADEC: authors exige objetos.")
            _string(author.get("name"), "authors.name")
            for field in ("affiliation", "conflict_of_interest", "orcid"):
                if field in author:
                    _string(author[field], f"authors.{field}")
    return validate_nodes(data)
