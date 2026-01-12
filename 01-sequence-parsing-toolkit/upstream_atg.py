"""
Extract upstream sequence from a DNA string.

Given a DNA sequence, this utility finds the first occurrence of a start codon (ATG)
with sufficient upstream context and returns the specified number of bases preceding it.
"""

import re
from typing import Optional


def extract_upstream(sequence: str, length: int = 20) -> Optional[str]:
    """
    Return `length` bases upstream of the first ATG start codon in `sequence`.

    Parameters
    ----------
    sequence : str
        DNA sequence to search.
    length : int, optional
        Number of bases to extract upstream (default is 20).

    Returns
    -------
    Optional[str]
        The upstream sequence if found, otherwise None.
    """
    pattern = rf"[ATCG]{{{length}}}ATG"
    match = re.search(pattern, sequence.upper())

    if match:
        return match.group()[:-3]  # remove the ATG
    return None


if __name__ == "__main__":
    seq = input("Enter DNA sequence: ").strip()
    result = extract_upstream(seq)

    if result:
        print("Upstream sequence:", result)
    else:
        print("No start codon with sufficient upstream context found.")
