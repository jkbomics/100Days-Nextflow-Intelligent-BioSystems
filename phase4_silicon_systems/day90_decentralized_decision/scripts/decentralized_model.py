import pandas as pd

df = pd.read_csv("distributed_intelligence.tsv", sep="\t")

nodes = ["NodeA", "NodeB", "NodeC", "NodeD"]

results = []

for _, row in df.iterrows():

    load = row["CommunicationLoad"]
    state = row["NetworkState"]

    for node in nodes:

        # Local autonomous decisions
        if state == "HIGH_COMMUNICATION":

            if load >= 4:
                decision = "REDUCE_LOAD"

            else:
                decision = "MONITOR"

        elif state == "NETWORK_STRESS":
            decision = "SELF_PROTECT"

        else:
            decision = "NORMAL_OPERATION"

        results.append({
            "Node": node,
            "NetworkState": state,
            "LocalDecision": decision
        })

out = pd.DataFrame(results)

out.to_csv("decentralized_decisions.tsv", sep="\t", index=False)