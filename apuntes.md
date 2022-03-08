# Apuntes sobre R

> Por: Mapachana

## Apuntes clase 24 Febrero

Al usar números complejos es necesario poner siempre el número delante de la i sin asterisco y con número, es decir, `1+i` no serviría, sería `1+1i`, y `1+2*i` no sería válido, sería `1+2i`.

Se separan distintas operaciones u órdenes por `;`.

Los comentarios se ponen con `#`.

El número pi se escirbe `pi`.

La ayuda se muestra con `help` o `help()` o `help("log")` y ejemplos con `example(mean)`.

Para salir se escribe `q()`.

## Apuntes clase 1 Marzo

### El directorio de trabajo

Para ejecutar un script se usa `source("ruta_absoluta_fichero.R")` o la ruta relativa `source("nombre.R")`.

Para usar la ruta relativa hay que configurar el directorio de trabajo, para lo que se usan las funciones `getwd()` y `setwd()` para obtener y asignar el directorio de trabajo actual.

### El área de trabajo (workspace)

El espacio de trabajo almacena todos los objetos que se han creado durante la sesión, se guarda en ficheros `.RData`.

También se puede guardar el histórico, es decir, todas las sentencias que se han escrito en la consola, de forma que se pueden cargar en otras sesiones.

También se pueden guardar los resultados de la consola.

### Paquetes de R

Para ver lo que hay instalado en R y qué paquetes se cargan por defecto se usa la función `search()`.

Al ejecutarlo recién iniciada la sesión se muestran 9 paquetes:

```R
> search()
[1] ".GlobalEnv"        "package:stats"     "package:graphics" 
[4] "package:grDevices" "package:utils"     "package:datasets" 
[7] "package:methods"   "Autoloads"         "package:base"
```

Esto quiere decir que ahora mismo en la memoria están cargados esos 9 paquetes, siendo el último paquete el paquete base, que es el sistema base, y el primer paquete `.GlobalEnv` es el espacio de trabajo.

La función `library()` muestra en una ventana todos los paquetes que están disponibles, es decir, instalados.

Estos paquetes no están cargados en memoria pero sí instalados.

Para instalar un paquete se tiene que especificar que mirror de CRAN se va a usar para instalar el paquete. Seleccionamos la más cercana. Después seleccionamos el paquete que queremos, se instala él y todas sus dependencias.

Por ejemplo instalamos `MaxLik`.

Para cargar un paquete en memoria se usar `library(nombre_paquete`). Por ejemplo `library(MaxLik)`.

Con `search()` podemos comprobar que en efecto se ha cargado.

### maxLik

Recordemos que en R si se escribe una función sin paréntesis te da el código de la función, mientras si se ponen paréntesis intenta ejecutarla.

```R
# Obtener codigo de la función
maxLik
```

### CRAN task views

Si buscamos en google "CRAN task views" entonces se nos muestra qué tiene R disponible por temas, como ecuaciones diferenciales u otras y cuales son los paquetes recomendados para esos temas.

### Otros interfaces y entornos

- RStudio: Se divide en varias ventanas y proporciona varias ventajas:
  - Ventana del espacio de trabajo (Environment): Muestra los objetos que se crean en una sesión.
  - Ventana de directorios (Files): Muestra el directorio de trabajo, ficheros, etc.
  - Ventana de gráficos (Plots): Muestra los gráficos.
  - Ventana de paquetes (Packages): Muestra los paquetes disponibles para poder cargarlos en memoria.
  - Ventana de ayuda (Help): Muestra la ayuda.
  - Permite guardar y gestionar ficheros en varios formatos.
  - En el menú principal tiene más opciones.
- Microsoft R Open.

### Objetos de datos y funciones

Los objetos de datos contienen valores, mientras las funciones son los algoritmos que se van a aplicar sobre los objetos de datos.

### Sintaxis

