# Autor: Ana Buendia Ruiz-Azuaga
# Ejercicios del 3 de Marzo
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
# segun la profe which(x==min(x[x>mx]))
# f Crea otro vector y con los primeros n numeros impares
y <- seq(1, by=2, length.out=n)
y
# g Imprime los elementos x que ocupen las posiciones indicadas por los primeros 5 elementos de y
x[y[1:5]]

# ------------------------------------------------------------------------------------------------------

# Ejercicio 2 Evaluar la siguiente funcion en una rejilla de valores equiespaciados
# en el intervalo [-2, 2] con incremento 0.1

x <- seq(-2, 2, by=0.1)
(x< -1)*(1) + (-1<=x & x<0)*(log(x^2)) + (0<=x & x <1)*(log(x^2+1)) + (1<=x)*(2)

# ------------------------------------------------------------------------------------------------------

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

# ------------------------------------------------------------------------------------------------------

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

# ------------------------------------------------------------------------------------------------------

# Ejercicio 5: Crea un vector x con elementos 2, 2, 8, 8, 7, 6, 1, 5
# Despues en una unica sentencia calcula las diferencias
# sucesivas entre sus elementos

x <- c(2, 2, 8, 8, 7, 6, 1, 5)
x

n <- length(x)
x[(2:n)]-x[1:n-1]
diff(x)

# ------------------------------------------------------------------------------------------------------

# Ejercicio 6: Crea un vector con nombre ABE con las letras
# del abecedario en mayuscula

ABE <- LETTERS[1:26]
ABE

# a Selecciona aleatoriamente 5 letras (usando la 
# funcion sample con argumento replace=FALSE)
# y almacenalas en un vector con nombre ABE.5

ABE.5 <- sample(ABE, 5, replace=FALSE)
ABE.5

# b Crea un vector (con nombre PAL) con 2 elementos
# consistentes en 2 palabras dormadas colocando aleatoriamente
# las 5 letras anteriores sin repeticiones.

PAL <- paste(sample(ABE.5, length(ABE.5), replace=FALSE), collapse='')
PAL