# Day 02 – Channels as Signal Propagation

## Objective

Understand how data flows through Nextflow using channels.

Unlike variables, channels represent asynchronous data streams.

---

## Technical Concept

- Channel.fromPath() emits a file object.
- The file flows into READ_SIGNAL.
- Output streams into TRANSFORM_SIGNAL.
- Final output is observed with `.view()`.

This demonstrates:

Data → Channel → Process → Transformation → Output

---

## Biological Analogy

Biological systems rely on signaling cascades:

Signal → Receptor → Amplification → Response

In workflow systems:

Input → Process → Transformation → Output

Channels are equivalent to molecular signal propagation.

They carry information forward without duplication.

---

## Key Insight

Channels are not storage containers.

They are directed streams.

This design enables scalability and parallelism.

---

## How to Run

```bash
nextflow run main.nf
```

