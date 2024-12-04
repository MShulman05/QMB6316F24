
# Assignment 5


Continue the in-class exercise using the script 
```data_mining_A5.R``` in RStudio, 
which is a modified version of the script 
```data_mining_demo.R```.  
In this exercise, we generate simulated data for car prices, 
which depend on mileage, 
whether the car has been in an accident, 
and whether the car has sustained major structural damage, 
which can happen only as a result of an accident. 



Run the entire script and observe the output from the 
series of models.


		
a) Verify that damage occurs in both the samples. 
	Observe the output under the code blocks in lines 123-139
	to verify that the bottom right numbers 
	(the number of observations with accidents with damages) are not zero.
	If one of these bottom-right numbers is zero, run the script again. 
	
```

Copy your results here.


```

		
b) Copy and paste the table of selected models and R-squared values, 
	under the command ```print(best_models)``` on line 315. 
	
```

Copy your results here.


```

		
c) Compare the models according to the in-sample ```R-bar-squared``` 
		under the column ```R2_in_sample```. 
		Which model is best under this criterion? 
		The variables in the model are listed in the column ```best_new_variable```
		up to the row of the chosen model. 

```

Type your response here.


```
		
d) Compare the models according to the out-of-sample ```R-bar-squared``` 
		under the column ```R2_out_sample```. 
		Which model is best under this criterion? 
		The variables in the model are listed in the column ```best_new_variable```
		up to the row of the chosen model. 

```

Type your response here.


```
		
e) Compare the differences between the two models.
		Do any variables appear in one model and not the other?
		Which model do you recommend on the basis of this data? 
		Is your recommended model the same as the true model? 



```

Type your response here.


```
