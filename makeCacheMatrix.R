
##The point here is really to learn how to check if some computation
##has already been done on a matrix and is cached so that you don't waste valuable 
##time and computer power doing it again. 

##This R script contains two functions. The first function makeCacheMatrix
##allows you to define a matrix and store it into m. This script also tells
##you which environment m, and the set, get, functions are stored in. The
##script prints these environments for you.


makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        print(environment())
        evn <- environment()
        print(parent.env(evn))
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        getevn<- function() environment()
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse,
             getevn = getevn)
}

##The second function is cacheSolve. This allows you to check whether the
##value of x has changed and get its inverse. If there is already a cached 
##matrix in X, the function prints a message. 
##NOTE: If your matrix changes, you MUST run makeCacheMatrix on it before running cacheSolve.

cacheSolve <- function(makeCacheMatrix, ...) {
        m <- makeCacheMatrix$getinverse()
        if(!is.null(m)) {
                message("Getting cached data")
                return(m)
        }
        data <- makeCacheMatrix$get()
        m <- solve(data)
        makeCacheMatrix$setinverse(m)
        m
}