import pandas as pd
import numpy as np
from sklearn.linear_model import SGDClassifier

df = pd.read_csv("streaming.tsv", sep="\t")

model = SGDClassifier(loss="log_loss")
classes = np.array([0, 1])

results = []

for t in sorted(df["Time"].unique()):
    batch = df[df["Time"] == t]

    X = batch["Expression"].values.reshape(-1, 1)
    y = (batch["Expression"] > batch["Expression"].mean()).astype(int)

    if t == 0:
        model.partial_fit(X, y, classes=classes)
    else:
        model.partial_fit(X, y)

    probs = model.predict_proba(X)[:, 1]

    for i, gene in enumerate(batch["Gene"]):
        results.append({
            "Time": t,
            "Gene": gene,
            "Confidence": probs[i]
        })

pd.DataFrame(results).to_csv("adaptive.tsv", sep="\t", index=False)