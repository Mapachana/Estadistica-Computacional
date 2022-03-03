# Autor: Ana Buendia
# Ejercicio 1: Crea un vector con nombre x que contenga una secuencia de
# de numeros reales entre 1 y 10 con incrementos de 0.2.

x <- seq(1, 10, by=0.2)
x
# a Calcula su longitud y almacenala en un objeto con nombre n
n <- length((x))
n
# b Da nombres a cada uno de los elemetnos del vector del tipo x_1, x_n
names(x) <- paste("x_", 1:n, sep="")
names(x)
# c Calcula la media de x y almacenala en un objeto con nombre mx
mx <- mean(x)
mx
# d Calcula cuantos elementos de x estan por encima de mx
length(x[x>mx])
# e Calcula la posicion que ocupa el elemento de x mas proximo por encima de mx
min(which(x>mx))
# f Crea otro vector y con los primeros n numeros impares
y <- seq(1, by=2, length.out=n)
y
# g Imprime los elementos x que ocupen las posiciones indicadas por los primeros 5 elementos de y
x[y[1:5]]