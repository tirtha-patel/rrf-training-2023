#### Name: Tirtha Patel
#### Date: 25th September, 2023
#### Purpose: Reproducible Research Training


### Installing and Loading Packages
install.packages("here")
library(here)

### Defining the path
path_input <- here("data", "colombia_connectivity_decleaned.csv")

### Calling the dataset
df <- read.csv(path_input)
df <- read.csv("data/colombia_connectivity_decleaned.csv")

### Saving the dataset
path_output <- here("outputs")
write.csv(df,here("outputs", "colombia_connectivity_decleaned.csv"))
