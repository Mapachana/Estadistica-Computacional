# Utiliza el código que aparece a continuación de este cuadro para generar una muestra de
# observaciones de las variables Y y X de tamaño n =5 de la forma siguiente: las observaciones
# corresponden a valores aleatorios desde una distribución normal estándar; y las observaciones de y
# se obtienen a partir de la ecuación del modelo y i = 1 + x i + ϵ i ,
# donde epsilon son valores aleatorios generados desde una normal con media 0 y desviación
# típica 0.1. A partir de esos datos:

# Crear muestra de observaciones
n <- 5
set.seed(2)
x <- rnorm(n)
y <- 1+x+rnorm(n, 0, 0.1)

# Crea la matriz de regresion X y el vector de respuesta y
X <- cbind(1, x)

# Calcula (X'X)^-1
aux <- solve(t(X)%*%X)

# Usando el resultado anterior calcula beta gorrito a partir de la expresion 3
b_gorrito <- aux %*% t(X) %*% y
b_gorrito

# Observa que los datos se han generado verificando exactamente el modelo de regresion
# lineal (1 con beta=(1,1)'. ¿Se parece el estimador por minimos cuadrados que has obtenido
# a partir de los datos al verdadero beta del modelo?

# Se parece bastante, esta relativamente cercano

# Representa el modelo lineal desde el que se han generado los datos. Despues añade
# los datos datos que has generado y finalmente la estimacion del modelo que has calculado.
curve(1+x, -3, 3)
points(x,y)
curve(b_gorrito[1]+b_gorrito[2]*x, -3, 3, add=TRUE, col=2)

# Repite el ejercicio para n=50 y n=500. ¿Que diferencias observas?

# n=50
n <- 50
set.seed(2)
x <- rnorm(n)
y <- 1+x+rnorm(n, 0, 0.1)
X <- cbind(1, x)
aux <- solve(t(X)%*%X)
b_gorrito <- aux %*% t(X) %*% y
curve(1+x, -3, 3)
points(x,y)
curve(b_gorrito[1]+b_gorrito[2]*x, -3, 3, add=TRUE, col=2)


# n = 500
n <- 50
set.seed(2)
x <- rnorm(n)
y <- 1+x+rnorm(n, 0, 0.1)
X <- cbind(1, x)
aux <- solve(t(X)%*%X)
b_gorrito <- aux %*% t(X) %*% y
curve(1+x, -3, 3)
points(x,y)
curve(b_gorrito[1]+b_gorrito[2]*x, -3, 3, add=TRUE, col=2)

# ¿Que problemas puede tener en la practica este tipo de implementacion directa?

# Claramente cuantos mas datos mas se acercan el modelo estimado y el modelo, pero a partir
# de cierto numero no merece la pena hacer mas observaciones