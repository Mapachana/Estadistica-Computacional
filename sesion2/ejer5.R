# Autor: Ana Buendia
# Ejercicio 5: Crea un vector x con elementos 2, 2, 8, 8, 7, 6, 1, 5
# Despues en una unica sentencia calcula las diferencias
# sucesivas entre sus elementos

x <- c(2, 2, 8, 8, 7, 6, 1, 5)
x

n <- length(x)
x[(2:n)]-x[1:n-1]
diff(x)