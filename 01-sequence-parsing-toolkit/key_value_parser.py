"""
Parse paired text into a dictionary.

Given a file where each line contains two whitespace-separated strings,
this utility constructs a dictionary using the first string as the key
and the second string as the value.

Example input file:
    geneA protein1
    geneB protein2
"""

from typing import Dict


def parse_key_value_file(path: str) -> Dict[str, str]:
    """
    Read a two-column text file and return a dictionary mapping
    the first column to the second.

    Parameters
    ----------
    path : str
        Path to the input file.

    Returns
    -------
    Dict[str, str]
        Dictionary of key-value pairs.
    """
    mapping: Dict[str, str] = {}

    with open(path, "r") as fh:
        for line in fh:
            line = line.strip()
            if not line:
                continue  # skip empty lines

            parts = line.split()
            if len(parts) != 2:
                raise ValueError(f"Invalid line format: {line}")

            key, value = parts
            mapping[key] = value

    return mapping


if __name__ == "__main__":
    import sys

    if len(sys.argv) != 2:
        print("Usage: python key_value_parser.py <input_file>")
        sys.exit(1)

    infile = sys.argv[1]
    result = parse_key_value_file(infile)

    for k, v in result.items():
        print(f"{k}\t{v}")
