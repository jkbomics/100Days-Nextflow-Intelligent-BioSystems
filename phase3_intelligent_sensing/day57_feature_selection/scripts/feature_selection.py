import pandas as pd
from sklearn.ensemble import RandomForestClassifier

# Load data
df = pd.read_csv("expression_matrix.tsv", sep="\t")

genes = df["Gene"]
X = df.drop(columns=["Gene"]).T

# Labels (control=0, disease=1)
y = [0, 0, 0, 1, 1, 1]

# Train model
model = RandomForestClassifier(random_state=42)
model.fit(X, y)

# Feature importance
importance = model.feature_importances_

result = pd.DataFrame({
    "Gene": genes,
    "Importance": importance
}).sort_values(by="Importance", ascending=False)

# Select top genes
top = result.head(5)

top.to_csv("selected_features.tsv", sep="\t", index=False)