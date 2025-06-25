#Tarea 2

#usamos la funciopn dir.create        
#creamos la carpeta donde se guardaran las tareas del curso de r

dir.create ('tareas_r') 

#Enunciado 1

mtcars
                              # cargamos el conjunto de datos mtcars
max(mtcars$mpg) 
                              #buscamos el valor maximo de la columna mpg
mpg <- max(mtcars$mpg) 
                              #una vez obtenido, procedemos a asignarlo como variable 

########################################################################################

#Enunciado 2, crearemos la variable de la materia del curso r de forma incorrecta

materia curso r <- materia
                              #esta linea no se podra ejecutar, porque el nombre la variable,
                              #contiene espacios, por ello, arrojara error
1.materia_curso_r <- materia
                             #esta linea tampoco se podra ejecutar, ya que, el nombre de las,
                            #variables no se pueden inciar con numeros y tampoco debe contener puntos
materia\curso*r <- materia
                            #el codigo de esta linea no se podra ejecutar, porque los nombres,
                            #de las variables no deben contener caracteres especiales


###### un detalle acá es que así el nombre de la variable estuviese bien declarado,
### igual daría un error al no existir el objeto materia dentro del environnment. Igual,
### no pasa nada, pero es bueno mencionarlo
#######################################################################################

#Enunciado 3. Crear diferenres tipos de vectores 

#vector integer 

vector_enteros <- c(17L, 30L, 1L)
is.integer(17L, 30L, 1L)

##### es necesario colocar la c(). ver línea siguiente de código

is.integer(c(17L, 30L, 1L))

                        #vector integer, contiene solamente numeros enteros, 
                        #este vector cuenta con tres elementos 

#vector logicos

vector_logico <- c(TRUE, FALSE, TRUE)
is.logical(TRUE, FALSE, TRUE)
### pasa lo mismo del caso anterior. Siempre es necesario verificar las salidas
### mira el error que te está dando y no te percataste

# > is.logical(TRUE, FALSE, TRUE)
# Error in is.logical(TRUE, FALSE, TRUE) : 
#   3 arguments passed to 'is.logical' which requires 1
                        #vector logico, contiene elementos de texto logico
                        #este vector cuenta con tres elementos 

#vector de caracteristicas

vector_caracter <- c('fresa', 'cereza', 'mora')
is.character('fresa', 'cereza', 'mora')

## idem a los casos anteiores

                        #vector de caractiridticas, elemetos de texto, nombres de frutas
                        #este vector contiene tres elementos

#####################################################################################

#Enunciado 4. Crear una lista

list('numeros', 'frutas', 'edad', 'colores')

#vector 1 numeros
numeros = c(2.5, 5.6, 10.7)

#vector 2 caracteristucas, texto
frutas = c('mora', 'parchita', 'manzana')

#vector 3 integer, numeros enteros
edades = c (23, 25, 30)

#vector 4 caracteristicas, texto
colores = c('amarillo', 'azul', 'verde')

#le otorgamos un nombre a la variable lista, usamos la funcion list, que contara con,
#los cuatro elementos, los vectores que difinimos al inicio, con sus respectivos,
#elementos cada uno

mi_lista <- list(
  numeros = c(2.5, 5.6, 10.7),
  frutas = c('mora', 'parchita', 'manzana'),
  edades = c (23, 25, 30),
  colores = c('amarillo', 'azul', 'verde'))

#Enunciado realizado con ayuda de la IA Monica y guias de clase

##### si ya se habían declarado algunos de los objetos-variables que 
##### contiene la lista "mi_lista" no era necesario declararlos dentro de la lista
##### abajo el ejemplo de cómo ser más eficiente declarando la lista

mi_lista <- list(
  numeros =numeros,
  frutas = frutas,
  edades = edadas,
  colores = colores)
###########################################################################################

#Enunciado 5. Crear matrices

