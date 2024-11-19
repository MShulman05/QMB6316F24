##################################################
#
# QMB 6316.0081 R for Business Analytics
#
# Merging datasets
#
# Lealand Morin, Ph.D.
# Adjunct Professor
# College of Business
# University of Central Florida
#
# November 19, 2024
#
##################################################
#
# merge_examples gives examples of
#   joining data in the common types of joins.
#
#
##################################################


##################################################
# Preparing the Workspace
##################################################

# Clear workspace.
rm(list=ls(all=TRUE))


# Set path for working directory.
setwd("~/GitHub/QMB6316F24/demo_06_merging_data")



##################################################
# Loading Data
##################################################

# Read the tables.
Employees <- read.csv('Employees.csv')
Departments <- read.csv('Departments.csv')



##################################################
# Merging data sets
##################################################


# INNER JOIN

inner_merge <- merge(Employees, Departments)
inner_merge
# Take attendance and see who is missing.


# LEFT OUTER JOIN

left_outer_merge <- merge(Employees, Departments, all.x = TRUE)
left_outer_merge



# RIGHT OUTER JOIN

right_outer_merge <- merge(Employees, Departments, all.y = TRUE)
right_outer_merge



# FULL OUTER JOIN

full_outer_merge <- merge(Employees, Departments, all = TRUE)
full_outer_merge




##################################################
# End
##################################################
