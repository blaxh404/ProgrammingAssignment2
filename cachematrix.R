
#I guess these function do really the same as the example for the mean, nothing very surprising

## This function will create an object makeCacheMatrix with some attributes (matrix/inverse) and methods (get/set)
 # that will allow us to store more than only the initial matrix inside

makeCacheMatrix <- function(x = matrix()) {
  
  inverse_m <- NULL
  
  set <- function(y){
    x <<- y
    inverse_m <<- NULL
  }
  get <- function() x
  set_inverse <- function(inverse_arg) inverse_m <<- inverse_arg
  get_inverse <- function() inverse_m
  
  list(set = set, get = get, set_inverse = set_inverse, get_inverse = get_inverse)
}


## This function will calculate the inverse of the matrix
# and store it in the previously created makeCacheMatrix object


cacheSolve <- function(x, ...) {
        inverse_m <- x$get_inverse()
        
        if(!is.null(inverse_m)){
          message("getting cached data")
          return(inverse_m)
        }
          dt_matrix <- x$get()
          inverse_m <- solve(dt_matrix, ...)
          x$set_inverse(inverse_m)
          inverse_m
        
}
