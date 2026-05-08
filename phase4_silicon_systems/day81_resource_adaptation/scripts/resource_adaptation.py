import pandas as pd

df = pd.read_csv("system_coordination.tsv", sep="\t")

results = []

resource_pool = 100

for _, row in df.iterrows():

    state = row["SystemState"]

    if state == "CRITICAL":
        resource_pool -= 15
        compensation = "HIGH"

    elif state == "UNSTABLE":
        resource_pool -= 5
        compensation = "MODERATE"

    else:
        resource_pool += 3
        compensation = "LOW"

    # Boundaries
    resource_pool = max(20, min(resource_pool, 100))

    results.append({
        "Time": row["Time"],
        "SystemState": state,
        "CompensationLevel": compensation,
        "ResourcePool": resource_pool
    })

out = pd.DataFrame(results)

out.to_csv("resource_adaptation.tsv", sep="\t", index=False)