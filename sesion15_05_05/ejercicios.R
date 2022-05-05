# Ejercicios Ana Buendia 5 de Mayo

hatco <- read.csv(file="hatco2.csv", header=TRUE, as.is=NA)
#hatco

# Ejercicio 1

plot(hatco[,c(6:13)])
# Parece que velocidad y fidelidad tiene relacion lineal, asi com calidad y velocidad

# Ejercicio 2
mod1<-lm(fidelidad~velocidad+precio+flexprec+imgfabri+servconj+imgfvent+calidadp,hatco)
mod1

summary(mod1)

anova(mod1)

# Ejercicio 3

mod2<-lm(fidelidad~precio+flexprec+imgfabri+servconj+imgfvent+calidadp,hatco)
mod2

summary(mod2)

anova(mod2)
# Por el pvalor asociado a precio no se rechaza la hipotesis H0 al 5% de significacion, al resto si se rechaza

# Ejercicio 4

summary(mod1)
# Se rechaza la hipotesis al 5% de significacion, pero al 1% no

# Ejercicio 5

res <- rstandard(mod1)
y_gorro <- mod1$fitted.values

plot(y_gorro, res)
# No se distingue ninguna forma en la nube de puntos

# Ejercicio 6

library("lmtest")

dwtest(mod1)

# Ejercicio 7

kstestres <- ks.test(y_gorro, res)
kstestres

qqnorm(y_gorro)
qqnorm(res)
# El qqnorm parece bastante lineal, luego parece que sigue una normal (mas o menos, siendo optimistas)

# Ejercicio 8

library("car")

crPlots(mod1)

# Ejercicio 9
