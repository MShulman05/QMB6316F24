# Assignment 3



Following the instructions in the document ```QMB6316_assignment_03.pdf``` above, 
enter your responses in the code blocks shown below.

*Please note that the document has been revised to clarify some details and correct a typo. These changes are shown in red.*


In this exercise, we will follow an approach different than that taken in class. 
We will first estimate a model with our choices of functional form, then consider exclusions of insignificant variables from the full model. 
Note that this approach allows for inclusion of possibly irrelevant variables and avoids excluding any relevant variables. 


At each stage, use the best model that you have found so far, 
incorporating the findings from the answer to the previous question.




a. Estimate a regression model that uses all available variables.
	Make sure to choose a reasonable transformation of the dependent variable, 
	such as the logarithmic transformation, if necessary.
	
```
Call:
lm(formula = saleprice ~ horsepower + age + enghours + diesel + 
    fwd + manual + johndeere + cab + spring + summer + winter, 
    data = tractor_full)

Residuals:
   Min     1Q Median     3Q    Max 
-43367  -6939   -972   5698 106859 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) 15478.1695  4511.5224   3.431 0.000698 ***
horsepower    183.7491    15.3139  11.999  < 2e-16 ***
age          -659.7654   148.2680  -4.450 1.27e-05 ***
enghours       -1.7932     0.3972  -4.514 9.58e-06 ***
diesel       1444.4664  4039.3857   0.358 0.720932    
fwd          2289.7272  2437.3099   0.939 0.348359    
manual      -4727.2221  2575.5053  -1.835 0.067563 .  
johndeere   13830.7849  3001.4687   4.608 6.33e-06 ***
cab         10589.8712  2622.7887   4.038 7.08e-05 ***
spring      -3005.2271  2698.7841  -1.114 0.266486    
summer      -7485.2891  2646.2313  -2.829 0.005033 ** 
winter      -6250.4788  2962.2099  -2.110 0.035793 *  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 16540 on 264 degrees of freedom
Multiple R-squared:  0.6073,	Adjusted R-squared:  0.5909 
F-statistic: 37.11 on 11 and 264 DF,  p-value: < 2.2e-16

> 


Call:
lm(formula = log_saleprice ~ horsepower + age + enghours + diesel + 
    fwd + manual + johndeere + cab + spring + summer + winter, 
    data = tractor_full)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.71960 -0.27081  0.06041  0.29064  0.93637 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  9.035e+00  1.179e-01  76.616  < 2e-16 ***
horsepower   4.287e-03  4.003e-04  10.709  < 2e-16 ***
age         -2.933e-02  3.876e-03  -7.569 6.31e-13 ***
enghours    -3.530e-05  1.038e-05  -3.400 0.000779 ***
diesel       3.188e-01  1.056e-01   3.019 0.002782 ** 
fwd          2.671e-01  6.371e-02   4.192 3.78e-05 ***
manual      -1.647e-01  6.732e-02  -2.447 0.015068 *  
johndeere    2.973e-01  7.846e-02   3.789 0.000187 ***
cab          6.899e-01  6.856e-02  10.063  < 2e-16 ***
spring      -1.015e-01  7.055e-02  -1.438 0.151552    
summer      -2.060e-01  6.917e-02  -2.978 0.003169 ** 
winter      -1.874e-01  7.743e-02  -2.420 0.016201 *  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.4323 on 264 degrees of freedom
Multiple R-squared:  0.7609,	Adjusted R-squared:  0.751 
F-statistic:  76.4 on 11 and 264 DF,  p-value: < 2.2e-16

Model 1:
Adjusted R-squared:  0.5909 

Model 2:
Adjusted R-squared:  0.751 

Model 2 (log_saleprice) is better.
```

Does this seem to be a reasonable model, as opposed to using average tractor prices? 
Said differently, do at least some of the variables help to predict the prices of used tractors?
Is the R-squared or the R-bar-squared reasonably high?

```
Enter your response here.

Yes!



```


b. Which variables seem to help explain used tractor prices? 
	Which have positive and negative relationships with tractor prices?
	Which variables that do not seem to have statistically significant coefficients under this specification?
	
```
Enter your response here.
Make sure to mention all variables (positive negative and insignificant.





```



c. Before making any reductions to your model, revise the model specification first
	by considering nonlinear specifications.
	A used tractor dealer tells you that overpowered used tractors are hard to sell, since they consume more fuel. 
      Tractor prices often increase with horsepower, up to a point, but beyond that they decrease. 
      To incorporate this advice, you create and include a variable for squared horsepower and include that in a new regression model. 
      

