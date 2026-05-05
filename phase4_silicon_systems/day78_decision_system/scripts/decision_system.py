import pandas as pd

df = pd.read_csv("silicon_anomalies.tsv", sep="\t")

def decide(row):
    if row["Anomaly"] and row["Deviation"] > 15:
        return "ALERT"
    elif row["Anomaly"]:
        return "WARNING"
    else:
        return "STABLE"

df["Decision"] = df.apply(decide, axis=1)

df.to_csv("decision_output.tsv", sep="\t", index=False)