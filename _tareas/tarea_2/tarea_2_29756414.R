## Creación del archivo
getwd()              # Ubicamos la ruta de trabajo del archivo
dir.create('tareas') # Creamos una nueva carpeta para su almacenamiento

## Actividad 1
View(mtcars)               # Accedemos a la data frame mtcars en una ventana aparte para más comodidad
mtcars$mpg                 # Extraemos la columna mpg de los datos tabulares
max(mtcars$mpg)            # Obtenemos el mayor valor de la columna por medio de la función max
max_mpg <- max(mtcars$mpg) # Creamos una variable con el paso anterior y le asignamos el nombre mx_mpg

## Actividad 2
m@ximo <- max(mtcars$mpg)              # Se recomienda usar variables que NO contengan acentos, ni diéresis, ni otros caracteres
                                       # especiales
valor maximo de mpg <- max(mtcars$mpg) # Los nombres de las variables NO deben contener espacios, en caso tal, usar "_"
1.max <- max(mtcars$mpg)               # Las variables NO deben llevar números al principio
.1max <- max(mtcars$mpg)               # Aunque los nombres de las variables admiten puntos, éste NO debe ser seguido de un 
                                       # número al principio

## Actividad 3
c(9,7,2.5)             # Vector numérico o numeric
c(6L,7L,8L)            # Vector de números enteros o integer
c(TRUE,FALSE,TRUE)     # Vector lógico o logic
c("Hello","World","R") # Vector de carateres o character
c(1+2i,3+4i)           # Vector de números complejos o complex

## Actividad 4
mi_lista <- list(
  Numeros = c(1, 2),
  Textos = c("Hola","Mundo"),
  Logicos = c(TRUE, FALSE),
  Factores = factor(c("Rojo","Azul"))  # Creamos la variable "mi_lista" que contenga la función "lista" compuesta por 4
)                                      # elementos diferentes entre sí compuestos a su vez de 2 elementos más
mi_lista                               # Llamamos la variable "mi_lista"
# Esta parte se hizo con la asistencia del LLM "Copilot"

## Actividad 5
matriz.1 <- matrix(1:16,
                  nrow = 4, 
                  ncol = 4)  # Creamos una matriz que vaya del 1 al 16 de 4 filas y 4 columnas
matriz.1                     # Llamamos la variable "matriz.1"
matriz.2 <- matrix(1:16,
                   nrow = 2,
                   ncol = 8) # Creamos una matriz que vaya del 1 al 16 de 2 filas y 8 columnas
matriz.2                     # Llamamos la variable "matriz.2"
matriz.3 <- matrix(1:16,
                   nrow = 8,
                   ncol = 2) # Creamos una matriz que vaya del 1 al 16 de 8 filas y 2 columnas
matriz.3                     # Llamamos la variable "matriz.3"
# Esta parte se hizo con la asistencia del LLM "Copilot"

## Actividad 6
# Parte 1
persona <- list(
  Nombre = "Ana",
  Edad = 25,
  Altura = 1.68,
  Pasatiempos = c("dibujar","cantar","futbol")
)                                               # Creamos la variable "persona" que contenga la lista solicitada
persona                                         # Llamamos a la lista "persona"
# Parte 2
persona[1]        # Accedemos al nombre
print(persona[1]) # Imprimimos el nombre
persona[2]        # Accedemos a la edad
print(persona[2]) # Imprimimos la edad
persona[4]        # Accedemos a los pasatiempos
print(persona[4]) # Imprimimos los pasatiempos
# Parte 3
persona$Nombre <- "Ana María" # Cambiamos el nomblre de "Ana" a "Ana María"
persona$Ciudad <- "Valencia"  # Agregamos un nuevo elemento "ciudad" con el valor "Valencia"
persona                       # Llamamos a la lista para ver la mocificación
# Parte 4
years <- c(2022, 2023, 2024)                               # Creamos la variable "years" con tres años
pib <- c(12345, 13000, 13500)                              # Creamos la variable "pib" con valores simulados
informe_PIB <- list(
  Título = "Informe PIB Venezuela",
  Autor = "Halena Ruiz",
  Datos = matrix(c(years,pib),
                  nrow = 2, 
                  byrow = 3),                              # La matriz se hizo con la asistencia del LLM "Copilot"
  Resumen = c("PIB año 2024","Inflación","PIB per cápita") 
)                                                          # Creamos la lista con los elementos requeridos
informe_PIB                                                # Llamamos a la lista "informe_PIB"
# Parte 5
informe_PIB[1]        # Accedemos al nombre del autor
informe_PIB[[3]][2,2] # Accedemos al PIB del 2023. Esta parte se hizo con la asistencia del LLM "Copilot"
informe_PIB[[4]][3]   # Accedemos al tercer elemento del elemento "resumen"

## Actividad 7
mi_data_frame <- data.frame(                                     # Creamos la data frame con la función "data.frame"
  Nombre = c("Ana", "Carlos", "Luisa", "Pedro"),
  Edad = c(25, 30, 22, 28),
  Estado = c(TRUE, FALSE, TRUE, FALSE),
  Ciudad = c("Caracas", "Maracaibo", "Barquisimeto", "Valencia") # Componemos la data frame de distintas clases de vectores
)                                                                # con 4 componentes cada una 
mi_data_frame                                                    # Llamamos a la data frame
mode(mi_data_frame)                                              # Evaluamos su "mode"
class(mi_data_frame)                                              # Evaluamos su clase
# Esta parte se hizo con la asistencia del LLM "Copilot"



#### lo más recomendable es que los asignaras, cada vector o lista, a una variable-objeto
#### evitar, por manual de estilo, uso de puntos en asignación de nombres a variables