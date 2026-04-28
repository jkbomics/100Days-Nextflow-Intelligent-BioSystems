import numpy as np
import pandas as pd
from sklearn.ensemble import RandomForestClassifier

np.random.seed(42)

df = pd.read_csv("gene_expression.tsv", sep="\t")

genes = df["Gene"]
base = df["Expression"].values

# Noise
noise = np.random.normal(0, 5, len(base))

# Drift (systematic shift)
drift = np.linspace(-5, 5, len(base))

# Simulated signal
observed = base + noise + drift

# Create dataset
data = pd.DataFrame({
    "Gene": genes,
    "Observed": observed
})

# Simple classification setup
X = observed.reshape(-1, 1)
y = (observed > np.mean(observed)).astype(int)

model = RandomForestClassifier(random_state=42)
model.fit(X, y)

proba = model.predict_proba(X)[:,1]

# Uncertainty
confidence = np.abs(proba - 0.5)

out = pd.DataFrame({
    "Gene": genes,
    "Observed": observed,
    "Confidence": confidence
})

out.to_csv("real_world_results.tsv", sep="\t", index=False)