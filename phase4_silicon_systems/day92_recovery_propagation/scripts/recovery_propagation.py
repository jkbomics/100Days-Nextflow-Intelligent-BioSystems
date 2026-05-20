import pandas as pd

df = pd.read_csv("node_resilience.tsv", sep="\t")

results = []

active_nodes = (df["NodeStatus"] == "ACTIVE").sum()

for _, row in df.iterrows():

    node = row["Node"]
    status = row["NodeStatus"]

    recovery_support = active_nodes * 0.15

    if status == "FAILED":

        # Recovery chance increases with active neighbors
        if recovery_support >= 0.3:
            new_status = "RECOVERED"

        else:
            new_status = "FAILED"

    else:
        new_status = "STABLE"

    results.append({
        "Node": node,
        "OriginalStatus": status,
        "RecoverySupport": round(recovery_support, 2),
        "UpdatedStatus": new_status
    })

out = pd.DataFrame(results)

out.to_csv("recovery_propagation.tsv", sep="\t", index=False)