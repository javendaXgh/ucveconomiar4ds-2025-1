"Hello World"
#Tarea 2

dir.create("Tareas")

#PARTE 1- Acceder, extraer y asignar la fila de mtcars con mayor mpg#
#Acceder al dataset mtcars#

data("mtcars")

#Para verla en una nueva página#
View(mtcars)

#Accedemos las primeras filas de la data para analizarlo#
head(mtcars)

#Obtener el valor máximo de "mpg" creamos una variable
max_mpg <- max(mtcars$mpg)
max_mpg

#Mostrar el valor máximo de mpg (sugerido por la IA Gemini)# 
print(paste("El valor máximo de mpg en el dataset matcars es:", max_mpg))

#Buscamos cual es la fila a la que corresponde el valor obtenido,
#donde la columna "mpg" es igual al valor max (Usando el operador lógico ==)#
fila_max_mpg <- mtcars[mtcars$mpg == max_mpg, ]
fila_max_mpg

#Si asignamos la fila con el mayor valor de mpg a una nueva variables.  
#(Sugerido por IA Gemini y obtenemos lo mismo)
carrito_max_mpg <- fila_max_mpg
carrito_max_mpg

#Podemos observar como la fila con mayor valor mpg es la fila 20 correspondiente a Toyota Corolla#
#-------------------------------------------------------------------------------

#PARTE 2: INTENTA CREAR CUATRO VARIABLES CON NOMBRES NO PERMIDOS

#Según la guía: las variables pueden tener cualquier estructura de datos como matriz,
# un valor númerico, un texto, un vector y otras.

#2.1. En clase cometí un error en las practicas de "mtcars" y escribí un número sin darme 
#cuenta y generó un error.
1mtcars <- mtcars$mpg

#2.2. muchos de los errores que he cometido están ligados a dejar espacios de mas#
mtcar $s <- mtcarsmpg
#o
una variables <- carrito_max_mpg

#2.3. Si intento usar una palabra ya ligada a una función de R#
print <- carrito
#o
paste <- carritos
paste("pega", "estas", 4, "palabras") <- carritos

#2.4. Si uso algún simbolo como: $, # o % al en la variable.
$lavariable <- mtcars
la%variable <- mtcars

#-------------------------------------------------------------------------------

#PARTE 3: Crear vectores de las distintas "clases" o "modes" con sus nombres
#y al menos tres elementos en cada uno de ellos:

# "Se usa c() para declarar un vector"

#3.1. Vectores numéricos#
#"Son aquellos que contiene números enteros o decimales"
c(1, 4, 8)
c(3.14, 2.14, 1.98)
x= c(10:50)

#Si tomamos en cuenta lo explicado en la guia, y queremos determinar si un vector
# es numérico o no, lo hacemos con la función:
is.numeric(x)

#Si creamos una variables como nos sugiere la AI Gemini
edad <- c(21, 22, 23, 24, 25)
edad
is.numeric(edad)
class(edad)
mode(edad)

#Si lo hacemos de otra manera
print("Verctor de edades (numeric):")
print(paste("Clase:", class(edad), "Modo:", mode(edad)))
#Es una menera de guardar "edad" y mostrar que el tipo de datos que contiene la variable#

#3.2. VECTORES ENTEROS.
#"Estos números se declaran con el uso de una L posterior al número"
c(4L, 3L, 15L, 26L)
lapices <- (c(4L, 3L, 15L, 26L))
lapices
is.integer(lapices)
class(lapices)
mode(lapices)

#Si lo hacemos de otra manera (Sugerido por IA Gemini:
print("Verctor de edades (integer):")
print(paste("Clase:", class(lapices), "Modo:", mode(lapices)))

#3.3. VECTORES LOGICOS
#"Sirven para representar datos que solo pueden traer uno de estos dos valores.
#Verdadero - TRUE
#Falso - FALSE 

#Si tomamos el ejemplo que nos sugiere el AI Gemini y lo extendemos: 
#para que tengamos "Todas las anteriores" (TRUE) y "Ninguna de las anteriores"
#(FALSE)
respuestas <- c(TRUE, FALSE, TRUE)
print ("vector de respuestas (logical):")
print(respuestas)
print(paste("Clase:", class(respuestas), "Modo:", mode(respuestas)))

#Tenemos:
todas_las_anteriores <- c(TRUE)
todas_las_anteriores
class(todas_las_anteriores)
ninguna_de_las_anteriores <- c(TRUE)
ninguna_de_las_anteriores
class(ninguna_de_las_anteriores)

#Si usamos la función "class" y "mode" nos indica que es un vector lógico.
class(todas_las_anteriores)
class(ninguna_de_las_anteriores)
mode(ninguna_de_las_anteriores)
mode(todas_las_anteriores)

#3.4. VECTORES DE CARACTERES#
#"se usan para almacenar cadenas de caracteres como por ejemplo un nombre, 
#una oración, o cualquier valor que el computador no deba entender como un objeto lógico, 
#número entero, númerico, matriz, etc."
"Maria"
class(c("Roselyn", "Polux", "Maria"))

#Podemos notar como R lo identifica como "character"
#Si seguimos el ejemplo que nos sugiere Gemini
nombres_hogar <- c("Roselyn", "Polux", "Maria")
nombres_hogar
print(paste("Clase:", class(nombres_hogar), "Modo:", mode(nombres_hogar)))

#Si tomamos en cuenta lo explicado en la guia "Clase 02 a 05: Complemento",
#y queremos determinar si un vector es un Character o no, lo hacemos con la función:#
is.character(nombres_hogar)

