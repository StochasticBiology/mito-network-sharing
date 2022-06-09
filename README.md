# mito-network-sharing
Sharing of contents on mitochondrial encounter networks

Required: R with `igraph`, `brainGraph`, `ggplot2`, and `XML` libraries; `igraph` libraries for C

`igraph` can be a pain to install for C. See `bingo.c` below for how to optionally run the code without this dependency.

Wrapper scripts pre-review (mtDNA and histories only)
------

`runcode.sh` calls R code to extract encounter networks from XML trajectory information in `Data/`, then C code to generate other networks for comparison and simulate the "bingo" game on these.

`plots.R` calls R code to produce summary plots of the results.

Wrapper scripts post-review (mtDNA and gene products)
------

`run-rna.sh` calls simulation and plotting code for this model.

Code 
----

`trajectory-analysis.R` extracts encounter networks from XML files and imposes any required restrictions (for example, truncating trajectory lengths)

`bingo.c` (and `bingo-rna3.c` post-review) is the workhorse C code for network generation and "bingo" simulation. For full functionality, this needs the `igraph` library. However, a preprocessor directive within the code can be removed, removing the `igraph` dependency. In this case, zeroes are output for all network statistics that `igraph` would provide. The followup R code can be used to compute these statistics for a subset of the networks generated in the simulations.

The various `bingo-...-script.R` scripts produce visualisations of the different aspects of the simulations. 
