# Read in a preprocessed csv file
import pandas as pd
import umap

# Check working directory
import os

# Set path to wherever your data is
path = "/Users/tylerburns/Documents/local.projects/umap/data"
os.chdir(path)

# Import the csv using pandas
csv_file_surface = "cells_surface.csv"
dat = pd.read_csv(csv_file_surface)
dat = dat.drop(dat.columns[0], axis=1)
print(dat)

# Import the csv using pandas
csv_file = "cells.csv"
dat_full = pd.read_csv(csv_file)
#dat_full = dat.drop(dat.columns[0], axis=1)

# Run the UMAP script
dat_umap = umap.UMAP(n_neighbors=5,
                      min_dist=0.3,
                      metric='correlation').fit_transform(dat)

# Now add the UMAP coordinates to the original dat file
dat_umap = pd.DataFrame(dat_umap)

# Rename
dat_umap.columns = ["umap1", "umap2"]

# Combine to the original data
final = pd.concat([dat_full, dat_umap], axis = 1)

# Output to csv
pd.DataFrame.to_csv(final, "cells_umap.csv")

