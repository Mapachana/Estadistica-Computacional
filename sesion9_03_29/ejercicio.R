# ejercicio 3
raiz <- function(x){
    if (is.numeric(x) && min(x) > 0){
        # si el minimo de x es mayor que 0 todos lo son
        sqrt(x)
    }
    else{
        print("nonono")
    }
}