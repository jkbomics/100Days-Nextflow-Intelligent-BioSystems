import numpy as np
import pandas as pd

np.random.seed(42)

df = pd.read_csv("base_signal.tsv", sep="\t")

components = df["Component"]
base = df["Signal"].values

records = []
time_points = 12

for t in range(time_points):

    # Thermal drift (aging)
    drift = t * 0.5

    # Electrical noise
    noise = np.random.normal(0, 2, len(base))

    # Failure event (bit flip / degradation)
    failure = np.zeros(len(base))
    if t == 8:
        failure += np.random.normal(-20, 5, len(base))

    observed = base + drift + noise + failure

    for i, comp in enumerate(components):
        records.append({
            "Time": t,
            "Component": comp,
            "Signal": observed[i]
        })

pd.DataFrame(records).to_csv("silicon_stream.tsv", sep="\t", index=False)