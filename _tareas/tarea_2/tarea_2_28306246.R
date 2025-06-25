#Variable for mpg's max value
mpgmax <- max(mtcars$mpg) #filtro la variable mpg y determino su valor maximo
View(mtcars) 
mpgmax #imprimo el valor
#Wrong ways for calling a variable.
###########??????? por qué en inglés??????

mala practica <- ':(' #variable con espacios y poco descriptiva
2019pib <- 193920 #variable con numeros
@variable <- FALSE
#@ucv <- variable #empieza con un un numeral y tiene un caracter no permitido
  #creacion de vectores de distintos tipos
  
numerico <- c(1, 2, 3, 4) # vector numerico
class(numerico) # atributo del objeto
mode(numerico) # tipo de datos
logico <- c(TRUE, FALSE, TRUE) # vector logico
class(logico) #atributo del objeto
mode(logico) # tipo de datos
caracteres <- c('hola', 'mundo', 'palabra')
class(caracteres) #atributo del objeto
mode(caracteres)  # tipo de datos
#creacion de lista
persona <- list(nombre='Ana', edad=25, altura=1.68, Pasatiempos=c('dibujar', 'cantar', 'futbol'))
# se imprimen los elementos solicitados seleccionandolos de la lista persona
persona
persona$nombre #imprimo el elemento nombre
persona$edad #imprimo el elemento edad
persona$Pasatiempos #imprimo el elemento pasatiempos
#modificar lista
persona$nombre <- 'Ana Maria' # cambio de nombre
persona$ciudad <- 'Valencia'#se agrega la ciudad
#crear lista de pib Venezuela
#procedo a crear vetores con los datos solicitados para la lista
anos <- c(2022, 2023, 2024)
pib <- c(30000, 35000, 40000)
informe_pib <- list(titulo='Informe PIB Venezuela', autor='Gustavo Moreno', datos=matrix(c(anos, pib), nrow=2, ncol=3, byrow=TRUE), resumen=list('PIB ano 2024'=40000, 'Inflacion'=2.3, 'PIB per capita'=1300)) #se hizo uso de la IA perplexity para arreglar la matriz
informe_pib$autor
informe_pib$datos[2,2] #Se consulto perplexity para imprimir el elemento seleccionado
informe_pib$resumen$`PIB per capita`
# crear dataframe
consumidores <- c('consumidor_1', 'consumidor_2', 'consumidor_3', 'consumidor_4') # primera variable , de tipo categorica
rentas <- c(400, 350, 340, 500) # segunda variable de tipo numerica
gastos_totales <- c(200, 150, 300, 450) # tercera variable de tipo numerica
gasto_alimentos <- c(150, 90, 290, 300) # cuarta variable de tipo numerica
consumo_hogares <- data.frame(consumidores, rentas, gastos_totales, gasto_alimentos)
View(consumo_hogares)
mode(consumo_hogares) #los dataframes son un un tipo de listas
class(consumo_hogares) #tipo de objeto


#Gustavo, cuida la legibilidad del código. Usa de ejemplo de legibilidad, 
# los scripts que les he ido compartiendo. Me llamó la atención la línea 5 del script