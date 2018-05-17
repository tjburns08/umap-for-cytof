# Date: May 9, 2018
# Procedure: pre-process the data
# Purpose: make it easy to read into Python

################# SETUP ################# 
library(Sconify)
library(tidyverse)

################# PIPELINE #################

# Get out the fcs files
fcs <- list.files() %>% .[grep("fcs", .)]

# This will produce a markers.csv file where you just manually remove the
# Markers you don't want from the given column and get rid of the gaps
raw_markers <- GetMarkerNames(fcs)

# When you're done with that, then go ahead and read in this markers.csv file
markers <- read_csv("markers.csv")
surface <- markers[[1]]

# Read in the fcs files and subsample the cells
to_sample <- 30000
cells <- ProcessMultipleFiles(fcs, numcells = to_sample, input = surface)
write.csv(cells, "cells.csv")
write.csv(cells[,surface], "cells_surface.csv")
