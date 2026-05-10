import pandas as pd

df = pd.read_csv("predictive_failure.tsv", sep="\t")

results = []

recovery_pool = 20

for _, row in df.iterrows():

    pool = row["ResourcePool"]
    risk = row["PredictedRisk"]

    recovery_action = "NONE"

    if risk == "HIGH_FAILURE_RISK":

        pool += recovery_pool * 0.5
        recovery_action = "STRONG_RECOVERY"

    elif risk == "MODERATE_RISK":

        pool += recovery_pool * 0.2
        recovery_action = "LIGHT_RECOVERY"

    pool = min(pool, 100)

    if pool >= 80:
        status = "STABLE"

    elif pool >= 60:
        status = "RECOVERING"

    else:
        status = "CRITICAL"

    results.append({
        "Time": row["Time"],
        "RecoveredPool": round(pool, 2),
        "RecoveryAction": recovery_action,
        "SystemStatus": status
    })

out = pd.DataFrame(results)

out.to_csv("self_healing.tsv", sep="\t", index=False)