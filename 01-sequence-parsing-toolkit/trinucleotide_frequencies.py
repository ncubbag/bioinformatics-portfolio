"""
Compute background frequencies of all trinucleotides in a DNA sequence.

Reads a genome file (FASTA or plain sequence), removes headers and newlines,
and computes overlapping trinucleotide counts and percentages.
"""

from __future__ import annotations

from collections import defaultdict
from typing import Dict


def load_sequence(path: str) -> str:
    """
    Load a DNA sequence from a file, ignoring FASTA headers and whitespace.
    """
    parts = []
    with open(path, "r", encoding="utf-8", errors="replace") as fh:
        for line in fh:
            if line.startswith(">"):
                continue
            parts.append(line.strip().upper())
    return "".join(parts)


def trinucleotide_frequencies(seq: str) -> Dict[str, float]:
    """
    Compute background frequencies (%) of all overlapping trinucleotides.
    """
    counts = defaultdict(int)

    for i in range(len(seq) - 2):
        tri = seq[i : i + 3]
        if set(tri) <= {"A", "T", "C", "G"}:
            counts[tri] += 1

    total = sum(counts.values())
    if total == 0:
        return {}

    return {tri: (count / total) * 100 for tri, count in counts.items()}


def write_frequencies(freqs: Dict[str, float], out_path: str) -> None:
    with open(out_path, "w", encoding="utf-8") as out:
        out.write("Trinucleotide\tFrequency(%)\n")
        for tri in sorted(freqs):
            out.write(f"{tri}\t{freqs[tri]:.4f}\n")


if __name__ == "__main__":
    import sys

    if len(sys.argv) != 3:
        print("Usage: python trinucleotide_frequencies.py <genome.txt> <out.tsv>")
        sys.exit(1)

    in_path = sys.argv[1]
    out_path = sys.argv[2]

    seq = load_sequence(in_path)
    freqs = trinucleotide_frequencies(seq)
    write_frequencies(freqs, out_path)

    print(f"Wrote {len(freqs)} trinucleotide frequencies to {out_path}")
