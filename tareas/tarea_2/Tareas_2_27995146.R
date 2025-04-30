################################################################################
############################### Inciso 1 #######################################
################################################################################

# Se extrae la fila con el valor máximo de la columna mpg del data frame mtcars
fila_max_mpg <- mtcars[mtcars$mpg == max(mtcars$mpg), ]
# Se usa el operador de subíndice [ ] para acceder a la fila y columna deseadas
print(fila_max_mpg)
# Se imprime la fila con el valor máximo de la columna mpg del data frame mtcars

################################################################################
############################### Inciso 2 #######################################
################################################################################

# 1. Empezando por un número
#.variable1 <- 10  # Error: el nombre no debe empezar con un signo de puntuación # nolint

# 2. Nombre con espacio
#variable 2 <- 20  # Error: no puede haber espacios en el nombre

# 3. Usando un carácter especial prohibido
#variable3#maximo <- 30  # Error: '#' no es permitido en nombres de variables # nolint

# 4. Usando una palabra reservada
#for <- 40  # Error: 'for' es una palabra reservada en R

################################################################################
############################### Inciso 3 #######################################
################################################################################

vector_num <- c(1, 2, 3) # Vector numérico
vector_char <- c("a", "b", "c") # Vector de caracteres
vector_log <- c(TRUE, FALSE, TRUE) # Vector lógico

################################################################################
############################### Inciso 4 #######################################
################################################################################

lista <- list(
  numeros = c(1, 2, 3, 4),        # Un vector numérico
  palabras = c("A", "B", "C", "D"),  # Un vector de caracteres
  logicos = c(TRUE, FALSE, TRUE, FALSE),       # Un vector lógico
  enteros = c(1L, 2L, 3L, 4L)  # Una matriz (también un objeto diferente)
)
print(lista)

################################################################################
############################### Inciso 5 #######################################
################################################################################

matriz1 <- matrix(1:16, nrow = 4, ncol = 4)

matriz2 <- matrix(1:16, nrow = 2, ncol = 8)

matriz3 <- matrix(1:16, nrow = 8, ncol = 2)

print(matriz1)
print(matriz2)
print(matriz3)

################################################################################
############################### Inciso 6 #######################################
################################################################################

persona <- list(
  nombre = "Ana",
  edad = 25,
  altura = 1.68,
  pasatiempos = c("Dibujar", "Cantar", "Futbol")
)
# Inciso 2.1: se imprime los elementos de la lista persona
print(persona$nombre) # Imprime el nombre
print(persona$edad) # Imprime la edad
print(persona$pasatiempos) # Imprime los pasatiempos

# Inciso 2.2: Editar elementos de la lista persona
persona$nombre <- "Ana Maria" # Cambia el nombre
persona$ciudad <- "Valencia" # Agrega una nueva ciudad

# Inciso 2.3:
informe_PIB <- list(
  Titulo = "Informe PIB Venezuela",
  Autor = "Angel Hernandez",
  Datos = matrix(c(2023, 2024, 2025, 2423, 2565, 2782), nrow = 3, ncol = 2),
  Resumen = c("PIB año 2024", "Inflación", "PIB per cápita") 
)
print(informe_PIB$Autor)
print(informe_PIB$Datos[2, 2]) # Imprime la matriz de datos
print(informe_PIB$Resumen[3]) # Imprime el resumen
