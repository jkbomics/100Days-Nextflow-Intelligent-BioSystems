import pandas as pd

df = pd.read_csv("self_healing.tsv", sep="\t")

results = []

aging_factor = 0

for _, row in df.iterrows():

    pool = row["RecoveredPool"]

    # Aging accumulates gradually
    aging_factor += 2

    effective_capacity = pool - aging_factor

    # Lifecycle state
    if effective_capacity >= 75:
        lifecycle_state = "HEALTHY"

    elif effective_capacity >= 50:
        lifecycle_state = "AGING"

    else:
        lifecycle_state = "DEGRADING"

    results.append({
        "Time": row["Time"],
        "RecoveredPool": pool,
        "AgingFactor": aging_factor,
        "EffectiveCapacity": effective_capacity,
        "LifecycleState": lifecycle_state
    })

out = pd.DataFrame(results)

out.to_csv("lifecycle_simulation.tsv", sep="\t", index=False)