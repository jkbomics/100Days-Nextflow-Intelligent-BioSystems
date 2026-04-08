import numpy as np
import pandas as pd
import sys

# Arguments
input_file = sys.argv[1]
window_size = int(sys.argv[2]) if len(sys.argv) > 2 else 5
seed = int(sys.argv[3]) if len(sys.argv) > 3 else 42
output_file = sys.argv[4] if len(sys.argv) > 4 else "filtered_signal.tsv"

np.random.seed(seed)

# Load data
df = pd.read_csv(input_file, sep="\t")

# Validate columns
required_cols = ["Gene", "Expression"]
missing = [col for col in required_cols if col not in df.columns]
if missing:
    raise ValueError(f"Missing required columns: {missing}")

# Ensure numeric
df["Expression"] = pd.to_numeric(df["Expression"], errors="coerce")
if df["Expression"].isna().any():
    raise ValueError("Non-numeric values found in 'Expression' column")

genes = df["Gene"]
true_signal = df["Expression"].values

# Add noise
noise = np.random.normal(0, 8, len(true_signal))
observed = true_signal + noise

# Filter
filtered = pd.Series(observed, index=df.index).rolling(
    window=window_size, min_periods=1
).mean()

# Output
df_out = pd.DataFrame({
    "Gene": genes,
    "True_Signal": true_signal,
    "Observed": observed,
    "Filtered": filtered
})

df_out.to_csv(output_file, sep="\t", index=False)

# Logs
print(f"Processed {len(df)} genes")
print(f"Window size: {window_size}")
print(f"Output written to: {output_file}")