```
Call:
lm(formula = log_saleprice ~ horsepower + age + enghours + diesel + 
    fwd + manual + johndeere + cab, data = tractor_full)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.80585 -0.27865  0.02766  0.30108  1.03003 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)  8.921e+00  1.138e-01  78.415  < 2e-16 ***
horsepower   4.167e-03  4.038e-04  10.320  < 2e-16 ***
age         -2.881e-02  3.922e-03  -7.344 2.51e-12 ***
enghours    -3.461e-05  1.051e-05  -3.293 0.001124 ** 
diesel       3.265e-01  1.068e-01   3.058 0.002452 ** 
fwd          2.735e-01  6.415e-02   4.263 2.80e-05 ***
manual      -1.723e-01  6.820e-02  -2.526 0.012130 *  
johndeere    2.995e-01  7.919e-02   3.782 0.000192 ***
cab          7.028e-01  6.929e-02  10.143  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.4389 on 267 degrees of freedom
Multiple R-squared:  0.7509,	Adjusted R-squared:  0.7434 
F-statistic: 100.6 on 8 and 267 DF,  p-value: < 2.2e-16


Call:
lm(formula = log_saleprice ~ horsepower + squared_horsepower + 
    age + enghours + diesel + fwd + manual + johndeere + cab, 
    data = tractor_full)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.77600 -0.22279  0.04383  0.25746  0.78445 

Coefficients:
                     Estimate Std. Error t value Pr(>|t|)    
(Intercept)         8.751e+00  1.078e-01  81.177  < 2e-16 ***
horsepower          1.121e-02  1.085e-03  10.335  < 2e-16 ***
squared_horsepower -1.586e-05  2.293e-06  -6.914 3.49e-11 ***
age                -3.159e-02  3.640e-03  -8.678 4.11e-16 ***
enghours           -4.035e-05  9.730e-06  -4.147 4.53e-05 ***
diesel              2.186e-01  9.970e-02   2.193   0.0292 *  
fwd                 2.809e-01  5.918e-02   4.746 3.38e-06 ***
manual             -1.606e-01  6.293e-02  -2.552   0.0113 *  
johndeere           3.121e-01  7.307e-02   4.272 2.70e-05 ***
cab                 4.857e-01  7.121e-02   6.820 6.09e-11 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.4048 on 266 degrees of freedom
Multiple R-squared:  0.7888,	Adjusted R-squared:  0.7817 
F-statistic: 110.4 on 9 and 266 DF,  p-value: < 2.2e-16



```


  c.i) Hypothesize the signs for the coefficients on horsepower 
	under this scenario. 
		What should be the sign of the coefficient for horsepower? 
		What sign do you expect for squared horsepower?
      
```
Enter your response here.


```

  c.ii) Perform 1-sided t-tests of the hypotheses for each of the horsepower coefficients. 
That is, are the t-statistics higher than 1.96, with the same sign as you hypothesized?

```

Enter your response here.
Use the coefficients and t-statistics from the regression output for this model to draw your conclusions.



```

  c.iii) Compare the models with and without the quadratic functional form for horsepower.
            Which model do you recommend? 
		Be sure to cite evidence to support your choice. 
		Specifically, check the four specification criteria: 
		statistical significant $t$-statistics, 
		an increase in R-squared, 
		a good theoretical justification, and 
		no large change in the other coefficients.

```
Enter your response here.

Without squared horsepower:
Adjusted R-squared:  0.7434 

With squared horsepower:
Adjusted R-squared:  0.7817


Statistical significant $t$-statistics: Check.

A good theoretical justification: 
declining value of horsepower from fuel consumption.


No large change in the other coefficients: Check.
If there were a change, you might consider keeping the new variable
if the other coefficients changed. 

```


d. Again, use the best model that results from the answer to the previous question to address further questions.
	Use the model you have so far to test that the time of year has no effect on the sale of tractors.
	That is, test whether the t-statistics on the seasonal indicators are statistically significant. 
	Is there evidence that tractor prices follow a seasonal pattern? 

