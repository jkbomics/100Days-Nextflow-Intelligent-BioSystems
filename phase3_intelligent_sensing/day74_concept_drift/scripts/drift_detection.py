import pandas as pd

df = pd.read_csv("streaming_expression.tsv", sep="\t")

df = df.sort_values(["Time"])

threshold = 5  # drift sensitivity

results = []

prev_mean = None

for t in sorted(df["Time"].unique()):
    
    batch = df[df["Time"] == t]
    current_mean = batch["Expression"].mean()

    if prev_mean is None:
        drift = False
    else:
        drift = abs(current_mean - prev_mean) > threshold

    results.append({
        "Time": t,
        "MeanExpression": current_mean,
        "DriftDetected": drift
    })

    prev_mean = current_mean

out = pd.DataFrame(results)
out.to_csv("drift_results.tsv", sep="\t", index=False)