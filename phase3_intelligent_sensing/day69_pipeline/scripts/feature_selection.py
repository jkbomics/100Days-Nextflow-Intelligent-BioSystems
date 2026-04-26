import pandas as pd

df = pd.read_csv("expression_matrix.tsv", sep="\t")

# Simple ranking
df["Score"] = abs(df.iloc[:,1:].mean(axis=1))

top = df.sort_values(by="Score", ascending=False).head(5)

top.to_csv("selected_genes.tsv", sep="\t", index=False)