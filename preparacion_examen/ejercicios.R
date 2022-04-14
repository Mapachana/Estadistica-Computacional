# Ejercicios 3 de Marzo

# --------------- Ejercicio 1 

x <- seq(1, 10, by=0.2)
x

# a
n <- length(x)

# b
names(x) <- paste("x", 1:n, sep="_")
x

# c
mx <- mean(x)
mx

# d
sum(x>mx)

# e
which(x == min(x[x>mx]))

# f
y <- seq(1, by=2, length.out=n)

# g
x[y[1:5]]

# --------------- Ejercicio 2 

x<- seq(-2, 2, by=0.1)
x

(x< (-1))*1+(-1 <= x)*(x < 0)*log(x^2)+(0 <= x)*(x < 1)*log(x^2+1)+(x >= 1)*2
fx <- (x< (-1))*1+(-1 <= x& x < 0)*log(x^2)+(0 <= x & x < 1)*log(x^2+1)+(x >= 1)*2
fx[is.nan(fx)] <- 0
fx

# --------------- Ejercicio 3 

set.seed(1)
x <- runif(50)

# a
sum(x > 0.25 & x < 0.75)

# b
sum(x<0.1 | x>0.9)
x[x<0.1 | x>0.9] <- NA
mean(x, na.rm=TRUE)

# c
x [is.na(x)] <- 0
mean(x, na.rm=TRUE)

# --------------- Ejercicio 4 

a1 = 1
d = 1.2
n <- 20

an = a1 + (1:20-1)*d
an

# a
sum(an)
n*(an[1]+an[n])/2

# b
sd(an)
abs(d)*sqrt((n*(n+1))/12)

# c
prod(an)
(d^n)*(gamma(a1/d +n))/gamma(a1/d)

# --------------- Ejercicio 5 

x <- c(2,2,8,7,6,1,5)
n <- length(x)

x[2:n]-x[1:n-1]
diff(x)

# --------------- Ejercicio 6 

ABE <- LETTERS
ABE

# a
ABE.5 <- sample(ABE, 5, replace=FALSE)
ABE.5

# b
PAL <- c(paste(sample(ABE.5, 5, replace=FALSE), collapse=""), paste(sample(ABE.5, 5, replace=FALSE), collapse=""))
PAL


# -------------------------------------------------------------------------------------------------------------------
# Ejercicio dia 10 de Marzo


# --------------- Ejercicio 1

A <- matrix(1:9, 3,3)
A
x <- 1:3
x

A%*%x
class(A%*%x)
# da una matriz columna

#A%*%t(x)  esto no fufa, todo lo demas si
x%*%A
class(x%*%A)
t(x)%*%A
class(t(x)%*%A)
# Los dos anteriores dan la misma matriz fila

t(x)%*%x
class(t(x)%*%x)
# Da una matriz 1x1

# --------------- Ejercicio 2

# 2x=2 -> x=1
solve(2,2)

# Ax=b -> x= (-4,6)
A<-matrix(c(3,1,4,2),2,2)
b<-c(12,8)
solve(A,b)

# AX=C (C es matriz identidad 2x2) -> x=((1, -2), (-0.5, 1.5))
solve(A,diag(2))

# Calcula la inversa de A
solve(A)

# --------------- Ejercicio 3

A <- matrix(c(10, 7, 8, 7, 7, 5, 6, 5, 8, 6, 10, 9, 7, 5, 9, 10), ncol=4, nrow=4)
A
b <- c(32, 23, 33, 31)
b

solve(A, b)
solve(A, b+0.05)
solve(A, b+0.1)
# Tiene mal condicionamiento

# --------------- Ejercicio 4

A.autov <- eigen(A)$values
abs(max(A.autov)/min(A.autov))

1/kappa(A, exact=TRUE)

kappa(A, exact=TRUE)
rcond(A)

# --------------- Ejercicio 5

n<-5
set.seed(2)
x<-rnorm(n)
y<-1+x+rnorm(n,0,0.1)

# a
X <- cbind(1, x)

# b
XX <- crossprod(X,X)
XX.inv <- solve(XX)
XX.inv

# c
beta <- XX.inv%*%t(X)%*%y

# d
curve(1+x,-3,3,main='Regresión lineal simple',ylab='y')
points(x,y)
curve(beta[1]+beta[2]*x,add=T,col=2)

# --------------- Ejercicio 6

# a
QR <- qr(X)

# b
Q <- qr.Q(QR)

# c
b<-t(Q)%*%y

# d
R<-qr.R(QR)

# e
backsolve(R,b)

# --------------- Ejercicio 7

n <- 3
A <- matrix(rep(1:n,times=n)^rep(1:n,times=n, each=n),ncol=n,nrow=n)
A
x <- rep(1, times=n)
x

b <- A%*%x
b

# a
solve(A,b)

# b
rcond(A)

# c
# Paso de repetir, se va agravando el condicionamiento y ya


# -------------------------------------------------------------------------------------------------------------------
# Ejercicio dia 17 de Marzo


# --------------- Ejercicio 1

lista <- list(x1=1:5, x2=2:6, x3=3:7)

# a
x <- runif(10)
lista$x <- x
lista

# b
y <- rnorm(10)
lista$y <- y

# c
lapply(lista, sum)
sapply(lista, sum)
# lapply devuelve una lista y sapply un vector

# d
reg<-lm(y~x)
typeof(reg)

# e
lapply(reg, class)

# f
matriz <- cbind(reg$residuals, reg$fitted.values, x, y)
colnames(matriz) <- c("residuals", "fitted.values", "x", "y")
matriz

# --------------- Ejercicio 2

xi<-c(1.2,1.8,2.2,2.5,1.1)
yi<-c(15,18,10,12,6)
ni<-c(12,23,5,9,11)
datos<-data.frame(xi,yi,ni)

# a
n<-sum(datos$ni)
n

# b
mx <- sum(ni*xi)/n
mx
sx <- sum(ni*(xi-mx)^2)/(n-1)
sx

my <- sum(ni*yi)/n
my
sy <- sum(ni*(yi-my)^2)/(n-1)
sy

# c
datos.n <- data.frame(cbind(
    rep(xi, ni),
    rep(yi, ni)
    ))
colnames(datos.n) <- c('xi', 'yi')
datos.n

# d
mean(datos.n$xi)
var(datos.n$xi)

mean(datos.n$yi)
var(datos.n$yi)

# e

transform(datos.n, zxi=(xi-mx)/sx, zyi=(yi-my)/sy)
within(datos.n, {
    zxi<-(xi-mx)/sx
    zyi<-(yi-my)/sy
})

# --------------- Ejercicio 3

# a
head(ChickWeight)
tail(ChickWeight)

# b
str(ChickWeight)

# c
summary(ChickWeight)

# d
peso.dieta <- tapply(ChickWeight$weight, ChickWeight$Diet, summary)

# e
# no se ve
peso.dieta.2 <- 0

# f
peso.dieta.2 <- aggregate(ChickWeight$weight, by=list(ChickWeight$Diet), summary)
peso.dieta.2

# g
chick100 <- ChickWeight[sample(1:nrow(ChickWeight), 100), ]
chick100

# h
chick100[,sample(1:ncol(chick100), ncol(chick100))]

# i
chick100[, order(colnames(chick100))]

# j
chick100[order(chick100$Diet,chick100$weight),]

# k
new<-chick100[rev(order(chick100$weight)),]
new[!duplicated(new$Diet),]


# -------------------------------------------------------------------------------------------------------------------
# Ejercicio dia 24 de Marzo


# --------------- Ejercicio 1

