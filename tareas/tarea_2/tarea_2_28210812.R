#Ejercicio 1

mtcars

#Utilizando el LLM Copilot
#ubicacion de la fila con mayor valor en mpg utilizando LLM
max(mtcars$mpg) 

#creamos la variable en relacion al valor encontrado
#con la funcion anterior
mayor_valor <- max(mtcars$mpg) 

#mostramos la fila extraida
print(mayor_valor)

#Ejercicio 2
#variables con nombres no permitidos

mi variable <- 1307 #contiene un espacio
1año <- 2002 #comienza con un numero
.3variable <- 'Jose Manuel' #comienza con un punto y un numero
nickn@ame <- 'Fulanito1' #error provocado por la nomenclatura de R

#Ejercicio 3
#vectores con distintas 'clases' o 'modes'

c(1, 2, 3, 4.5, 5.4) #vector numerico
c('hola', 'como', 'estas') #vector de caracteres
as.Date(c('2002-07-13')) #vector de fecha
c(1L, 2L, 5L, 7L) #vector de enteros

###### quizás era bueno asignar a una variable cada vector y verificar su clase y mode 

#Ejercicio 4
#creacion de lista

mi_lista <- list(
  numeros = list(
    enteros = c(1L, 2L, 3L, 4L, 5L),
    reales = c(1, 2, 3, 4)
  ),
  texto = list(
    saludos_en_espanol = c("hola", "buenos dias"),
    saludos_en_ingles = c("hello", "good morning")
  ),
  fecha = list(
    pasadas = as.Date(c("2020-03-13", "2024-07-29")),
    futuras = as.Date(c("2025-12-31", "2026-01-01"))
  ),
  logicos = list(
    valores_verdad = c(TRUE, FALSE, TRUE),
    condiciones = c(FALSE, TRUE)
  )
)
#mostrar la lista creada
print(mi_lista)

#Ejercicio 5
#creacion de matrices

matriz_1 <- matrix(1:16, nrow = 4, ncol = 4)
matriz_2 <- matrix(1:16, nrow = 2, ncol = 8)
matriz_3 <- matrix(1:16, nrow = 8, ncol = 2)

matriz_1
matriz_2
matriz_3

#Ejercicio 6: con listas
#parte 1, 2, 3

mi_lista_pt1 <- list(
  nombre = 'Ana',
  edad = '25',
  altura = '1.68',
  pasatiempos = c('dibujar', 'cantar', 'futbol')
)
Nombre <- mi_lista_pt1[1] #acceder e imprimir
Nombre
Edad <- mi_lista_pt1[2] #acceder e imprimir
Edad
Pasatiempos <- mi_lista_pt1[4] #acceder e imprimir

mi_lista_pt1$nombre <- 'Ana Maria' #cambio de nombre
mi_lista_pt1$ciudad <- 'Valencia' #nuevo elemento agregado
mi_lista_pt1

#parte 4

informe_PIB <- list(
  titulo = 'informe PIB venezuela',
  autor = 'Jose Suarez',
  matriz_pib = matrix(c(2010L, 2011L, 2012L, 393.19, 316.48, 381.29), 
                      nrow = 2, ncol = 3, byrow = TRUE),
  Resumen = c('PIB ano 2024', 'Inflacion', 'PIB per capita')

)
informe_PIB


rownames(informe_PIB$matriz_pib) <- c("Año", "PIB(MM)") #nombre a columnas

informe_PIB

#parte 5

informe_PIB$autor #acceso a elementos
informe_PIB$matriz_pib[2,2] #acceso a elementos
informe_PIB$Resumen[3] #acceso a elementos

#ejercicio 7: Data Frame
# data frame, 4 vectores que contienen 4 elementos, texto y numerico

data_frame_practica <- data.frame(
  Paises = c('Mexico', 'Brasil', 'Alemania', 'Francia'),
  Capitales = c('Ciudad de Mexico', 'Brasilia', 'Berlin', 'Paris'),
  Continentes = c('America del Norte', 'America del Sur', 'Europa', 'Europa'),
  Poblacion_Millones_2023 = c(129.7, 211.1, 83.28, 68.29)
)
data_frame_practica
clase_df <- class(data_frame_practica)
clase_df
modo_df <- mode(data_frame_practica)
modo_df
