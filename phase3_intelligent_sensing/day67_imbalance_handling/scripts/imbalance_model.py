import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report

# Load data
df = pd.read_csv("expression_matrix.tsv", sep="\t")

X = df.drop(columns=["Gene"]).T

# Simulate imbalance (more control samples)
y = [0, 0, 0, 0, 0, 1]  # 5 control, 1 disease

# Baseline model
model_base = RandomForestClassifier(random_state=42)
model_base.fit(X, y)
pred_base = model_base.predict(X)

# Weighted model
model_weighted = RandomForestClassifier(
    class_weight='balanced',
    random_state=42
)
model_weighted.fit(X, y)
pred_weighted = model_weighted.predict(X)

# Save reports
with open("imbalance_report.txt", "w") as f:
    f.write("Baseline Model:\n")
    f.write(classification_report(y, pred_base))
    f.write("\n\nWeighted Model:\n")
    f.write(classification_report(y, pred_weighted))