```
Enter your response here.
Use the coefficients from the regression output for this model to draw your conclusions.


Call:
lm(formula = log_saleprice ~ horsepower + squared_horsepower + 
    age + enghours + diesel + fwd + manual + johndeere + cab + 
    spring + summer + winter, data = tractor_full)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.70032 -0.23458  0.05526  0.29542  0.74373 

Coefficients:
                     Estimate Std. Error t value Pr(>|t|)    
(Intercept)         8.862e+00  1.114e-01  79.527  < 2e-16 ***
horsepower          1.125e-02  1.069e-03  10.533  < 2e-16 ***
squared_horsepower -1.569e-05  2.258e-06  -6.948 2.92e-11 ***
age                -3.205e-02  3.591e-03  -8.926  < 2e-16 ***
enghours           -4.089e-05  9.596e-06  -4.261 2.84e-05 ***
diesel              2.132e-01  9.842e-02   2.166  0.03121 *  
fwd                 2.761e-01  5.869e-02   4.704 4.12e-06 ***
manual             -1.534e-01  6.202e-02  -2.474  0.01400 *  
johndeere           3.100e-01  7.228e-02   4.289 2.52e-05 ***
cab                 4.762e-01  7.023e-02   6.781 7.85e-11 ***
spring             -1.115e-01  6.498e-02  -1.716  0.08741 .  
summer             -1.972e-01  6.372e-02  -3.095  0.00218 ** 
winter             -1.774e-01  7.132e-02  -2.487  0.01351 *  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.3982 on 263 degrees of freedom
Multiple R-squared:  0.798,	Adjusted R-squared:  0.7888 
F-statistic: 86.59 on 12 and 263 DF,  p-value: < 2.2e-16


T-statistics are significant:
spring             -1.115e-01  6.498e-02  -1.716  0.08741 .  
summer             -1.972e-01  6.372e-02  -3.095  0.00218 ** 
winter             -1.774e-01  7.132e-02  -2.487  0.01351 *  
(2 out of three)

Adjusted R-squared is higher at  0.7888 

```
	
	
e. Finally, consider another modification to your model. 
	Some say that John Deere tractors hold their value longer than other tractors. 
      This raises the question of whether an additional hour of use affects the value of a John Deere tractor 
	differently than for tractors of other brands. 
	You can test this by including an interaction with ```enghours:johndeere``` in the regression.
	
```
Enter your regression results here.



```

Test the hypothesis, at the 5 percent level of significance, that the slope for engine hours differs by brand. 

Does an additional hour of use affect the price of a John Deere tractor
differently than tractors of other brands?
	
```
Enter your response here.

Call:
lm(formula = log_saleprice ~ horsepower + squared_horsepower + 
    age + enghours + diesel + fwd + manual + johndeere + cab + 
    spring + summer + winter + enghours:johndeere, data = tractor_full)

Residuals:
     Min       1Q   Median       3Q      Max 
-1.70721 -0.22173  0.05738  0.29261  0.76140 

Coefficients:
                     Estimate Std. Error t value Pr(>|t|)    
(Intercept)         8.865e+00  1.118e-01  79.275  < 2e-16 ***
horsepower          1.124e-02  1.071e-03  10.491  < 2e-16 ***
squared_horsepower -1.562e-05  2.268e-06  -6.888 4.19e-11 ***
age                -3.208e-02  3.597e-03  -8.918  < 2e-16 ***
enghours           -4.215e-05  1.018e-05  -4.141 4.66e-05 ***
diesel              2.162e-01  9.891e-02   2.186  0.02970 *  
fwd                 2.754e-01  5.881e-02   4.683 4.55e-06 ***
manual             -1.519e-01  6.225e-02  -2.440  0.01534 *  
johndeere           2.794e-01  1.086e-01   2.572  0.01065 *  
cab                 4.779e-01  7.048e-02   6.780 7.93e-11 ***
spring             -1.146e-01  6.561e-02  -1.747  0.08183 .  
summer             -2.004e-01  6.439e-02  -3.113  0.00206 ** 
winter             -1.776e-01  7.144e-02  -2.486  0.01353 *  
enghours:johndeere  7.866e-06  2.078e-05   0.378  0.70541    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.3988 on 262 degrees of freedom
Multiple R-squared:  0.7981,	Adjusted R-squared:  0.7881 
F-statistic: 79.68 on 13 and 262 DF,  p-value: < 2.2e-16

Adjusted R-squared is  0.7881 

vs.
Adjusted R-squared:  0.7888 
from the previous model.
Not much of an improvement.

And the t-statistic is insignificant:
enghours:johndeere  7.866e-06  2.078e-05   0.378  0.70541    

Conclude that John Deere tractors decline in value at the same rate.


```
	
	
	
