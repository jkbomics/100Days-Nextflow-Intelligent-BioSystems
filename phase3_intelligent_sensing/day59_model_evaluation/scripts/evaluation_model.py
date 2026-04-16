import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, confusion_matrix

# Load data
df = pd.read_csv("expression_matrix.tsv", sep="\t")

X = df.drop(columns=["Gene"]).T

# Labels (control=0, disease=1)
y = [0, 0, 0, 1, 1, 1]

# Train/Test split
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.33, random_state=42
)

# Train model
model = RandomForestClassifier(random_state=42)
model.fit(X_train, y_train)

# Predict
pred = model.predict(X_test)

# Metrics
acc = accuracy_score(y_test, pred)
cm = confusion_matrix(y_test, pred)

# Save predictions
out = pd.DataFrame({
    "Sample": X_test.index,
    "True_Label": y_test,
    "Predicted": pred
})

out.to_csv("test_predictions.tsv", sep="\t", index=False)

# Save metrics
with open("metrics.txt", "w") as f:
    f.write(f"Accuracy: {acc}\n")
    f.write(f"Confusion Matrix:\n{cm}\n")