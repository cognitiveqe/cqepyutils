import pandas as pd
import itertools
import numpy as np

# Read the Excel file into a DataFrame
df = pd.read_excel('example.xlsx')

# Get the column names
column_names = df.columns.tolist()

# Define the suffixes for permute and spread columns
permute_suffix = '_P'
spread_suffix = '_S'

# Get the column names for permute and spread columns
permute_columns = [col for col in column_names if col.endswith(permute_suffix)]
spread_columns = [col for col in column_names if col.endswith(spread_suffix)]

# Get the unique non-null values from each column
unique_values = []
for col in column_names:
    if col in permute_columns or col in spread_columns:
        continue
    non_null_values = df[col].dropna().unique()
    if len(non_null_values) > 1:
        spread_values = []
        for i in range(len(non_null_values)-1):
            spread = np.linspace(non_null_values[i], non_null_values[i+1], num=5, endpoint=False)[1:]
            spread_values.extend(spread)
        unique_values.append(sorted(set(list(non_null_values) + spread_values)))
    else:
        unique_values.append(non_null_values)

# Generate all permutations
permutations = list(itertools.product(*unique_values))

# Create a new DataFrame with separate columns for each column in the original Excel file
df_permutations = pd.DataFrame(permutations, columns=[col for col in column_names if col not in permute_columns and col not in spread_columns])

# Add the spread columns to the DataFrame
for col in spread_columns:
    if col not in column_names:
        continue
    spread_values = df[col].unique()
    df_permutations[col] = spread_values[0]

# Generate all permutations for permute columns
for col in permute_columns:
    if col not in column_names:
        continue
    unique_values = df[col].dropna().unique()
    permutations = list(itertools.permutations(unique_values))
    df_permute = pd.DataFrame(permutations, columns=[f"{col}_{i}" for i in range(len(unique_values))])
    df_permutations = pd.concat([df_permutations]*len(df_permute), ignore_index=True)
    df_permute = pd.concat([df_permute]*len(df_permutations), ignore_index=True)
    df_permutations = pd.concat([df_permutations, df_permute], axis=1)

# Add the permute columns to the DataFrame
for col in permute_columns:
    if col not in column_names:
        continue
    permute_column_names = [f"{col}_{i}" for i in range(len(df[col].dropna().unique()))]
    for i, name in enumerate(permute_column_names):
        df_permutations[name] = df_permutations[col][i::len(permute_column_names)].tolist()

# Print the DataFrame with permutations
print(df_permutations)
