##################################################
#
# QMB 6316.0081 R for Business Analytics
#
# OLS Regression Demo
# Regression with Simulated Data: Omitted Variables
#
# Lealand Morin, Ph.D.
# Adjunct Professor
# College of Business
# University of Central Florida
#
# November 20, 2024
#
##################################################
#
# OLS_omit uses simulated data to create an example
#   that illustrates the change in estimates resulting from
#   omitted variables.
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

# You need to set the working directory to the location
# of your files.
# setwd("/path/to/your/folder")
# Find this path as follows:
# 1. Click on the "File" tab in the bottom right pane.
# 2. Browse to the folder on your computer that contains your R files.
# 3. Click the gear icon and choose the option "Set as Working Directory."
# 4. Copy the command from the Console in the bottom left pane.
# 5. Paste the command below:

setwd("~/GitHub/QMB6316F24/demo_10_omitted_variables")


# Now, RStudio should know where your files are.



# No libraries required.
# Otherwise would have a command like the following.
# library(name_of_R_package)


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
beta_income     <-   5.00    # Slope ceofficient for income
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
sigma_2 <- 0.1        # Variance of error term
num_obs <- 100      # Number of observations in dataset


##################################################
# Generating the Data
##################################################

# Call the housing_sample function from ECO6416_tools.R.
housing_data <- housing_sample(beta_0, beta_income, beta_cali, beta_earthquake,
                               avg_income, sd_income, pct_in_cali, prob_earthquake,
                               sigma_2, num_obs)


# Summarize the data to inspect for data quality.
summary(housing_data)

# Check that earthquakes occurred only in California:
table(housing_data[, 'in_cali'], housing_data[, 'earthquake'])
# Data errors are the most frequent cause of problems in model-building.

# Run it again if no earthquakes occurred.


##################################################
# Estimating the Regression Model
# Model 1: All Variables Included
##################################################

# Estimate a regression model.
lm_full_model <- lm(data = housing_data,
                    formula = house_price ~ income + in_cali + earthquake)

# Output the results to screen.
summary(lm_full_model)


##################################################
# Estimating the Regression Model
# Model 2: Omitting One Variable
##################################################

# Estimate a regression model.
lm_no_earthquakes <- lm(data = housing_data,
                        formula = house_price ~ income + in_cali) # earthquake removed.

# Output the results to screen.
summary(lm_no_earthquakes)


##################################################
#
# Exercise:
#
# Observe the values of the coefficient for earthquakes.
# Then compare the change in coefficient on California
# with and without the earthquake variable.
#
##################################################



##################################################
# End
##################################################