import pandas as pd
import numpy as np
from sklearn.linear_model import SGDClassifier

# Load streaming data
df = pd.read_csv("streaming_expression.tsv", sep="\t")

df = df.sort_values(["Time"])

# Initialize model (supports partial_fit)
model = SGDClassifier(loss="log_loss", random_state=42)

classes = np.array([0, 1])

results = []

for t in sorted(df["Time"].unique()):

    batch = df[df["Time"] == t]

    X = batch["Expression"].values.reshape(-1, 1)

    # Simple label (above mean = 1)
    y = (batch["Expression"] > batch["Expression"].mean()).astype(int)

    # First step needs classes
    if t == 0:
        model.partial_fit(X, y, classes=classes)
    else:
        model.partial_fit(X, y)

    # Predict probabilities
    proba = model.predict_proba(X)[:, 1]

    for i, gene in enumerate(batch["Gene"]):
        results.append({
            "Time": t,
            "Gene": gene,
            "Expression": X[i][0],
            "Probability": proba[i]
        })

out = pd.DataFrame(results)
out.to_csv("adaptive_results.tsv", sep="\t", index=False)