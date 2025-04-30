# Tarea 2

# primero llamamos al dataset de mtcars
data(mtcars)

# inspeccionamos que contiene el dataset
head(mtcars)

# apartado 1 valor maximo

# buscamos el valor maximo de la columna mpg, usamos la funcion max
max_mpg <- max(mtcars$mpg)
max_mpg
# apartado 2 creacion de variables con nombres no permitidos
1mtcars <- 10
# no podemos empezar con numeros para la asignacion
mtcars-mpg <- 2
# no podemos usar guiones para separar las palabras
_mtcars_2 <- 30
# no podemos comenzar con _
mt cars <- 4
# no podemos tener espacios en la asignacion
# apartado 3 crear vectores de diferentes clases
# vector numerico
vector_numerico <- mtcars$mpg[1:3]
class(vector_numerico)
str(vector_numerico)
# vector caracter
vector_caracter <- rownames(mtcars)[1:3]
class(vector_caracter)
str(vector_caracter)
# vector logico
vector_logico <- mtcars$cyl[1:3]>4
class(vector_logico)
str(vector_logico)
# Apartado 4 creación de lista    
mi_lista <- list(
  marca_de_carros = rownames(mtcars)[1:5],
  vector_numerico = mtcars$mpg[1:5],
  cilindros = mtcars$cyl[1:5])
str(mi_lista)

# Apartado 5 creación de matrices de distintas dimenciones

# Para la matriz 4x4: necesitamos 16 datos
elementos_4x4 <- c(mtcars$mpg[1:4],
                   mtcars$cyl[1:4],
                   mtcars$hp[1:4],
                   mtcars$drat[1:4])

matriz_4x4 <- matrix(elementos_4x4, nrow = 4, ncol = 4,
                     byrow = TRUE)
print(matriz_4x4)


# Para la matriz 3x6: necesitamos 18 datos
elementos_3x6 <- c(mtcars$mpg[1:6],
                   mtcars$cyl[1:6],
                   mtcars$hp[1:6]
                   )

matriz_3x6 <- matrix(elementos_3x6, nrow = 3, ncol = 6,
                     byrow = TRUE)
print(matriz_3x6)


# Para la matriz 4x2: necesitamos 8 datos
elementos_4x2 <- c(mtcars$mpg[1:4],
                   mtcars$cyl[1:4]
                   )

matriz_4x2 <- matrix(elementos_4x2, nrow = 4, ncol = 2,
                     byrow = TRUE)
print(matriz_4x2)


# Apartado 6: creación de lista
# Crear la lista persona
persona <- list(
  nombre = "Ana",
  edad = 25,
  altura = 1.68,
  pasatiempos = c("dibujar", "cantar", "futbol")
)

# Imprimir elementos de la lista persona
print(persona$nombre)      
print(persona$edad)          
print(persona$pasatiempos)  

# Modificar elementos de la lista persona
persona$nombre <- "Ana María"     # Cambiar nombre
persona$ciudad <- "Valencia"      # Añadir ciudad

# Mostrar la lista modificada
print(persona$nombre)
print(persona$ciudad)


# Apartado creación de una lista anidada
# Creación de la matriz de datos
years <- c(2022, 2023, 2024)
pib_simulado <- c(120, 130, 140)

datos_matriz <- matrix(c(years, pib_simulado),
                       nrow = 2,
                       byrow = TRUE)

# Crear la lista anidada informe_PIB
informe_PIB <- list(
  Titulo = "Informe PIB Venezuela",
  Autor = "Eidiusca Figueira",  # <-- aquí pon tu nombre
  Datos = datos_matriz,
  Resumen = c("PIB año 2024", "Inflación", "PIB per cápita")
)

# Mostrar la lista
print(informe_PIB)

# Accedemos a los elementos específicos de la lista
print(informe_PIB$Autor)

# El PIB para el segundo año
print(informe_PIB$Datos[2,2])

# El texto "PIB per cápita" del resumen
print(informe_PIB$Resumen[3])


# Apartado 7: Creación de 4 vectores de clases distintas

# Vector de caracteres
nombres <- c("Andrea", "Luis", "Carmen", "Marcos")

# Vector numérico
edades <- c(25, 30, 22, 28)

# Vector lógico (TRUE o FALSE)
estudia <- c(TRUE, FALSE, TRUE, TRUE)

# Vector numérico decimal
alturas <- c(1.68, 1.75, 1.60, 1.82)

# Crear el data frame
personas <- data.frame(
  Nombre = nombres,
  Edad = edades,
  Estudia = estudia,
  Altura = alturas)

# Mostrar el data frame
print(personas)

# Evaluar mode y class
print(mode(personas))
print(class(personas))
