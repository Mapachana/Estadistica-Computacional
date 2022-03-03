# Autor: Ana Buendia
# Ejercicio 2

x <- seq(-2, 2, by=0.1)
(x< -1)*(1) + (-1<=x & x<0)*(log(x^2)) + (0<=x & x <1)*(log(x^2+1)) + (1<=x)*(2)