# Analysis - R - secondary sources Template
# Load necessary packages --------------------------

# install.packages("pacman")

packages <- c("tidyr", 
              "dplyr", 
              "ggplot2", 
              "corrplot", 
              "stargazer", 
              "gt", 
              "plm", 
              "lmtest")

pacman::p_load(packages,
               character.only = TRUE,
               install = FALSE) # Change to TRUE to install the necessary packages

# Set path of our data 

# Set folder path to where you downloaded the data
tidy_folder <- 
  "YOUR/FOLDER/PATH"

# read data 

municipality_database <- read.csv(file.path(tidy_folder,
                                            "municipality_database.csv"))

state_database <- read.csv(file.path(tidy_folder,
                                     "state_database.csv"))

# -------------
# Task 1: Create Summary Statistics
# -------------

# In this task, generate summary statistics for both municipality and state databases.

# You can use summary() function, here is another more customized option. 

summary_stats <- municipality_database %>%
  # only numeric variables 
  summarise(across(avg_d_mbps_winsorized:avg_u_mbps_change, list(mean = ~mean(.x, na.rm = TRUE), 
                                                                 sd = ~sd(.x, na.rm = TRUE), 
                                                                 cilower = ~quantile(.x, 0.025, na.rm = TRUE), 
                                                                 ciupper = ~quantile(.x, 0.975, na.rm = TRUE)))) %>%
  pivot_longer(cols = everything(),
               names_to = c("Statistic", "Variable"),
               values_to = "value", 
               names_sep = "_(?=[^_]+$)") %>% 
  pivot_wider(names_from = Variable) %>% 
  rename(Mean = "mean", SD = "sd", `95% CI Lower` = "cilower", `95% CI Upper` = "ciupper")

# Task 1: Create Summary Statistics ------------------------

# For Municipality
# Note: Use dplyr functions such as summarise and across to calculate summary statistics like mean, sd, etc.
# ....
# Use gt package to create nice looking tables.
# ....

# For State
# Note: Similarly, create summary statistics for the state database
# ....

# Task 2: Visualization of Individual Variables ------------

# Histogram
# Note: Use ggplot2 package to create histograms. Use geom_histogram() function for histograms.
# ....

# Boxplot
# Note: Use geom_boxplot() function to create box plots.
# ....

# Save the plots using ggsave()
# ....

# Task 3: Regression Analysis ------------------------

# Building Simple Linear Regression Model
# Note: Use lm() function to create a linear model. Use summary() function to get a summary of the model.
# ....

# Building Panel Data Model
# Note: Use pdata.frame() to create a panel data frame and use plm() function for panel data models.
# ....

# Multiple Regression Model with Clustered Standard Errors
# Note: Use plm() function to build the model and vcovHC() and coeftest() functions to get clustered standard errors.
# ....

# Save the model using stargazer
# Note: Use the stargazer package to create a neat table of your regression results. 
# Set different parameters in the stargazer function to customize the table according to your needs.
# ....

# Task 4: Visual Analysis ------------------------

# Relationship Analysis
# Note: Use ggplot2 for scatter plots and add trend lines using geom_smooth() function. 
# Analyze the relationship between different variables visually.
# ....

# Change in Connectivity Analysis
# Note: Use ggplot2 to create a bar plot to visualize changes in connectivity. 
#You can use dplyr functions like filter, group_by, and summarize to process the data before plotting.
# ....

# Task 5: Correlation Analysis ------------------------

# Note: Use cor.test() function to perform correlation tests. Use cor() function to create a correlation matrix.
# ....

# Visualize the correlation matrix
# Note: Use corrplot() function from corrplot package to visualize the correlation matrix.
# ....