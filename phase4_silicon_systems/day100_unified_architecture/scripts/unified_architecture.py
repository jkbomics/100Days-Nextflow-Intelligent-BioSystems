import pandas as pd

df = pd.read_csv("self_sustaining_intelligence.tsv", sep="\t")

results = []

global_health = df["EcosystemHealth"].mean()

for _, row in df.iterrows():

    node = row["Node"]
    equilibrium = row["EquilibriumFactor"]
    sustainment = row["SustainmentState"]

    # Integrated adaptive intelligence score
    intelligence_score = equilibrium * global_health

    # Unified architecture state
    if intelligence_score >= 1.2:
        architecture_state = "AUTONOMOUS_INTELLIGENCE"

    elif intelligence_score >= 1.0:
        architecture_state = "ADAPTIVE_STABILITY"

    else:
        architecture_state = "FRAGILE_ADAPTATION"

    results.append({
        "Node": node,
        "IntelligenceScore": round(intelligence_score, 2),
        "ArchitectureState": architecture_state,
        "GlobalHealth": round(global_health, 2)
    })

out = pd.DataFrame(results)

out.to_csv("unified_adaptive_architecture.tsv", sep="\t", index=False)