# Pregunta 1. Acceder, extraer y asignar a una variable la fila de mtcars con mayor valor mpg. Describir proceso ejecutado mediante comentarios. Apoyarse con un LLM para realizar la actividad. Preferiblemente sólo usar funciones vistas en el curso. Para obtener el valor máximo de un vector se puede usar la función max
# paso 1. acceder y extraer la data mtcars
data("mtcars")
View(mtcars)

# paso 2. asignamos la variable maxvalor_mpg a la fila de mtcars con mayor valor mpg
max_valor_mpg <- max(mtcars$mpg)
max_valor_mpg

# de esta manera observamos en la consola el mayor valor mpg

# Pregunta 2. Crear cuatro variables con nombres no permitidos
min valor mpg <- "describir el valor menor de mpg"

2mediampg <- 58

.2variablesnodescriptivas <- "mpg y cyl"

numero_de_celular_ell@s <- "02123134342"

# como observamos el uso de caracteres especiales, numeros, puntos con numero y espacios es incorrecto para asignar variables y al ejecutarlas obsrvamos el error en la consola

# Pregunta 3. Crear vectores de las distintas “clases” o “modes” vistas en el curso, con su correspondiente nombre y al menos tres elementos en cada uno de ellos
# 3.1 Vector logical
vector_logical <- c(TRUE, FALSE, TRUE)
mode(vector_logical) # muestra el modo logical

# 3.2 Vector Numeric
vector_numeric <- c(7,2,4)
mode(vector_numeric) # muestra el modo numeric

# 3.3 Vector complex
vector_complex <- c(2i+3i,6i+7i,4i-2i)
mode(vector_complex) # muestra el modo complex

#3.4 Vector Date
vector_date <- as.Date(c("1999-10-14", "2000-03-14", "2002-08-02"))
class(vector_date) # muestra el modo date

#3.5 Vector Character
vector_character <- c("Diego", "Camila", "Ronald")
mode(vector_character) # muestra el modo character

#3.6 Vector Integer
vector_integer <- c(35L,41L,500L)
class(vector_integer) # muestra el modo integer

#Pregunta 4. Crear una lista con al menos cuatro elementos de distintas clases, donde cada uno de estos contenga al menos dos otros elementos
Lista_creada_elementos_cuatro <- list(palabras=c("constancia", "perseverancia"), peso=c(69,75), fecha=as.Date(c("2024-08-21", "2025-04-25")), altura=c(1.72, 1.73))

# cuando ejecutamos observamos en Environment que la lista ya aparece en data
# ver mi Lista_creada_elementos_cuatro
View(Lista_creada_elementos_cuatro)


#Pregunta 5. Crear tres matrices con los mismos 16 elementos y que presenten 3 combinaciones de dimensiones distintas
# 5.1 matriz de 16 elementos, 2 filas y 8 columnas
matrix(1:16, nrow = 2, ncol = 8)

#5.2 matriz de 16 elementos, 4 filas y 4 columnas
matrix(1:16, nrow = 4, ncol = 4)

#5.3 matriz de 16 elementos, 8 filas, 2 columnas
matrix(1:16, nrow = 8, ncol = 2)

#Pregunta 6. Con listas:
# 6.1 Crea una lista llamada persona que contenga los siguientes elementos: Nombre: “Ana” Edad: 25 Altura: 1.68 Pasatiempos: un vector con “dibujar”, “cantar” y “futbol”
persona <- list(nombre="Ana", edad=25, altura=1.68, pasatiempos=c("dibujar", "cantar", "futbol"))

# 6.2 Accede e imprime los siguientes elementos de la lista persona: El nombre, La edad y Los hobbies
persona[1] #nombre 
persona[2] #edad 
persona[4] #pasatiempos 

# 6.3 Modificar Elementos de la lista persona para que: Cambie el nombre a “Ana María” y Añada un nuevo elemento llamado “ciudad” con el valor “Valencia”
#cambiar el nombre
persona$nombre <- "Ana María"
persona$ciudad <- "Valencia"

#6.4 Crea una lista anidada llamada informe_PIB que contenga los siguientes elementos: Título: “Informe PIB Venezuela”, Autor: su nombre, Datos: una matriz de 2x3 con valores numéricos, la primera fila son tres años consecutivos, la segunda fila son tres valores simulados con el PIB, Resumen: un vector con “PIB año 2024”, “Inflación” y “PIB per cápita”
#creamos primero los datos de la matriz para agilizar el proceso y hacerlo mas comprensible
Resumen <- c("PIB periodo 2024", "inflacion", "PIB per capita")
Periodos <- c(2022,2023,2024)
PIB_simulado <- c(576, 645, 490)
Informe_PIB <- list(Titulo="Informe PIB Venezuela", Autor="Diego Perez", Datos=matrix(c(PIB_simulado, Periodos), nrow =2, ncol = 3, byrow = TRUE), Resumen=Resumen)

#Compruebo el orden de la matriz para validar que este correcta
matrix(c(PIB_simulado, Periodos), nrow =2, ncol = 3, byrow = TRUE)

#6.5 Accede a los siguientes elementos de la lista informe: El autor, PIB para segundo año de la serie, PIB per cápita
Informe_PIB$Autor #Al ejecutar reflejar Diego Perez
Informe_PIB$Datos[1,2] #Al ejecutar la matriz el valor correspondiente al periodo 2023 se encuentra en [1,2] que es 645
Informe_PIB$Resumen[3] #Al ejecutar refleja PIB Per capita

#Pregunta 7. Crear una data frame y asignar a un objeto, a partir de 4 vectores donde cada uno contenga al menos 4 elementos. Los vectores deben ser al menos de dos clases distintas. La función de Rbase que se usa para definir objetos de la clase data frame es data.frame . Una vez creada la data frame evaluar y especificar la mode y la class
#Paso 1 creamos los vectores que contendra la data frame
Vector_estatura <- c(1.75, 1.84, 1.92, 2.02) #numeric
Vector_nombres <- c("Diego", "Carlos", "Ronald", "Gustavo") #character     
Vector_peso <- c(71, 82, 89, 95)
Vector_hobbies <- c("jugar beisbol", "jugar futbol", "cantar", "estudiar R")

#Paso 2 cremos nuestra drata frame
Diego_dataframe <- data.frame(Vector_estatura, Vector_nombres, Vector_peso, Vector_hobbies)

#Paso 3 evualuamos la mode y la class de la Diego_dataframe
mode(Diego_dataframe) #al ejecutar debe salir "list"
class(Diego_dataframe) #al ejecutar debe salir "data.frame"

#Importante recordar el mode es como R almacena el objeto y la class permite determinar las operaciones y los comportamientos de distintas funciones sobre el objetivo.
