

dir.create("TareasCursoR")

# Cargar el conjunto de datos mtcars
data(mtcars)

# Encontrar el valor máximo de mpg en el conjunto de datos
max_mpg <- max(mtcars$mpg)
max_mpg

#utilizamos el comando view para observar la tabla y ubicarnos, asi 
#Reconocer cual es el vehículo que tiene el mpg más alto (para verificar que el código está correcto)
View(mtcars) 
################### no es necesario el View

# Extraer la fila correspondiente al valor máximo de mpg
#Usamos la coma y espacios en el corchete para ubicarnos en la fila correcta
fila_max_mpg <- mtcars[mtcars$mpg == max_mpg, ]

#ahora, buscaremos la fila en la que se encuentra el toyota corolla
#utilizamos which y rownames para encontrar el nombre y que nos 
#de la ubicación exacta del corolla

fila_toyota_corolla <- which(rownames(mtcars) == "Toyota Corolla")

fila_toyota_corolla

# Mostrar la fila que tiene el mayor valor de mpg y la fila en la que se ubica
#Para la idea de como representar la fila, se utilizó la IA de ChatGPT o4-mini
print(paste("El valor máximo de MPG en Mtcars es:", max_mpg, 
            "y la fila de dicho valor en el dataset es:", 
            fila_toyota_corolla))


#PArte 2 de la tarea: Intentar crear cuatro variables con nombres no permitidos.


FALSE <- 21
TRUE <- 20
123 <- 5
2perros <-2
#Las variables anteriores, todas dan error porque son operadores logicos y 
# reglas como la creacion de objetos con inicial numerica, algo reservado y prohibido.



#Parte 3: Crear vectores de las distintas “clases” o “modes” vistas en el curso, con su correspondiente nombre y al menos tres elementos en cada uno de ellos.



# Vector numérico con valores enteros
vector_num <- c(1, 2, 3, 12, 31)

#Vector lógico
vector_logico <- c(TRUE, FALSE, TRUE)

#Vector de strings
vector_caracter <- c("Hola", "Mundo", "R", "Esto es un string")


#Estos tres vectores fueron vistos en clases. 



#Parte 4: Crear una lista con al menos cuatro elementos de distintas clases, donde cada uno de estos contenga al menos dos otros elementos.



# Crear una lista con elementos de distintas clases
# Crear la lista de suplementos deportivos con la dosis máxima al día
suplementos_deportivos <- list(
  # Beta Alanina
  Beta_Alanina = list(
    dosis_mg = 2000, 
    tipo_dosis = "Polvo", 
    dosis_maxima_dia = 5000  # 5 gramos (5000 mg)
  ),
  
  # Creatina
  Creatina = list(
    dosis_mg = 5000, 
    tipo_dosis = "Polvo", 
    dosis_maxima_dia = 10000  # 2 dosis de 5 gramos (5000 mg cada una)
  ),
  
  # Vitamina C
  Vitamina_C = list(
    dosis_mg = 1000, 
    tipo_dosis = "Pastilla", 
    dosis_maxima_dia = 1000  # 1 dosis de 1000 mg
  ),
  
  # Magnesio
  Magnesio = list(
    dosis_mg = 400, 
    tipo_dosis = "Pastilla", 
    dosis_maxima_dia = 400  # 1 dosis de 400 mg
  )
)

# Imprimir la lista de suplementos deportivos
print(suplementos_deportivos)

# Comprobar el tipo de cada elemento en la lista
print(class(suplementos_deportivos$Creatina))  # Verifica tipo de Creatina
print(class(suplementos_deportivos$Beta_Alanina))  # Verifica tipo de Beta Alanina
print(class(suplementos_deportivos$Vitamina_C))  # Verifica tipo de Vitamina C
print(class(suplementos_deportivos$Magnesio))  # Verifica tipo de Magnesio

# Imprimir la dosis máxima al día de cada suplemento
print(suplementos_deportivos$Beta_Alanina$dosis_maxima_dia)  # 5000 mg
print(suplementos_deportivos$Creatina$dosis_maxima_dia)  # 10000 mg
print(suplementos_deportivos$Vitamina_C$dosis_maxima_dia)  # 1000 mg
print(suplementos_deportivos$Magnesio$dosis_maxima_dia)  # 400 mg


#Parte 5 : Crear tres matrices con los mismos 16 elementos y que presenten 3 combinaciones de dimensiones distintas.



# Crear un vector con 16 elementos
valores <- 1:16

# Matriz 1: 4 filas y 4 columnas
matriz_1 <- matrix(valores, nrow = 4, ncol = 4)
print("Matriz 1 (4x4):")
print(matriz_1)

# Matriz 2: 2 filas y 8 columnas
matriz_2 <- matrix(valores, nrow = 2, ncol = 8)
print("Matriz 2 (2x8):")
print(matriz_2)

