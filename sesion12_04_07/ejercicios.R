# Ejercicios del dia 7 de Abril de Ana Buendia Ruiz-Azuaga

# Ejercicio 1

# Defino la funcion
f<-function(x) x^2-5
# Represento la funcion en 0, 10
curve(f, 0, 10)
# Añado linea horizontal en y=0
abline(h=0, col=2)

# derivada
f.prima <- function(x) 2*x
# valor inicial
x0 <- 2

# primera iteracion
x1 <- x0-f(x0)/f.prima(x0)
x1

# segunda iteracion
x2 <- x1-f(x1)/f.prima(x1)
x2

# tercera iteracion
x3 <- x2-f(x2)/f.prima(x2)
x3

# segunda iteracion
x4 <- x3-f(x3)/f.prima(x3)
x4

# Hacemos ahora x^3-2x-5
f <-function(x) x^3-2*x-5
curve(f, -5, 5)
abline(h=0, col=2)
f.prima <- function(x) 3*x^2-2

# valor inicial
x0 <- 2

# primera iteracion
x1 <- x0-f(x0)/f.prima(x0)
x1

# segunda iteracion
x2 <- x1-f(x1)/f.prima(x1)
x2

# tercera iteracion
x3 <- x2-f(x2)/f.prima(x2)
x3

# segunda iteracion
x4 <- x3-f(x3)/f.prima(x3)
x4

x0<- 10

# primera iteracion
x1 <- x0-f(x0)/f.prima(x0)
x1

# segunda iteracion
x2 <- x1-f(x1)/f.prima(x1)
x2

# tercera iteracion
x3 <- x2-f(x2)/f.prima(x2)
x3

# segunda iteracion
x4 <- x3-f(x3)/f.prima(x3)
x4

# Observo que cuanto mas lejos esta el valor inicial del valor real mas lento converge

# Cargo libreria
library(numDeriv)

print("DECLARACION DE LA FUNCION")
algoritmo.NR <- function(f, f.prima, x0, tol, nmax, dibuja=TRUE){
    if (missing(f.prima)){
        if (!is.function(f)){
            print("f debe ser una funcion")
            return()
        }
    }
    else{
        if (!is.function(f) || !is.function(f.prima)){
            print("f y f prima deben ser funciones")
            return()
        }
    }
    
    if (!is.numeric(x0) || !is.numeric(tol)){
        print("x0 y tol deben ser numeros")
        return()
    }
    if (!all.equal(nmax, as.integer(nmax))){
        print("nmax debe ser un entero")
        return()
    }

    

    if(dibuja){
        curve(f, -5, 5)
        abline(h=0, col=2)  
    }


    num_it = 1
    x = x0
    if (missing(f.prima)){
        x_sig <- x-f(x)/genD(func=f, x=x0)$D[1]
    }
    else{
        x_sig = x-f(x)/f.prima(x)
    }
    

    while (abs(x_sig-x) >= tol && num_it < nmax){
        x = x_sig
        if (missing(f.prima)){
        x_sig <- x-f(x)/genD(func=f, x=x0)$D[1]
        }
        else{
            x_sig = x-f(x)/f.prima(x)
        }
        num_it = num_it+1
    }

    if (num_it >= nmax){
        print("Se ha parado por numero maximo de iteraciones")
    }

    print(x)
    print(x_sig)

    return(list(x_sig, x_sig-x, num_it))
}

# Compruebo que funciona
f<-function(x) x^2-5
f.prima <- function(x) 2*x
algoritmo.NR(f, f.prima, 2, 0.001, 10)

uniroot(f, c(0, 5))

# Otra prueba de que funciona
f <-function(x) x^3-2*x-5
f.prima <- function(x) 3*x^2-2
algoritmo.NR(f=f, x0=2, tol=0.001, nmax=10, dibuja=FALSE)

uniroot(f, c(0, 5))

f <- function(x) x^2-5
# derivda en x=2
res <- genD(func=f, x=2)
#res

# La derivada esta en 
res$D[1]
x0 <- 2
x1 <- x0-f(x0)/genD(func=f, x=x0)$D[1]
x1

# Las soluciones que nos da uniroot y las obtenidas por Newton Raphson son practicamente las mismas

# ------------------------------------------------------------------------------------
# Ejercicio 2

# a
dif.eq <- function(x1, r, n){
    num_elems = 1

    resultado = rep(0, n)

    resultado[num_elems] = x1

    while (num_elems < n){
        num_elems = num_elems +1
        resultado[num_elems] = r*resultado[num_elems-1]*(1-resultado[num_elems-1])
    }

    return(resultado) 
}

dif.eq(0.7, 2, 10)

# b
plot(1:500, dif.eq(0.95, 2.99, 500))

# c
dif.eq2 <- function(x1, r){
    tol = 0.02

    num_elems = 1
    resultado = 0
    resultado[num_elems] = x1
    dif <- 1

    while(dif >= tol){
        num_elems = num_elems +1
        resultado[num_elems] = r*resultado[num_elems-1]*(1-resultado[num_elems-1])
        dif = abs(resultado[num_elems]-resultado[num_elems-1])
    }

    return(list(numiter=num_elems, suc=resultado))
}

dif.eq2(0.95,2.99)
