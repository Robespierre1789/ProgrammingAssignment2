## You can change the Matriz and execute makeCacheMatrix, 
## but if it is equal to the last matrix used, when you next time you execute cacheSolve it will use 
## the chache and don`t calculate again
# Please try this example
# AA<-matrix(7:10,2,2)
# BB<-matrix(7:10,2,2)
# ACA<-makeCacheMatrix(AA)
# cacheSolve(ACA)
# ACA<-makeCacheMatrix(BB)
# cacheSolve(ACA)


makeCacheMatrix <- function(x = matrix()) {
  #m <- NULL  This line is not necesary, because is the two matrix are equal, the function return m
  set <- function(y) {
    x <<- y
    #m <<- NULL Equal that the last comment
  }
  get <- function() x
  setinv <- function(solve) m <<- solve
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## Write a short comment describing this function
cacheSolve <- function(x, ...) {
  data <- x$get()
  
  if (exists("m")){
    if(identical(lastMatrix,data)) {
      message("The Matrix has no change")
      m <- x$getinv()
      return(m)
    }
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  lastMatrix<<-data  #Keep the last matrix used
  m
}