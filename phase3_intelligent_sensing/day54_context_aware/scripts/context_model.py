import numpy as np
import pandas as pd

np.random.seed(42)

df = pd.read_csv("gene_expression.tsv", sep="\t")

genes = df["Gene"]
base = df["Expression"].values

# Simulate baseline drift (control variation)
drift = np.random.normal(0, 5, len(base))
control = base + drift

# Simulate disease perturbation
perturbation = np.random.normal(10, 8, len(base))
disease = control + perturbation

# Estimate baseline (moving average)
baseline_est = pd.Series(control).rolling(window=5, min_periods=1).mean()

# Context-aware deviation
delta = disease - baseline_est

# Detect anomalies relative to baseline
threshold = 15
anomaly = abs(delta) > threshold

out = pd.DataFrame({
    "Gene": genes,
    "Control": control,
    "Disease": disease,
    "Baseline_Est": baseline_est,
    "Delta": delta,
    "Anomaly": anomaly
})

out.to_csv("context_aware_results.tsv", sep="\t", index=False)