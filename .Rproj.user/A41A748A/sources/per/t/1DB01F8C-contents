#### Name: Tirtha Patel
#### Date: 25th September, 2023
#### Purpose: Reproducible Research Training


### Installing and Loading Packages
install.packages("here")
library(here)

install.packages("renv")
library(renv)

### Defining the path
renv::init()
renv::snapshot()
path_input <- here("data", "colombia_connectivity_decleaned.csv")
path_output <- here("outputs")

### Calling the dataset
df <- read.csv(path_input)
df <- read.csv("data/colombia_connectivity_decleaned.csv")

### Saving the dataset
write.csv(df,here("outputs", "colombia_connectivity_decleaned.csv"))
