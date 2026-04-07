import numpy as np
import pandas as pd

np.random.seed(42)

genes = [f"Gene_{i}" for i in range(100)]

signal = np.random.normal(loc=50, scale=10, size=100)
noise = np.random.normal(loc=0, scale=5, size=100)

expression = signal + noise

df = pd.DataFrame({
    "Gene": genes,
    "Expression": expression
})

df.to_csv("signal_expression.tsv", sep="\t", index=False)