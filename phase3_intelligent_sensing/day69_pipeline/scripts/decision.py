import pandas as pd

df = pd.read_csv("prediction.tsv", sep="\t")

threshold = 0.6

df["Decision"] = df["Probability"] > threshold

df.to_csv("final_decision.tsv", sep="\t", index=False)