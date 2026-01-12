# Sequence Parsing Toolkit

A small collection of Python utilities for common bioinformatics text-processing tasks,
originally developed during my M.S. in Biotechnology (Bioinformatics).

These scripts demonstrate:
- FASTA and BLAST output parsing
- Regular-expression–based sequence matching
- File I/O and dictionary construction
- Trinucleotide frequency analysis

## Tools & Skills
Python • Regex • FASTA • BLAST • File Parsing • Basic Bioinformatics Pipelines

## Included Scripts
- `upstream_atg.py` – Extracts 20 bases upstream of a start codon (ATG)
- `key_value_parser.py` – Builds dictionaries from paired text files
- `trinucleotide_frequencies.py` – Computes background frequencies of trinucleotides
- `fasta_header_parser.py` – Parses FASTA headers for metadata
- `blast_parser.py` – Extracts key fields from BLAST results

Each script is intentionally small and focused, reflecting how bioinformatics tasks are
often built as composable utilities.

Future improvements include:
- Input validation and edge-case handling
- Unit tests for each module
- CLI argument parsing

