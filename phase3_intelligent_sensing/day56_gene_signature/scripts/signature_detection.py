import pandas as pd

df = pd.read_csv("control_vs_disease.tsv", sep="\t")

# Compute signal (difference)
df["Delta"] = df["Disease"] - df["Control"]

# Select top informative genes (signature)
top_genes = df.reindex(df["Delta"].abs().sort_values(ascending=False).index).head(5)

# Simple detection rule
threshold = 20
top_genes["Signal_Detected"] = top_genes["Delta"].abs() > threshold

top_genes.to_csv("gene_signature.tsv", sep="\t", index=False)