##################################################
#
# QMB 6316.0081 R for Business Analytics
#
# OLS Regression Demo
# Examples of Model Specification
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
# tractor_analysis gives examples of OLS regression models
#   by considering a number of different model specifications
#   on a dataset of prices from the sale of used tractors.
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


setwd("~/GitHub/QMB6316F24/demo_07_linear_regression")


# Now, RStudio should know where your files are.



# No libraries required.
# Otherwise would have a command like the following.
# library(name_of_R_package)


# The csv file used below must be in the working directory.
# If you an error message, make sure that the file is
# located in your working directory.
# Also make sure that the name has not changed.


##################################################
# Loading the Data
##################################################

tractor_full <- read.csv('tractor_full.csv')

# Inspect the contents.
summary(tractor_full)
# Make sure there are no problems with the data.


##################################################
# Generating New Variables
##################################################

# You can create new variables in two ways:
# 1. Add commands within this program
#     (as for log_saleprice and squared_horsepower below).
# 2. Create new columns in a spreadsheet.

hist(tractor_full[, 'saleprice'])
# Notice that there are some very large values.
# Consider taking logs to bring outliers closer to the others.

tractor_full[, 'log_saleprice'] <- log(tractor_full[, 'saleprice'])

# Now plot the histogram for log of saleprice:
hist(tractor_full[, 'log_saleprice'])
# Much better behaved. Looks almost normal.

# Create a variable squared_horsepower
# to investigate quadratic relationship of sale price to horsepower.
tractor_full[, 'squared_horsepower'] <- tractor_full[, 'horsepower']^2


##################################################
# Estimating a Regression Model
# Model 1: Linear model for dollar sale price
##################################################

# Estimate a regression model.
lm_model_1 <- lm(data = tractor_full,
                 formula = saleprice ~ horsepower + age + enghours +
                   diesel + fwd + manual + johndeere +
                   cab +
                   spring + summer + winter)

# Output the results to screen.
summary(lm_model_1)


##################################################
# Estimating a Regression Model
# Model 2: Linear model for log of dollar sale price
##################################################

# Estimate a regression model.
lm_model_2 <- lm(data = tractor_full,
                 formula = log_saleprice ~ horsepower + age + enghours +
                   diesel + fwd + manual + johndeere +
                   cab +
                   spring + summer + winter)

# Output the results to screen.
summary(lm_model_2)


summary(tractor_full[, 'saleprice'])

summary(tractor_full[tractor_full[, 'johndeere'] == 1, 'saleprice'])
summary(tractor_full[tractor_full[, 'johndeere'] == 0, 'saleprice'])


##################################################
# Estimating a Regression Model
# Model 3: Linear model for log of dollar sale price
# Omit seasonal indicators
##################################################

# Estimate a regression model.
lm_model_3 <- lm(data = tractor_full,
                 formula = log_saleprice ~ horsepower + age + enghours +
                   diesel + fwd + manual + johndeere +
                   cab)

# Output the results to screen.
summary(lm_model_3)


##################################################
# Estimating a Regression Model
# Model 4: Linear model for log of dollar sale price
# Omit seasonal indicators and transmission type
##################################################

# Estimate a regression model.
lm_model_4 <- lm(data = tractor_full,
                 formula = log_saleprice ~ horsepower + age + enghours +
                   diesel + fwd + johndeere +
                   cab)

# Output the results to screen.
summary(lm_model_4)


##################################################
#
# Exercise:
#
# Consider a polynomial functional form for horsepower.
# Idea: Horsepower improves performance up to a limit,
# then extra power does not add value, only consumes more fuel.
#
# 1. Generate the squared variable.
# 2. Hypothesize the signs.
# 3. Add the squared horsepower term to the regression equation.
# 4. Estimate the revised model.
# 5. Analyze the resulting estimates.
# 6. Make recommendation for the new model.
#
##################################################


##################################################
# Estimating a Regression Model
# Model 5: Linear model for log of dollar sale price
# Omit seasonal indicators and transmission type
# and estimate with nonlinear relationship with horsepower
##################################################



# Estimate a regression model.
lm_model_5 <- lm(data = tractor_full,
                 formula = log_saleprice ~ horsepower + squared_horsepower +
                   age + enghours +
                   cab +
                   diesel + fwd + johndeere)

# Output the results to screen.
summary(lm_model_5)


# Note that diesel indicator is no longer significant.


##################################################
# Estimating a Regression Model
# Model 6: Linear model for log of dollar sale price
# Omit seasonal indicators, diesel, and transmission type
# and estimate with nonlinear relationship with horsepower
##################################################



# Estimate a regression model.
lm_model_6 <- lm(data = tractor_full,
                 formula = log_saleprice ~ horsepower + squared_horsepower +
                   age + enghours +
                   cab +
                   # diesel + 
                   fwd + johndeere)

# Output the results to screen.
summary(lm_model_6)


##################################################
# Test with seasonal indicators
##################################################



# Estimate a regression model.
lm_model_7 <- lm(data = tractor_full,
                 formula = log_saleprice ~ horsepower + squared_horsepower +
                   age + enghours +
                   cab +
                   # diesel + 
                   fwd + johndeere + 
                   spring + summer + winter)

# Output the results to screen.
summary(lm_model_7)


##################################################
# Test with seasonal indicators
##################################################



# Estimate a regression model.
lm_model_8 <- lm(data = tractor_full,
                 formula = log_saleprice ~ horsepower + squared_horsepower +
                   age + enghours +
                   cab +
                   # diesel + 
                   fwd + johndeere + 
                   spring + summer + winter +
                   age:johndeere)

# Output the results to screen.
summary(lm_model_8)


##################################################
# End
##################################################