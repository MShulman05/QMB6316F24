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
Enter your regression results here.


```

Does this seem to be a reasonable model, as opposed to using average tractor prices? 
Said differently, do at least some of the variables help to predict the prices of used tractors?
Is the R-squared or the R-bar-squared reasonably high?

```
Enter your response here.



```


b. Which variables seem to help explain used tractor prices? 
	Which have positive and negative relationships with tractor prices?
	Which variables that do not seem to have statistically significant coefficients under this specification?
	
```
Enter your response here.



```



c. Before making any reductions to your model, revise the model specification first
	by considering nonlinear specifications.
	A used tractor dealer tells you that overpowered used tractors are hard to sell, since they consume more fuel. 
      Tractor prices often increase with horsepower, up to a point, but beyond that they decrease. 
      To incorporate this advice, you create and include a variable for squared horsepower and include that in a new regression model. 
      

```
Enter your regression results here.



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



```


d. Again, use the best model that results from the answer to the previous question to address further questions.
	Use the model you have so far to test that the time of year has no effect on the sale of tractors.
	That is, test whether the t-statistics on the seasonal indicators are statistically significant. 
	Is there evidence that tractor prices follow a seasonal pattern? 

```
Enter your response here.
Use the coefficients from the regression output for this model to draw your conclusions.



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



```
	
	
	
