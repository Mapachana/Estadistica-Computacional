
# Cojo la muestra del ejercicio 5
n <- 5
set.seed(2)
x <- rnorm(n)
y <- 1+x+rnorm(n, 0, 0.1)

# Crea la matriz de regresion X y el vector de respuesta y
X <- cbind(1, x)

# a)
QR <- qr(X)

# b)
Q <- qr.Q(QR)
Q

# c)
b <- t(Q)%*%y
b

# d)
R <- qr.R(QR)
R

# e)
backsolve(R,b)