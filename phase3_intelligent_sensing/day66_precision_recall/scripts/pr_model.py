import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import precision_recall_curve, auc
import matplotlib.pyplot as plt

# Load data
df = pd.read_csv("expression_matrix.tsv", sep="\t")

X = df.drop(columns=["Gene"]).T
y = [0, 0, 0, 1, 1, 1]

# Train model
model = RandomForestClassifier(random_state=42)
model.fit(X, y)

# Probabilities
proba = model.predict_proba(X)[:, 1]

# Precision-Recall
precision, recall, thresholds = precision_recall_curve(y, proba)
pr_auc = auc(recall, precision)

# Save values
pr_df = pd.DataFrame({
    "Precision": precision[:-1],
    "Recall": recall[:-1],
    "Threshold": thresholds
})

pr_df.to_csv("pr_values.tsv", sep="\t", index=False)

# Plot
plt.figure()
plt.plot(recall, precision, label=f"PR-AUC = {pr_auc:.2f}")
plt.xlabel("Recall")
plt.ylabel("Precision")
plt.title("Precision-Recall Curve")
plt.legend()

plt.savefig("pr_curve.png")