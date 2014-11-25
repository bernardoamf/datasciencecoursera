## Put comments here that give an overall description of what your
## functions do

## Takes a matrix and creates a new object where the inverted of the matrix is stored

makeCacheMatrix <- function(x = matrix()) {
		m <- x
        set <- function(y) {
                m <<- y
                mi <<- NULL
        }
        get <- function() m
        setInverted <- function(Inverted = matrix) mi <<- Inverted
        getInverted <- function() mi
        list(set = set, get = get,
             setInverted = setInverted,
             getInverted = getInverted)

}

## takes a Matrix and checks if the inverted has been calculated, if so it return the cached value


cacheSolve <- function(x, ...) {
        mi <- x$getInverted()
        if(!is.null(mi)) {
                message("getting cached data")
                return(mi)
        }
        data <- x$get()
        mi <- solve(data)
        x$setInverted(m1)
        mi
}


