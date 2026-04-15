import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score

# Load data
df = pd.read_csv("expression_matrix.tsv", sep="\t")

genes = df["Gene"]
X = df.drop(columns=["Gene"]).T

# Labels (control=0, disease=1)
y = [0, 0, 0, 1, 1, 1]

# Train model
model = RandomForestClassifier(random_state=42)
model.fit(X, y)

# Predict
pred = model.predict(X)

# Accuracy
acc = accuracy_score(y, pred)

# Save results
out = pd.DataFrame({
    "Sample": X.index,
    "True_Label": y,
    "Predicted": pred
})

out.to_csv("predictions.tsv", sep="\t", index=False)

with open("accuracy.txt", "w") as f:
    f.write(f"Accuracy: {acc}\n")