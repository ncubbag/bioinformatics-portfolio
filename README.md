# Bioinformatics Portfolio

This is a curated collection of programming and data projects completed during my M.S. in Biotechnology with a specialization in Bioinformatics and refined thereafter. 

---

## 1. Sequence Parsing Toolkit (Python)

A small collection of Python utilities for common bioinformatics text-processing tasks.

These scripts demonstrate:
- FASTA and BLAST output parsing  
- Regular-expression–based sequence matching  
- File I/O and dictionary construction  
- Trinucleotide frequency analysis  

### Tools & Skills
Python • Regex • FASTA • BLAST • File Parsing • Basic Bioinformatics Pipelines

### Included Scripts
- `upstream_atg.py` – Extracts 20 bases upstream of a start codon (ATG)  
- `key_value_parser.py` – Builds dictionaries from paired text files  
- `trinucleotide_frequencies.py` – Computes background frequencies of trinucleotides  
- `fasta_header_parser.py` – Parses FASTA headers for metadata  
- `blast_parser.py` – Extracts key fields from BLAST results  
- `restriction_enzyme_cuts.py` – Reads FASTA sequences and a restriction enzyme library to identify which enzymes cut each sequence and report cut positions  

Each script is intentionally small and focused, reflecting how bioinformatics tasks are often built as
composable utilities.

Future improvements include:
- CLI argument parsing  

---

## 2. Java FASTA & Text Utilities

Small Java programs illustrating file I/O, user interaction, and structured output.

- `FastaCollector.java` – Interactive program that collects clone IDs and DNA sequences from user input, writes them to disk in FASTA format, and echoes all entries upon exit  
- `WordCounter.java` – Counts words in a text file and outputs a sorted frequency table of unique tokens  

These exercises demonstrate core software engineering concepts in a bioinformatics context.

---

## 3. Sensory Integration Database (SQL Project)

A relational database modeling how human sensory systems interact, capturing stimuli, measurements,
and responses across multiple modalities (auditory, visual, nociceptive, gustatory, etc.).

The schema was designed from formal requirements, translated into an ERD, and implemented using
production-style SQL (DDL, DML, views, sequences, and triggers).

### Project Artifacts

- `requirements-definition-document.sql`  
  A structured requirements specification describing each entity, attribute, and business meaning.  
  This document captures the conceptual model before implementation and mirrors how database design
  is performed in professional environments.

- `Cubbage_Nichole_ERD.erd`  
  Entity–Relationship Diagram (crow’s foot notation) generated from the requirements.

- `ddl-source-code.sql`  
  Data Definition Language (DDL) used to create all tables, constraints, indexes, views, sequences,
  and triggers.

- `dml-source-code.sql`  
  Seed and test data used to populate the schema and validate relational behavior.

This project demonstrates:
- Requirements-driven database design  
- Fully normalized relational modeling  
- Referential integrity and constraint design  
- Use of views, indexes, sequences, and triggers  
- Translating domain knowledge into structured data systems