Las asignaciones se hacen son `<-`. Por ejemplo `x<-1`. También se puede usar `=` pero no es buena práctica aunque funcione (`x=1`).

También se puede escribir en la otra dirección `1->x`.

Los nombres de variables no pueden contener espacios ni empezar por `_`.

### Funciones

```R
x<-5;y<-2*x;z<-log(y);k<-x*y*z
ls()
rm(x,y)
ls()
```

#### Función matrix

```R
# Crea una matriz 1 por 1 con valor por defecto NA
matrix()
# Matriz 1 por 3 con valores pi
matrix(data=pi, nrow=1, ncol=3)
# Matriz 1 por 3 con valores pi sin especificar el nombre, por posición de argumentos
matrix(pi, 1, 3)
# Matriz 1 por 3 con valores pi sin especificar el nombre, por posición de argumentos usando valor por defect de nrows 1
matrix(pi,, 3)
```

#### Cálculo aritmético y expresiones lógicas

```R
# mayor
10>2 # true

# mayor o igual
10>=2 #true

# truncar
floor(1.5)==1 # true

floor(1.5)==ceiling(1.5) # false

floor(1.5)!=abs(ceiling(-1.5)) #false

x<-sqrt(3)
x^2==3 #false

all.equal(x^2, 3) # true
# all.equal comprueba igualdad entre expresiones salvo una diferencia menor que la tolerancia fijada

.Machine # Muestra los epsilon de tolerancia

# Valor infinito
Inf
# Valor not a number
NaN
# Valor Not Available, dato perdido
NA
```

EL infinito se usa en expresiones lógicas pero si uso NaN el resultado es NA, luego no se puede usar.

```R
# COmprueba si el resultado no es un numero
is.nan(0/0) # true
```

### Vectores vs listas

Ambas son unidimensionales, pero tienen una diferencia.

Un vector es una colección de objetos del mismo tipo, mientras una lista puede contener datos de distinto tipo.

Asimismo, en objetos bidimensionales, una matriz tiene datos del mismo tipo, pero si son de distinto se llama dataframe.

```R
# Vector con numeros 1,2,3,4,5
x<-c(1,2,3,4,5)
# vector con valores uno, dos
z<-c("uno", "dos")
# Al concatenar dos vectores con tipos diferentes lo pasa todo a strings
k<-c(x,z)
# Para nombrar los elementos de un vector se usa la funcion name
names(x)<-c("x1", "x2", "x3", "x4", "x5")
# Operador :
# crea un vector con vlaores de 1 a 5
x<-1:5
y<- -1:6 # de -1  a 6
# secuecnia del 1 al 10
seq(1,10)
# secuencia del 1 al 10
seq(10)
# secuencia del 1 al 10 de 2 en 2 
seq(1,10,by=2)
# Secuencia de 15 numeros regulares entre 1 y 10.
seq(1,10, length.out=15)
```

> Ejercicio
> Crear un vector con los 20 primeros números pares
> Crear un vector con 50 valores equiespaciados entre -1 y 1

> Solución:
 ```R
# Crear un vector con los 10 primeros números pares
seq(2,40,by=2)
seq(2, by=2, length.out=20)
# Crear un vector con 50 valores equiespaciados entre -1 y 1
seq(-1, 1, length.out=50)
```

```R
# Repite el numero 1 3 veces
rep(1,3) # 1 1 1
x<-10:12 # 10 11 12
rep(x, each=2) # 10 10 11 11 12 12
rep(x, length.out=7) # 10 11 12 10 11 12 10
rep(1:4, each=2, times=3)
```

> Ejercicio
> Crear un vector con valores 1 2 2 3 3 3 4 4 4 4 5 5 5 5 5

> Solución:
```R
rep(1:5, each=1, times=1:5)
rep(1:5, times=1:5)
```

```R
vector("numeric",2) # vector con dos 0
vector("logical",2) # vector con dos FALSE
vector("character"; 2) # vector con dos ""

# cREANDO vectores vacios
numeric()
integer()
double()
character()

```

