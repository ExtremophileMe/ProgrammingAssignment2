
##This exercise may seem like it has no point initially, but
##the point is really to learn how to check if some computation
##has already been done and is cached so that you don't waste valuable 
##time and computer power doing it again. Useful for more things
##than just calculating the mean in the future.

makeVector <- function(c = numeric()) {
        d <- NULL
        print(environment())
        evn <- environment()
        print(parent.env(evn))
        set <- function(g) {
                c <<- g
                d <<- NULL
        }
        get <- function() c
        setmean <- function(mean) d <<- mean
        getmean <- function() d
        getevn<- function() environment()
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean,
             getevn = getevn)
}