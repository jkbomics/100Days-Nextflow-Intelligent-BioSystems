import pandas as pd

df = pd.read_csv("resource_adaptation.tsv", sep="\t")

results = []

for i in range(len(df)):

    row = df.iloc[i]

    pool = row["ResourcePool"]

    # Predictive logic
    if pool < 50:
        prediction = "HIGH_FAILURE_RISK"

    elif pool < 75:
        prediction = "MODERATE_RISK"

    else:
        prediction = "LOW_RISK"

    results.append({
        "Time": row["Time"],
        "ResourcePool": pool,
        "PredictedRisk": prediction
    })

out = pd.DataFrame(results)

out.to_csv("predictive_failure.tsv", sep="\t", index=False)