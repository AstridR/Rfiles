## in this first function "makeCacheMatrix" the inverse of a cache matrix is 
## calculated


makeCacheMatrix <- function(x = matrix()) { 
        ##the function requires the input of a matrix x, it cannot be set later
        
        ## inv is set to zero to be filled later
        inv <- NULL
        
        ## this function returns the matrix x     
        getmatrix <- function() x   
        
        ## the inverse of x is calculated 
        setinv <- function(solve) inv <<- solve(x) 
        
        ## this function returns the inverse of matrix x 
        getinv <- function() inv
        
        list(getmatrix = getmatrix,
             setinv = setinv,
             getinv = getinv)
        
       
}


## in this second function "cacheSolve", either the inverse of matrix x is 
## returned from the function above or the inverse of x calculated if not 
## already calculated in the first function 

cacheSolve <- function(x, ...) {
        
        ## the inverse of matrix x is questioned from the above function 
        ## and allocated to inv
        inv <- x$getinv()
        
        ## if the inverse has already been calculated in the above function 
        ## (inv != zero) it is returned here
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        
        ## if inv is NULL, the matrix x is taken from makeCacheMatrix 
        ## and the inverse caluclated 
        
        data <- x$getmatrix()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
        
        

}