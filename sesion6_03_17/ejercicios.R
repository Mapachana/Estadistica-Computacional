# Ejercicios del dia 17 de Marzo de Ana Buendia Ruiz-Azuaga

# Ejercicio 1

# Crea un objeto de tipo lista con estas tres componentes: 
#x1 = (1,2,3,4,5),x2 =(2,3,4,5,6)yx3 = (3,4,5,6,7).
#A partir de ella resuelve las siguientes tareas:

x1 <- 1:5
x2 <- 2:6
x3 <- 3:7

lista <- list(x1, x2, x3)
lista

# Crea un vector y con una muestra de 10 números aleatorios de una distribución
# uniforme en el intervalo (0,1). Añade dicho vector como una nueva componente a la lista anterior.

x <- runif(10)
x
lista[[length(lista)+1]] <- x
lista

# b

y <- rnorm(10)
lista[[length(lista)+1]] <- y
lista

# c

lapply(lista, sum) # devuelve lista
sapply(lista, sum) # devuelve vector

# d
reg <- lm(y~x)
typeof(reg) # objeto de tipo list

# e
lapply(reg, typeof)

# f
mat <- cbind(reg$residuals, reg$fitted.values, x, y)
colnames(mat) <- c('residuals', 'fitted.values', 'x', 'y')
mat

# ------------------------------------------------------------------------------------
# Ejercicio 2

xi <- c(1.2, 1.8, 2.2, 2.5, 1.1)
yi <- c(15, 18, 10, 12, 16)
ni <- c(12, 23, 5, 9, 11)
datos <- data.frame(xi, yi, ni)
datos

# a
n <- sum(datos[,'ni'])
n

# b
x_media <- sum(datos[,'xi']*datos[,'ni']/n)
x_media
x_var <- sum((datos[,'ni']*(datos[,'xi']-x_media)^2)/(n-1))
x_var

y_media <- sum(datos[,'yi']*datos[,'ni']/n)
y_media
y_var <- sum((datos[,'ni']*(datos[,'yi']-y_media)^2)/(n-1))
y_var

# c
datos.n <- data.frame(cbind(
    rep(datos[,'xi'], datos[, 'ni']),
    rep(datos[,'yi'], datos[, 'ni'])
    ))
datos.n <- setNames(datos.n, c('xi', 'yi'))
#datos.n

mean(datos.n[,'xi'])
var(datos.n[,'xi'])

mean(datos.n[,'yi'])
var(datos.n[,'yi'])

# e
# no me ha dado tiempo :(

# ------------------------------------------------------------------------------------
# Ejercicio 3
