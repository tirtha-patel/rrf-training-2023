# Construction - R - secondary sources
# Load necessary packages --------------------------

install.packages("pacman")
library(pacman)

packages <- c("tidyr", 
              "dplyr",
              "here",
              "ggplot2",
              "utils")

pacman::p_load(packages,
               character.only = TRUE,
               install = TRUE)

# Set path of our data 

# Set folder path to where you downloaded the data
tidy_folder <- here("data") 

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
## How many analysis data sets will you have to create? - We would need 2 data sets

## What are the unit of observations in each of them? - Municipality level and State level

##### Task 2  --------------------------
# Standardize units
# Add your code here to standardize units from KB to MB

colombia_connectivity_clean <- colombia_connectivity_clean %>% 
  mutate(avg_d_mbps = avg_d_kbps/1000,
         avg_u_mbps = avg_u_kbps/1000)

##### Task 3  --------------------------
# Handle outliers 
# - Visual identification of outliers through plots
# - Define a function to handle outliers
colombia_connectivity_clean %>% ggplot(aes(y = avg_d_mbps)) +
  geom_boxplot() +
  facet_wrap(~trimester)

colombia_connectivity_clean %>% ggplot(aes(x = avg_d_mbps)) +
  geom_histogram()

colombia_connectivity_clean %>% ggplot(aes(y = avg_u_mbps)) +
  geom_boxplot() +
  facet_wrap(~trimester)

colombia_connectivity_clean %>% ggplot(aes(x = avg_u_mbps)) +
  geom_histogram()

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

colombia_connectivity_clean <- winsor_function(colombia_connectivity_clean, "avg_d_mbps")
colombia_connectivity_clean <- winsor_function(colombia_connectivity_clean, "avg_u_mbps")

# - Check the difference in graphs
colombia_connectivity_clean %>% ggplot(aes(y = avg_d_mbps_winsorized)) +
  geom_boxplot() +
  facet_wrap(~trimester)

colombia_connectivity_clean %>% ggplot(aes(x = avg_d_mbps_winsorized)) +
  geom_histogram()

colombia_connectivity_clean %>% ggplot(aes(y = avg_u_mbps_winsorized)) +
  geom_boxplot() +
  facet_wrap(~trimester)

colombia_connectivity_clean %>% ggplot(aes(x = avg_u_mbps_winsorized)) +
  geom_histogram()


##### Task 4  --------------------------
# Create indicators
# - Create a state database
# - Create a municipality database

connectivity_municipality <- colombia_connectivity_clean %>% 
  group_by(ADM2_PC, trimester) %>% 
  summarise(avg_d_mbps = mean(avg_d_mbps, na.rm = TRUE),
            avg_d_mbps_winsorized = mean(avg_d_mbps_winsorized, na.rm = TRUE),
            avg_u_mbps = mean(avg_u_mbps, na.rm = TRUE),
            avg_u_mbps_winsorized = mean(avg_u_mbps_winsorized, na.rm = TRUE), 
            tests = sum(tests, na.rm = TRUE),
            devices = sum(devices, na.rm = TRUE))

connectivity_state <- colombia_connectivity_clean %>% 
  group_by(ADM1_PC, trimester) %>% 
  summarise(avg_d_mbps = mean(avg_d_mbps, na.rm = TRUE),
            avg_d_mbps_winsorized = mean(avg_d_mbps_winsorized, na.rm = TRUE),
            avg_u_mbps = mean(avg_u_mbps, na.rm = TRUE),
            avg_u_mbps_winsorized = mean(avg_u_mbps_winsorized, na.rm = TRUE),
            tests = sum(tests, na.rm = TRUE),
            devices = sum(devices, na.rm = TRUE))

infrastructure_municipality <- colombia_infraestructure %>% 
  rowwise() %>% 
  mutate(n_types = sum(!is.na(c(college, university, clinic, school, hospital))))

infrastructure_state <- colombia_infraestructure %>% 
  group_by(ADM1_PC) %>% 
  summarise(college = sum(college, na.rm = TRUE),
         school = sum(school, na.rm = TRUE),
         university = sum(university, na.rm = TRUE),
         clinic = sum(clinic, na.rm = TRUE),
         hospital = sum(hospital, na.rm = TRUE))

infrastructure_state[infrastructure_state == 0] <- NA 

infrastructure_state <- colombia_infraestructure %>% 
  rowwise() %>% 
  mutate(n_types = sum(!is.na(c(college, university, clinic, school, hospital))))

##### Task 5  --------------------------
# Save the final datasets
# - Remove unnecessary variables
# - Save the datasets as CSV files
