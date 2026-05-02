import pandas as pd

anom = pd.read_csv("anomaly.tsv", sep="\t")
adapt = pd.read_csv("adaptive.tsv", sep="\t")
drift = pd.read_csv("drift.tsv", sep="\t")

df = anom.merge(adapt, on=["Time", "Gene"])
df = df.merge(drift, on="Time")

def decide(row):
    if row["Anomaly"] and row["Drift"]:
        return "High Risk"
    elif row["Anomaly"]:
        return "Moderate Risk"
    else:
        return "Stable"

df["Decision"] = df.apply(decide, axis=1)

df.to_csv("final_output.tsv", sep="\t", index=False)