# Ejercicios del dia 31 de Marzo de Ana Buendia Ruiz-Azuaga

# Ejercicio 1

# Leemos datos
muestra <- scan()
25.03 18.59 47.20 80.20 187.67
95.94 35.07 145.38 9.52 128.14
136.69 180.82 49.67 33.41 4.16
94.87 102.25 11.04 35.14 151.15
17.14 81.94 20.01 125.26 7.11
61.36 55.59 10.80 31.88 16.39
45.95 4.98 23.20 8.78 30.68
22.65 13.19 40.62 2.78 35.41
8.63 17.04 8.02 126.54 2.11
136.93 17.39 37.73 84.53 14.22

# Funcion logaritmo de L
logl<-function(theta){
    a<-theta[1]
    b<-theta[2]
    l<-sum(log(dgamma(x=muestra,shape=a,scale=b)))
    return(-l)
}

# Comprobamos que la funcion funciona
logl(c(2,1))

# Establecer valores iniciales para los parametros
b0<-a0<-1

# Usamos la funcion optim
res<-optim(par=c(a0,b0),fn=logl)
res$par # Mejor par de parametros obtenido
res$value # Valor de la funcion para dichos parametros
res$convergence # Valor que indica si se ha convergido o codigos de error

# Prueba para otros valores
res<-optim(par=c(2,3),fn=logl)
res$par # Mejor par de parametros obtenido
res$value # Valor de la funcion para dichos parametros
res$convergence # Valor que indica si se ha convergido o codigos de error
# Se ve que los valores optimos para los parametros varian ligeramente, pero el valor de la funcion no

# Resolvemos ahora con la funcion solnp
library(Rsolnp)

res<-solnp(pars=c(a0,b0),fun=logl,LB=c(0,0))
res$pars

# Probamos ahora usando valores iniciales mas cercanos a la solucion
s <- var(muestra)
x_barra <- mean(muestra)

a_gorro <- s/x_barra
b_gorro <- x_barra/a_gorro

res<-solnp(pars=c(a_gorro,b_gorro),fun=logl,LB=c(0,0))
res$pars
# Hay mucha diferencia de los valores obtenidos con respecto a los obtenidos antes

# Ahora vamos a usar la funcion de maxlik
library(maxLik)
logl2<-function(theta) -logl(theta)
res<-maxLik(logl2,start=c(1,1))
res
res$estimate

# Probamos ahora con los valores iniciales a y b gorro
res<-maxLik(logl2,start=c(a_gorro, b_gorro))
res
res$estimate

# Añadimos restricciones
A<-matrix(c(1,0,0,1),2)
B<-c(0,0)
maxLik(logl2,start=c(1,1),constraints=list(ineqA=A,ineqB=B))

# Metodo 2
f<-function(a) log(a)-digamma(a)- log(mean(muestra))+mean(log(muestra))
res <- uniroot(f, c(0.1, 100))
res

a <- res$root
b = x_barra/a
# Obtenemos valores similares a los obtenidos antes
a
b

# ------------------------------------------------------------------------------------
# Ejercicio 2

print("EJERCICIO 2")

medias <- function(x){
    if (is.numeric(x)){
        x <- x[!is.na(x)] # elimino los na
        
        arit <- mean(x, na.rm=TRUE)

        if (min(x) > 0){
            geo <- exp(mean(log(x)))
        }
        else{
            geo <- NA
        }

        if (any(x==0)){
            armo <- NA
        }
        else{
            armo <- 1/mean(1/x)
        }

        if (is.na(geo) || is.na(armo)){
            warning("El valor tiene valores menores o iguales que 0")
        }
        
        resultado <- list(arit, geo, armo)
        names(resultado) <- c("arit", "geo", "armo")
        
        return(resultado)
    }
    else{
        print("El vector no es numerico, no hago nada")
    }
}

medias(1:10)
medias(c(1:10,NA))
medias(0:10)
medias(-1:10)


# ------------------------------------------------------------------------------------
# Ejercicio 3

mediana <- function(x){
    if (missing(x) || !is.numeric(x)){
        stop("Se debe proporcionar un x numerico")
    }

    # Elimino valores perdidos
    x <- x[!is.na(x)]

    # Ordeno x
    x_ord = sort(x)
    n <- length(x)

    if (n%%2 == 0){
        mediana <- (x_ord[n/2]+x_ord[n/2 +1])/2
    }
    else{
        mediana <- x[ceiling(n/2)]
    }

    return(mediana)
}

mediana(1:5)
mediana(1:6)
mediana(c(1:6,NA))
#mediana("hola")
set.seed(1)
mediana(runif(20))


# ------------------------------------------------------------------------------------
# Ejercicio 4

cuartiles <- function(x){
    if (missing(x) || !is.numeric(x)){
        stop("Debe proporcionar x numerico")
    }

    x <- x[!is.na(x)]
    xord <- sort(x)
    n <- length(x)

    pos.q1 <- (n+1)/4
    i <- trunc(pos.q1)
    q1 <- x[i]+(pos.q1-i)*(x[i+1]-x[i])

    if (n%%2 == 0){
        q2 <- (xord[n/2]+xord[n/2 +1])/2
    }
    else{
        q2 <- xord[ceiling(n/2)]
    }

    pos.q3 <- 3*(n+1)/4
    i <- trunc(pos.q3)
    q3 <- x[i]+(pos.q3-i)*(x[i+1]-x[i])

    return(list(Q1=q1, Q2=q2, Q3=q3))
}

cuartiles(1:9)
cuartiles(1:10)
quantile(1:9, c(0.25, 0.5, 0.75))
quantile(1:10, c(0.25, 0.5, 0.75))