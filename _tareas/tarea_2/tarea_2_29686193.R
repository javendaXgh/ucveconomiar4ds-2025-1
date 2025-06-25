#Universidad Central de Venezuela
#Facultad de Ciencias Economica y Sociales
#Escuela de Economía
#Materia Ciencia de Datos Basado en Programación en R para Economista- COD:3335
#Tarea2- Practica 
#Estudiante: Dolly Laynes
#Cédula:29.686.193
#Fecha: 27/04/2025
#-------------------------------------------------------------------------------

#Nota: Para la realización de esta tarea se ha elaborado con el asesoramiento tanto de sistemas de inteligencia artificial(Gemini,Monica) como materiales vistos en la materia

#-------------------------------------------------------------------------------
# 1. Acceder, extraer y asignar a una variable la fila de mtcars con mayor valor mpg. Describir proceso ejecutado mediante comentarios. 
#Cargar el conjunto de datos mtcars
data(mtcars)

#Hallar el valor máximo de la columna "mpg" con la función max()
max(mtcars$mpg)

#Se asigna al valor maximo de la columna "mpg" a una variable que en este caso llamaremos "max_mpg"
max_mpg <- max(mtcars$mpg)

#Extraer la fila correspondiente al valor máximo de mpg
#Se crea la variable "fila_max_mpg" para indicar el vector lógico que indica qué filas cumplen con la condición de ser igual a la varible "max_mpg" 
fila_max_mpg <- mtcars[mtcars$mpg == max_mpg, ]

# 2.Intentar crear cuatro variables con nombres no permitidos
Mi variable <- "variable con espacios"
7variable <- "variable con un numero al inicio"
.1variable <- "variable con numero despues de un punto"
dolares$$ <- "variable con signos especiales"

# 3.Crear vectores de las distintas “clases” o “modes” vistas en el curso, con su correspondiente nombre y al menos tres elementos en cada uno de ellos.
#Vector numerico
c(27,49,56)

#vectores de Caracteres
c("rojo","azul","naranja","amarillo")

#Vector logico
c(TRUE,FALSE,TRUE,TRUE)

#Vector Entero
c(3L,48L,5L,9L)


# 4.Crear una lista con al menos cuatro elementos de distintas clases, donde cada uno de estos contenga al menos dos otros elementos.

#Se crea lista ejecutando la función list()
list(numero = c(47,50,52),  texto = c("Hola","Dolly"), logico = c(TRUE,FALSE), enteros=c(5L,7L))

# 5. Crear tres matrices con los mismos 16 elementos y que presenten 3 combinaciones de dimensiones distintas.

# Se Crea un vector de 16 elementos, a patir de la funcion ":" creando una secuencia del 1 al 16
elementos <- 1:16
# Crear matrices con diferentes dimensiones
matrix(elementos, nrow = 4, ncol = 4)  #dimensiones: 4x4
matrix(elementos, nrow = 2, ncol = 8)  # dimensiones: 2x8
matrix(elementos, nrow = 1, ncol = 16) # dimensiones: 1x16

# 6. a) Crea una lista llamada persona con los datos suministrado

# Se crea la lista con la función list() y la asignamos a una variable que llamaremos "persona"
persona <- list(Nombre = "Ana",Edad = 25, Altura = 1.68, Pasatiempos = c("dibujar", "cantar", "futbol"))

# b) Acceder e imprime los siguientes elementos: (nombre,edad, pasatiempos) de la lista persona

# Se Accede a los elementos utilizando el simbolo $
persona$Nombre
persona$Edad
persona$Pasatiempos

#Se Imprme usando la función print()
print(persona$Nombre)
print(persona$Edad)
print(persona$Pasatiempos)

# c) Modificar Elementos de la lista persona

# Se Cambia el nombre a “Ana María”
persona$Nombre <- "Ana María"

# Se Añade un nuevo elemento llamado “ciudad” con el valor “Valencia”
persona$ciudad <- "Valencia"

# verificamos los cambios realizandos llamando y ejecutando la variable "persona"
persona

# 7.a) Crea una lista anidada llamada informe_PIB
informe_PIB <- list( Título = "Informe PIB Venezuela", Autor = "Dolly Laynes",Datos = matrix(c(2022, 2023, 2024, 90, 110, 130), nrow = 2, ncol=3), Resumen = c("PIB año 2024", "Inflación", "PIB per cápita"))

#b) Accede a los siguientes elementos:(autor,PIB para segundo año de la serie, PIB per capita) de la lista informe:

#Acceder a Autor
informe_PIB$Autor

#Acceder a PIB para segundo año de la serie
informe_PIB$Datos[2, 2]

#Acceder a PIB per capita
informe_PIB$Resumen[3]

# 8.Crear una data frame y asignar a un objeto, a partir de 4 vectores donde cada uno contenga al menos 4 elementos. Los vectores deben ser al menos de dos clases distintas. La función de Rbase que se usa para definir objetos de la clase data frame es data.frame . Una vez creada la data frame evaluar y especificar la mode y la class

# Crear vectores
vector1 <- c(1, 2, 3, 4)        # numérico
vector2 <- c("A", "B", "C", "D") # carácter
vector3 <- c(TRUE, FALSE, TRUE, FALSE) # lógico
vector4 <- c(1.5, 2.5, 3.5, 4.5) # numérico

# Crear un data frame

mi_dataframe <- data.frame(Columna1 = vector1, Columna2 = vector2,Columna3 = vector3, Columna4 = vector4)

# Evaluar y especificar el mode y la class
mode(mi_dataframe) 
class(mi_dataframe)

#### lo más recomendable es que los asignaras, cada vector o lista, a una variable-objeto

