# Day 03 – Process Isolation & Modular Design

## Objective

Design processes that perform a single responsibility.

Each process:
- Receives defined input
- Performs one transformation
- Produces controlled output

---

## Technical Concept

Three isolated processes:

1. LOAD_DATA
2. NORMALIZE_DATA
3. SUMMARIZE_DATA

They are chained via channels.

This structure enables:
- Reusability
- Testability
- Scalability

---

## Biological Analogy

In cellular systems:

- Enzymes perform single reactions.
- They do not manage the entire pathway.
- Modularity enables robustness.

In workflow systems:

- Each process acts like an enzyme.
- Channels act as substrates.
- The workflow defines pathway order.

---

## Key Insight

Good pipelines are not large scripts.

They are networks of small, isolated computational reactions.

---

## Run

```bash
nextflow run main.nf
```