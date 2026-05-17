import pandas as pd

df = pd.read_csv("emergent_behavior.tsv", sep="\t")

results = []

for _, row in df.iterrows():

    dominant = row["DominantSystems"]
    collapsing = row["CollapsingSystems"]
    state = row["EmergentState"]

    # Communication intensity
    communication_load = dominant + collapsing

    # Distributed coordination logic
    if state == "STABLE_CLUSTER":
        network_state = "COORDINATED"

    elif state == "CASCADE_FAILURE":
        network_state = "NETWORK_STRESS"

    elif communication_load >= 4:
        network_state = "HIGH_COMMUNICATION"

    else:
        network_state = "PARTIAL_COORDINATION"

    results.append({
        "EmergentState": state,
        "CommunicationLoad": communication_load,
        "NetworkState": network_state
    })

out = pd.DataFrame(results)

out.to_csv("distributed_intelligence.tsv", sep="\t", index=False)