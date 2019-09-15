myfunction <- function(){
	x <- rnorm(100)
	mean(x)
}

second <- function(x){
	x + rnorm(length(x))
}

first_factorial <- function(num){
  temp_num <- num
  count <- 1
 
  while(num > 0){
   temp_num <- temp_num * (num - count)
   count <- count + 1
  }
  return(temp_num)
}