#3.5. VECTORES DE FECHAS (DATE)
#Segun la guía "Clase 02 a 05: Complemento" nos indica que puede ser un tanto 
#complejo. Sin embargo, replicaremos los ejemplos:
#"La función Date solo almacena la fecha calendario"
fecha1 <- as.Date('2025-04-19')
fecha1
as.Date.numeric(fecha1)
as.numeric(fecha1)

#Adicionalmente, la guía dice "La función POSIXct puede almacenar en conjunto hora y fecha"
fecha2 <- as.POSIXct('2025-04-19 11:15')
fecha2
as.numeric(fecha2)
class(fecha2)

#-------------------------------------------------------------------------------
#PARTE 4:Crear una lista con al menos cuatro elementos de distintas clases,
#donde cada uno de estos contenga al menos dos otros elementos.

#Usando la guía( "Guía Listas" usamos la función: list
mi_lista <- list(pastillas = c("paracetamol", "dipirona"), uniddisponibles = c(2, 4), mg = c(200, 400), presentación = c("ampollas", "tabletas", "gel" ))
mi_lista
mi_lista$pastillas
mi_lista$uniddisponibles
mi_lista$mg
mi_lista$presentación

#Acceder a elementos de la lista: pastillas , que es la primera de la lista
mi_lista[[1]][1:2]

#-------------------------------------------------------------------------------

#PARTE 5:  Crear una matriz con 16 elementos que presente al menos 3 combinaciones
#de dimensiones distintas
#Para orientarnos usamos la lista "Guía Básica Subsettings"

#Primero una matriz de 16x1:
matriz_1 <- matrix(1:16, nrow=1, ncol=16)
matriz_1

#Segunda matriz: 1Xx6
matriz_2 <- matrix(16:1, nrow=16, ncol=1)
matriz_2

#Tercera matriz: 4x4
matriz_3 <- matrix(4:4, nrow=4, ncol=4)
matriz_3

#Si hacemos una matriz 8x2 o 2x8, R nos dice lo siguiente:
# "data length [7] is not a sub-multiple or multiple of the number of rows [8]"
matriz_4 <-  matrix(8:2, nrow=8, ncol=2)
matriz_4

#Si lo hacemos tal y como nos sugiere Gemini:
matriz_16x1 <- matrix(1:16, nrow = 16, ncol = 1)
print("\nMatriz de 16x1:")
print(matriz_16x1)
print(paste("Dimensiones:", dim(matriz_16x1)))

#-------------------------------------------------------------------------------

#PARTE 6:Con listas,
#6,1. Crear una lista llamada 'persona' con los siguientes elementos:
persona <- list(nombre = "ana", edad = 25, altura = 1.68, pasatiempos = c("dibujar", "cantar", "futbol"))
persona

#6.2: Imprime los elementos de la lista:
print(persona$nombre)
print(persona$edad)
print(persona$altura)
print(persona$pasatiempos)

#6.3.1: Cambia el nombre de "ana" a "Ana Maria" (Para esto nos orientamos a la guía
#"Guía Listas")
persona$nombre <- "Ana Maria"
persona
persona$nombre

#6.3.2 Añadir un nuevo elemento llamado "ciudad" con el valor "valencia'
persona$ciudad <- "valencia"
persona$ciudad
print(persona)

#6.4: Crear una lista anidada llamada informe_PIB que contenga los elementos:
#Para esto nos orientaremos con Gemini y las guías.
informe_PIB<- list(Título = "Informe PIB Venezuela", Autor = "Roselyn", Datos = matrix(c(2022, 2023, 2024, 140, 150, 180), nrow = 2, byrow = TRUE), Resumen = c("PIB año 2024", "inflación", "PIB per cápita"))
print(informe_PIB)

#Podemos usar print o no, R nos arroja el contenido de la lista:
informe_PIB$Título
informe_PIB$Autor
informe_PIB$Datos
informe_PIB$Resumen

#-------------------------------------------------------------------------------
#PARTE 7: CREAR EL DATA FRAME
datos_de_los_estudiantes <- data.frame(materias = c("Ciencia", "castellano", "ingles", "deporte"), asistencias = c(10L, 20L, 12L, 14L), notas = c(9.1, 13.6, 6.2, 17.2), aprobadas = c(FALSE, TRUE, FALSE, TRUE))
datos_de_los_estudiantes

#Evaluamos el "mode" y la "class" de la data.frame:
modo_de_los_estudiantes <- mode(datos_de_los_estudiantes)
modo_de_los_estudiantes
clase_de_los_estudiates <- class(datos_de_los_estudiantes)
clase_de_los_estudiates

#Lo evaluamos de manera individual:
mode(datos_de_los_estudiantes$materias)
mode(datos_de_los_estudiantes$asistencias)
mode(datos_de_los_estudiantes$notas)
mode(datos_de_los_estudiantes$aprobadas)
class(datos_de_los_estudiantes$materias)
class(datos_de_los_estudiantes$asistencias)
class(datos_de_los_estudiantes$notas)
class(datos_de_los_estudiantes$aprobadas)

#Otra manera de hacerlo en conjunto (Sugerido por la IA Gemini) es:
print(paste("Columna 'materias' - Modo:", mode(datos_de_los_estudiantes$materias), ", Clase:", class(datos_de_los_estudiantes$materias)))
print(paste("Columna 'asistencias' - Modo:", mode(datos_de_los_estudiantes$asistencias), ", Clase:", class(datos_de_los_estudiantes$asistencias)))
print(paste("Columna 'notas' - Modo:", mode(datos_de_los_estudiantes$notas), ", Clase:", class(datos_de_los_estudiantes$notas)))
print(paste("Columna 'aprobadas' - Modo:", mode(datos_de_los_estudiantes$aprobadas), ", Clase:", class(datos_de_los_estudiantes$aprobadas)))

"Bye World"
