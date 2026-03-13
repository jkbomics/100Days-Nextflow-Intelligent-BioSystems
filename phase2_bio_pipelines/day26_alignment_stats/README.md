# Day 26 — BAM Indexing and Alignment Statistics

## Objective

Add post-alignment processing to the RNA-Seq pipeline.

This stage generates:

• BAM index files (.bai)  
• alignment statistics reports  

These outputs allow quality assessment of alignment performance and enable efficient access to genomic coordinates.

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
SAMtools Flagstat
 ↓
featureCounts

## Tools Used

FastQC — sequencing quality control  
Trim Galore — adapter trimming  
STAR — RNA-seq alignment  
SAMtools — BAM indexing and statistics  
featureCounts — gene quantification

## Run

nextflow run main.nf