# Tarea 2 - CI: [27600050] 


#Se utilizó deepseek y chatGPT 3.5 como guia para la elaboracion del codigo

#Respuestas:

# 1. Extraer fila con máximo mpg de mtcars
# Para esto se creó la variable max_mpg y se utilizo la funcion para encontrar
#el maximo valor en la columna de MPG: max(mtcars$mpg),
max_mpg <- max(mtcars$mpg)
# Filtrar la fila del dataframe con el carro con el mpg máximo, para esto se 
#utilizó [] y == para excluir todas las filas donde no este el maximo MPG en el dataframe,
# y la coma , para seleccionar todas las columnas de la fila con el maximo valor de MPG
fila_max_mpg <- mtcars[mtcars$mpg == max_mpg, ]
# Para ver resultado
print("Fila con máximo mpg:")
print(fila_max_mpg)
# 2. Crear variables con nombres no permitidos: en este caso se realizaron las 
#variables incluyendo caracteres especiales no permitidos e inicio con numero,
# como _ . - ! 
`1variable` <- 10          
`_variable` <- 5     
`variable-1` <- 20    
`variable!` <- 8  

######### si lo colocas así, con el apóstrofe o comilla simple inclinada, sí puedes crear la variable,
#########, es decir, que no haces lo indicado en la tarea

# 3. Crear vectores de distintas clases
vector_numerico <- c(1, 2.5, 3)               
vector_caracter <- c("a", "b", "c")            
vector_logico <- c(TRUE, FALSE, TRUE)          
vector_complejo <- c(1+2i, 3+4i, 5+6i)         
vector_entero <- c(1L, 2L, 3L)                 
# 4. Crear lista con elementos de distintas clases
#Para crear la lista con elementos numericos, de texto, logicos y anidados, utilizamos 
# la funcion list() 
lista_1 <- list(
  numeros = c(1, 2),
  texto = c("Gazoo", "Racing"),
  logico = c(TRUE, FALSE)
)
print(lista_1)
# 5. Crear matrices con 16 elementos y distintas dimensiones
# Matriz de 2x8
matriz_2x8 <- matrix(1:16, nrow = 2, ncol = 8)
print(matriz_2x8)
# Matriz de 4x4
matriz_4x4 <- matrix(1:16, nrow = 4, ncol = 4)
print(matriz_4x4)
# Matriz de 1X16
matriz_1x16 <- matrix(1:16, nrow = 1, ncol = 16)
# 6. Crear lista 'persona'
#Se construyó la lista con los elementos de distinta clase: 
#nombre (texto), edad (numerico), altura (numerico), pasatiempos (texto)
# Crear lista persona
persona <- list(
  Nombre = "Ana", 
  Edad = 25, 
  Altura = 1.68, 
  Pasatiempos = c("dibujar", "cantar", "Simracing")
  )
# Acceder a elementos
print("Elementos de persona:") 

print(persona$Nombre)
print(persona$Edad)
print(persona$Pasatiempos)
# Para modificar los elementos de la lista se utiliza el operador $ para que hiciera
#el cambio en los elementos Nombre y crear el elemento Ciudad
persona$Nombre <- "Ana María"
persona$ciudad <- "Valencia"
# Acceder a elementos
##### codigo duplicado

print("Elementos de persona:")
print(persona$Nombre)
print(persona$Edad)
print(persona$Pasatiempos)
print(persona$ciudad)
#Crear lista anidada informe_PIB
#Se sigue el mismo procedimiento de la pregunta anterior
informe_PIB <- list(
  Titulo = "Informe PIB Venezuela",
  Autor = "[Ignacio Goncalves]",
  Datos = matrix(c(2022, 2023, 2024, 80, 90, 95), nrow = 2, byrow = TRUE),
  Resumen = c("PIB año 2024", "Inflación", "PIB per cápita")
)
print("Elementos de informe_PIB:")
print(informe_PIB$Autor)
print(informe_PIB$Datos[2, 2])        
print(informe_PIB$Resumen[3])        
# 7. Crear data frame y verificar su clase
#Para el dataframe se utilizó datos de carros deportivos Corvette, Camaro,
#Porsche 911 y Nissan GTR, creando los vectores: carro, potencia, naturalmente aspirado
#y cuartodemilla, conformados por elementos de texto, numerico y logicos.
# Crear vectores de distintas clases
carro <- c("Corvette", "Camaro", "Porsche911", "GTR")
potencia <- c(505, 425, 400, 650)
naturalmenteaspirado <- c(TRUE, TRUE, TRUE, FALSE)
cuartodemilla <- c(11.5, 12.5, 11.6, 11)
# Crear data frame
Listacarros <- data.frame(carro, potencia, naturalmenteaspirado, cuartodemilla)
# Verificar propiedades
print("Clase del data frame:")
print(class(Listacarros))   
print("Modo del data frame:")
print(mode(Listacarros))    

#### no creo que era necesario que te ayudaras con una IA para hacer toda la tarea, ya que
#### estimo que termina complicando algo que es muy sencillo que debes prepararte para
#### resolver solo


