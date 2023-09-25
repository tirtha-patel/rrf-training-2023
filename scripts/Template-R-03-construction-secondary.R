# Construction - R - secondary sources
# Load necessary packages --------------------------

# install.packages("pacman")

packages <- c("tidyr", 
              "dplyr")

pacman::p_load(packages,
               character.only = TRUE,
               install = FALSE) # Change to TRUE to install the necessary packages

# Set path of our data 

# Set folder path to where you downloaded the data
tidy_folder <- 
  "YOUR/FOLDER/PATH"

# read data 

# from cleaned
colombia_connectivity_clean <- read.csv(file.path(tidy_folder, 
                                                  "colombia_connectivity_cleaned.csv"))

# from tidying  
colombia_infraestructure <- read.csv(file.path(tidy_folder,
                                               "colombia_infrastructure_wide.csv"))


##### Task 1  --------------------------
# Plan construct outputs
# Add your code here to plan how to construct the outputs

##### Task 2  --------------------------
# Standardize units
# Add your code here to standardize units from KB to MB

##### Task 3  --------------------------
# Handle outliers 
# - Visual identification of outliers through plots
# - Define a function to handle outliers
# Define the function
winsor_function <- function(dataset, var, min = 0.00, max = 0.99){
  var_sym <- sym(var)
  
  percentiles <- quantile(
    dataset %>% pull(!!var_sym), probs = c(min, max), na.rm = TRUE
  )
  
  min_percentile <- percentiles[1]
  max_percentile <- percentiles[2]
  
  dataset %>%
    mutate(
      !!paste0(var, "_winsorized") := case_when(
        is.na(!!var_sym) ~ NA_real_,
        !!var_sym <= min_percentile ~ percentiles[1],
        !!var_sym >= max_percentile ~ percentiles[2],
        TRUE ~ !!var_sym
      )
    )
}
# - Apply the function to your dataset


##### Task 4  --------------------------
# Create indicators
# - Create a state database
# - Create a municipality database


##### Task 5  --------------------------
# Save the final datasets
# - Remove unnecessary variables
# - Save the datasets as CSV files
