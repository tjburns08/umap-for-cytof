# UMAP_for_CyTOF
The materials necessary to get a UMAP embedding with flow or mass cytometry data.

This repository is part of a larger project to determine the fidelity of the UMAP embeddings as relevant to CyTOF data.
Given that UMAP is written in Python and a lot of CyTOF processing architecture is written in R, I provide both R and Python
code necessary to simply try UMAP for yourself. The input for this is a simple fcs file, and the output is a csv file 
containing your CyTOF data matrix along with two new t-SNE coordinates and two new UMAP coordinates. 

The UMAP paper can be found here: 
https://arxiv.org/abs/1802.03426

A paper on UMAP applied to CyTOF can be found here: 
https://www.biorxiv.org/content/early/2018/04/10/298430


## Instructions: 
Step 0: Install the necessary packages in the R scripts. Tidyverse is on CRAN and (my) Sconify is on Bioconductor. Then
install UMAP. Instructions for this are in the UMAP GitHub repo, found here: 
https://github.com/lmcinnes/umap

Step 1: Process the CyTOF data running data_process.R. For a detailed explanation involving how I set this up, please
go to this vignette in my Sconify package: 
https://bioconductor.org/packages/release/bioc/vignettes/Sconify/inst/doc/Step1.PreProcessing.html

Step 2: go into the python script and change line 9 to your working directory. In my case, it's different than the one
containing the script, so I had to write it in here. Now run the script. You can do this in the command line but navigating
to your working directory and running "python umap_run.py." Note that there are three hyperparameters you can change within 
the UMAP function: nearest neighbors, minimum distance, and the distance metric itself. 

Step 3: Run tsne_run.R. This will output a csv file called cells_umap_tsne.csv. 

Step 4: Import cells_umap_tsne.csv into Cytobank or FlowJo for visualization and comparisons. 

I'll continually update this repo. I wanted to get this out as soon as I could because anyone doing high-dimensional single 
cell analysis should play around with UMAP sooner rather than later. It may prove to be superior to t-SNE in particular 
contexts. 

Note that there are ways for R and Python to interface, but I ran into a problems particularly with UMAP running
through R-Python packages (like reticulate). If others are experiencing this too (and therefore can't use this: 
https://gist.github.com/schochastics/2f83532f04729321b06822fbaa98f3ab then my repository is for you. 

