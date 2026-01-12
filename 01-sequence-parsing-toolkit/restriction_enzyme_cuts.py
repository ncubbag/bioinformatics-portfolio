#!/usr/bin/env python3
"""
Question 6 — Restriction enzyme cut-site finder

Reads:
  1) A FASTA file of DNA sequences
  2) An enzyme library file (e.g., "Staden_Link.txt") containing enzyme names and recognition sites

Outputs:
  For each FASTA record, prints the enzymes that cut the sequence and the cut positions.

Notes on enzyme file parsing:
- Lines starting with "Rich", "REBASE", or blank lines are ignored (common in some datasets).
- We expect each usable line to contain fields separated by "/" where:
    first field  = enzyme name
    last field   = recognition site (may contain a cut marker)
- Cut marker support:
    "^" indicates the cut position within the recognition site (e.g., G^AATTC).
    If no marker is found, cut position defaults to the start of the match.

Cut positions:
- Reported as 1-based positions in the sequence (more human-friendly for bio).
"""

from __future__ import annotations

import re
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, List, Tuple


IUPAC_TO_REGEX: Dict[str, str] = {
    "A": "A",
    "C": "C",
    "G": "G",
    "T": "T",
    "R": "[AG]",
    "Y": "[CT]",
    "M": "[AC]",
    "K": "[GT]",
    "S": "[GC]",
    "W": "[AT]",
    "B": "[CGT]",
    "D": "[AGT]",
    "H": "[ACT]",
    "V": "[ACG]",
    "N": "[ACGT]",
}


@dataclass(frozen=True)
class Enzyme:
    name: str
    site: str                 # recognition site with markers removed
    cut_offset: int           # 0-based offset from start of match where cut occurs
    regex: re.Pattern         # compiled regex for the recognition site


def read_fasta(path: str | Path) -> List[Tuple[str, str]]:
    """
    Minimal FASTA parser: returns list of (header, sequence).
    """
    records: List[Tuple[str, str]] = []
    header: str | None = None
    seq_chunks: List[str] = []

    with open(path, "r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            if line.startswith(">"):
                if header is not None:
                    records.append((header, "".join(seq_chunks).upper()))
                header = line[1:].strip()
                seq_chunks = []
            else:
                seq_chunks.append(line)

    if header is not None:
        records.append((header, "".join(seq_chunks).upper()))

    return records


def iupac_site_to_regex(site: str) -> str:
    """
    Convert an IUPAC recognition site into a regex string.
    """
    out = []
    for ch in site.upper():
        if ch in IUPAC_TO_REGEX:
            out.append(IUPAC_TO_REGEX[ch])
        else:
            raise ValueError(f"Unsupported character in site: {ch!r}")
    return "".join(out)


def parse_site_and_cut(site_raw: str) -> Tuple[str, int]:
    """
    Parse a recognition site that may include a cut marker.

    Supports:
      - "G^AATTC"  -> site="GAATTC", cut_offset=1 (cut after 'G')
      - "GAATTC"   -> site="GAATTC", cut_offset=0 (default: at match start)

    Returns:
      (site_without_markers, cut_offset)
    """
    s = site_raw.strip().upper()

    if "^" in s:
        cut_offset = s.index("^")
        site = s.replace("^", "")
        return site, cut_offset

    # If you later discover your file uses a different marker (e.g., "|"),
    # add it here the same way as "^".

    return s, 0


def read_enzymes(path: str | Path) -> List[Enzyme]:
    """
    Reads an enzyme library file.

    Expected (tolerant) format:
      EnzymeName / ... / RecognitionSite

    Example line:
      EcoRI/.../G^AATTC
    """
    enzymes: List[Enzyme] = []

    with open(path, "r", encoding="utf-8", errors="replace") as f:
        for raw in f:
            line = raw.strip()
            if not line:
                continue
            if line.startswith("Rich") or line.startswith("REBASE"):
                continue

            # Split on "/" like you were doing; grab name and last field as site.
            parts = [p.strip() for p in line.split("/") if p.strip()]
            if len(parts) < 2:
                continue

            name = parts[0]
            site_raw = parts[-1]

            # Remove quotes if present
            name = name.replace('"', "").replace("'", "")
            site_raw = site_raw.replace('"', "").replace("'", "")

            site, cut_offset = parse_site_and_cut(site_raw)

            # Skip obviously non-site lines
            if not site or any(ch not in IUPAC_TO_REGEX for ch in site):
                continue

            regex_str = iupac_site_to_regex(site)
            compiled = re.compile(regex_str)

            enzymes.append(Enzyme(name=name, site=site, cut_offset=cut_offset, regex=compiled))

    return enzymes


def find_cut_positions(sequence: str, enzyme: Enzyme) -> List[int]:
    """
    Returns 1-based cut positions for an enzyme in the given sequence.

    If a match starts at index i (0-based), the cut occurs at i + enzyme.cut_offset.
    We return cut positions as 1-based coordinates for readability.
    """
    cuts: List[int] = []
    for m in enzyme.regex.finditer(sequence):
        cut_0_based = m.start() + enzyme.cut_offset
        cuts.append(cut_0_based + 1)  # convert to 1-based
    return cuts


def main(
    fasta_path: str = "SeqLibrary.fasta",
    enzyme_path: str = "Staden_Link.txt",
) -> None:
    sequences = read_fasta(fasta_path)
    enzymes = read_enzymes(enzyme_path)

    if not sequences:
        raise SystemExit(f"No FASTA records found in {fasta_path!r}")
    if not enzymes:
        raise SystemExit(f"No enzymes parsed from {enzyme_path!r}. Check the file format.")

    for header, seq in sequences:
        print("=" * 72)
        print(f">{header}")
        print(f"Length: {len(seq)}")
        print()

        hits = []
        for enz in enzymes:
            cuts = find_cut_positions(seq, enz)
            if cuts:
                hits.append((enz.name, enz.site, cuts))

        if not hits:
            print("No restriction enzymes (from provided library) cut this sequence.")
            continue

        print("Enzyme\tRecognitionSite\tCutPositions(1-based)")
        for name, site, cuts in hits:
            cut_str = ",".join(map(str, cuts))
            print(f"{name}\t{site}\t{cut_str}")


if __name__ == "__main__":
    # Change defaults here to match your filenames, or call main() with your paths.
    main(fasta_path="SeqLibrary.txt", enzyme_path="Staden_Link.txt")
