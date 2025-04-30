##########################################################################################
# Tarea 2 - 27/04/2025 
# Alumno: Jonathan Perez
# C.I: 27487707
##########################################################################################

#Crear una carpeta en RStudio donde Guardaremos las tareas del curso---- 

dir.create("tareas") #Esta funcion nos permite crear carpetas
                     # de forma automatica.

# Ejercicio 1: Acceder, extraer y asignar fila con mayor mpg de mtcars----

# Cargar el dataset mtcars (ya viene incluido en R)
data("mtcars") #Ejecutar este codigo nos permite cargar
               #el dataset en nuestro environment

View(mtcars)   #Nos permite visualizar los datos de mtcars

# Acceder a todos los datos que se encuentran en una columna
mtcars$mpg

#extraer el mayor valor de mpg y asignarlo a una variable
max_mpg <- max(mtcars$mpg)

# Mostrar la fila con mayor mpg
print(max_mpg)

# Ejercicio 2: Intentar crear cuatro variables con nombres no permitidos----

# 1. Nombre con caracter especial
$variable <- 30 #Esto da error
# 2. Nombre con punto y numero
.6variable <- 6 #Esto da error
# 3. Nombre con espacio
variable con espacio <- 30 
# 3. Nombre que comienza con numero
10variable <- 30 

# Ejercicio 3: Crear vectores de distintas clases---- 

# Vector de caracteres
vector_de_caracteres <- c("amarillo", "azul", "rojo")
mode(vector_de_caracteres) #Ejecutar este codigo devuelve "character"
# Vector numérico
vector_numerico <- c(11, 20.5, 1999)
mode(vector_numerico) #Ejecutar este codigo devuelve "numeric"
# Vector lógico
vector_logico <- c(FALSE, TRUE, FALSE)
mode(vector_logico) #Ejecutar este codigo devuelve "logical"
# Vector de enteros
vector_enteros <- c(1L, 2L, 3L)
mode(vector_enteros) #Ejecutar este codigo devuelve "numeric"
# Vector complejo
vector_complejo <- c(1+2i, 3+4i, 5+6i)
mode(vector_complejo) #Ejecutar este codigo devuelve "complex"

# Ejercicio 4: Crear una lista con al menos cuatro elementos de distintas clases----

mi_lista <- list(
  numeros = c(1, 2, 3),            # Vector numérico
  letras = c("a", "b"),            # Vector de caracteres
  logico = c(TRUE, FALSE),         # Vector lógico
  matriz = matrix(1:4, nrow=2)     # Matriz
)
# Ver la lista 
print(mi_lista) #impresion explicita
mi_lista        #autoimpresion  
# Ejercicio 5: Crear tres matrices con los mismos 16 elementos y que presenten 3 combinaciones de dimensiones distintas.---- 
# Crear una variable con 16 elementos:
elementos <- 1:16

# Matriz 4x4
matriz1 <- matrix(elementos, nrow=4, ncol=4)
# Matriz 2x8
matriz2 <- matrix(elementos, nrow=2, ncol=8)
# Matriz 8x2
matriz3 <- matrix(elementos, nrow=8, ncol=2)

# Mostrar matrices
print(matriz1)
print(matriz2)
print(matriz3)
# Ejercicio 6: trabajar con lista.----
# 6.1 Crear una lista llamada persona.
persona <- list(
  Nombre = "Ana",
  Edad = 25,
  Altura = 1.68,
  Pasatiempos = c("dibujar", "cantar", "futbol")
)

# 6.2 Accede e imprime los siguientes elementos de la lista persona:
#Puedes acceder a los elementos de una lista utilizando corchetes [] 
#o el operador $. 

# Usando Corchetes []:
persona[1] #Ejecutar este codigo devuelve "$Nombre"

persona[2] #Ejecutar este codigo devuelve "$Edad"

persona[3] #Ejecutar este codigo devuelve "$Edad"

persona[4] #Ejecutar este codigo devuelve "$Pasatiempos"

# Usando el operador $:
persona$Nombre       #Ejecutar este codigo devuelve "Ana"

persona$Edad         #Ejecutar este codigo devuelve "25"

persona$Altura       #Ejecutar este codigo devuelve "1.68"

persona$Pasatiempos  #Ejecutar este codigo devuelve "dibujar" "cantar"  "futbol" 

# 6.3 Modificar Elementos de la lista `persona` para que:

# 1.Cambie el nombre a "Ana María":
persona$Nombre <- "Ana María"

# 2. Añada un nuevo elemento llamado "ciudad" con el valor "Valencia"
persona$ciudad <- "Valencia"
 
# Ver la lista modificada
persona 

# 6.4 Crear lista anidada informe_PIB: 
informe_PIB <- list(
  Titulo = "Informe PIB Venezuela",
  Autor = "Jonathan Perez",  
  Datos = matrix(c(2022, 2023, 2024, 100, 105, 110), nrow=2, byrow=TRUE),
  Resumen = c("PIB año 2024", "Inflación", "PIB per cápita")
)
# 6.5 Acceder a elementos de informe_PIB
informe_PIB$Autor         #Ejecutar este codigo devuelve "el nombre del autor"
informe_PIB$Datos[2, 2]   #Ejecutar este codigo devuelve "105" que es el valor PIB para el segundo año
informe_PIB$Resumen[3]    #Ejecutar este codigo devuelve "PIB per cápita"

# Ejercicio 7: Crear data frame----
mi_primer_data_frame <- data.frame(
  nombre = c("Yelitza", "Rosa", "Owis", "Jonathan"),
  edad = c(44, 60, 48, 25),
  ciudad = c("Caracas", "La Guaira", "La Guaira", "La Guaira")
)
mi_primer_data_frame

mode(mi_primer_data_frame)  #Ejecutar este codigo devuelve "list"
class(mi_primer_data_frame) #Ejecutar este codigo devuelve "data.frame"


# Codigo para limpiar el Environment----
#rm(list = ls() )



# Notas----
# 1.Este Código fue escrito con asistencia parcial de Deepseek 
# y utilizando las laminas de las clases anteriores. 