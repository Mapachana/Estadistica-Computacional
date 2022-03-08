# Crear una matriz cuadrada A de dimensión 3 con números aleatorios de una uniforme.
set.seed(1)

A<-matrix(runif(9),3,3)
# A<-matrix(runif(9),3)
A

# Localizar los valores que sean mayores o iguales a 0.5
A>=0.5

# Contar cuantos cumplen la condicion anterior
sum(A>=0.5)
# Otra forma de hacerlo
length(A[A>=0.5])

# Crear una nueva matriz B de la misma dimensión con los valores que cumplen la condición y el resto 0's.
B<-A
B[A<0.5]<-0
B


# Crear dos matrices una con el triángulo superior de A y otra el inferior (el resto NAs).
