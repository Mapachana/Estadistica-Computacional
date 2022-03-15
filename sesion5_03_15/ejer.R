# dado un dataframe datos con DNI, age, sexo, estudios, salario. Tiene 5 filas
# Seleccionar aleatoriamente los datos de dos individuos de una fila concreta aleatoriamente (la fila es lo aleatorio creo)

datos[sample(1:5,2,replace=FALSE),]

# obtener las filas de un dataframe es con nrow(datos)

datos[sample(1:nrow(datos),2,replace=FALSE),]

# ahora elegimos tambien aleatoriamente las columnas

datos[sample(1:nrow(datos),2,replace=FALSE), sample(1:ncol(datos),2,replace=FALSE)]