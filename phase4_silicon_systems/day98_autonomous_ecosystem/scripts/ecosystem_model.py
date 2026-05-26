import pandas as pd

df = pd.read_csv("collective_intelligence.tsv", sep="\t")

results = []

ecosystem_stability = df["UpdatedEfficiency"].mean()

for _, row in df.iterrows():

    node = row["Node"]
    efficiency = row["UpdatedEfficiency"]

    # Ecosystem interaction
    environmental_pressure = ecosystem_stability - efficiency

    adaptive_response = efficiency + (environmental_pressure * 0.3)

    # Ecosystem adaptive state
    if adaptive_response >= 1.15:
        ecosystem_role = "STABILIZING_AGENT"

    elif adaptive_response >= 0.95:
        ecosystem_role = "BALANCED_AGENT"

    else:
        ecosystem_role = "VULNERABLE_AGENT"

    results.append({
        "Node": node,
        "AdaptiveResponse": round(adaptive_response, 2),
        "EnvironmentalPressure": round(environmental_pressure, 2),
        "EcosystemRole": ecosystem_role
    })

out = pd.DataFrame(results)

out.to_csv("autonomous_ecosystem.tsv", sep="\t", index=False)