import pandas as pd

df = pd.read_csv("streaming.tsv", sep="\t")

results = []
prev_mean = None

for t in sorted(df["Time"].unique()):
    sub = df[df["Time"] == t]
    mean_val = sub["Expression"].mean()

    drift = False
    if prev_mean is not None:
        drift = abs(mean_val - prev_mean) > 5

    results.append({
        "Time": t,
        "Mean": mean_val,
        "Drift": drift
    })

    prev_mean = mean_val

pd.DataFrame(results).to_csv("drift.tsv", sep="\t", index=False)