# Script to readin census data, strip spaces from headers
# add in # tot the data
# Files: week1Import_tidyScriptR
# E08000025_WP201EW.csv
# E08000025_WP403EW.csv
# E08000025_WP501EW.csv
# E08000025_WP601EW.csv
# Load necessary library
library(readxl)

# Define directory and file names
directory <- "/Users/jonsadler/Library/CloudStorage/OneDrive-UniversityofBirmingham/Teaching-materials/COURSES/4TH_YR/LM 40222 Quantitative methods/Codefiles/Data/Birmingham_Workplace_Data_Pack_2011/Local_Authority_Districts/E08000025/tables"

file_names <- c("E08000025_WP201EW.csv", "E08000025_WP403EW.csv", "E08000025_WP501EW.csv","E08000025_WP601EW.csv")

# Initialize list to store data
data_list <- list()

# Loop through each file name
for (file_name in file_names) {
  file_path <- file.path(directory, file_name)
  data_list[[file_name]] <- read_csv(file_path)
}

# use mutate to generate %

# Assuming your list of data frames is named 'data_list' and we want to mutate the first data frame
df <- data_list[[1]]  # Extract the first data frame from the list
# Calculate percentages using mutate for the first data frame E08000025_WP201EW.csv
df1 <- df %>%
  mutate(across(
    6:ncol(df),  # Apply the operation to all columns from the 6th to the last column
    ~ .x / EthnicGroup_total * 100,  # Calculate the percentage using EthnicGroup_total as the base
    .names = "{.col}:value%"  # Append ':value%' to the names of the new percentage columns
  ))

# Calculate percentages using mutate for the second data frame E08000025_WP403EW.csv
df <- data_list[[2]]  # Extract the first data frame from the list

# Calculate percentages using mutate for the second data frame
df2 <- df %>%
  mutate(across(
    6:ncol(df),  # Apply the operation to all columns from the 6th to the last column
    ~ .x / `Tenure: All categories: Tenure; measures: Value` * 100,  # Calculate the percentage using the specified total column as the base
    .names = "{.col}:value%"  # Append ':value%' to the names of the new percentage columns
  ))

# Calculate percentages using mutate for the third data frame E08000025_WP501EW.csv
df <- data_list[[3]]  # Extract the first data frame from the list
# Calculate percentages using mutate for the third data frame
df3 <- df %>%
  mutate(across(
    6:ncol(df),  # Apply the operation to all columns from the 6th to the last column
    ~ .x / `Highest Level of Qualification: All categories: Highest level of qualification; measures: Value` * 100,  # Calculate the percentage using the specified total column as the base
    .names = "{.col}:value%"  # Append ':value%' to the names of the new percentage columns
  ))

# Calculate percentages using mutate for the first data frame E08000025_WP601EW.csv
df <- data_list[[4]]  # Extract the first data frame from the list
df4 <- df %>%
  mutate(across(
    6:ncol(df),  # Apply the operation to all columns from the 6th to the last column
    ~ .x / `Employment Status: All categories: Employment status; measures: Value` * 100,  # Calculate the percentage using the specified total column as the base
    .names = "{.col}:value%"  # Append ':value%' to the names of the new percentage columns
  ))

# write to files
write.csv(df1, "E08000025_WP201EW.csv", row.names = FALSE)
write.csv(df2, "E08000025_WP403EW.csv", row.names = FALSE)
write.csv(df3, "E08000025_WP501EW.csv", row.names = FALSE)
write.csv(df4, "E08000025_WP601EW.csv", row.names = FALSE)
