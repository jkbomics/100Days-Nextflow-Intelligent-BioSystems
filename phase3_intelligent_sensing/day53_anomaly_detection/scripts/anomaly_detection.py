import pandas as pd

df = pd.read_csv("control_vs_disease.tsv", sep="\t")

# Compute fold change (difference)
df["Delta"] = df["Disease"] - df["Control"]

# Simple anomaly threshold
threshold = 20

df["Anomaly"] = df["Delta"].abs() > threshold

df.to_csv("anomaly_results.tsv", sep="\t", index=False)