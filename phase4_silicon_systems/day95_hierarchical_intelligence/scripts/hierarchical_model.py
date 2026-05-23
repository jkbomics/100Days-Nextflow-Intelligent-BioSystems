import pandas as pd

df = pd.read_csv("self_organized_network.tsv", sep="\t")

results = []

for _, row in df.iterrows():

    node = row["Node"]
    role = row["NetworkRole"]
    connectivity = row["ConnectivityLevel"]

    # Layer assignment
    if role == "CORE_NODE":
        hierarchy = "GLOBAL_LAYER"

    elif role == "SUPPORT_NODE":
        hierarchy = "REGIONAL_LAYER"

    else:
        hierarchy = "LOCAL_LAYER"

    # Intelligence behavior
    if hierarchy == "GLOBAL_LAYER":
        control_mode = "SYSTEM_ORCHESTRATION"

    elif hierarchy == "REGIONAL_LAYER":
        control_mode = "COORDINATED_ADAPTATION"

    else:
        control_mode = "LOCAL_RESPONSE"

    results.append({
        "Node": node,
        "HierarchyLayer": hierarchy,
        "ControlMode": control_mode,
        "ConnectivityLevel": connectivity
    })

out = pd.DataFrame(results)

out.to_csv("hierarchical_intelligence.tsv", sep="\t", index=False)