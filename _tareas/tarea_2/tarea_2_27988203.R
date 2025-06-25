# 1.Acceder, extraer y asignar a una variable la fila de mtcars con mayor valor mpg. 

mtcars #accedo al conjunto de datos mtcars

mtcars$mpg #accedo a la columna mpg del conjunto mtcars

max(mtcars$mpg) #esta función devuelve el valor maximo de la columna mpg que es 33.9

max_mpg_fila <- mtcars[which.max(mtcars$mpg), ] #creamos la variable "max_mpg_fila" usando una variable compuesta con el codigo which.max que nos devuelve devuelve el índice de la fila con el valor máximo en mpg

max_mpg_fila #consultamos para verificar que nos llame todos los datos de la fila cuando mpg=33.9

# 2 Intentar crear cuatro variables con nombres no permitidos.

1max_mpg_fila <- mtcars[which.max(mtcars$mpg), ] #No es permitido porque el nombre de una variable no puede empezar por un numero.

max-mpg-fila <- mtcars[which.max(mtcars$mpg), ] # Los nombres de variables no pueden contener caracteres especiales (excepto . y _)

if <- mtcars[which.max(mtcars$mpg), ] # No pueden contener palabras de reserva (como if, else, for, etc.)

max mpg fila <- mtcars[which.max(mtcars$mpg), ] # No pueden contener espacios.

# 3 Crear vectores de las distintas “clases” o “modes” vistas en el curso, con su correspondiente nombre y al menos tres elementos en cada uno de ellos.

vector_numerico <- c(1:9) # genero un vector numerico del 1 al 10 y le asigno una variable
vector_numerico #verifico el contenido del conjunto
mode(vector_numerico) # verificamos si es un vector numerico

vector_caracteres <- c('A','B','C','D','E')  # genero un vector caracteres de la A a D y le asigno una variable
mode(vector_caracteres) # verificamos si es un vector de caracteres.

vector_logico <- c(FALSE, TRUE, FALSE, TRUE, FALSE) #genero un vector logico de verdadero y falso, y le asigno una variable
mode(vector_logico) # verificamos si es un vector logico

vector_numerico_2 <- c(1,2, FALSE, TRUE) #genero este vector numerico, aunque coloco FALSE este es tomado como el numero 0 y TRUE como el numero 1
vector_numerico_2 #compruebo su contenido
mode(vector_numerico_2) #verificamos si es un vector numerico

vector_complex <- c(2+1i, 1+2i, 5i)  #genero este vector complex y le asigno una variable
vector_complex #compruebo su contenido
mode(vector_complex) #verificamos si es un vector complex

vector_fecha_intento <- c(1995-04-03, 2000-15-04, 1966-10-02, 1970-06-02)
vector_fecha_intento #compruebo su contenido y me percato que hace una resta de los numeros, esto sucede porque no coloque comillas
mode(vector_fecha_intento) #verifico el tipo de vector, y compruebo que es uno numerico


vector_fecha <- as.Date(c("1995-04-03", "2000-04-15", "1966-10-02", "1970-06-02", "1989-12-27")) #creo un vector con fechas pero en este caso debo usar tambien la función as.Date que le asigna la clase Date a el vector
vector_fecha #compruebo su contenido
mode(vector_fecha) #verifico su mode, y nos arroja que es numerico
class(vector_fecha) #verifico su clase y nos arroja Date

# 4 Crear una lista con al menos cuatro elementos de distintas clases, donde cada uno de estos contenga al menos dos otros elementos.

lista_elementos <- list(
  numerico = vector_numerico,
  caracteres = vector_caracteres,
  logico = vector_logico,
  fecha = vector_fecha
) # Creo la lista usan como elementos los vectores creados en el apartado 3

lista_elementos # verifico el contenido de la lista 

# 5 Crear tres matrices con los mismos 16 elementos y que presenten 3 combinaciones de dimensiones distintas.

elementos_matriz <- c('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P') #creo un vector con 16 elementos
mode(elementos_matriz) #verifico el tipo de vector, observando que son tipo character
matrix(elementos_matriz, nrow = 4, ncol = 4) #matriz de 4 filas y 4 columnas
matrix(elementos_matriz, nrow = 2, ncol = 8) #matriz de 2 filas y 8 columnas
matrix(elementos_matriz, nrow = 8, ncol = 2) #matriz de 8 filas y 2 columnas

#6 Con listas:

lista_persona <- list(
  nombre = "Ana",
  edad = 25,
  altura = 1.68,
  pasatiempo = c("dibujar", "cantar", "futbol")
) #creo la lista con 4 elementos

lista_persona[1] #imprimo el nombre
lista_persona[2] #imprimo la edad
lista_persona[4] # imprimo el pasatiempo
lista_persona$nombre <- "Ana Maria" #modifico el nombre de Ana a Ana Maria
lista_persona$ciudad <- "Valencia" #creo el nuevo elemento de la lista "ciudad"
lista_persona #verifico los elementos de la lista y las modificaciones

# Crear la lista anidada informe_PIB
informe_PIB <- list(
  Titulo = "Informe PIB Venezuela",
  Autor = "Arnaldo",
  Datos = matrix(c(2022, 2023, 2024, 50.5, 48.2, 45.7), 
                 nrow = 2, ncol = 3, byrow = TRUE), #el codigo byrow lo agrego la inteligencia artificial Grow ya que sin el, la matrix no se muestra ordenada correctamente
  Resumen = c("PIB año 2024", "Inflación", "PIB per cápita") #vector con los datos resumen
)

# Mostrar la lista
informe_PIB

informe_PIB$Autor #accedo el elemento autor
informe_PIB$Datos [2,2] #accedo PIB para segundo año de la serie
informe_PIB$Resumen[3] #accedo PIB per capital

#7 Crear una data frame y asignar a un objeto, a partir de 4 vectores donde cada uno contenga al menos 4 elementos. 

# Creo los cuatro vectores y le asigno nombre de variables
calificacion <- c(9, 12, 15, 20, 5) # Este es numerico
nombre_estudiante <- c("Ana", "Luis", "Marta", "Pedro", "Sofía")  # Este es tipo Caracteres
aprobado <- c(FALSE, TRUE, TRUE, TRUE, FALSE) # Es tipo logico
fecha_registro <- as.Date(c("2023-01-15", "2023-02-20", "2023-03-10", "2023-04-05", "2023-05-01"))  # Es tipo Date

# Crear el data frame con los vectores creados anteriormente
calificacion_data_frame <- data.frame(calificacion, nombre_estudiante, aprobado, fecha_registro)

# Muestro el data frame
calificacion_data_frame

# Evaluar mode y class del data frame

mode(calificacion_data_frame) #Verifico cual es el mode de esta variable, y me arroja lista

class(calificacion_data_frame) # Verifico cual es la clase de esta variable y me arroja que es un data.frame

# Evaluar clases y mode de las columnas del data.frame para confirmar
lapply(calificacion_data_frame, class) 
lapply(calificacion_data_frame, mode)

#### pregunta: ¿¿¿cómo se te ocurrió el uso de las funcione apply????

