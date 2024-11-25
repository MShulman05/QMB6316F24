##################################################
#
# QMB 6316.0081 R for Business Analytics
#
# OLS Regression Demo
# Regression with Simulated Data
#
# Lealand Morin, Ph.D.
# Adjunct Professor
# College of Business
# University of Central Florida
#
# November 13, 2024
#
##################################################
#
# OLS_sim gives an example of OLS regression
#   using simulated data.
#
# Dependencies:
#   sim_tools.R
#
##################################################


##################################################
# Preparing the Workspace
##################################################

# Clear workspace.
rm(list=ls(all=TRUE))

# RStudio does its work in a working directory,
# which is a folder on your computer.
# Display the current path to working directory, with getwd():
getwd()


# You need to set the working directory to the location
# of your files.
# setwd("/path/to/your/folder")
# Find this path as follows:
# 1. Click on the "File" tab in the bottom right pane.
# 2. Browse to the folder on your computer that contains your R files.
# 3. Click the gear icon and choose the option "Set as Working Directory."
# 4. Copy the command from the Console in the bottom left pane.
# 5. Paste the command below:

setwd("~/GitHub/QMB6316F24/demo_04_R_intro")


# Now, RStudio should know where your files are.


# Verify that it changed the path correctly.
getwd()



# R uses libraries, which we will use in future sessions.
# No libraries required.
# Otherwise would have a command like the following.
# library(name_of_R_package)
# We will use this later in the course.


# Read function for sampling data.
source('../tools/sim_tools.R')
# This is the same as running the sim_tools.R script first.
# It assumes that the script is saved in a folder called 'tools'.

# The file sim_tools.R must be in a folder called 'tools'.
# If you an error message, make sure that the file is
# located in your working directory.
# Also make sure that the name has not changed.


##################################################
# Setting the Parameters
##################################################

# Dependent Variable: Property values (in Millions)

beta_0          <-   0.10    # Intercept
beta_income     <-   5.00    # Slope coefficient for income
beta_cali       <-   0.25    # Slope coefficient for California
beta_earthquake <- - 0.50    # Slope coefficient for earthquake
# beta_earthquake <- - 0.00    # Slope coefficient for earthquake

# Distribution of incomes (also in millions).
avg_income <- 0.1
sd_income <- 0.01

# Fraction of dataset in California.
pct_in_cali <- 0.5

# Frequency of earthquakes (only in California).
prob_earthquake <- 0.05

# Additional terms:
sigma_2 <- 0.1      # Variance of error term
num_obs <- 100      # Number of observations in dataset


##################################################
# Generating the Data
##################################################

# Call the housing_sample function from sim_tools.R.
housing_data <- housing_sample(beta_0, beta_income, beta_cali, beta_earthquake,
                               avg_income, sd_income, pct_in_cali, prob_earthquake,
                               sigma_2, num_obs)


# Summarize the data to inspect for data quality.
summary(housing_data)

# Check that earthquakes occurred only in California:
table(housing_data[, 'in_cali'], housing_data[, 'earthquake'])
# Data errors are the most frequent cause of problems in model-building.



##################################################
# Estimating the Regression Model
##################################################

# Estimate a regression model.
lm_model <- lm(data = housing_data,
               formula = house_price ~ income + in_cali + earthquake)

# Output the results to screen.
summary(lm_model)




##################################################
# Generate another dataset and save it
##################################################

# Call the housing_sample function from sim_tools.R.
housing_data_2 <- housing_sample(beta_0, beta_income, beta_cali, beta_earthquake,
                               avg_income, sd_income, pct_in_cali, prob_earthquake,
                               sigma_2, num_obs)

# Save this to disk.
write.csv(housing_data_2, file = 'housing_data_2.csv')



##################################################
# Read the dataset and run another regression
# This is the same process you will follow when
# reading in a dataset obtained from any other source.
##################################################

# Read the newly saved dataset.
housing_data_3 <- read.csv(file = 'housing_data_2.csv')

# Estimate a regression model.
lm_model_3 <- lm(data = housing_data_3,
               formula = house_price ~ income + in_cali + earthquake)

# Output the results to screen.
summary(lm_model_3)


##################################################
# End
##################################################

