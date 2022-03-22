# ejercicios tema 3 pagina 5
# ejercicio crea una funcion que calcule la media de un vector de n elementos. la funcion tendra como nombrea medai1 y un unico argumento x (el vector). El calculo de la media lo debes hacer descartando posibles valores perdidos (NA) en el vector. Como resultado la funcion devolvera un objeto de tipo vector con dos elementos: La media calculada y el numero de valore sperdios que habia en el vector
media1 <- function(x){
    n.nas<-sum(is.na(x))
    media<-sum(x[!is.na(x)])/(length(x)-n.nas)
    return(c(media, n.nas))
}

# Crea una funcion qeu calcule la media de una variable a partir de una tabla de frecuencias ((x, ni) con i=1, ...k) donde xi son los valores distintos observados y ni su 