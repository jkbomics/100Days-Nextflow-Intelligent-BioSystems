import pandas as pd

df = pd.read_csv("silicon_stream.tsv", sep="\t")

results = []

window = 3
threshold_k = 2

for comp in df["Component"].unique():
    sub = df[df["Component"] == comp].copy()

    sub["RollingMean"] = sub["Signal"].rolling(window, min_periods=1).mean()
    sub["RollingStd"] = sub["Signal"].rolling(window, min_periods=1).std().fillna(0)

    sub["Deviation"] = abs(sub["Signal"] - sub["RollingMean"])
    sub["Anomaly"] = sub["Deviation"] > (threshold_k * sub["RollingStd"])

    results.append(sub)

out = pd.concat(results)
out.to_csv("silicon_anomalies.tsv", sep="\t", index=False)