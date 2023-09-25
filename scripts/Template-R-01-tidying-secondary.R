# Tidying data - R - secondary sources - template
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

# Exercise 1 ---------------------------------------

# Step 1: Read the wide format data

connectivity_wide <- read.csv(file.path(tidy_folder, 
                                        "colombia_connectivity_wide.csv")) 

# Step 2: Remove duplicates 

# Step 3: Reshape data

# Step 4: Verify your dataset has the desired structure

# Exercise 2 ----------------------------

# Step 1: Read the long format data for infrastructure 
infrastructure_long <- read.csv(file.path(tidy_folder,
                                          "colombia_infrastructure_lng.csv"))

# Step 2: Explore the data 

# Step 3: Reshape the data. 

# Challenges  --------------------------

##### Part 1: municipality with more download speed

# rest of the exercise 

##### Part 2: municipality with more educational institutions 

# rest of the exercise 

