import pandas as pd

df = pd.read_csv("recovery_propagation.tsv", sep="\t")

results = []

for _, row in df.iterrows():

    node = row["Node"]
    status = row["UpdatedStatus"]

    # Adaptive communication strategy
    if status == "RECOVERED":
        communication_mode = "PRIORITY_ONLY"
        load_factor = 0.5

    elif status == "STABLE":
        communication_mode = "NORMAL"
        load_factor = 1.0

    else:
        communication_mode = "LIMITED"
        load_factor = 0.2

    results.append({
        "Node": node,
        "UpdatedStatus": status,
        "CommunicationMode": communication_mode,
        "CommunicationLoadFactor": load_factor
    })

out = pd.DataFrame(results)

out.to_csv("optimized_communication.tsv", sep="\t", index=False)