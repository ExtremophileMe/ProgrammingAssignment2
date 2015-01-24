
cacheSolve <- function(x, ...) {
        m <- x[getinverse()]
        if(!is.null(m)) {
                message("Getting cached matrix")
                return(m)
        }
        data <- x[get()]
        m <- solve(data)
        x[setinverse(m)]
        m
}