# Autor: Ana Buendia
# Ejercicio 3

set.seed(1)

x <- runif(50)
x

# a
length(x[0.25<x & x<0.75])

# b
length(x[x < 0.1 | x > 0.9])
is.na(x) <- which(x < 0.1 | x > 0.9)
x
mean(x,na.rm=TRUE)

# c
x[is.na(x)]<-0
x
mean(x)