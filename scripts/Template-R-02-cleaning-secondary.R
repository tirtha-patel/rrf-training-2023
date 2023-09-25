# Cleaning data - R - secondary sources - template
# Load necessary packages --------------------------

# install.packages("pacman")

packages <- c("tidyr", 
              "dplyr", 
              "labelled", 
              "stringi", 
              "Hmisc")

pacman::p_load(packages,
               character.only = TRUE,
               install = FALSE) # Change to TRUE to install the necessary packages

# Set path of our data 

# Set folder path to where you downloaded the data
tidy_folder <- 
  "YOUR/FOLDER/PATH"

# Exercise 1 part 1 ---------------------------------------

# Step 0: Read data
# Read the connectivity data from your CSV file
# ...

# Step 1: Remove duplicate entries
# Identify and remove duplicate rows in your data
# ...

# Step 2: Ensure there is at least one identifying variable in the data
# Verify that your data has at least one identifying variable
# ...

# Step 3: Encode choice questions and ensure correct data types
# Check data types of different columns and modify them if necessary
# ...

# Step 4: Handle missing values
# Handle rows and columns with missing values in a way that suits your analysis
# ...

# Step 5: Drop data collection metadata variables not needed for analysis
# Remove unnecessary columns from your dataset
# ...

# Step 6: Ensure all variables have English names and no special characters
# Standardize the column names by removing special characters
# ...

# Step 7: Adding variable labels
# Add descriptive labels to your variables with a maximum of 80 characters each
# ...

# View the clean data
# Preview your cleaned data
# ...

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
