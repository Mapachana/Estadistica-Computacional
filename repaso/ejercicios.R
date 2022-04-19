# Ejercicio 1
# a
set.seed(1)
x <- runif(100)
mx <- mean(x)
mx
which(x == min(x[x>mx]))
# b
sum(x < mx)
# c
x <- x[!(x<mx)]
x
# d
mat <- cbind(x, abs(x-mx))
colnames(mat) <- c("x", "abs(x-mx)")
mat


# Ejercicio 2
# a
hatco <- read.table(file="hatco.txt", header=TRUE)
hatco
# b
hatco$x8 <- factor(hatco$x8,levels=c(0,1), labels=c('pequeña','grande'))
hatco
str(hatco)
# c
hatco$cliente <- as.character(hatco$x1)
hatco
str(hatco)
# d
nrow(hatco[hatco$x8 == 'pequeña',])
nrow(hatco[hatco$x8 == 'grande',])
hatco.peq <- hatco[hatco$x8 == 'pequeña',]
hatco.gra <- hatco[hatco$x8 == 'grande',]
hatco.peq[sample(1:nrow(hatco.peq), 1),]
hatco.gra[sample(1:nrow(hatco.gra), 1),]
# e
m <- mean(hatco$y)
m
mpeq <- mean(hatco.peq$y)
mpeq
mgra <-mean(hatco.gra$y)
mgra
# f
sum(hatco.peq$y > mpeq)
sum(hatco.gra$y > mgra)
# g
hatco2 <- scale(Filter(is.numeric, hatco))
hatco2

hatco3 <- data.frame(Filter(is.factor, hatco), Filter(is.character, hatco), hatco2)
hatco3

# Ejercicio 3
progarit <- function(n, a1, d){
    if(missing(n) || missing(a1) || missing(d) || !is.numeric(n) || !is.numeric(a1) || !is.numeric(d)){
        stop("Argumentos incorrectos")
    }

    v <- a1+d*0:(n-1)
    suma <- sum(v)
    produ <- prod(v)

    return(list(v=v, suma=suma, producto=produ))
}

progarit(2, 2, 2)
#progarit(2,"a",1)
#progarit(1,2)

