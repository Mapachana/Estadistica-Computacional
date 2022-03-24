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