
# Logistic Regression

When the variable takes the form of a binary variable, i.e., it takes on only two values, say, 0 and 1, the linear regression model is not appropriate. 
The logistic regression model uses the logistic transformation to produce an estimate of the probability that 
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20Y_i=1"/>.

## The Logistic Equation

The logistic equation also implies that the data are a transformation of a linear equation in
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20X_i"/>
by applying the *logit* transformation:

<img src="Images/Logistic_Regression_Equation.gif"/>

## Comparison with Linear Probability Model


The prediction from a linear regression is called the *linear probability model* when it is used to predict binary events. 
Compared to the linear probability model, the logisti regression produces estimates of the probabilities that are constrained to lie between zero and one, as they should. 
In contrast, the predictions from the linear probability model will be greater than one and lower than zero for some values of 
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20X_i"/>.

<img src="Images/Logistic_vs_OLS_Regression.png"/>



## Estimating a Logistic Regression in R

Estimating a logistic regression in R involves the same three steps as
for a linear regression model.
1. Reading in the data.
1. Specifying the regression equation.
1. Calculating the statistics for the regression model.

As above, you can read in the data with the ```read.table``` or the ```read.csv``` function. 

```
my_data <- read.csv('path_to_my_data/name_of_data_set_file.csv')
```

Again, you then specify a ```formula``` object. 
This is dfined by a set of notation to specify the names of the dependent variables and explanatory variables. 
As above, the formula takes the form 
```
Y ~ X_1 + X_2 + X_3
```
which will estimate a logistic regression using ```X_1```, ```X_2``` and ```X_3```
to predict ```Y```. 


Then pass these two arguments to the ```glm``` function, where the 
```g``` denotes the *Generalized Linear Model*. 
```
my_logit_model <- glm(data = my_data, formula = Y ~ X_1 + X_2 + X_3, family = 'binomial')
```

The additional argument ```family = 'binomial'``` is used to specify the particular model within the ```glm``` famil of models. 
For a logistic regression, with binary outcomes, you select the ```binomial``` model as the ```family```.

The results of the regression are stored in the ```glm``` object ```my_logit_model```. 
As with a linear regression, you can print out the regression results by summarizing the ```lm``` model object ```my_lm_model``` that was created by the ```lm``` function.


```
summary(my_logit_model)
```


## The Fit of a Logistic Regression Model

Another method is used to measure the quality of fit of a logistic regression model. 
A statistic called the *Area under the ROC Curve* is appropriate for this. 
The *AUROC* is interpreted as the probability that any pair of predictions is correctly ordered, when one observation is drawn from 
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20Y_i=0"/>
and one is drawn from
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20Y_i=1"/>, 
where "correctly ordered" means that the prediction for the probability that
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20Y_i=1"/>
is higher than the prediction for the probability that
<img src="https://latex.codecogs.com/png.latex?%5Cbg_white%20Y_i=0"/>.

Although it is quite commonly used in industry, 
this statistic is not automatically printed out with the ```glm``` model output. 
You can calculate it separately as follows. 

```
roc(response = my_data[, 'Y'], 
    predictor = my_data[, 'my_predictions'])
```

But first, in order to do this, you will need to create predictions from the model and store it in a variable, possibly in the same dataset. 
```
my_data[, 'my_predictions'] <- predict(my_logit_model, type = 'response')
```


Note that to perform this calculation by calling the ```roc``` function, you need to install and attach the ```pROC``` package:

```
install.packages("pROC')
library(pROC)
```

You only need to ```install.packages``` the first time you use this library, 
from then on, the function in this package can be used by calling the ```library``` function, just like the ```import``` function does for modules in Python. 
