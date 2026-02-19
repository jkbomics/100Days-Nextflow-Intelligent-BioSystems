# Day 04 – Channel Branching & Parallel Signal Amplification

## Objective

Understand how one channel can feed multiple processes.

This introduces implicit parallelism.

---

## Technical Concept

One channel → Two independent downstream processes.

- TO_UPPER
- COUNT_LINES

Both operate on the same upstream signal.

---

## Biological Analogy

In cellular systems:

One activated receptor can trigger multiple signaling pathways.

Signal amplification enables complex responses.

In workflow systems:

A channel can branch into multiple computational reactions.

This forms a directed execution graph.

---

## Key Insight

Parallelism is not manually controlled.

It emerges naturally from channel design.

---

## Run

```bash
nextflow run main.nf
```