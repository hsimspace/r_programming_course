## Put comments here that give an overall description of what your
## functions do

## This function creates a matrix and allows us to use a
## sub-function to calculate the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {
  result_m <- NULL
  
  set <- function(y){
    x <<- y
    result_m <<- NULL
  }
  
  
  get <- function() x
  
  setInverse <- function(solve) result_m <<- solve
  
  getInverse <- function() result_m
  
  list(set = set, get = get, setInverse = setInverse, 
       getInverse = getInverse)
}


## This function takes the matrix object created in the above fucntion, 
## finds out whether the inverse of the matrix is already available.
## If it is not, it will calculate and return the inverse of the matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  result_m <- x$getInverse()
  
  if(!is.null(result_m)) {
    message("getting cached data")
    return(result_m)
  }
  
  data <- x$get()
  result_m <- solve(data, ...)
  x$setInverse(result_m)
  result_m
}
