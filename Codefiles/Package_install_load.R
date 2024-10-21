# script to loop through packages to assess weather they are loaded....
# List of required libraries
required_libraries <- c("sf","terra", "spdep","mapsf","maps","viridis","tmap","spData","spDataLarge","tidyverse")

# Check for the libraries that are not already installed
libraries_to_install <- required_libraries[!(required_libraries %in% installed.packages()[,"Package"])]

# Install missing libraries
if(length(libraries_to_install)) {
  install.packages(libraries_to_install, dependencies = TRUE)
}

# Load all the required libraries
lapply(required_libraries, library, character.only = TRUE)

#This first line of code asks to supply a vector of the libraries we need using 
# the **c()** command. We need the following libraries

#The **installed.packages()** function returns a matrix of installed packages and 
#maps this against the libraries we need. The line checking for uninstalled packages 
#uses !(required_libraries %in% installed.packages()[,"Package"]) expression to identify 
#packages not yet installed. **install.packages()** installs missing packages 
#and **dependencies=TRUE** makes sure all the correct dependencies are installed.
#**lapply()**: Loads each required library name from a list (i.e. **lapply()** 
#after checking whether they're installed. It is the equivalent of repeatedly typing library(thePackageName) many times.