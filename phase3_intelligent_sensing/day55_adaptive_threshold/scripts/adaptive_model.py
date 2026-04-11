import numpy as np
import pandas as pd

np.random.seed(42)

df = pd.read_csv("gene_expression.tsv", sep="\t")

genes = df["Gene"]
base = df["Expression"].values

# Simulate drift + disease
drift = np.random.normal(0, 5, len(base))
control = base + drift

perturbation = np.random.normal(10, 8, len(base))
disease = control + perturbation

# Baseline estimation
baseline = pd.Series(control).rolling(window=5, min_periods=1).mean()

# Deviation
delta = disease - baseline

# Adaptive threshold
mean = np.mean(delta)
std = np.std(delta)
k = 1.5

threshold = mean + k * std

anomaly = abs(delta) > threshold

out = pd.DataFrame({
    "Gene": genes,
    "Control": control,
    "Disease": disease,
    "Baseline": baseline,
    "Delta": delta,
    "Threshold": threshold,
    "Anomaly": anomaly
})

out.to_csv("adaptive_results.tsv", sep="\t", index=False)