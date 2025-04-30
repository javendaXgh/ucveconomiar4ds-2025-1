# -----------------------------------------------------------------------------
# Tarea: Numero 2
# Curso: Ciencia de Datos basado en programacion en R 
# Carlos Eduardo Morillo CI29521323
# -----------------------------------------------------------------------------

#Crear una carpeta en su proyecto en curso de RStudio donde alojará las tareas 
  #a realizar a lo largo del curso.

#Esta carpeta la nombre tareas dentro del proyecto cursor

#Antes de comenzar limpiare el enviroment

rm(list = ls())  # Limpiar todo

#Procedemos a programar los siguientes códigos:

#Primera Tarea: 
#Extraer la fila de mtcars con el mayor valor de 'mpg' (millas por galón)

# 1. Cargar el dataset mtcars (ya está incluido en R por defecto)

data(mtcars)

# 2. Encontrar el valor máximo de la columna 'mpg' usando la función max()
max_mpg <- max(mtcars$mpg)  # Extrae el valor máximo de la columna mpg

# 3.  Identificar y extraer la fila donde 'mpg' es igual al valor máximo
fila_completa <- mtcars[mtcars$mpg == max_mpg, ]

# 4. Mostrar el resultado en consola
print(fila_completa)


# -----------------------------------------------------------------------------
#segunda tarea:
#Intentar crear cuatro variables con nombres no permitidos.

# 1. Variable que comienza con un número (inválido)
2datos <- c(1, 2, 3)  # Error: no puede empezar con número

# 2. Variable con un espacio en el nombre
mi variable <- "hola"  # Error: espacio no permitido

# 3. Variable con un carácter especial (@)
nombre@empresa <- "RStudio"  # Error: "@" no es válido

# 4. Variable con un guión (-)
precio-unitario <- 100  # Error: "-" es interpretado como operador


# -----------------------------------------------------------------------------
#tercera tarea:
#Crear vectores de las distintas “clases” o “modes” vistas en el curso, 
  #con su correspondiente nombre y al menos tres elementos en cada uno de ellos.

# 1. VECTORES NUMÉRICOS (numeric)

num1 <- c(1, 2, 3)                # Enteros (pero R los guarda como numeric)
num2 <- c(1.5, -3.2, 0.0)         # Decimales
num3 <- c(10, 20, 30)             # Otros números

# 2. VECTORES ENTEROS (integer)

int1 <- c(1L, 2L, 3L)             # Con "L" explícita
int2 <- c(-5L, 0L, 10L)           # Negativos y cero
int3 <- as.integer(c(4, 5, 6))    # Convertidos a integer

# 3. VECTORES LÓGICOS (logical)

log1 <- c(TRUE, FALSE, TRUE)      # Valores directos
log2 <- c(5 > 3, 2 == 2, 1 != 0)  # Comparaciones (TRUE, TRUE, TRUE)
log3 <- as.logical(c(1, 0, -1))   # Coerción: 1=TRUE, 0=FALSE, -1=TRUE

# 4. VECTORES DE CARACTERES (character)

char1 <- c("a", "b", "c")         # Letras
char2 <- c("hola", "mundo", "R")  # Palabras
char3 <- c("1", "2.5", "TRUE")    # Números y lógicos como texto

# 5. VECTORES DE FECHA (Date)

date1 <- as.Date("2024-01-01")                   # Fecha simple
date2 <- as.POSIXct('2024-04-21 11:15')          # Hora exacta
date3 <- as.Date(c("2024-04-21.", "2024-04-23")) # Dos fechas


# -----------------------------------------------------------------------------
#cuarta tarea:
#Crear una lista con al menos cuatro elementos de distintas clases,
  #donde cada uno de estos contenga al menos dos otros elementos.


# Crear una lista con elementos de diferentes tipos

# Voy a utilizar como elementos Nombre (Character), Edad (integer), 
  #Altura (numeric decimal) y hobbies (character) 

mi_lista <- list(
  nombre = c("Juan","Carlos","Gabriel"),
  edad = c(16,17,18),
  altura = c(1.75,1.60,1.70),
  hobbies = c("leer", "correr", "jugar al fútbol")
)

