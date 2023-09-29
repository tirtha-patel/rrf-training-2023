# Cleaning data - R - secondary sources - template
# Load necessary packages --------------------------

packages <- c("tidyr", 
              "dplyr", 
              "labelled", 
              "stringi", 
              "Hmisc",
              "codebook")

pacman::p_load(packages,
               character.only = TRUE,
               install = TRUE)

# Set path of our data 

# Set folder path to where you downloaded the data
tidy_folder <- here("data") 

# Exercise 1 part 1 ---------------------------------------

# Step 0: Read data
# Read the connectivity data from your CSV file
connectivity <- read.csv(file.path(tidy_folder, 
                                        "colombia_connectivity_decleaned.csv")) 

# Step 1: Remove duplicate entries
# Identify and remove duplicate rows in your data
connectivity <- connectivity %>% 
  distinct()

# Step 2: Ensure there is at least one identifying variable in the data
# Verify that your data has at least one identifying variable

summary(connectivity)
length(unique(connectivity$quadkey))*2 # each qua
length(unique(connectivity$ADM2_PC))
length(unique(connectivity$ADM2_ES)) 

# Step 3: Encode choice questions and ensure correct data types
# Check data types of different columns and modify them if necessary
str(connectivity)

# Step 4: Handle missing values
# Handle rows and columns with missing values in a way that suits your analysis
connectivity <- connectivity %>% 
  rowwise() %>% 
  filter(!all(is.na(c(avg_d_kbps, avg_u_kbps, avg_lat_ms, tests, devices))))

# Step 5: Drop data collection metadata variables not needed for analysis
# Remove unnecessary columns from your dataset

connectivity <- connectivity %>% 
  select(-id_test_data)

# Step 6: Ensure all variables have English names and no special characters
# Standardize the column names by removing special characters
connectivity <- connectivity %>% 
  mutate(ADM1_ES = stri_trans_general(ADM1_ES, "Latin-ASCII"),
         ADM2_ES = stri_trans_general(ADM2_ES, "Latin-ASCII"))

# Step 7: Adding variable labels
# Add descriptive labels to your variables with a maximum of 80 characters each
connectivity_clean <- connectivity %>% 
  set_variable_labels(quadkey = "tiles", 
                      ADM0_PC = "country code", 
                      ADM0_ES = "country name", 
                      ADM1_PC = "state code", 
                      ADM1_ES = "state name", 
                      ADM2_PC = "municipality code", 
                      ADM2_ES = "municipality name", 
                      connection = "connection", 
                      trimester = "quarter in the year", 
                      avg_d_kbps = "average download speed", 
                      avg_u_kbps = "average upload speed", 
                      avg_lat_ms = "average lat speed", 
                      tests = "tests", 
                      devices = "devices")

# View the clean data
# Preview your cleaned data
str(connectivity_clean)
summary(connectivity_clean)

# Exercise 1 part 2 ---------------------------------------

# Metadata
# Step 0: Get data type and labels for each column
# Get the class/type and labels of each column in your cleaned data
# ...

# Step 1: Create a data frame for the codebook
# Create a codebook data frame using the info gathered in the previous step
# ...

# Step 2: Save the cleaned data and the codebook
# Save your cleaned data and the codebook as CSV files
# ...
