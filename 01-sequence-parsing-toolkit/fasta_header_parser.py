"""
Parse contig metadata from FASTA headers.

Expected header format (example-ish):
> MID2 contig123 length=456 numreads=78

This script extracts:
- MID tag (e.g., MID2)
- contig id (e.g., contig123)
- length (integer)
- numreads (integer)

Writes a TSV summary.
"""

from __future__ import annotations

import re
from dataclasses import dataclass
from typing import Iterable, List, Optional


@dataclass
class ContigRecord:
    mid: str
    contig: str
    length: int
    numreads: int


# Example matches:
# "MID2" anywhere in header
_MID_RE = re.compile(r"\b(MID\d+)\b", re.IGNORECASE)
# "contig123" (contig + digits)
_CONTIG_RE = re.compile(r"\b(contig\d+)\b", re.IGNORECASE)
# "length=456"
_LENGTH_RE = re.compile(r"\blength=(\d+)\b", re.IGNORECASE)
# "numreads=78"
_NUMREADS_RE = re.compile(r"\bnumreads=(\d+)\b", re.IGNORECASE)


def parse_fasta_headers(lines: Iterable[str]) -> List[ContigRecord]:
    """
    Scan FASTA file lines and parse metadata from header lines beginning with '>'.
    """
    records: List[ContigRecord] = []

    for line in lines:
        if not line.startswith(">"):
            continue

        header = line[1:].strip()  # remove leading '>'

        mid_m = _MID_RE.search(header)
        contig_m = _CONTIG_RE.search(header)
        length_m = _LENGTH_RE.search(header)
        numreads_m = _NUMREADS_RE.search(header)

        # Skip headers that don't match the expected metadata pattern
        if not (mid_m and contig_m and length_m and numreads_m):
            continue

        records.append(
            ContigRecord(
                mid=mid_m.group(1),
                contig=contig_m.group(1),
                length=int(length_m.group(1)),
                numreads=int(numreads_m.group(1)),
            )
        )

    return records


def write_records_tsv(records: List[ContigRecord], out_path: str) -> None:
    with open(out_path, "w", encoding="utf-8") as out:
        out.write("MID\tContig\tLength\tNumReads\n")
        for r in records:
            out.write(f"{r.mid}\t{r.contig}\t{r.length}\t{r.numreads}\n")


if __name__ == "__main__":
    import sys

    if len(sys.argv) != 3:
        print("Usage: python fasta_header_parser.py <input.fna> <out.tsv>")
        sys.exit(1)

    in_path = sys.argv[1]
    out_path = sys.argv[2]

    with open(in_path, "r", encoding="utf-8", errors="replace") as fh:
        records = parse_fasta_headers(fh)

    write_records_tsv(records, out_path)
    print(f"Wrote {len(records)} record(s) to {out_path}")
