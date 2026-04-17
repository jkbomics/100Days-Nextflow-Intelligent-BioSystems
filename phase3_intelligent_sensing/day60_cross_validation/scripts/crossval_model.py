import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import cross_val_score

# Load data
df = pd.read_csv("expression_matrix.tsv", sep="\t")

X = df.drop(columns=["Gene"]).T

# Labels (control=0, disease=1)
y = [0, 0, 0, 1, 1, 1]

# Model
model = RandomForestClassifier(random_state=42)

# Cross-validation (k=3)
scores = cross_val_score(model, X, y, cv=3)

# Save results
with open("crossval_metrics.txt", "w") as f:
    f.write(f"Fold Accuracies: {scores}\n")
    f.write(f"Mean Accuracy: {scores.mean()}\n")
    f.write(f"Std Dev: {scores.std()}\n")