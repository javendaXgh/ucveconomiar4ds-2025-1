
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

# dataset
mtcars
View(mtcars)
?mtcars
dim(mtcars)

mtcars$mpg

mean(mtcars$mpg)

sum(mtcars$carb)

unique(mtcars$cyl)
mtcars$cyl
# Crear variables
cilindros <- unique(mtcars$cyl)
# Llamar variables
cilindros


# seleccionar elementos
length(mtcars$mpg)
mtcars$mpg
mtcars$mpg[7]
View(mtcars)
mtcars[4,1]

sort(mtcars$qsec)

#tablas de contingencia
table(mtcars$cyl,
      mtcars$gear)

min(mtcars$mpg)
max(mtcars$mpg)

str(mtcars)

summary(mtcars)

paste('la cantidad de cilindros es', mtcars$cyl)

rownames(mtcars)

paste( 'El', rownames(mtcars),
       'tiene una cantidad de cilindros de', 
       mtcars$cyl)



## 
plot(cars$speed , cars$dist)

plot(cars$speed , 
     cars$dist,
     col='blue')

lm(cars$speed ~ cars$dist)

# Ejercicios con base en cheat sheet

runif(n=18, min= 0, max= 20)
# RBase-
# paquetes

#help
?runif

rnorm
rbinom
runinf

#llamar a objeto creado