# A) Normal
determina.n <- function(epsilon, sigma, alpha){
    z <- qnorm(alpha/2, lower.tail=FALSE)
    n <- (z*sigma/epsilon)^2
    return(n)
}

