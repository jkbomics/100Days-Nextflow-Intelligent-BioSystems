# Day 20 – Mini RNA-Seq Pipeline Skeleton

## Objective

Combine workflow engineering primitives into a structured RNA-Seq pipeline architecture.

Pipeline structure:

FASTQ → QC → Trim → Align → Count

---

## Technical Concepts Demonstrated

- DSL2 modular pipelines
- Multi-stage workflow orchestration
- Resource configuration
- Execution monitoring
- Parallel sample processing

---

## Run

nextflow run main.nf