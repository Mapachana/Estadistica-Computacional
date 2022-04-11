medias <- function(x){
    if (is.numeric(x)){
        arit <- mean(x, na.rm=TRUE)

        prod(x)
        
        resultado <- list(arit, -1, -1)
        names(resultado) <- c("arit", "geo", "armo")
        
        return(resultado)
    }
    else{
        print("El vector no es numerico, no hago nada")
    }
}

medias(c(1,2,3, NA))