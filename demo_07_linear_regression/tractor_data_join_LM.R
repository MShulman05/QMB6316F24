##################################################
#
#
# QMB 6316.0081 R for Business Analytics
#
# Joining Datasets
#
# Lealand Morin, Ph.D.
# Adjunct Professor
# College of Business
# University of Central Florida
#
# November 18, 2024
#
##################################################
#
# tractor_data_join is an exercise in joining
# data sets with data on tractor sales and
# tractor specifications to build a dataset for
# a regression model.
#
##################################################


##################################################
# Preparing the Workspace
##################################################

# Clear workspace.
rm(list=ls(all=TRUE))

# No libraries required.
# Otherwise would have a command like the following.
# library(name_of_R_package)


##################################################
# Setting the Parameters
##################################################


# Set path for working directory.
setwd("~/GitHub/QMB6316F24/demo_07_linear_regression")

# Modify the above line according to the specific path on your computer,
# as in:
# wd_path <- 'C:/Users/name/of/your/path'

# Set the working directory to this path.
# setwd(wd_path)

# Verify that the path was assigned correctly.
getwd()


##################################################
# Loading the Data
##################################################

tractor_sales <- read.csv('tractor_sales.csv')

# Inspect the contents.
summary(tractor_sales)
# Make sure there are no problems with the data.



##################################################
# Estimating a Regression Model
# Model 0: Linear model for log of sale price
##################################################

# Use all available variables from first dataset.
colnames(tractor_sales)

# Estimate a regression model.
lm_model_0 <- lm(data = tractor_sales,
                 formula = log(saleprice) ~ age + enghours +
                   johndeere +
                   spring + summer + winter)

# Output the results to screen.
summary(lm_model_0)


##################################################
# Joining in Tractor Specifications
##################################################


# Load the dataset of tractor specifications.
tractor_specs <- read.csv('tractor_specs.csv')

# Inspect the contents.
summary(tractor_specs)
# Make sure there are no problems with the data.


# Join the two datasets.

tractor_sales_specs <- merge(x = tractor_sales, y = tractor_specs)

# Verify that the data were joined correctly.
summary(tractor_sales_specs)



##################################################
# Estimating a Regression Model
# Model 1: Linear model for log of sale price
##################################################

# Use all available variables from full dataset.
colnames(tractor_sales_specs)

# Estimate a regression model.
lm_model_1 <- lm(data = tractor_sales_specs,
                 formula = log(saleprice) ~ horsepower + age + enghours +
                   diesel + fwd + manual + johndeere +
                   spring + summer + winter)

# Output the results to screen.
summary(lm_model_1)


# This should be a much better model.


##################################################
# Joining in Tractor Specifications
##################################################


# Load the dataset of tractor specifications.
tractor_cabs <- read.csv('tractors_with_cabs.csv')

# Inspect the contents.
summary(tractor_cabs)
# Make sure there are no problems with the data.


# Join the two datasets.
tractor_full <- merge(x = tractor_sales_specs, y = tractor_cabs)

# Verify that the data were joined correctly.
summary(tractor_full)


# That did not seem to have worked.
# We lost some observations.

# The above merge command was an inner join (the default).
# Add the all.x argument to specify a left join.


# Try the join allowing for the tractors not appearing in the cabs dataset.
tractor_full <- merge(x = tractor_sales_specs, y = tractor_cabs, 
                      all.x = TRUE)

# Check the data again.
summary(tractor_full)
# Cab is either 1 or missing (NA's).


# Then replace the cab variable with a proper indicator.
# Make a copy, just in case.
tractor_full[, 'cab_orig'] <- tractor_full[, 'cab']

# Create an indicator variable.
# Select the rows with missing cabs.
sel_rows <- is.na(tractor_full[, 'cab'])
# Set those to zero to indicate no cabs.
tractor_full[sel_rows, 'cab'] <- 0


# Verify *again* that the data were joined correctly this time.
summary(tractor_full)
# Looks good this time. Same number of observations.


##################################################
# Estimating a Regression Model
# Model 2: Linear model for the sale price
##################################################

# Use all available variables from full dataset.
colnames(tractor_full)

# Estimate a regression model.
lm_model_2 <- lm(data = tractor_full,
                 formula = saleprice ~ horsepower + age + enghours +
                   diesel + fwd + manual + johndeere +
                   cab +
                   spring + summer + winter)

# Output the results to screen.
summary(lm_model_2)


# If the new variable predictive value, this should be an even better model.


##################################################
# Output the full dataset for further analysis
##################################################


write.csv(tractor_full, 'tractor_full.csv')


##################################################
# End
##################################################