# Ejercicios del dia 24 de Marzo de Ana Buendia Ruiz-Azuaga

# Ejercicio 1

# a
censo <- read.csv(file="Census.csv",header=TRUE, colClasses=c("cellsource"='factor', "travel"='factor', "getlunch"='factor', "gender"='factor'))
#censo

# b
str(censo)

# c
colSums(sapply(censo, is.na))
lapply(lapply(censo, is.na), sum)

# d
sum(complete.cases(censo))

# e
censo2 <- censo[complete.cases(censo), ]
censo2 <- na.omit(censo)

# f
write.table(censo2, file="censo2.txt", row.names=FALSE, sep='\t')

# g
censo3 <- read.table(file="censo2.txt", header=TRUE, colClasses = c("cellsource"='factor', "travel"='factor', "getlunch"='factor', "gender"='factor'))
str(censo2)
str(censo3)

# En efecto coinciden en estructura


# ------------------------------------------------------------------------------------
# Ejercicio 2

matriz <- matrix(rnorm(10*5), nrow=10, ncol=5)
matriz

# a
colnames(matriz) <- c("col1", "col2", "col3", "col4", "col5")
matriz

# b
write(colnames(matriz), file="matriz.txt", sep=",", ncolumns=5)
write(t(matriz), file="matriz.txt", sep=",",  ncolumns=5, append=TRUE)

# c
matrizpd <- read.csv(file="matriz.txt",header=TRUE)
matrizpd


# ------------------------------------------------------------------------------------
# Ejercicio 3
# a
olimpics <- read.csv(file="Olympics100m.csv",header=TRUE, colClasses=c("name"='factor', "country"='factor',"gender"='factor'))
str(olimpics)

# b
colSums(sapply(olimpics, is.na))
# No hay ningun dato perdido en el dataframe

# c
resumen <- summary(olimpics)
typeof(resumen)

write.table(resumen, file="resumen.txt", col.names=TRUE, sep=",", row.names=FALSE)
resumen2 <- read.table(file="resumen.txt", header=TRUE, sep=",")
resumen2

# d
resumen3 <- aggregate(olimpics$TIME, by=list(olimpics$Gender), summary)
resumen3

write.table(resumen2, file="resumen2.txt", sep=",", col.names=TRUE, row.names=FALSE)
resumenpd <- read.csv(file="resumen2.txt", sep=",", header=TRUE)
resumenpd