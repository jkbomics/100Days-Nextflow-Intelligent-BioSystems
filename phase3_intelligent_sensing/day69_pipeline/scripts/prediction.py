import pandas as pd
from sklearn.ensemble import RandomForestClassifier

df = pd.read_csv("expression_matrix.tsv", sep="\t")

X = df.drop(columns=["Gene"]).T
y = [0, 0, 0, 1, 1, 1]

model = RandomForestClassifier(random_state=42)
model.fit(X, y)

proba = model.predict_proba(X)[:,1]

out = pd.DataFrame({
    "Sample": X.index,
    "Probability": proba
})

out.to_csv("prediction.tsv", sep="\t", index=False)