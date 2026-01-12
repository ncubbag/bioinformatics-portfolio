"""
Parse key summary fields from a BLAST text output file.

Extracts:
- Query (from lines like: "Query= ...")
- Best hit (from lines beginning with: ">")
- E-value (from lines containing: "Expect = ...")
- Identities (from lines containing: "Identities = ...")

Outputs a tab-delimited table suitable for quick review.
"""

from __future__ import annotations

import re
from dataclasses import dataclass
from typing import Iterable, List, Optional


@dataclass
class BlastHit:
    query: str
    best_hit: str
    e_value: str
    identities: str


_QUERY_RE = re.compile(r"^\s*Query=\s*(.+)\s*$")
_HIT_RE = re.compile(r"^\s*>\s*(.+)\s*$")
# Handles: Expect = 2e-10   OR  Expect(2) = 0.001  OR  Expect = 0.0
_EVALUE_RE = re.compile(r"Expect(?:\(\d+\))?\s*=\s*([^\s,]+)")
# Handles: Identities = 45/100 (45%)  OR variations with spaces
_IDENTITIES_RE = re.compile(r"Identities\s*=\s*([0-9]+/[0-9]+)\s*\(([^)]+)\)")


def parse_blast_output(lines: Iterable[str]) -> List[BlastHit]:
    """
    Parse BLAST output lines into a list of BlastHit records.
    """
    hits: List[BlastHit] = []

    current_query: Optional[str] = None
    current_best_hit: Optional[str] = None
    current_evalue: Optional[str] = None
    current_identities: Optional_
