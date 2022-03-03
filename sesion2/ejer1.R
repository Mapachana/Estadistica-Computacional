# Autor: Ana Buendia
# Ejercicio 1

x <- seq(1, 10, by=0.2)
x
# a
n <- length((x))
n
# b
names(x) <- paste("x_", 1:n, sep="")
names(x)
# c
mx <- mean(x)
mx
# d
length(x[x>mx])
# e
min(which(x>mx))
# f
y <- seq(1, by=2, length.out=n)
y
# g
x[y[1:5]]