#Vamos a definir de los elementos de la matriz, con elementos conformados por,
#numeros del 1 al 16

#creamos una matriz

#nombrmaos a la variable matriz uno, siendo la primera 
#combinacion de nuestas tres matrices

matriz_uno <- matrix(1:16, nrow = 2, ncol  = 4)
  
                            #una vez definida la variable, usamos la funcio base de
                            #matrix, con elementos del 1 al 16, definimos numero de 
                            #columnas y  filas, tendra una dimension 2x4

matriz_uno                  #llamamos a la matriz y vemos la salida en la consola

#realizamos el mismo procedimiento para las demas matrices a crear

#definimos la siguiente variable como: matriz_dos, con una dimension 4x4

matriz_dos <- matrix(1:16, nrow = 4, ncol  = 4) 
matriz_dos 
                              #visualizamos la segunda matriz

#la ultima variable la definiremos como matriz_tres, con una dimension 8x2

matriz_tres <- matrix(1:16, nrow=8, ncol=2)
matriz_tres
                              #visualizamos la tercera matriz

#Enunciado realizado con la Guía Básica Subsetting, prorcionada para el curso

##############################################################################

#Enunciado 6

#aparatado 1. Crear lista persona

#nombramos la variable: persona y usamos la funcion para crear la lista

persona <-list(
  nombre = 'Ana',
  edad = 25,
  altura = 1.68,
  pasatiempo = c('dibujar','cantar','futbol'))
                            #definimos, el caracter y  los vectores para cada categoria 
                            #de la lista llamada persona
persona
                            #llamamos a la variable para confirma que se creo la lista
#apartado 2

#Accedemos a los siguientes elementos, nos guiamos por la poscion en la lista
persona [1] #para acceder al nombre
persona [2] #para acceder a la edad
persona [4] #para accerder a los pasatiempos 


#Procedemos a imprimir los elementos
print(persona[1])
print(persona[2])
print(persona[4])

#apartado 3 modificar la lista persona

#para modificar el nombre usaremos el operador $

persona$nombre <- 'Ana Maria'
persona

#usaremos tambien el operdaro $ para incluir la variable ciudad en la lista
persona$ciudad <- 'Valencia'
persona                     #llamamos a la lista pero revisar la modificacion

#apartado 4

#creamos la matriz de dos fialas y tres colunmas
#escribimos primero los años y luego el valor numerico del PIB
#el byrow= TRUE indicara que los datos se llenan por filas
datos<- matrix(c(2021, 2022, 2023, 150, 155, 160), nrow=2, ncol = 3, byrow = TRUE)
rownames (datos)<- c('anios', 'PIB')

#creamos la lista inform_PIB
imforme_PIB<- list(
  titulo = 'Informe PIB Venezuela',
  autor= 'Alexandra',
  datos = matrix(c(2021, 2022, 2023, 150, 155, 160), nrow=2, ncol = 3, byrow = TRUE),
  resumen = c('PIB año 2024', 'Inflacion', 'PIB per capita'))

#apartado  realizado con ayuda de la guia de clase: Guía Básica Subsetting y la IA Chatgpt

##################################################################

#Enunciado 7. Data Frames

#creamos una data frames, con el nombre de la variable zapatos_data_frame

zapatos_data_frame<- data.frame(
  tallas = c(34, 36, 37, 38, 40),                                       #vector numerico
  marca = c ('adidas', 'nike', 'joran', 'Puma', 'reebok'),              #vector de caracteres
  cuidades = c('caracas', 'valencia', 'merida', 'coro', 'lecherias'),   #vector de caracteres
  precio = c(35.50, 40.99, 24.30, 30.15, 55.60)                         #vector integer
  )
zapatos_data_frame

modo_zapatos_data_frame <- mode(zapatos_data_frame)
clase_zapatos_data_frame <- class(zapatos_data_frame)

#aparatado realizado siguiendo la Guía Básica Subsetting e indicaciones de la IA Monica
