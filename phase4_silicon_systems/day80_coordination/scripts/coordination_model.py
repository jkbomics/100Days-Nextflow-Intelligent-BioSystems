import pandas as pd

df = pd.read_csv("adaptive_feedback.tsv", sep="\t")

results = []

for t in sorted(df["Time"].unique()):

    batch = df[df["Time"] == t]

    alerts = (batch["Decision"] == "ALERT").sum()
    warnings = (batch["Decision"] == "WARNING").sum()

    if alerts >= 2:
        system_state = "CRITICAL"

    elif alerts == 1 or warnings >= 2:
        system_state = "UNSTABLE"

    else:
        system_state = "STABLE"

    results.append({
        "Time": t,
        "Alerts": alerts,
        "Warnings": warnings,
        "SystemState": system_state
    })

out = pd.DataFrame(results)

out.to_csv("system_coordination.tsv", sep="\t", index=False)