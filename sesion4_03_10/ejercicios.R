# Ejercicios del dia 10 de Marzo de Ana Buendia Ruiz-Azuaga

# Ejercicio 1
# Ejecuta las siguientes sentencias y extrae conclusiones sobre el tipo de objeto que devuelven

A <- matrix(1:9, 3, 3)
x <- 1:3
A%*%x
# toma x como vector columna y devuelve un vector columna
#A%*%t(x)
# Argumentos no compatibles porque una matriz no se multiplica por un vector fila
x%*%A
# Toma x como vector fila y por tanto devuelve un vector fila
t(x)%*%A
# Toma x como vector fila y por tanto devuelve un vector fila
# En el caso anterior no realizaba el cambio automaticamente pero ahora si
t(x)%*%x
# Multiplica como se espera dos vectores

# ------------------------------------------------------------------------------------
# Ejercicio 2
# Ejecuta las siguientes sentencias en R y formula los sistemas que se revuelven en cada caso:

# Sistema 1
solve(2,2)
# resuelve el sistema: 2x = 2

# Sistema 2
A <- matrix(c(3, 1, 4, 2), 2, 2)
b <- c(12, 8)
solve(A,b)
# resuelve el sistema  3x+4y = 12, 1x+2y = 8


# Sistema 3
solve(A, diag(2))
# resuelve Ax=B siendo B la matriz identidad de orden 2

# ------------------------------------------------------------------------------------
# Ejercicio 3
# Crea objetos A (matriz de coeficientes) y b (vector de terminos independientes)
# para resolver en R el sistema anterior. Resuelve el sistema con solve.
# Despues perturba el vector b sumandole 0.05 a cada uno de sus elementos y busca
# la nueva solucion. ¿Se parece a la anterior? Repite la operacion con un incremento de 0.1
# Comenta los resultados

A <- matrix(c(10, 7, 8, 7, 7, 5, 6, 5, 8, 6, 10, 9, 7, 5, 9, 10), 4, 4)
b <- c(32, 23, 33, 31)
solve(A,b)
# 1 1 1 1
c <- b + 0.05
solve(A,c)
# 0.4 2 0.75 1.15
d <- b + 0.1
solve(A, d)
# -0.2 3 0.5 1.3
# Como vemos la solucion del sistema cambia mucho a perturbaciones pequeñas, luego parece mal condicionado

# ------------------------------------------------------------------------------------
# Ejercicio 4
# Calcula el número de condición de la matriz A del sistema anterior así como su recíproco.
# Realiza primero el cálculo con las funciones kappa y rcond y después comprueba que
# coinciden con su denición ( kappa(A) como cociente entre máximo y mínimo autovalor
# en valor absoluto y rcond(A) como su inversa). Comenta el resultado.

A <- matrix(c(10, 7, 8, 7, 7, 5, 6, 5, 8, 6, 10, 9, 7, 5, 9, 10), 4, 4)
b <- c(32, 23, 33, 31)

kappa(A, exact=TRUE)
abs(max(eigen(A)$values))/abs(min(eigen(A)$values))

rcond(A, exact=TRUE)
abs(min(eigen(A)$values))/abs(max(eigen(A)$values))
# No sale exacto pero creo que es por aproximaciones

# ------------------------------------------------------------------------------------
# Ejercicio 5
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

# ------------------------------------------------------------------------------------
# Ejercicio 6


# Cojo la muestra del ejercicio 5
n <- 5
set.seed(2)
x <- rnorm(n)
y <- 1+x+rnorm(n, 0, 0.1)

# Crea la matriz de regresion X y el vector de respuesta y
X <- cbind(1, x)

# a)
QR <- qr(X)

# b)
Q <- qr.Q(QR)
Q

# c)
b <- t(Q)%*%y
b

# d)
R <- qr.R(QR)
R

# e)
backsolve(R,b)

# ------------------------------------------------------------------------------------
# Ejercicio 7 (Ejercicio propuesto)

n <- 3
A <- matrix(rep(1:n, times=n, each=n)^rep(1:n, times=n), ncol=n, nrow=n)
A

b <- A %*%rep(1,n)

# a)
solve(A,b)

# b)
rcond(A)

# c)

n <- 12
A <- matrix(rep(1:n, times=n, each=n)^rep(1:n, times=n), ncol=n, nrow=n)
A
b <- A %*%rep(1,n)
#solve(A,b)
rcond(A)

# Hay un mal condicionamiento que se agrava conforme crece n
# Para resolverlo
cA <- rcond(A)
solve(A,b,tol=cA)