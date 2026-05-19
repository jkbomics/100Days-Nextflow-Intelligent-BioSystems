import pandas as pd
import random

random.seed(42)

df = pd.read_csv("decentralized_decisions.tsv", sep="\t")

results = []

active_nodes = 0
failed_nodes = 0

for _, row in df.iterrows():

    node = row["Node"]
    decision = row["LocalDecision"]

    # Simulate node failure probability
    if decision == "SELF_PROTECT":
        failure_probability = 0.6

    elif decision == "REDUCE_LOAD":
        failure_probability = 0.2

    else:
        failure_probability = 0.1

    failed = random.random() < failure_probability

    if failed:
        status = "FAILED"
        failed_nodes += 1

    else:
        status = "ACTIVE"
        active_nodes += 1

    results.append({
        "Node": node,
        "Decision": decision,
        "FailureProbability": failure_probability,
        "NodeStatus": status
    })

# Overall resilience
if active_nodes >= failed_nodes:
    network_resilience = "RESILIENT"
else:
    network_resilience = "FRAGILE"

summary = pd.DataFrame([{
    "ActiveNodes": active_nodes,
    "FailedNodes": failed_nodes,
    "NetworkResilience": network_resilience
}])

detail = pd.DataFrame(results)

detail.to_csv("node_resilience.tsv", sep="\t", index=False)
summary.to_csv("network_resilience.tsv", sep="\t", index=False)