# Day 07 – Container Integration

## Objective

Introduce Docker-based container execution.

---

## Technical Concept

- Enabled Docker in `nextflow.config`
- Added `container` directive to process
- Ensured execution inside Ubuntu 22.04 image
- Maintained parameter-driven threshold logic

---

## Biological Analogy

Cells operate within controlled environments.

Containers act as computational micro-environments.

They ensure stability and reproducibility.

---

## Run

nextflow run main.nf

Custom threshold:

nextflow run main.nf --threshold 60