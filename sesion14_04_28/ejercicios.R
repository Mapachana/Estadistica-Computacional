# Ejercicios del 28 de Abril de Ana Buendia
# Ejercicio 1

employee <- read.table(file="Employee.txt", header=TRUE, as.is=NA)
employee$gender <- factor(employee$gender, levels=c("m","f"), labels=c("male", "female"))
attach(employee)

# ------------------------------------------------------------------------------------------
# Ejercicio 2
hist(salary)

res<-hist(salary,plot=FALSE)
res

hist(salary,breaks=100)

x1 <- seq(15000,40000,by=5000)
x2 <- seq(50000,80000,by=10000)
x3 <- seq(100000,140000,by=20000)
hist(salary,breaks=c(x1,x2,x3))

hist(salary,breaks=c(x1,x2,x3))
lines(density(salary),col='blue')
curve(dnorm(x, mean(salary), sd(salary)), add=TRUE, col="red")
# La normal no parece un modelo adecuado para los datos

# -----------------------------------------------------------------------------------------
# Ejercicio 3

qqnorm(salary)
ks.test(salary,pnorm,mean=mean(salary),sd=sd(salary))
shapiro.test(salary)
boxplot(salary)
summary(salary)

hist(salary,probability=TRUE,main="",axes=FALSE)
axis(1)
lines(density(salary),col='red',lwd=2)
par(new=TRUE)
boxplot(salary,horizontal=TRUE,axes=FALSE,lwd=2)

boxplot(salary~gender)
boxplot(salary~minority)
boxplot(salary~jobcat)
boxplot(salary~gender*jobcat)

# Ahora para startsal y age
qqnorm(startsal)
ks.test(startsal,pnorm,mean=mean(startsal),sd=sd(startsal))
shapiro.test(startsal)
boxplot(startsal)
summary(startsal)

hist(startsal,probability=TRUE,main="",axes=FALSE)
axis(1)
lines(density(startsal),col='red',lwd=2)
par(new=TRUE)
boxplot(startsal,horizontal=TRUE,axes=FALSE,lwd=2)

boxplot(startsal~gender)
boxplot(startsal~minority)
boxplot(startsal~jobcat)
boxplot(startsal~gender*jobcat)

qqnorm(age)
ks.test(age,pnorm,mean=mean(age),sd=sd(age))
shapiro.test(age)
boxplot(age)
summary(age)

hist(age,probability=TRUE,main="",axes=FALSE)
axis(1)
lines(density(age),col='red',lwd=2)
par(new=TRUE)
boxplot(age,horizontal=TRUE,axes=FALSE,lwd=2)

boxplot(age~gender)
boxplot(age~minority)
boxplot(age~jobcat)
boxplot(age~gender*jobcat)

# -----------------------------------------------------------------------------------
# Ejercicio 3

plot(startsal,salary)

mod<-lm(salary~startsal)
mod
plot(startsal,salary)
abline(mod,col='blue')

# para salary y age
mod2<-lm(salary~age)
mod2
plot(age,salary)
abline(mod2,col='blue')
# No parece que haya ninguna relacion porque la pendiente de la recta es casi plana y no se ve ningun patron en los puntos

# para salary y edu
mod3<-lm(salary~edu)
mod3
plot(edu,salary)
abline(mod3,col='blue')
# Se ve una tendencia creciente, a  mayor nivel de educacion mas salario

# -----------------------------------------------------------------------------------
# Ejercicio 4

tab<-table(jobcat)
tab

tab.fi<-prop.table(tab)
tab.fi

data.frame(tab,Freq.rel=as.numeric(tab.fi))

barplot(tab)
pie(tab)

# para gender
tab2<-table(gender)
tab2

tab2.fi<-prop.table(tab2)
tab2.fi

data.frame(tab2,Freq.rel=as.numeric(tab2.fi))

barplot(tab2)
pie(tab2)

# para minority
tab3<-table(minority)
tab3

tab3.fi<-prop.table(tab3)
tab3.fi

data.frame(tab3,Freq.rel=as.numeric(tab3.fi))

barplot(tab3)
pie(tab3)

# -------------------------------------------------------------------------------------
# Ejercicio 5

tab2<-table(jobcat,gender)
tab2
addmargins(tab2)

barplot(tab2)

barplot(tab2, legend.text=TRUE, args.legend=list(x="topleft", bty="n"), ylim=c(0,300), density=30,col=c('green','blue','red'), main='Number of employees by gender and job category')
barplot(tab2, legend.text=TRUE, args.legend=list(x="top", bty="n"), density=30,col=c('green','blue','red'), main='Number of employees by gender and job category', beside=TRUE)

# Segun jobcat y minority

tab3<-table(jobcat,minority)
addmargins(tab3)

barplot(tab3)

barplot(tab3, legend.text=TRUE, args.legend=list(x="topleft", bty="n"), ylim=c(0,400), density=30,col=c('green','blue','red'), main='Number of employees by minority and job category')
barplot(tab3, legend.text=TRUE, args.legend=list(x="top", bty="n"), density=30,col=c('green','blue','red'), main='Number of employees by minority and job category', beside=TRUE)

# ------------------------------------------------------------------------------------------
# Ejercicio 6 (propuesto)

attach(airquality)

# a
hist(Ozone, breaks=10, freq=FALSE)

# b
curve(dnorm(x, mean(Ozone, na.rm=TRUE), sd(Ozone, na.rm=TRUE)), add=TRUE, col="red")
# Una normal no parece una distribucion adecuada a estos datos

# c
qqnorm(Ozone)
# El grafico indica que no sigue una normal
ks.test(startsal,pnorm,mean=mean(salary),sd=sd(salary))
shapiro.test(startsal)
# En ambos tests se rechaza la hipotesis, y por tanto los datos no siguen una normal

# d
boxplot(Ozone)
# Vemos que la distribucion es asimetrica a la derecha, pues la mediana no esta en el centro de la caja, ademas vemos que los datos tienen mucha dispersion y hay 2 outliers

# e
boxplot(Ozone ~ Month)
# Vemos que la contaminacion es mucho mayor en Verano y a su vez tiene mas dispersion en estos meses. Además, es asimetrica en todos ellos.

# f

