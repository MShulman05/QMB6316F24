# Linear Regression 

Linear regression is a statistical method for obtaining a prediction of an outcome 
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20Y_i"/> 

## The Regression Equation


The prediction takes the form of a linear equation for the prediction of 
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20Y_i"/> 
as a linear combination of the variables
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20X_i"/>
multiplied by the parameter
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20\beta_1"/>, 
plus an intercept
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20\beta_0"/>.

<img src="Images/Regression_Equation.png"/>


## The Minimization Problem

The parameters 
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20\beta_1"/> 
and
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20\beta_0"/>
are estimated by minimizing the sum of squared residuals from the regression line defined by
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20\beta_1"/> 
and
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20\beta_0"/>.
The residuals are the differerences from the observed values 
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20Y_i"/> 
from the values predicted by the regression line. 


<img src="Images/Regression_Minimization.png"/>


## Estimating a Linear Regression in R

Estimating a linear regression in R involves three main steps.
1. Reading in the data.
1. Specifying the regression equation.
1. Calculating the statistics for the regression model.

You can read in the data with the ```read.table``` or the ```read.csv``` function. 

```
my_data <- read.csv('path_to_my_data/name_of_data_set_file.csv')
```

Then specify a ```formula``` object. 
This is dfined by a set of notation to specify the names of the dependent variables and explanatory variables. 
A formula takes the form 
```
Y ~ X_1 + X_2 + X_3
```
which will estimate a regression using ```X_1```, ```X_2``` and ```X_3```
to predict ```Y```. 
You can also create the formula object from a string using the ```as.formula``` function:
```
my_lm_fmla <- as.formula("Y ~ X_1 + X_2 + X_3")
```


Then pass these two arguments to the ```lm``` function. 
```
my_lm_model <- lm(data = my_data, formula = Y ~ X_1 + X_2 + X_3)
```

If you created a formula object from a string, you can pass the formula through the ```formula``` argument with ```formula = my_lm_fmla```,
instead of typing in the regression equation directly.

The results of the regression are stored in the ```lm``` object ```my_lm_model```. 
You can print out the regression results by summarizing the ```lm``` model object ```my_lm_model``` that was created by the ```lm``` function.
This is done by using the generic ```summary``` function just as you would for a variable or any other object. 


```
summary(my_lm_model)
```



## The Fit of a Regression Model

The quality of fit of a regression model is determined by the degree to which the observations fit close to the regression line. 
It is represented by the statistic 
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20R^2"/>, 
pronounced "R-squared."
This statistic ranges from 
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20R^2=1"/>, 
for a model that fits the data perfectly,
to 
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20R^2=0"/>, 
if the dependent variable 
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20Y_i"/>
is unrelated to the explanatory variable
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20X_i"/>.
This statistic is shown in the regression output under the headings
```Multiple R-squared``` and ```Adjusted R-squared```.
The ```Adjusted R-squared``` includes an adjustment, or penalty, to account for the number of variables in the model, because
the ```Multiple R-squared``` can only be improved by including more variables in the model. 

<img src="Images/Linear_regression.png"/>