# -----------------------------------------------------------------------------
#quinta tarea:
#Crear tres matrices con los mismos 16 elementos y que presenten 3 combinaciones 
  #de dimensiones distintas.

# Definimos los mismos 16 elementos para todas las matrices
elementos <- 1:16  # Secuencia del 1 al 16

# 1. Matriz 4x4 (filas x columnas)
matriz_4x4 <- matrix(elementos, nrow = 4, ncol = 4, byrow = FALSE)

# 2. Matriz 2x8
matriz_2x8 <- matrix(elementos, nrow = 2, ncol = 8, byrow = TRUE)

# 3. Matriz 8x2
matriz_8x2 <- matrix(elementos, nrow = 8, ncol = 2, byrow = FALSE)

# -----------------------------------------------------------------------------
#sexta tarea:
#Con listas:

#1. Crea una lista llamada persona que contenga los siguientes elementos:

    #Nombre: “Ana”
    #Edad: 25
    #Altura: 1.68
    #Pasatiempos: un vector con “dibujar”, “cantar” y “futbol”


persona <- list(
  Nombre = "Ana",
  Edad = 25,
  Altura = 1.68,
  Pasatiempos = c("dibujar", "cantar", "fútbol")
)

#2. Accede e imprime los siguientes elementos de la lista persona:

#El nombre
#La edad
#Los hobbies

print(persona$Nombre)       #imrpime el nombre
print(persona$Edad)         #imprime la edad
print(persona$Pasatiempos)  #imrpime el pasatiempo

#3. Modificar Elementos de la lista persona para que:

#Cambie el nombre a “Ana María”

#Añada un nuevo elemento llamado “ciudad” con el valor “Valencia”

persona$Nombre <- "Ana María" #Cambiar el nombre

persona$Ciudad <- "Valencia" #Anadir elemento / valor


#4. Crea una lista anidada llamada informe_PIB que contenga los siguientes elementos:

#Título: “Informe PIB Venezuela”
#Autor: su nombre
#Datos: una matriz de 2x3 con valores numéricos, la primera fila son 
#tres años consecutivos, la segunda fila son tres valores simulados con el PIB
#Resumen: un vector con “PIB año 2024”, “Inflación” y “PIB per cápita”

informe_PIB <- list(
  Título = "Informe PIB Venezuela",
  Autor = "Carlos Morillo",
  Datos = matrix(
    c(2022, 2023, 2024,   # Años
      78, 96, 106),     # Valores PIB de Venezuela simulados (en mil millones de USD)
    nrow = 2,
    byrow = TRUE
  ),
  Resumen = c("PIB = 106.327 mil millones de USD", "Inflación = 85% ", "PIB per cápita = 3.838 USD")
)

#5. Accede a los siguientes elementos de la lista informe:

#El autor
#PIB para segundo año de la serie
#PIB per cápita

informe_PIB$Autor #Ver el autor 
informe_PIB$Datos[2, 2] #Ver el segundo año de la serie
informe_PIB$Resumen[3] #Acceder al PIB per capita

# -----------------------------------------------------------------------------
#septima tarea:
#Crear una data frame y asignar a un objeto, a partir de 4 vectores donde 
#cada uno contenga al menos 4 elementos. Los vectores deben ser al menos de dos 
#clases distintas. La función de Rbase que se usa para definir objetos 
#de la clase data frame es data.frame . Una vez creada la data frame evaluar 
#y especificar la mode y la class.

# 1. Definir los vectores (cada uno con 4+ elementos)

nombre <- c("Ana", "Juan", "María", "Pedro")          # Character
edad <- c(25L, 32L, 28L, 40L)                        # Integer
altura <- c(1.68, 1.75, 1.62, 1.80)                   # Numeric
es_estudiante <- c(TRUE, FALSE, TRUE, FALSE)          # Logical

# 2.  Creación del data.frame 

datos_personas <- data.frame(
  nombre,
  edad,
  altura,
  es_estudiante
)

# 3. Evaluar y especificar la mode y la class.

str(datos_personas) #Ver la estructura de la data frame
class(datos_personas) #Ver la class
mode(datos_personas) #Ver el mode
