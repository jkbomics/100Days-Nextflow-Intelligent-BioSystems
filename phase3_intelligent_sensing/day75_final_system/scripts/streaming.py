import numpy as np
import pandas as pd

np.random.seed(42)

df = pd.read_csv("base_expression.tsv", sep="\t")

genes = df["Gene"]
base = df["Expression"].values

records = []
time_points = 10

for t in range(time_points):
    drift = t * 0.8
    noise = np.random.normal(0, 3, len(base))

    spike = np.zeros(len(base))
    if t == 6:
        spike += np.random.normal(15, 5, len(base))

    observed = base + drift + noise + spike

    for i, gene in enumerate(genes):
        records.append({
            "Time": t,
            "Gene": gene,
            "Expression": observed[i]
        })

pd.DataFrame(records).to_csv("streaming.tsv", sep="\t", index=False)