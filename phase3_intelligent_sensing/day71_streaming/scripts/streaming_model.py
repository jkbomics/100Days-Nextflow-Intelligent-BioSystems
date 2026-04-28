import numpy as np
import pandas as pd

np.random.seed(42)

df = pd.read_csv("base_expression.tsv", sep="\t")

genes = df["Gene"]
base = df["Expression"].values

time_points = 10

records = []

for t in range(time_points):

    # Drift over time
    drift = t * 0.8

    # Noise
    noise = np.random.normal(0, 3, len(base))

    # Occasional spike (simulate event)
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

out = pd.DataFrame(records)
out.to_csv("streaming_expression.tsv", sep="\t", index=False)