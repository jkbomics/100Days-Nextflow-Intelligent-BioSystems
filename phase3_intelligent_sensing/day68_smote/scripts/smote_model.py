import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report
from imblearn.over_sampling import SMOTE

# Load data
df = pd.read_csv("expression_matrix.tsv", sep="\t")

X = df.drop(columns=["Gene"]).T

# Simulated imbalance
y = [0, 0, 0, 0, 0, 1]

# Apply SMOTE
smote = SMOTE(random_state=42)
X_res, y_res = smote.fit_resample(X, y)

# Train model
model = RandomForestClassifier(random_state=42)
model.fit(X_res, y_res)

# Predict on original data
pred = model.predict(X)

# Save report
with open("smote_report.txt", "w") as f:
    f.write("After SMOTE:\n")
    f.write(classification_report(y, pred))