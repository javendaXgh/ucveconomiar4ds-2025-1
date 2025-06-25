1# Acceder, extraer y asignar a una variable la fila de mtcars con mayor valor de mpg 

max_mpg <- max(mtcars$mpg)

2# Intentar crear cuatro variables con nombres no permitidos.

variable con espacio <- 'esta línea no se podrá ejecutar'
1variable <- 'No comenzar con números'
.5variable <- ' Si se utiliza un punto al inicio, no debe ser seguido de un número'
@2variable.inasig@nabl_e <- 'Caracteres Especiales no Permitidos'

3# Crear vectores de las distintas “clases” o “modes” vistas en el curso, con su correspondiente nombre y al menos tres elementos en cada uno de ellos.

# vector con números
c (1, 5, 7)

# vector con carácteres o strings
c ('A', 'c', 'De')

# vector con datos mixtos que R convierte a strings
c (1, 5, 'letras')

4# Crear una lista con al menos cuatro elementos de distintas clases, donde cada uno de estos contenga al menos dos otros elementos.

ejem_lista <-list(el1=c('a','x'), el2=c(1), c(TRUE, FALSE),c (1, 5, 'letras'))

5# Crear tres matrices con los mismos 16 elementos y que presenten 3 combinaciones de dimensiones distintas.

vector_16 <- 1:16
matriz_4x4 <- matrix(vector_16, nrow=4, ncol=4)
matriz_2x8 <- matrix(vector_16, nrow=2, ncol=8)
matriz_8x2 <- matrix(vector_16, nrow=8, ncol=2)

6# Con listas:
persona <- list(
  Nombre = "Ana",
  Edad = 25,
  Altura = 1.68,
  Pasatiempos = c("dibujar", "cantar", "futbol"))

# Acceder e imprimir elementos de persona
persona$Nombre
persona$Edad
persona$Pasatiempos

# Modificar nombre y añadir ciudad
persona$Nombre <- "Ana María"
persona$Ciudad <- "Valencia"

# Crear lista anidada informe_PIB
informe_PIB <- list(
  Titulo = "Informe PIB Venezuela",
  Autor = "Victor Delgado",
  Datos = matrix(c(2022, 2023, 2024, 150, 160, 170), nrow=2, byrow=TRUE),
  Resumen = c("PIB año 2024", "Inflacion", "PIB per capita"))

# Acceder a elementos de informe_PIB
informe_PIB$Autor
informe_PIB$Datos[2,2]
informe_PIB$Resumen[3]

# Crear data frame a partir de 4 vectores de al menos dos clases distintas
# vectores
nombres <- c("Carlos", "Lucia", "Pedro", "Sofia")
edades <- c(25, 30, 22, 28)                               
alturas <- c(1.70, 1.65, 1.80, 1.60)  
estudiantes <- c(TRUE, FALSE, TRUE, TRUE)

# Crear data frame
datos_personas <- data.frame(Nombre = nombres,
                             Edad = edades,
                             Altura = alturas,
                             Estudiante = estudiantes)

## Ver data frame
datos_personas

# Evaluar mode y class
mode(datos_personas)
class(datos_personas)
