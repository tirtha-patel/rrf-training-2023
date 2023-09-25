# ------------------------------------------------------------------------------
# Project: rrf-training-2023
# Purpose: Main Script

# Author: Tirtha Patel
# Date: 25th September, 2023

# ------------------------------------------------------------------------------

### Loading necessary libraries
install.packages("pacman")
library(pacman)

libraries <- c("here",
               "renv")

pacman::p_load(libraries, character.only = TRUE, install = TRUE)


### Sourcing all scripts libraries
source(here("scripts", "Template-R-01-tidying-secondary.R"))
source(here("scripts", "Template-R-02-cleaning-secondary.R"))
source(here("scripts", "Template-R-03-construction-secondary.R"))
source(here("scripts", "Template-R-04-analysis-secondary.R"))


### Printing completion message
print("Data analysis is complete")