# Matriz 3: 8 filas y 2 columnas
matriz_3 <- matrix(valores, nrow = 8, ncol = 2)
print("Matriz 3 (8x2):")
print(matriz_3)


#Cada una de las tres matrices que se crearon, cumplen con la regla de repsresentar 3 combinaciones distintas del vector con 16 valores


#Parte 6:Con listas:


#Parte 6.1:

# Crear la lista persona con los elementos solicitados
persona <- list(
  Nombre = "Ana",
  Edad = 25,
  Altura = 1.68,
  Pasatiempos = c("dibujar", "cantar", "futbol"))

# Imprimir la lista persona
print(persona)


#Parte 6.2:

# Acceder e imprimir el nombre de la persona
print(persona$Nombre)

# Acceder e imprimir la edad del sujeto
print(persona$Edad)

# Acceder e imprimir los hobbies de la persona
print(persona$Pasatiempos)


#Parte 6.3:

persona$Nombre <-  "Ana María"

#Crear un nuevo elemento cuyo nombre es "ciudad" y con el valor de "Valencia"

persona$Ciudad <- "Valencia"

#Dicho elemento podría indicar seguramente, el nacimiento o lugar de residencia de la persona.

print(persona)


#Parte 6.4:

#Para est aparte, utilicé la misma IA que venia utilizando y las guías que suministro el profesor
#La idea de utilizra la IA es un código más limpio y estructurado
#El objetivo inicial es calcular de manera fictia el PIB y mostrar un informe
#se nos presenta una limitante que son las funciones vista hasta la fecha con  el profesor
#De estar mas avanzados, se podría  agregar una población estimada y datos reales del PIB
#funciones como "round" que indicó la IA no fueron utilizadas para darle profundidad y sentido al código.

# Crear la matriz de datos con años y con valor PIB simulado
matriz_datos <- matrix(c(2022, 2023, 2024, 50000, 52000, 54000), nrow = 2, byrow = TRUE)

# Crear la lista anidada informe_PIB
informe_PIB <- list(
  Titulo = "Informe PIB Venezuela",
  Autor = "Leonardo Crespo",
  Datos = matriz_datos,
  Resumen = c("PIB año 2024", "Inflación", "PIB per cápita"))


# Imprimimos la lista informe_PIB
print(informe_PIB)


#Parte 6.5: accederemos a los elementos de la lista creada


# Acceder al autor
print(informe_PIB$Autor)

# Accedemos al PIB del segundo año (2023)
print(informe_PIB$Datos[2, 2])  # El PIB de 2023 está en la segunda fila, segunda columna

# Accedemos al PIB per cápita (calculado previamente)
print(informe_PIB$Resumen[3])  # El PIB per cápita está en el tercer elemento del resumen




#Parte 7: Creamos una data.frame como nos comentaron en clases y utilizamos la guia
#Para reforzar el conocimeinto


# Crearemos un data frame con la temática de atletas y competiciones
datos_de_atletas <- data.frame(
  atleta = c("Juan", "Ana", "Luis", "Maria"), #nombre de los atletas
  competencias = c(5, 8, 7, 6), #numero de competencias, en enteros
  puntajes = c(90.5, 85.3, 92.4, 88.1), #puntajes obtenidos , máximos
  medalla = c(TRUE, FALSE, TRUE, FALSE)) #¿Ganaron medallas o premios los atletas? - Vector lógico

# Mostramos el data frame
datos_de_atletas

# Evaluamos el "mode" y la "class" de la data frame creada:
modo_de_atletas <- mode(datos_de_atletas)
modo_de_atletas
clase_de_atletas <- class(datos_de_atletas)
clase_de_atletas

# Evaluamos de manera individual el "mode" y "class" de cada una de las columnas:
mode(datos_de_atletas$atleta)
mode(datos_de_atletas$competencias)
mode(datos_de_atletas$puntajes)
mode(datos_de_atletas$medalla)

class(datos_de_atletas$atleta)
class(datos_de_atletas$competencias)
class(datos_de_atletas$puntajes)
class(datos_de_atletas$medalla)

# Otra manera de hacerlo en conjunto y de una manera mucho más avanzada, para aprender a hacerlo así y a la concatenación correcta, se usó la IA de ChatGPT en su versión o4-mini
print(paste("Columna 'atleta' - Modo:", mode(datos_de_atletas$atleta), ", Clase:", class(datos_de_atletas$atleta)))
print(paste("Columna 'competencias' - Modo:", mode(datos_de_atletas$competencias), ", Clase:", class(datos_de_atletas$competencias)))
print(paste("Columna 'puntajes' - Modo:", mode(datos_de_atletas$puntajes), ", Clase:", class(datos_de_atletas$puntajes)))
print(paste("Columna 'medalla' - Modo:", mode(datos_de_atletas$medalla), ", Clase:", class(datos_de_atletas$medalla)))

