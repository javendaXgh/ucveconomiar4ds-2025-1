##########################################################################################
# 
# Clase 07- script apoyo
# 
##########################################################################################

##########################################################################################
######## Nombres Variables                                                         #######
##########################################################################################

# obtener el "mode" o modo en que R almacena un objeto
mode(3)
mode(3L)

# permite obtener la clase que posee un objeto. Según la clase que tenga cualquier objeto
# se determinarán las operaciones y el comportamiento de distintas funciones sobre él.

# ver la distintas clases obtenidas en los siguientes objetos
class(3)
class(3L) # con la L asignamos que es un número entero el 3

class(mtcars) 
class(sum)

mode(sum) # muchas veces la mode y la class coinciden pero no son lo mismo

mode('palabras')

# en general, y nunca olvidar: un objeto es todo lo que existe dentro de R

# Acceso a elementos dentro de una data frame

head(mtcars) # primeras filas de la df (cuando se muestre df nos referimos a una 
# data frame, es decir, a datos en una tabla)

#acceder a todos los datos que se encuentran en una una columna
mtcars$hp

# crear una nueva columna en mtcars asignando los nombres de las filas de la data.frame
mtcars$nombre <- rownames(mtcars)

# visualizar la data frame con la nueva columna
View(mtcars)

# remover todos los objetos que están en el environment
rm(list=ls())
