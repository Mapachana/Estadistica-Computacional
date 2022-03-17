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
