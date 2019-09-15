## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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


## Write a short comment describing this function

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
