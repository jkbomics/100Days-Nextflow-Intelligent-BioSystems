# Day 24 — Gene Quantification with featureCounts

## Objective

Quantify RNA-Seq reads at the gene level using featureCounts.

Pipeline:

FASTQ → FastQC → Trim Galore → STAR → featureCounts

## Technical Concepts

- BAM-based read summarization
- gene-level quantification
- annotation-driven counting
- generation of count matrices for differential expression

## Run

nextflow run main.nf