import pandas as pd

df = pd.read_csv("hierarchical_intelligence.tsv", sep="\t")

results = []

adaptation_efficiency = {
    "GLOBAL_LAYER": 1.3,
    "REGIONAL_LAYER": 1.0,
    "LOCAL_LAYER": 0.7
}

for _, row in df.iterrows():

    node = row["Node"]
    layer = row["HierarchyLayer"]
    control = row["ControlMode"]

    efficiency = adaptation_efficiency[layer]

    # Meta-adaptation behavior
    if efficiency >= 1.2:
        strategy = "OPTIMIZED_ADAPTATION"

    elif efficiency >= 0.9:
        strategy = "BALANCED_ADAPTATION"

    else:
        strategy = "REACTIVE_ADAPTATION"

    results.append({
        "Node": node,
        "HierarchyLayer": layer,
        "AdaptationEfficiency": efficiency,
        "MetaStrategy": strategy
    })

out = pd.DataFrame(results)

out.to_csv("meta_adaptation.tsv", sep="\t", index=False)