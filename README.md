# rrf-training-2023

This reproducibility package includes three main folders namely:

1.  **data**: This is the folder where all the data (decleaned and cleaned) are stored. We use two main data sets for this study: one with variables on connectivity (taken from [Ookla](https://www.ookla.com)) and the other with variables on infrastructure (taken from [OpenStreetMaps](https://www.openstreetmap.org/#map=4/38.01/-95.84)). For more information on the data collection process, please follow the hyperlinks shared above. 

2.  **scripts**: This is the folder where four scripts:
* ***Template-R-01-tidying-secondary*** - This script is used to primarily restructure the data sets from the wide format to the long format.
* ***Template-R-02-cleaning-secondary*** - This script is used to identify duplicates (if any), removing any unnecessary variables, adding variable labels and preparing the identifying variables for both the data sets.
* ***Template-R-03-construction-secondary*** - This script uses the clean data generated from the previous script to conduct data checks, standardize units, handle outliers, aggregate the data to the levle of the unit of analysis for both the data sets.
* ***Template-R-04-analysis-secondary*** - This script is used to create basic summary statistics and the analysis plots for both the data sets. 

3.  **outputs**: This is the folder where the final set of outputs from the analysis stage are stored.

4.  **main script**: This is the scrip that calls and runs all the scripts of this package and produce the outputs of the study.



In order reproduce the outputs stored for this study, kindly follow the following steps:

1. Clone this repository from GitHub onto your desktop.

2. Clear your environment on R.

3. Run the main script on RStudio. This should run all the scripts and reproduce the output of this study.
