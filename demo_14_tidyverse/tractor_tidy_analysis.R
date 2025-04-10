##################################################
#
#
# QMB 6316.0081 R for Business Analytics
#
# Joining Datasets and Estimating Regression Models
# using tools in the tidyverse
#
# Lealand Morin, Ph.D.
# Adjunct Professor
# College of Business
# University of Central Florida
#
# December 4, 2024
#
##################################################
#
# tractor_tidy_analysis is an exercise in joining
# data sets with data on tractor sales and
# tractor specifications to build a dataset for
# a regression model. 
# Then it is used to estimate OLS regression models
# by considering a number of different model specifications
# on a dataset of prices from the sale of used tractors.
#
##################################################


##################################################
# Preparing the Workspace
##################################################

# Clear workspace.
rm(list=ls(all=TRUE))

# Load required libraries.
# library(name_of_R_package)
library(tidyverse)
library(readxl)


##################################################
# Setting the Parameters
##################################################


# Set path for working directory.
setwd("~/GitHub/QMB6316F24/demo_14_tidyverse")

# Modify the above line according to the specific path on your computer,
# as in:
# wd_path <- 'C:/Users/name/of/your/path'

# Set the working directory to this path.
# setwd(wd_path)

# Verify that the path was assigned correctly.
getwd()


##################################################
# Introducing the "pipe" operator.
##################################################

# The "pipe" operator passes the value on the left 
# as the first argument of the function on the right.

# Adding numbers.
c(1, 2, 3) %>% sum()

# Summarizing data.
seq(1, 10) %>% summary()

# You can chain multiple operations.
1 %>% log()
# is the same as
log(1)
# and 
7 %>% log() %>% exp()
# because exp() and log() are inverses of each other.
exp(log(42))
log(exp(103))


# We will use this operator several times in what follows.


##################################################
# Loading the Data
##################################################

# tractor_sales <- read.csv('tractor_sales.csv')
read_xlsx("tractor_data.xlsx", sheet = "Sales") %>%
  summary()

tractor_data <- read_xlsx("tractor_data.xlsx", sheet = "Sales")

# Inspect the contents.
summary(tractor_data)
# Same as above.



##################################################
# Estimating a Regression Model
# Model 0: Linear model for log of sale price
##################################################

# Use all available variables from first dataset.
colnames(tractor_data)

# Estimate a regression model.
lm_model_0 <- lm(data = tractor_data,
                 formula = log(saleprice) ~ age + enghours +
                   johndeere +
                   spring + summer + winter)

# Output the results to screen.
summary(lm_model_0)


##################################################
# Joining in Tractor Specifications
##################################################

# This time, read and join the data in one operation.
tractor_data <- read_xlsx("tractor_data.xlsx", sheet = "Sales") %>%
  left_join(read_xlsx("tractor_data.xlsx", sheet = "Specs"))



##################################################
# Estimating a Regression Model
# Model 1: Linear model for log of sale price
##################################################


# Use all available variables from full dataset.
colnames(tractor_data)

# Estimate a regression model.
lm_model_1 <- lm(data = tractor_data,
                 formula = log(saleprice) ~ horsepower + age + enghours +
                   diesel + fwd + manual + johndeere +
                   spring + summer + winter)

# Output the results to screen.
summary(lm_model_1)


# This should be a much better model.


##################################################
# Joining in Tractors with Cabs
##################################################


# This time, read and join the data in one operation.
tractor_data <- read_xlsx("tractor_data.xlsx", sheet = "Sales") %>%
  left_join(read_xlsx("tractor_data.xlsx", sheet = "Specs")) %>%
  left_join(read_xlsx("tractor_data.xlsx", sheet = "Cabs"))

# Verify that the data were joined correctly.
summary(tractor_data)


# That did not seem to have worked.
# We lost some observations.
# Cab is either 1 or missing (NA's).

# Use the mutate command to replace the cab variable with a proper indicator.
tractor_data <- read_xlsx("tractor_data.xlsx", sheet = "Sales") %>%
  left_join(read_xlsx("tractor_data.xlsx", sheet = "Specs")) %>%
  left_join(read_xlsx("tractor_data.xlsx", sheet = "Cabs")) %>%
  mutate(cab_orig = cab, 
         cab = ifelse(is.na(cab), 0, cab))

# Verify *again* that the data were joined correctly this time.
summary(tractor_data)
# Looks good this time. Same number of observations.

##################################################
# Estimating a Regression Model
# Model 2: Linear model for the log of the sale price
##################################################

# Use all available variables from full dataset.
colnames(tractor_data)

# Estimate a regression model.
lm_model_2 <- lm(data = tractor_data,
                 formula = log(saleprice) ~ horsepower + age + enghours +
                   diesel + fwd + manual + johndeere +
                   cab +
                   spring + summer + winter)

# Output the results to screen.
summary(lm_model_2)

##################################################
# Output the full dataset for further analysis
##################################################

# No need to output dataset, since we can performa
# all the joins in one (chained) command.


##################################################
# Read in all data and join together, then
# generate new variables in one command.
##################################################

tractor_data <- read_xlsx("tractor_data.xlsx", sheet = "Sales") %>%
  left_join(read_xlsx("tractor_data.xlsx", sheet = "Specs")) %>%
  left_join(read_xlsx("tractor_data.xlsx", sheet = "Cabs")) %>%
  mutate(cab_orig = cab, 
         cab = ifelse(is.na(cab), 0, cab), 
         log_saleprice = log(saleprice), 
         squared_horsepower = horsepower^2)

# Inspect the contents one more time.
summary(tractor_data)


##################################################
# Estimating a Regression Model
# Model 2: Linear model for log of dollar sale price
##################################################

# Estimate a regression model.
lm_model_2 <- lm(data = tractor_data,
                 formula = log_saleprice ~ horsepower + squared_horsepower + 
                   age + enghours +
                   diesel + fwd + manual + johndeere +
                   cab # +
                   # spring + summer + winter
                 )

# Output the results to screen.
summary(lm_model_2)

# This time, all the work was done in two commands.

# (I know, that's easy to say, after you know the best model, 
# but it would still take several attempts to find that model.)


##################################################
# End
##################################################
