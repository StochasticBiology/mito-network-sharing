# adapted version of pipeline to deal with model including gene products (post review)
# new source code for simulation; slightly changed plotting scripts (reviewer-requested styling)

# process XML output of analysed video data to get encounter network adjacency matrices
# 1.6 is threshold distance for an encounter in microns; -1 denotes no cap on trajectory lengths
#Rscript trajectory-analysis.R Data/orig-1.xml 1.6 -1

# housekeeping
#mkdir Output
#cp Data/*amlist.csv .



# compile simulation code
g++ -o3 bingo-rna3.c -I /usr/local/include/igraph -ligraph -lm -g -o ./bingo-rna3.ce
# run various experiments
./bingo-rna3.ce orig-1.xml-amlist.csv --output-simulation-traces --output-trajectories 10 --bingo-type 0 > tmpo0 &
./bingo-rna3.ce orig-1.xml-amlist.csv --output-simulation-traces --output-trajectories 10 --bingo-type 1 > tmpo1 &
./bingo-rna3.ce orig-1.xml-amlist.csv --output-simulation-traces --output-trajectories 10 --bingo-type 2 > tmpo2  &
./bingo-rna3.ce orig-1.xml-amlist.csv --output-simulation-traces --output-trajectories 10 --bingo-type 1 --exchange-probability 0.1 > tmpo3 &
#################


# final performance of different networks
Rscript bingo-results-script.R Output/orig-1.xml-amlist.csv-0-1.000-rna3-results-overall.txt 1
Rscript bingo-results-script.R Output/orig-1.xml-amlist.csv-1-1.000-rna3-results-overall.txt 1
Rscript bingo-results-script.R Output/orig-1.xml-amlist.csv-2-1.000-rna3-results-overall.txt 1
Rscript bingo-results-script.R Output/orig-1.xml-amlist.csv-1-0.100-rna3-results-overall.txt 0.1

# dynamics for different L in bio networks
Rscript bingo-biotrace-script.R Output/orig-1.xml-amlist.csv-0-0-rna3-results-frame.txt 0
Rscript bingo-biotrace-script.R Output/orig-1.xml-amlist.csv-1-0-rna3-results-frame.txt 0
Rscript bingo-biotrace-script.R Output/orig-1.xml-amlist.csv-2-0-rna3-results-frame.txt 0

# dynamics for different L across all networks
Rscript bingo-alltraces-script.R Output/orig-1.xml-amlist.csv-0-0-rna3-results-frame.txt 0
Rscript bingo-alltraces-script.R Output/orig-1.xml-amlist.csv-1-0-rna3-results-frame.txt 0
Rscript bingo-alltraces-script.R Output/orig-1.xml-amlist.csv-2-0-rna3-results-frame.txt 0

# predictions of bingo score
#Rscript bingo-prediction-script.R Output/orig-1.xml-amlist.csv-0-0-graphs.txt Output/orig-1.xml-amlist.csv-0-0-rna2-results-overall.txt
#Rscript bingo-prediction-script.R Output/orig-1.xml-amlist.csv-1-0-graphs.txt Output/orig-1.xml-amlist.csv-1-0-rna2-results-overall.txt
#Rscript bingo-prediction-script.R Output/orig-1.xml-amlist.csv-2-0-graphs.txt Output/orig-1.xml-amlist.csv-2-0-rna2-results-overall.txt

# correlations of network statistics with bingo performance
Rscript bingo-correlations-script.R Output/orig-1.xml-amlist.csv-0-0-rna3-results-overall.txt
Rscript bingo-correlations-script.R Output/orig-1.xml-amlist.csv-1-0-rna3-results-overall.txt
Rscript bingo-correlations-script.R Output/orig-1.xml-amlist.csv-2-0-rna3-results-overall.txt