## Apuntes clase 3 de Marzo

### paste y paste0

Paste pega las cadenas de caracteres entre ellas, mientras la función paste0 es igual pero necesita menos argumentos.

```R
código página 7 de 50 de parte 2 etma 2.
```

Para crear vectores de caracteres se usa la función `letters`.

### Acceder a los elementos del vector

Para acceder podemos usar `[]`. Los elementos empiezan numerados en 1.

Si entre los corchets el número es negativo se elimina el valor de la posición positiva correspondiente (-2 elimina el elemento 2).

```R
x<- -5:5
x> 0 # vector de true false de longitud de x indicando si cada elemento cumple la condicion
x[x>0] # vector con longitud la de los elementos que cumplen la condicion apareciedno sus valores
```

También si se pone entre los corchetes una expresión lógica se accede a los elementos que la verifiquen.

### Operaciones con vectores

Se puede operar con vectores lógicos y numéricos, para eso el vector lógico lo pasa a numérico, el TRUE es 1 y FALSE es 0.

## Apuntes clase 8 de Marzo

### Crear factores

Se pueden crear los factores con el argumento `levels` al crearlo.

También hay un argumento `ordered`, que puede crear factores ordenados.

### Ejemplos

```R
# Hacer la media de la edad por grupos de las clases de un factor
sexo.f<-<-factor(c(1,1,2,1,1,2,2,1,2,1),labels=c('hombre','mujer'))
edad<-c(23, 25, 20, 19, 20, 22, 24, 20, 23, 19)

mean(edad[sexo.f=='hombre'])
mean(edad[sexo.f=='mujer'])
tapply(edad, sexo.f, mean)
tapply(edad, sexo.f, sd)
tapply(edad, sexo.f, summary)

```

### Matrices

Para asignar nombre a las columnas de una matriz se usa `colnames` o `names`. Para las filas se usa `rownames`.

La función `row` devuelve una matriz con los elementos los números indicando las filas en las que está cada elemento, análogamente lo hace `col`.

### Ejercicios

> Crear una matriz cuadrada A de dimensión 3 con números aleatorios de una uniforme.
> A partir de ella:
> i) Localizar los valores que sean mayores o iguales a 0.5
> ii) Contar cuantos cumplen la condicion anterior
> iii) Crear una nueva matriz B de la misma dimensión con los valores que cumplen la condición y el resto 0's.
> iv) Crear dos matrices una con el triángulo superior de A y otra el inferior (el resto NAs).
> Pista: Pueden ser útiles las funciones row() y col() aplicadas a la matriz

```R
# Crear una matriz cuadrada A de dimensión 3 con números aleatorios de una uniforme.
set.seed(1)

A<-matrix(runif(9),3,3)
# A<-matrix(runif(9),3)
A

# Localizar los valores que sean mayores o iguales a 0.5
A>=0.5

# Contar cuantos cumplen la condicion anterior
sum(A>=0.5)
# Otra forma de hacerlo
length(A[A>=0.5])

# Crear una nueva matriz B de la misma dimensión con los valores que cumplen la condición y el resto 0's.
B<-A
B[A<0.5]<-0
B


# Crear dos matrices una con el triángulo superior de A y otra el inferior (el resto NAs).

```
### Ejemplos

```R
A<-matrix(c(0, 1, -1, 2), 2,2)
A
A*A
A%*%A
crossprod(A,A)
rowSums(A)
colSums(A)
rowMeans(A)
colMeans(A)
```

```R
A<-matrix(c(3,5,2,4,-2,,-2,-1,1,1),3,3)
A
b<-c(8,4,1)
solve(A,b)
```

```R
AA<-crossprod(A,A)
solve(AA)
# descomposicion de cholesky a A
U<-chol(AA) 
t(u)%*%U # da AA
AA
chol2inv(U) # igual que solve(AA)
```
