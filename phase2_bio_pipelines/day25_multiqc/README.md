# Day 25 — MultiQC Report Aggregation

## Objective

Aggregate results from multiple RNA-Seq processing tools into a unified report.

Pipeline:

FASTQ → FastQC → Trim Galore → STAR → MultiQC

## Technical Concepts

- QC aggregation
- pipeline-wide reporting
- automated result dashboards

## Run

nextflow run main.nf