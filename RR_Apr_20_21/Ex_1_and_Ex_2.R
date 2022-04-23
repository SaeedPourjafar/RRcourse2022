######### Exercise 1 ##############################

for(i in seq(100)){
  
  #If i is multiple of 15, print "FizzBuzz"
  if(i %% 3 == 0 & i %% 5 == 0)
  {cat("FizzBuzz \n")}
  
  #If i is multiple of 3, print "Fizz"
  else if(i %% 3 == 0)
  {cat("Fizz \n")} 
  
  #If i is multiple of 5, print "Buzz"
  else if(i %% 5 == 0)
  {cat("Buzz \n")}      
  
  #For other numbers, print exactly them
  else 
  {cat(i, "\n")}        
}

######### Exercise 2.1 ##############################

library(types)

# This function compute Fibonacci value
fib <- function(num = ? integer){
  if(num < 2){return(num)}
  else {return(fib(num-1)+fib(num-2))}
}

# This function uses fib function to output the largest Fibonacci number smaller than input
myFibFunction <- function(num = ? integer ? float){
  
  # It starts from 1 and check whether fib(i) is larger than num or not. 
  # If so, it stops and returns fib of previous i
  for(i in 1:(num+1))
  {if (fib(i)>=num)
  {return(fib(i-1))}}
}

######### Exercise 2.2 ##############################

MyInverseFunc <- function(num = ? integer){
  
  # First count the digits of num by transforming it to a character
  x1 <- nchar(as.character(num))
  
  # Then create an empty object
  x2 <- ""
  
  # Finally, starting from the last digit, concatenate them one by one 
  for (i in x1:1) {
    x2 <- paste0(x2, substr(as.character(num), i, i))
  }
  
  return(x2)
}
