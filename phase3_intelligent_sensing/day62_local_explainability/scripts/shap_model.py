import pandas as pd
import shap
from sklearn.ensemble import RandomForestClassifier

# Load data
df = pd.read_csv("expression_matrix.tsv", sep="\t")

genes = df["Gene"]
X = df.drop(columns=["Gene"]).T

# Labels
y = [0, 0, 0, 1, 1, 1]

# Train model
model = RandomForestClassifier(random_state=42)
model.fit(X, y)

# SHAP explainer
explainer = shap.TreeExplainer(model)
shap_values = explainer.shap_values(X)

# Use class 1 (disease)
shap_df = pd.DataFrame(
    shap_values[1],
    columns=genes,
    index=X.index
)

shap_df.to_csv("shap_values.tsv", sep="\t")