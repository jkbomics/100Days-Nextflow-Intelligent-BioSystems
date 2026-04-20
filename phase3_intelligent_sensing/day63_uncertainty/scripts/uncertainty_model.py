import pandas as pd
from sklearn.ensemble import RandomForestClassifier

# Load data
df = pd.read_csv("expression_matrix.tsv", sep="\t")

X = df.drop(columns=["Gene"]).T

# Labels
y = [0, 0, 0, 1, 1, 1]

# Train model
model = RandomForestClassifier(random_state=42)
model.fit(X, y)

# Predictions
pred = model.predict(X)
proba = model.predict_proba(X)

# Confidence = max probability
confidence = proba.max(axis=1)

# Uncertainty flag
threshold = 0.7
uncertain = confidence < threshold

out = pd.DataFrame({
    "Sample": X.index,
    "Prediction": pred,
    "Confidence": confidence,
    "Uncertain": uncertain
})

out.to_csv("uncertainty_results.tsv", sep="\t", index=False)