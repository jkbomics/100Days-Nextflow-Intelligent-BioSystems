import pandas as pd

df = pd.read_csv("decision_output.tsv", sep="\t")

results = []

# Initial adaptive threshold
threshold = 10

for _, row in df.iterrows():

    decision = row["Decision"]

    # Adaptive feedback logic
    if decision == "ALERT":
        threshold += 2

    elif decision == "STABLE":
        threshold = max(5, threshold - 1)

    results.append({
        "Time": row["Time"],
        "Component": row["Component"],
        "Decision": decision,
        "AdaptiveThreshold": threshold
    })

out = pd.DataFrame(results)

out.to_csv("adaptive_feedback.tsv", sep="\t", index=False)