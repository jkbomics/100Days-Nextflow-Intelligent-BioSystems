import pandas as pd

df = pd.read_csv("selection_results.tsv", sep="\t")

results = []

dominant = (df["SelectionStatus"] == "DOMINANT").sum()
collapsing = (df["SelectionStatus"] == "COLLAPSING").sum()
surviving = (df["SelectionStatus"] == "SURVIVING").sum()

# Emergent system interpretation
if dominant >= 3:
    emergent_state = "STABLE_CLUSTER"

elif collapsing >= 3:
    emergent_state = "CASCADE_FAILURE"

elif dominant >= 1 and collapsing >= 1:
    emergent_state = "COMPETITIVE_INSTABILITY"

else:
    emergent_state = "MIXED_DYNAMIC"

results.append({
    "DominantSystems": dominant,
    "SurvivingSystems": surviving,
    "CollapsingSystems": collapsing,
    "EmergentState": emergent_state
})

out = pd.DataFrame(results)

out.to_csv("emergent_behavior.tsv", sep="\t", index=False)