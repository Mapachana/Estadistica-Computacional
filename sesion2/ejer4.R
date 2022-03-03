# Autor: Ana Buendia
# Ejercicio 4: Crea un vector con los 20 primeros terminos de la progresion
# aritmetica a_n=a_1+(n-1)d con a_1=1, d=1.2

a1 <- 1
d <- 1.2

x <- a1+((1:20) - 1)*d
x

# a Calcula la suma de sus elementos usando la funcion sum y comprueba que coincide con
# formula n(a1+an)/2 con n=20

n<-20
names(x)<-paste("a", 1:n, sep="")
(n*(x["a1"]+x["a20"]))/2

sum(x)

# b Calcula la (cuasi-)desviacion tipica usando al funcion sd y comprueba
# que coincide con |d|sqrt(n(n+1)/12)

abs(d)*sqrt((n*(n+1))/12)
sd(x)
all.equal(abs(d)*sqrt((n*(n+1))/12), sd(x))

# c Calcula el producto de sus elementos usando la funcion prod y comprueba
# que coincide con la formula dada

prod(x)
all.equal(prod(x), d**n * gamma(a1/d + n)/gamma(a1/d))