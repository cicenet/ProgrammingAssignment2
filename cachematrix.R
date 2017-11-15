## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  # Assign NULL to a global variable "m" in which is stored inverse matrix
  m <- NULL
  set <- function(y) {
    #Assign values to global variables
   x <<- y
   m <<- NULL
  }
 get <- function() x
  #Inverse matrix is assigned to global variable
 setsolve <- function(solve) m <<- solve
  # Return the inverse matrix
 getsolve <- function() m
 list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


cachesolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
    m <- x$getsolve()
  #Validation if the inverse matrix was already calculated
  if(!is.null(m)) {
     message("getting cached inverse matrix")
    #Return the inverse matrix and exit the function
     return(m)
    }
  #If inverse matrix was not calculated, then is calculated for once
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
   m
}
