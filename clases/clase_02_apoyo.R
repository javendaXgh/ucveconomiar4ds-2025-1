# Abordar

#
# http://localhost:90/descarga/
# funciones precargadas
sum()

mean(c(11,12,13,14,15,16))

mean(11:16)

seq(2,16, by=2)

# argumentos
seq(from = 2, 
    to = 16,
    by = 2)
# posicionales
seq(5, 8, by=.2)

# nombrados
seq(to = 8,
    from= 5,
    by = .2)

seq(by = .2, to = 8,from= 5)

runif(n=18, min= 0, max= 20)
# RBase-
# paquetes

#help
?runif

sample(1:20, size= 18, replace = TRUE )
sample(1:10, size= 18, replace = FALSE)
sample(1:10, size= 18, replace = FALSE )

rep(4,times= 10)

rep(c(1,5,10),times=4)

rep(c(1,5,10),times=4, each=2)

rep(seq(from= 2, to= 8, by=2),3)

rev(c(1:10))

# vectores

c('a','b')
c('a','b',1)

#tipos
class(c('a','b'))

paste('estoy en el', 'salon')
paste0('estoy en el', 'salon')

# dataset
mtcars
mtcars
dim(mtcars)

mean(mtcars$mpg)
sum(mtcars$carb)

unique(mtcars$cyl)

# Crear variables
cilindros <- unique(mtcars$cyl)
# Llamar variables
cilindros


# seleccionar elementos

length(mtcars$mpg)
mtcars$mpg
mtcars$mpg[4]
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
rnorm
rbinom
runinf

#llamar a objeto creado