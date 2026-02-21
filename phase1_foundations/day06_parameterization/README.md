# Day 06 – Parameterization & Dynamic Thresholds

## Objective

Remove hardcoded filtering thresholds and introduce runtime parameters.

---

## Technical Concept

- Introduced `params.threshold`
- Enabled command-line configuration
- Implemented dynamic filtering

---

## Biological Analogy

Cellular activation thresholds change depending on context.

Workflow pipelines should behave the same way.

Static thresholds limit adaptability.
Parameterization enables flexibility.

---

## Run

Default threshold:

nextflow run main.nf

Custom threshold:

nextflow run main.nf --threshold 60