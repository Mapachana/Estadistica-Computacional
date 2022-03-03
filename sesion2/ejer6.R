# Autor: Ana Buendia
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