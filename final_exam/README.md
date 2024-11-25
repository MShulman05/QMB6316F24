# Final Examination

## Due Friday, December 6, 2024 at 11:59 PM in your GitHub repository.

Complete the exercise described in the pdf above and enter your answers in 
the spaces below.

*Please see the revised version of the pdf copy of the question paper, uploaded Nov. 23, 2024.*

## Part A: Data Handling and Preliminary Regression Modelling

### Question 1

a) Read in the ```airplane_sales.csv``` dataset and store it in a data frame called ```airplane_sales``` in your workspace. 


```

Enter the required code here.

```

b) Calculate and copy the printed output from a ```summary``` of the data. 
Use this to get familiar with the contents of the dataset. 


```

Copy your results here.


```

c) Estimate a regression model to predict ```price``` as a function of ```age```. 
Copy the printed estimation output from the ```summary``` command. 


```

Copy your results here.


```


### Question 2

a) Read in the ```airplane_specs.csv``` dataset and store it 
in a data frame called ```airplane_specs``` in your workspace. 


```

Enter the required code here.

```

b)  Form a dataset ```airplane_sales_specs.csv``` 
by ```merge```ing the data frames 
```airplane_sales.csv``` and ```airplane_specs.csv```. 
Store the new dataset in a data frame called 
```airplane_sales_specs``` in your workspace. 


```

Enter the required code here.

```


c) Calculate and copy the printed output from a ```summary``` of the data. 
Use this to get familiar with the contents of the dataset. 


```

Copy your results here.


```


d) Estimate a regression model to predict ```price``` as a function of 
```age```, ```pass```, ```wtop```, ```fixgear```, 
and ```tdrag```. 
Copy the printed estimation output from the ```summary``` command. 


```

Copy your results here.


```




### Question 3

a) Read in the ```airplane_perf.csv``` dataset and store it 
in a data frame called ```airplane_perf``` in your workspace. 


```

Enter the required code here.

```

b) Form a dataset ```airplane_full.csv``` 
by ```merge```ing all three datasets. 
Store the new dataset 
in a data frame called ```airplane_full``` in your workspace. 


```

Enter the required code here.

```

c) Calculate and copy the printed output from a ```summary``` 
of the new variables. 
Use this to get familiar with the contents of the dataset. 


```

Copy your results here.


```


d) Estimate a regression model to predict ```price``` as a function of 
```age```, ```pass```, ```wtop```, ```fixgear```, 
and ```tdrag```, 
as well as ```horse```, ```fuel```, ```ceiling```, and ```cruise```.
Copy the printed estimation output from the ```summary``` command. 


```

Copy your results here.


```






## Part B: Advanced Regression Modelling


### Question 4

a) Create new variables 
	```log_price```, ```log_age```, ```log_horse```, 
	```log_fuel```, ```log_ceiling```, and ```log_cruise```
	from the variables 
	```price```, ```age```, ```horse```, 
	```fuel```, ```ceiling```, and ```cruise```, 
	using the logarithm function ```log()``` in ```R``` 
	to create these new variables. 


```

Enter the required code here.

```

b) Calculate and copy the printed output from a ```summary``` 
of the new variables. 
Use this to get familiar with the contents of the dataset. 


```

Copy your results here.


```


c) Estimate a regression model to predict ```log_price``` as a function of 
	```log_age```, ```pass```, ```wtop```, ```fixgear```, 
	and ```tdrag```, 
	as well as 
	```log_horse```, ```log_fuel```, ```log_ceiling```, 
	and ```log_cruise```. 
	Copy the printed estimation output from the ```summary``` command. 


```

Copy your results here.


```


d) If you notice that any coefficients are statistically insignificant, 
	estimate the model by removing them one at a time. 
	For each variable removed, 
	determine whether the variable should be removed 
	by considering the four specification criteria: 
		statistically significant $t$-statistics, 
		an increase in ```R-bar-squared```, 
		a good theoretical justification, and 
		no large change in the other coefficients.


```

Enter a description of your sequence of adjustments
to the regression model here.
Be sure to address the four specification criteria
described above.


```

Next regression model:

```

Copy your regression results here.


```

Next regression model, if necessary:

```

Copy your regression results here.


```

Next regression model, if necessary:

```

Copy your regression results here.


```

Next regression model, if necessary:

```

Copy your regression results here.


```



e) Print the output from a ```summary``` of the regression results
of your final regression model.


```

Copy your final regression results here.


```

f) Finally, for each of the variables in the datasets, 
	list those that are positively related to airplane prices,
	negatively related to airplane prices, 
	and statistically unrelated to airplane prices. 


```

Enter your response here.


```




## Part C: Version Control

### Question 5

Push your completed files to the ```final_exam``` folder 
in your private GitHub repository.