# Day 27 — Expression Matrix Generation

## Objective

Convert raw featureCounts output into a clean gene expression matrix suitable for downstream analysis.

## Pipeline

FASTQ
 ↓
FastQC
 ↓
Trim Galore
 ↓
STAR
 ↓
SAMtools Index
 ↓
Alignment Statistics
 ↓
featureCounts
 ↓
Expression Matrix

## Output

results/expression_matrix/expression_matrix.tsv

This matrix can be used directly with tools such as DESeq2 or edgeR.