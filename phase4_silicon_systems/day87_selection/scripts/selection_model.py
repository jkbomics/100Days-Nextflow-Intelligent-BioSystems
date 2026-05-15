import pandas as pd

df = pd.read_csv("population_simulation.tsv", sep="\t")

results = []

survival_score = {}

for system in df["System"].unique():

    sub = df[df["System"] == system]

    score = 0

    for _, row in sub.iterrows():

        fitness = row["PopulationFitness"]

        if fitness == "HIGH":
            score += 3

        elif fitness == "MODERATE":
            score += 1

        else:
            score -= 2

    survival_score[system] = score

# Classification
for system, score in survival_score.items():

    if score >= 7:
        status = "DOMINANT"

    elif score >= 2:
        status = "SURVIVING"

    else:
        status = "COLLAPSING"

    results.append({
        "System": system,
        "SurvivalScore": score,
        "SelectionStatus": status
    })

out = pd.DataFrame(results)

out.to_csv("selection_results.tsv", sep="\t", index=False)