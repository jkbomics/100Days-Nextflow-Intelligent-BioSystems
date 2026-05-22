import pandas as pd

df = pd.read_csv("optimized_communication.tsv", sep="\t")

results = []

for _, row in df.iterrows():

    node = row["Node"]
    status = row["UpdatedStatus"]
    load = row["CommunicationLoadFactor"]

    # Structural adaptation
    if status == "STABLE" and load >= 1.0:
        network_role = "CORE_NODE"

    elif status == "RECOVERED":
        network_role = "SUPPORT_NODE"

    else:
        network_role = "ISOLATED_NODE"

    # Connectivity adjustment
    if network_role == "CORE_NODE":
        connectivity = "HIGH"

    elif network_role == "SUPPORT_NODE":
        connectivity = "MODERATE"

    else:
        connectivity = "LOW"

    results.append({
        "Node": node,
        "NetworkRole": network_role,
        "ConnectivityLevel": connectivity
    })

out = pd.DataFrame(results)

out.to_csv("self_organized_network.tsv", sep="\t", index=False)