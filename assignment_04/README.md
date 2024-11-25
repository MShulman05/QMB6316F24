# Assignment 4

Complete the exercise described in the pdf above and enter your answers in 
the spaces below.

## Running the Script as Given

Run the entire script and observe the output from the simulation.
In particular, observe the statistics printed at the bottom.



a. Copy and paste the means and standard deviations from the output after the commands
```sapply(reg_results[, full_list_of_variables], mean)``` 
and ```sapply(reg_results[, full_list_of_variables], sd)```. 


```

Copy your results here.


```

b. For each parameter, calculate the distance between the mean estimate and the true value, in terms of the number of standard deviations of that variable. 
The true values of the coefficients are listed in lines 74 to 78 in the script ```OLS_on_repeat_A4.R```.


```
Type your response here.
```


c. Now compare the average values of each of the estimated coefficients with their true values.
Are they biased or unbiased?
Keep in mind that with an unbiased estimator 
a difference of less than $2$ standard deviations could often happen by chance.


```

Type your response here.


```



## Running the Script after Modification


d. Copy and paste the means and standard deviations from the output 
after the commands 
```sapply(reg_results[, full_list_of_variables], mean)```

and ```sapply(reg_results[, full_list_of_variables], sd)```.


```

Copy your results here.


```


e. For each parameter, calculate the distance between the mean estimate and the true value, in terms of the number of standard deviations of that variable. 


```

Type your response here.

```


f. Now compare the average values of each of the estimates 
with their true values when the true 
```mileage``` is unobserved 
but inaccurate ```mileage_1``` is observed instead.
Are they biased or unbiased?
Again, keep in mind that with an unbiased estimator 
a difference of less than $2$ standard deviations could often happen by chance. 


```

Type your response here.


```

