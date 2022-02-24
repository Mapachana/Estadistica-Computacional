# Generamos dos  vectores de datos desde sendas distribuciones normales y los guardamos en sendos objetos x e y
x <- rnorm(50)
y <- rnorm(50, mean=10, sd=2)
# Imprimos en la consola el contenido de los objetos x e y
x
y

# Resumen descriptivo de los datos
summary(x); summary(y)

# Histograma de x
hist(x)
### esto genera un pdf y lo guarda ahi

# Representamos la distribucion conjunta de los datos (scatterplot)
plot(x, y)

# Ajustamos una recta de regresion de los datos
fit <- lm(y~x)
summary(fit)

# Superponemos la recta de regresion al grafico anterior
abline(fit)

# Creamos dos nuevos vectores con secuencias de valores
x <- 1:10
y <- seq(-pi, pi, length.out=10)

# Escribimos una matriz con los vectores anteriores por columnas
cbind(x, y)

# Escribimos una matriz con dos filas y cinco columnas con los elementos de x
matrix(x, 2, 5)

# Creamos una matriz con filas y columnas indexadas por x e y cuyos valores son cos(y)/(1+x^2)
f <- outer(x, y, function(x,y) cos(y)/(1+x^2))
f

# Dos representaciones tridimensional de f como función de x e y primero un diagrama de contornos
contour(x, y, f)

# y ahora un mapa de colores
image(x, y ,f)

# Demostracion de otras funciones graficas
#demo(graphics)
#demo(persp)

# Terminamos la sesion
q()