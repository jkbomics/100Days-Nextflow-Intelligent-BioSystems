import pandas as pd

df = pd.read_csv("autonomous_ecosystem.tsv", sep="\t")

results = []

ecosystem_health = df["AdaptiveResponse"].mean()

for _, row in df.iterrows():

    node = row["Node"]
    response = row["AdaptiveResponse"]
    pressure = row["EnvironmentalPressure"]

    # Sustained equilibrium adjustment
    equilibrium_factor = response - pressure

    # Persistent intelligence state
    if equilibrium_factor >= 1.15:
        sustainment_state = "SELF_SUSTAINING"

    elif equilibrium_factor >= 0.95:
        sustainment_state = "STABLE_ADAPTIVE"

    else:
        sustainment_state = "FRAGILE"

    results.append({
        "Node": node,
        "EquilibriumFactor": round(equilibrium_factor, 2),
        "SustainmentState": sustainment_state,
        "EcosystemHealth": round(ecosystem_health, 2)
    })

out = pd.DataFrame(results)

out.to_csv("self_sustaining_intelligence.tsv", sep="\t", index=False)