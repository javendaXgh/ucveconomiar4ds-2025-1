# Bienvenido a la programación de los códigos asignados en "Tarea 2"
# By: Samuel Linares

# Item 1: Acceder, extraer y asignar a una variable la fila de "mtcars"
#         con mayor valor "mpg"
#
# Primero - Se averigua cuál es el mayor valor para "mpg"
#
max(mtcars$mpg)
#
# Segundo - Con el uso de la función "rownames" se obtiene el nombre de la fila
#           con ese valor de mpg
#           *NOTA* - Tomando apoyo de Copilot (LLM de Microsoft), nos sugiere
#                    la siguiente estructura.
#
rownames(mtcars)[mtcars$mpg == max(mtcars$mpg)]
#
#           Tal como puede observarse en el código, especificamos como argumento
#           de la función "rownames" que estamos accediendo a los datos de
#           "mtcars". Además, con el uso de corchetes, accedemos a los elementos
#           concretos que buscamos, donde se deja la instrucción de que el valor
#           de mpg de las filas a devolver deben ser iguales a ese valor mayor
#           que nos interesa.
#
# Tercero - Creamos una variable que se defina por la función previamente
#           construida, para que así tenga asignada la fila con el mayor
#           mpg
#
Mayor_mpg_mtcars <- rownames(mtcars)[mtcars$mpg == max(mtcars$mpg)]

######## la idea era extraer la fila, no el nombre

# Item 2: Intentar crear cuatro variables con nombres no permitidos
#
2buques_guanta <- "numero"
#
niquel@extraido <- "numero"
#
nivel de amenaza <- "cualidad"
#
else <- "alternativa"

# Item 3: Crear vectores de las distintas clases vistas en el curso, con un
#        mínimo de tres elementos en cada uno
#
logico <- c(TRUE, FALSE, FALSE)
#
entero <- c(45L, 5L, 21L)
#
numerico <- c(4, 8, 2)
#
de_caracteres <- c("Guanta", "El Guamache", "Cumaná")

#### como que tu eres oriental!!!!
#
# Verificación con el uso de la función "class"
#
class(logico)
#
class(entero)
#
class(numerico)
#
class(de_caracteres)

# Item 4: Crear una lista con al menos cuatro elementos de distintas clases,
#         donde cada uno de ellos contenga al menos dos otros elementos.
#
contenedor_cma_F2 <- list("Historial_buques" 
                          = c("Venecia", "Angelina", "Port Lois"), 
                          "Reparacion_ultimos_dos_viajes" 
                          = c(TRUE, FALSE), 
                          "Inspecciones_ultimos_dos_viajes" 
                          = c(3L, 2L), 
                          "Carga_kg_ultimos_dos_viajes" 
                          = c(23840, 24500))

# Item 5: Creación de tres matrices con los mismos 16 elementos y que presenten
#         3 combinaciones de dimensiones distintas
#
# Primera opción: Matriz 4x4
#
matrix(140:155, nrow = 4, ncol = 4)
#
# Segunda opción: Matriz 2x8
#
matrix(140:155, nrow = 2, ncol = 8)
#
# Tercera opción: Matriz 1x16
#
matrix(140:155, nrow = 1, ncol = 16)
#

# Item 6: Ejercicios con listas
#
# Primer inciso - Creación de lista "persona"
#
persona <- list("Nombre" = "Ana", "Edad" = 25, "Altura" = 1.68,
                 "Pasatiempos" = c("dibujar", "cantar", "futbol"))
#
# Segundo inciso - Acceder e imprimir los elementos solicitados de la lista
#
# El nombre
#
persona$Nombre
print(persona$Nombre)
#
# La edad
#
persona$Edad
print(persona$Edad)
#
# Los pasatiempos
#
persona$Pasatiempos
print(persona$Pasatiempos)
#
# Tercer inciso - Modificación de elementos solicitados
#
# Cambio del elemento "Nombre" de la lista
#
persona$Nombre = "Ana María"
#
# Adición de un nuevo elemento a la lista
#
persona$Ciudad <- "Valencia"
#
# Nota: Se consultó la guía de complemeto acerca de listas que se puede
#       encontrar en la página del curso R4DS.
#
# Visualización de lista "persona" con nuevos elementos
#
persona
#
# Cuarto inciso: Creación de lista anidada "informe_PIB"
#
#                Antes de construir la lista, se procede a definir los datos
#                que conformaran a la matriz del elemento "Datos".
#                Nota: Una curso de acción que sugiere "Copilot" LLM de
#                      preferencia, consiste en construir primero la matriz y,
#                      luego asignarla al elemento de la lista "Datos"
#
años <- c(2022, 2023, 2024)
pib <- c(3456.78, 3822.01, 3704.20)
#
#               Ahora bien, aplicamos la función para construir una matriz y la
#               asignamos a una variable llamada "matriz_datos_pib", el aporte
#               de la LLM utilizada para proceder con este apartado consiste en
#               crear la matriz con dos filas y organizarlas en base a las
#               posiciones de los datoa "años" y "pib" en el vector que refiere
#               a los datos que contendrá la matriz, esto gracias al uso del
#               argumento "byrow = TRUE".
#
matriz_datos_pib <- matrix(c(años, pib), nrow = 2, byrow = TRUE)
#
#               Luego, procedemos a construir la lista solicitada con nombre
#               "informe_PIB"
#
informe_PIB <- list(
  "Título" = "Informe PIB Venezuela", 
  "Autor" = "Samuel Linares", 
  "Datos" = matriz_datos_pib, 
  "Resumen" = c("PIB año 2024", "Inflación", "PIB per cápita"))
#
# Quinto inciso: Acceder a los elementos solicitados de la lista creada
#                "informe_PIB"
#
# Código para acceder al autor
#
# - De acuerdo a la guía de complemento acerca de listas del curso R4DS, esto
#   puede hacerse con el operador "$", o bien indicando la posición del 
#   elemento deseado con corchetes "[]". Se utilizará la segunda opción.
#
informe_PIB[2]

#
# Código para acceder al PIB del segundo año de la serie
#
# - Usaremos una combinación de operadores para acceder con más facilidad a la
#   posición en la matriz en la que se encuentra el dato deseado.
#
informe_PIB$Datos[2, 2]
#
# - Existe una segunda opción, de acuerdo a la sugerencia de la LLM utilizada, 
#   en la que podemos hacer que también se muestre ese año en el que se indicó
#   debía pertenecer el PIB buscado, que sería el siguiente código.
#
informe_PIB$Datos[, 2]
#
# Código para acceder al PIB per cápita
#
informe_PIB[[4]][3]

# Item 7: Creación del dataframe solicitado y asignación a objeto
#
# - En primer lugar, se crean los vectores que conformaran a los datos del
#   del dataframe.
#
Condicion <- c("Óptimo", "Defectuoso", "Óptimo", "Óptimo")
Marca_de_calidad <- c("A", "A", "C", "B")
Cantidad_del_lote <- c(40L, 28L, 32L, 34L)
Costo_incurrido_USD <- c(24000, 16000, 15000, 18000)
#
data.frame(Condicion, Marca_de_calidad, Cantidad_del_lote, Costo_incurrido_USD)
#
# - Ahora asignamos esta función a un objeto que llamaremos 
#   "resumen_produccion"
#
resumen_produccion <- data.frame(Condicion, 
                                 Marca_de_calidad, 
                                 Cantidad_del_lote, 
                                 Costo_incurrido_USD)
#
# Verificación de claas y mode del dataframe creado
#
class(resumen_produccion)
#
mode(resumen_produccion)

# GRACIAS POR SU LECTURA #