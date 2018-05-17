# Date: May 9, 2018
# Procedure: make a t-SNE map
# Purpose: to compare t-SNE with UMAP

################# SETUP ################# 
library(Sconify)
################# PIPELINE ################# 

# Read in the data
cells <- read_csv("cells_umap.csv")

# Two columns are added to the front when you read in a python-generated 
# csv. If I try to drop columns within python, then onother bug happens, 
# so this is the best way to remove those two columns for now. 
cells[[1]] <- NULL
cells[[1]] <- NULL

# Get the markers out needed for the t-SNE run
markers <- read_csv("markers.csv")
surface <- markers[[1]]

# Run t-SNE through the Sconify package
final <- SubsampleAndTsne(cells, input = surface, numcells = nrow(cells))
write.csv(final, "cells_umap_tsne.csv")
