# Autor: Ana Buendia
# Ejercicio 2 Evaluar la siguiente funcion en una rejilla de valores equiespaciados
# en el intervalo [-2, 2] con incremento 0.1

x <- seq(-2, 2, by=0.1)
(x< -1)*(1) + (-1<=x & x<0)*(log(x^2)) + (0<=x & x <1)*(log(x^2+1)) + (1<=x)*(2)