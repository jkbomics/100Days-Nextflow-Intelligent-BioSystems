import pandas as pd
import numpy as np

np.random.seed(42)

df = pd.read_csv("evolutionary_adaptation.tsv", sep="\t")

systems = ["SysA", "SysB", "SysC", "SysD"]

results = []

for system in systems:

    variation = np.random.normal(1.0, 0.15)

    for _, row in df.iterrows():

        adjusted = row["AdjustedCapacity"] * variation

        # Population fitness classification
        if adjusted >= 90:
            fitness = "HIGH"

        elif adjusted >= 60:
            fitness = "MODERATE"

        else:
            fitness = "LOW"

        results.append({
            "System": system,
            "Time": row["Time"],
            "VariationFactor": round(variation, 2),
            "PopulationCapacity": round(adjusted, 2),
            "PopulationFitness": fitness
        })

out = pd.DataFrame(results)

out.to_csv("population_simulation.tsv", sep="\t", index=False)