# Day 28 — Metadata Integration and Design Matrix Generation

## Objective

Integrate experimental metadata into the RNA-Seq pipeline and generate a design matrix for downstream statistical analysis.

## Pipeline

FASTQ
 ↓
FastQC
 ↓
Trim Galore
 ↓
STAR
 ↓
SAMtools
 ↓
featureCounts
 ↓
Expression Matrix
 ↓
Design Matrix

## Output

results/design_matrix/design_matrix.tsv

The design matrix describes the experimental conditions associated with each sample and is used by differential expression tools such as DESeq2.