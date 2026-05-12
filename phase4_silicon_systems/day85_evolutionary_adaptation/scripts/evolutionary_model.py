import pandas as pd

df = pd.read_csv("lifecycle_simulation.tsv", sep="\t")

results = []

adaptation_score = 1.0

for _, row in df.iterrows():

    capacity = row["EffectiveCapacity"]
    state = row["LifecycleState"]

    # Evolutionary adjustment
    if state == "DEGRADING":
        adaptation_score += 0.3

    elif state == "AGING":
        adaptation_score += 0.1

    else:
        adaptation_score -= 0.05

    adaptation_score = max(0.5, min(adaptation_score, 3.0))

    adjusted_capacity = capacity * adaptation_score

    # Evolutionary fitness
    if adjusted_capacity >= 80:
        fitness = "HIGH"

    elif adjusted_capacity >= 50:
        fitness = "MODERATE"

    else:
        fitness = "LOW"

    results.append({
        "Time": row["Time"],
        "AdaptationScore": round(adaptation_score, 2),
        "AdjustedCapacity": round(adjusted_capacity, 2),
        "FitnessLevel": fitness
    })

out = pd.DataFrame(results)

out.to_csv("evolutionary_adaptation.tsv", sep="\t", index=False)