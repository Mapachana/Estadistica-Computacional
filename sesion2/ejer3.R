# Autor: Ana Buendia
# Ejercicio 3: Crea un vector con nombre x que contenga 50 valores aleatorios de
# una distribucion uniforme en el intervalo unidad usando la funcion runif
# con semilla 1.

set.seed(1)

x <- runif(50)
x

# a Calcula cuantos de sus elementos estan en el intervalo (0.25, 0.75)
length(x[0.25<x & x<0.75])

# b Calcula cuantos de sus elementos estan por debajo de 0.1 o por encima de 0.9.
# Reemplaza dichos elemetnos por el valor NA. Despues calcula su media.
length(x[x < 0.1 | x > 0.9])
is.na(x) <- which(x < 0.1 | x > 0.9)
x
mean(x,na.rm=TRUE)

# c Reemplaza los valores NA por ceros. Despues calcula su media y compara con la anterior
x[is.na(x)]<-0
x
mean(x)