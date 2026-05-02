import pandas as pd

df = pd.read_csv("streaming.tsv", sep="\t")

results = []

for gene in df["Gene"].unique():
    sub = df[df["Gene"] == gene].copy()
    sub["Mean"] = sub["Expression"].rolling(3, min_periods=1).mean()
    sub["Std"] = sub["Expression"].rolling(3, min_periods=1).std().fillna(0)

    sub["Anomaly"] = abs(sub["Expression"] - sub["Mean"]) > (2 * sub["Std"])
    results.append(sub)

pd.concat(results).to_csv("anomaly.tsv", sep="\t", index=False)