##########################################################################################
# 
# Modelo Tarea 2
# 
##########################################################################################
# crear carpeta
# codigos
# 1
max(mtcars$mpg)

fila_max_mpg <- mtcars[mtcars$mpg == max(mtcars$mpg), ]
# 2 cuatro variables codigos no permitidos

# 3 vectores de distinta mode
numerico <- c(1:3)
logico <- c(FALSE, FALSE, FALSE)
enteros <- c(1L:3L)
caracteres <- c('A','B','*')

# 4 lista con al menos cuatro elementos de distintas clases

lista_tarea <- list(elemento1_log= c(TRUE, TRUE, TRUE),
                    elemento2_ent= c(2020L, 2022L, 2025L),
                    elemento3_num= seq(1,5, by=2),
                    elemento4_char= c('ayer','hoy','mañana'),
                    elemento5_date= c(Sys.Date()-1,
                                      Sys.Date(),
                                      Sys.Date()+1)
                    )


mode(lista_tarea[[1]])
mode(lista_tarea[[2]])
mode(lista_tarea[[3]])
mode(lista_tarea[[4]])

mode(lista_tarea[[1:4]]) # incorrecto

lapply(lista_tarea ,mode)
apply(cars, 2, sum)

# 5 matrices con los mismos 16 elementos, 3 combinaciones
set.seed(5)

elementos_matriz <- sample(x= 1:100, size= 16, replace= FALSE)
elementos_matriz

matrix(elementos_matriz, 8, 2)
matrix(elementos_matriz, 4, 4)
matrix(elementos_matriz, 2, 8)

# 6
# 6.1 lista persona
persona <- list(Nombre= 'Ana',
                Edad= 25,
                Altura= 1.68,
                Pasatiempos= c('dibujar',
                               "cantar",
                               "futbol")
                )


#indentado, línea nueva
# 6.2 acceso e imprimir elementos
persona$Nombre
persona[[1]]

persona$Nombre==persona[[1]]
persona$Nombre==persona[1]

names(persona[1])
names(persona[[1]])

persona$Edad

persona$Pasatiempos # indicar error en enunciado (hobbies vs pasatiempos)

# 6.3.1 modificar elemento
persona$Nombre= "Ana Maria"
persona # verificar cambio

persona$Nombre

# 6.3.2 añadir elemento
persona$ciudad= "Valencia"
persona

# 6. 4 lista informe_PIB
matrix(c(2023:2025,10001,10010,10012),3,2) # descomponer problema

informe_PIB <- list(Titulo= 'Informe_PIB_Venezuela', #remover tilde
                    Autor= '.....',
                    Datos =matrix(c(2023:2025,10001,10010,10012),3,2),
                    Resumen= c(pib_2024= 10010,
                               inflacion= 0.97,
                               pib_percap=200))

# 6.5 acceso elementos informe_PIB
informe_PIB$Autor # acá también puedo hacer comentarios
informe_PIB$Datos[2,2]
informe_PIB$Resumen[[3]]
informe_PIB$Resumen[3]

# 7 crear data frame
df_punto_7V1 <- as_data_frame(lista_tarea)

df_punto_7V2 <- data.frame(col1= c(lista_tarea[[1]],FALSE),
                           col2= c(lista_tarea[[2]],2027L),
                           col3= c(lista_tarea[[3]] ,7 ),
                           col4= c(lista_tarea[[4]],'pasado mañana'))
df_punto_7V2

as_tibble(df_punto_7V2)

mode(df_punto_7V2)
class(df_punto_7V2)


#Plus Listas
## Regresión Lineal cars
plot(data= cars, speed~ dist)

lm(data= cars, speed~dist)
rl_cars <- lm(data= cars, speed~dist)


str(rl_cars)

rl_cars$coefficients


