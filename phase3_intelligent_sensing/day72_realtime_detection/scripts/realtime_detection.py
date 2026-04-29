import pandas as pd

df = pd.read_csv("streaming_expression.tsv", sep="\t")

# Sort by time
df = df.sort_values(["Gene", "Time"])

results = []

window = 3
k = 2

for gene in df["Gene"].unique():
    sub = df[df["Gene"] == gene].copy()

    sub["RollingMean"] = sub["Expression"].rolling(window, min_periods=1).mean()
    sub["RollingStd"] = sub["Expression"].rolling(window, min_periods=1).std().fillna(0)

    sub["Deviation"] = abs(sub["Expression"] - sub["RollingMean"])
    sub["Anomaly"] = sub["Deviation"] > (k * sub["RollingStd"])

    results.append(sub)

out = pd.concat(results)
out.to_csv("realtime_anomalies.tsv", sep="\t", index=False)