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
yi <- c(15, 18, 10, 12, 6)
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
# Con transform
datos.n1<-transform(datos.n,zx=(xi-x_media)/sqrt(x_var),zy=(yi-y_media)/sqrt(y_var))
head(datos.n1)

# Con within
datos.n2<-within(datos.n,{zx<-(xi-x_media)/sqrt(x_var);zy<-(yi-y_media)/sqrt(y_var)})
head(datos.n2)

# ------------------------------------------------------------------------------------
# Ejercicio 3

# a
head(ChickWeight)

tail(ChickWeight)

# b
str(ChickWeight)

# c
summary(ChickWeight)

# d
peso.dieta<-tapply(ChickWeight$weight,ChickWeight$Diet,summary)
class(peso.dieta)
mode(peso.dieta)
is.list(peso.dieta)
# es una lista

# e
# esta cortada la solucion

# f
peso.dieta.2<-aggregate(ChickWeight$weight,by=list(ChickWeight$Diet),summary)
class(peso.dieta.2)

# g
Chick100<-ChickWeight[sample(1:nrow(ChickWeight),100),]

# h
# columnas permutadas aleatoriamente
p<-ncol(Chick100)
Chick100[,sample(1:p,p,replace=FALSE)]

# i
# columnas por orden alfabético
Chick100[1,order(names(Chick100))]

# j
# ordenacion segun diet
Chick100[order(Chick100$Diet),]
# ordenacion segun diet y weight
Chick100[order(Chick100$Diet,Chick100$weight),]

# k
new<-Chick100[rev(order(Chick100$weight)),]
new[!duplicated(new$Diet),]