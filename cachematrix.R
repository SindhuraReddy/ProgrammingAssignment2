## The following functions use the concept of lexical scoping in R 

## The makeCacheMatrix creates a matrix that can store its inverse

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
}
get<-function() x
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)
}

## This function computes the inverse of the matrix returned by the makeCacheMatrix 
## function and returns its inverse
## if the inverse has already been calculated previously then it retrieves it from the Cache

cacheSolve <- function(x, ...) {
    m<-x$getmatrix()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
    matrix <-x$get()
    m<-solve(matrix, ...)
    x$setmatrix(m)
    m
}
