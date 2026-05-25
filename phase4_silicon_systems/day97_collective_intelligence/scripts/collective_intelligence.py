import pandas as pd

df = pd.read_csv("meta_adaptation.tsv", sep="\t")

results = []

# Network-level learning score
network_efficiency = df["AdaptationEfficiency"].mean()

for _, row in df.iterrows():

    node = row["Node"]
    local_efficiency = row["AdaptationEfficiency"]

    # Collective adjustment
    collective_gain = network_efficiency - local_efficiency

    updated_efficiency = local_efficiency + (collective_gain * 0.5)

    # Collective intelligence state
    if updated_efficiency >= 1.2:
        intelligence_state = "HIGH_COLLECTIVE_ALIGNMENT"

    elif updated_efficiency >= 0.9:
        intelligence_state = "MODERATE_ALIGNMENT"

    else:
        intelligence_state = "LOW_ALIGNMENT"

    results.append({
        "Node": node,
        "OriginalEfficiency": local_efficiency,
        "UpdatedEfficiency": round(updated_efficiency, 2),
        "CollectiveState": intelligence_state
    })

out = pd.DataFrame(results)

out.to_csv("collective_intelligence.tsv", sep="\t", index=False)