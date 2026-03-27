# Day 40 — Stateful Workflows & Checkpointing

## Concept

This pipeline introduces state-aware execution by tracking processed samples.

## Features

- Skips already processed samples
- Processes only new data
- Maintains persistent state across runs

## Workflow

Input → Filter (new samples) → QC → Update State

## Run

nextflow run main.nf

## Example

Run 1:
- sample1 → processed

Run 2:
- sample1 → skipped
- sample2 → processed