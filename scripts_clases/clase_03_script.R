##########################################################################################
# 
# Clase 03- script apoyo
# 
##########################################################################################

##########################################################################################
######## Operaciones en Vectores                                                   #######
##########################################################################################
# verificar en Consola el índice en el inicio de cada fila
c(20:50)

# invertir el orden de salida mediante la función rev
rev(1:10)

# acceder al cuarto elemento del vector generado
rev(1:10)[4] # acceso a la posición 4

# 
c('a','b')

# aunque definimos un elemento numérico en el vector, R aplica un proceso llamado
# coherce que hace que todos los elementos que integran el vector se conviertan en tipo
# character o string
c('a','b',1)

#Para saber cuál clase tiene un vector aplicamos la función class
class(c('a','b'))
class(c('a',1))
class(c(8,1))
class(c(1,5))
# pronto veremos cuáles son las clases de vectores con las que trabajaremos en el curso

##########################################################################################
######## Concatenar cadenas de texto  (strings)                                    #######
##########################################################################################

# uso de la función paste para pegar cadenas de texto sin un separador. Los elementos se 
# pegan en el mismo orden en que se encuentran dentro de los argumentos de la función 
# paste. En paste0 no hay separador entre las cadenas de texto
paste0('estoy en el', 'salon')

# en paste nuevamente se van pegando todos los elementos que se le pasan de argumento, pero
# esta vez van separados por un espacio
paste('estoy en clase en el', 
      'laboratorio')


paste('estoy en clase en el', 
      'laboratorio',
      sep='_')
# al agregar el argumento sep a la función paste podemos modificar el espacio como 
# separador por otra cadena de texto que definamos que en este caso es la línea de piso 
# bajo. Hay argumentos que tienen las funciones por defecto, como es en el caso de paste
# donde el espacio opera por defecto como separador, pero se puede modificar ese 
# comportamiento cuando pasamos el argumento y especificamos cuál va a ser el valor que 
# asumirá. Cuando creémos nuestras propias funciones, hablaremos con mayor detalle sobre
# esto

##########################################################################################
######## Crear Variables.                                                          #######
##########################################################################################

# Definir variables
# Mediante el operador <- asignaremos el valor "R4DS" a una variable que se llama materia
materia <- "R4DS"  #

# cuando ahora invoquemos a la variable materia, lo que aparecerá en la consola será el 
# valor que le asignamos, que fue "R4DS"
materia

# para crear variables existen una serie de reglas y buenas prácticas que serán expuestas
# en una clase dentro de muy corto tiempo

# ahora podemos generar una string más compleja usando la función paste, el argumento sep,
# e invocando una variable

paste0('estoy dando clases de',
       materia, 
       ' el dia' ,
       Sys.Date())

# si modifico el valor asignado a la variable materia, ahora puedo crear una nueva string 
materia <- 'Estadística I'

# y visualizar en la consola la nueva frase
paste('estoy dando clases de',
      materia, 
      ' el dia' ,
      Sys.Date())

##########################################################################################
######## Explorar conjunto de datos precargado mtcars                              #######
##########################################################################################

# dataset seleccionado ver en consola
mtcars

# quizás es más cómodo verlo en una nueva ventana mediante la función View
View(mtcars)
# es necesario tener presente que la función View no se puede usar en algunos casos, como
# por ejemplo, cuando usemos el sistema Quarto, pero esto nuevamente, es asunto de una
# clase futura

# si queremos obtener información sobre este conjunto de datos, usamos el operador ?
?mtcars
# al usar el operador ? , en RStudio, en la parte derecha inferior, en la pestaña "help",
# podremos ver una descripción general sobre este conjunto de datos, así como sobre
# las variables que lo conforman. Este menú de ayuda, en el caso de los conjuntos de datos
# no necesariamente estará disponible si por lo menos léemos un libro de excel que contenga
# el histórico del tipon de cambio en Venezuela, por poner un ejemplo.

# la función dim nos sirve para obtener un vector de dos elementos con la cantidad de filas
# y la cantidad de columnas de los datos tabulares que estamos revisando
dim(mtcars)

# para obtener los nombres de todas las columnas, usamos la función names
names(mtcars)

# el operador $ nos sirve en el caso de una tabla, para acceder a los elementos que están
# en una columna, en este caso la columna mpg.
mtcars$mpg
# se puede ver que se muestran 32 valores que corresponde con la cantidad de filas, es decir,
# de observaciones, que contiene mtcars

# podemos determinar la cantidad de elementos que contiene un vector si usamos la función
# length
length(mtcars$mpg)

# si aplicamos la función mean sobre la columna seleccionada que es mpg de mtcars, podremos
# ver el valor promedio de toda la columna
mean(mtcars$mpg)

# si queremos sumar los valores de la columna carb, seleccionamos la misma con $carb y en
# la parte externa acudimos a la función sum
sum(mtcars$carb)

# cuando revisamos el contenido de la columna cyl vemos que se repiten una serie de valores
mtcars$cyl

# si queremos detectar los valores únicos que se encuentran en la columna cyl, procedemos
# a usar la función unique
unique(mtcars$cyl)


# Volviendo a la creación de variables, podemos crear una que contenga los valores únicos
# de cilindros
cilindros <- unique(mtcars$cyl)

# llamamos a la variable para ver los valores que contiene
cilindros

##########################################################################################
######## Accdeder a elementos del conjunto de datos mtcars                         #######
##########################################################################################

# Usando el índice 7 accedemos al séptimo elemento del vector que contiene las mpg
mtcars$mpg[7]

# si queremos acceder puntualmente al valor de una tabla que se encuentra en la fila número
# cuatro, en la sexta columna lo podemos hacer de esta forma
mtcars[4,6]
# No obstante, existen distintos métodos para acceder a valore puntuales, y gran parte del
# curso tiene que ver con poder aislar valores o regiones del conjunto de datos que nos 
# resulten de interés.
