import pandas as pd
from sklearn.ensemble import RandomForestClassifier

# Load data
df = pd.read_csv("expression_matrix.tsv", sep="\t")

X = df.drop(columns=["Gene"]).T
y = [0, 0, 0, 1, 1, 1]

# Train model
model = RandomForestClassifier(random_state=42)
model.fit(X, y)

# Get probabilities for class 1 (disease)
proba = model.predict_proba(X)[:, 1]

# Define thresholds
thresholds = [0.3, 0.5, 0.7]

results = []

for t in thresholds:
    preds = (proba > t).astype(int)
    for i, sample in enumerate(X.index):
        results.append({
            "Sample": sample,
            "Threshold": t,
            "Probability": proba[i],
            "Prediction": preds[i]
        })

out = pd.DataFrame(results)
out.to_csv("threshold_results.tsv", sep="\t", index=False)