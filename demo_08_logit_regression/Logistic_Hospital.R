##################################################
#
# QMB 6316.0081 R for Business Analytics
#
# Logistic Regression Demo
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
# Logistic_Hospital gives an example of
#   a logistic regression model
#   and compares with linear model specifications.
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

setwd("~/GitHub/QMB6316F24/demo_08_logit_regression")


# Now, RStudio should know where your files are.


# The csv file used below must be in the working directory.
# If you an error message, make sure that the file is
# located in your working directory.
# Also make sure that the name has not changed.

# Load library for computing the AUROC.
# You will have to install this package the first time.
# Press the "Install" button or run the following (without the #):
# install.packages('pROC')
library(pROC)


##################################################
# Loading the Data
##################################################

# A sample dataset to predict patients' choice of hospital.
hospital_choice <- read.csv('HOSPITAL.csv')

# Inspect the contents.
summary(hospital_choice)

# Variables include:
# D to indicate whether a patient chose Cedars Sinai Hospital,
#   0 if they chose UCLA
# DISTANCE is the excess distance from the patients home to Cedars Sinai
#   minus the distance to UCLA
# INCOME is the average income in the zip code in thousands
# OLD is an indicator for whether the patient is older than 75

# Inspect the correlations between numeric explanatory variables.
cor(hospital_choice[, c('DISTANCE', 'INCOME', 'OLD')])
# Be aware of any explanatory variables that are highly correlated
# (both positively and negatively) with each other.

# Compare the distributions of variables
# for classes of the dependent variable.
summary(hospital_choice[hospital_choice[, 'D'] == 0, ])
summary(hospital_choice[hospital_choice[, 'D'] == 1, ])


##################################################
# Generating New Variables
##################################################

# You can create new variables in two ways:
# 1. Add commands within this program
# 2. Create new columns in a spreadsheet
#   (but you would need to re-load the dataset
#   after adding variables this way)




##################################################
# Estimating a Linear Regression Model
# Model 1: Linear probability model for hospital choice
##################################################

# Estimate a regression model.
lm_model_1 <- lm(data = hospital_choice,
                 formula = D ~ DISTANCE + INCOME + OLD)

# Output the results to screen.
summary(lm_model_1)

# Calculate the predictions of this model.
hospital_choice[, 'D_hat_lm'] <- predict(lm_model_1)

summary(hospital_choice[, 'D_hat_lm'])
# Does anything look unusual?


##################################################
# Estimating a Logistic Regression Model
# Model 2: Logistic model for hospital choice
##################################################

# Estimate a logistic regression model.
logit_model_1 <- glm(data = hospital_choice,
                     formula = D ~ DISTANCE + INCOME + OLD,
                     family = 'binomial')

# Output the results to screen.
summary(logit_model_1)


# Calculate the predictions of this model.
hospital_choice[, 'D_hat_logit'] <- predict(logit_model_1, type = 'response')

summary(hospital_choice[, 'D_hat_logit'])
# Does this look better?


##################################################
# Compare quality of prediction with AUROC
# The Area Under the ROC Curve
##################################################

# Calculate the AUROC for the logistic model.
roc(response = hospital_choice[, 'D'],
    predictor = hospital_choice[, 'D_hat_logit'])


# Compare this to the estimate for the linear model.
roc(response = hospital_choice[, 'D'],
    predictor = hospital_choice[, 'D_hat_lm'])



##################################################
# Estimating a Logistic Regression Model
# Model 3: Logistic model for hospital choice
# Interaction between age and distance
##################################################

# Estimate a logistic regression model.
logit_model_2 <- glm(data = hospital_choice,
                     formula = D ~ DISTANCE + INCOME + OLD, 
                     family = 'binomial')

# Output the results to screen.
summary(logit_model_2)

# Calculate the predictions of this model.
hospital_choice[, 'D_hat_logit_2'] <- predict(logit_model_2, type = 'response')


# Calculate the AUROC for this logistic model.
roc(response = hospital_choice[, 'D'],
    predictor = hospital_choice[, 'D_hat_logit_2'])




##################################################
# Interaction with Age and Distance
##################################################

# Estimate another logistic regression model
# that allows for a different slope coefficient
# on distance for older patients.
# Does this new model lead you to revise your conclusion
# about the coefficient on DISTANCE? If so, how?


# Estimate a logistic regression model.
logit_model_3 <- glm(data = hospital_choice,
                     formula = D ~ DISTANCE + INCOME + OLD +
                       OLD:DISTANCE, 
                     family = 'binomial')

# Output the results to screen.
summary(logit_model_3)

# Calculate the predictions of this model.
hospital_choice[, 'D_hat_logit_3'] <- predict(logit_model_3, type = 'response')


# Calculate the AUROC for this logistic model.
roc(response = hospital_choice[, 'D'],
    predictor = hospital_choice[, 'D_hat_logit_3'])





##################################################
# End
##################################################
