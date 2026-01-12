def extract_upstream(sequence: str, length: int = 20) -> str | None:
    match = re.search(rf"[ATCG]{{{length}}}ATG", sequence.upper())
    if match:
        return match.group()[:-3]
    return None
