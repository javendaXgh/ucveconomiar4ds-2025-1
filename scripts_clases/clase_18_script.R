##########################################################################################
#
# Script Clase 18: crear funciones/ 2da parte
# Usar de base la función Cobb-Douglas (C-D)
# más info en https://g.co/gemini/share/5453d88037fe
#
# Se harán distintas versiones de una función en R teniendo de base de la C-D, 
# cada una será más compleja en cuanto a los procesamientos y salida que se genera
#
##########################################################################################
 
# Cargar librerías
library(ggplot2)
library(dplyr)

# info general: llamaremos a la funcion `calculo_cd`

# Primera versión: se realiza el cálculo de la función C-D,

calculo_cdV1 <- function(A, K, alfa, beta, L){
                       A*(K^alfa)*(L^beta)
                       }

# Segunda versión: agregar comentarios a la función para que quien la use sepa qué hace la
# función y cuáles son sus argumentos

calculo_cdV2 <- function(A, K, alfa, beta, L){
  # Función que calcula el valor de la función Cobb-Douglas (C-D)
  
  # Argumentos:
  # A: Productividad total de los factores
  # K: Capital utilizado
  # alfa: Coeficiente de elasticidad del capital
  # beta: Coeficiente de elasticidad del trabajo
  # L: Trabajo utilizado
  
  # Retorna: el valor de la función C-D
  A*(K^alfa)*(L^beta)
}

# Tercera versión: agregar una validación para que la función retorne un mensaje si la 
# suma de los coeficientes alfa y beta es distinta a 1. 

# Se introduce el uso de las estructuras de control if-else para validar la condición.
# Se redondea a dos décimales el valor retornado

calculo_cdV3 <- function(A, K, alfa, beta, L){
  # Función que calcula el valor de la función Cobb-Douglas (C-D)
  
  # Argumentos:
  # A: Productividad total de los factores
  # K: Capital utilizado
  # alfa: Coeficiente de elasticidad del capital
  # beta: Coeficiente de elasticidad del trabajo
  # L: Trabajo utilizado
  
  # Retorna: el valor de la función C-D o un mensaje de error
  
  # caso no éxito
  if((alfa + beta) != 1){
    # valor a retornar
    print("La suma de los coeficientes alfa y beta debe ser igual a 1.")
    # caso éxito
  }else{
    # valor a retornar
    round(A*(K^alfa)*(L^beta),2)
  }
}


# Cuarta versión: agregar un mensaje si la suma de los coeficientes alfa y beta es mayor a 1
# y otro mensaje si es menor que 1. Notar que se invierte el condicional a evaluar y el 
# lo que hace en el éxito, y lo que hace en la falla (else)

# Se introduce el uso de las estructuras de control if-else  y else if para validar las 
# condiciones.

calculo_cdV4 <- function(A,
                       K,
                       alfa,
                       beta,
                       L){
  # Función que calcula el valor de la función Cobb-Douglas (C-D)
  
  # Argumentos:
  # A: Productividad total de los factores
  # K: Capital utilizado
  # alfa: Coeficiente de elasticidad del capital
  # beta: Coeficiente de elasticidad del trabajo
  # L: Trabajo utilizado
  
  # Retorna: 
  # Caso éxito: el valor de la función C-D o
  # Caso no éxito: un mensaje de error según caso
  
  # caso éxito
  if((alfa+beta)==1){
    # valor a retornar
    round(A*(K^alfa)*(L^beta),2)
    
    # caso no éxito 1
  } else if (alfa+beta>1){ 
    # valor a retornar
    print('sumatoria coeficientes mayor a 1')
    
    # caso no éxito 2
  } else{
    # valor a retornar
    print('sumatoria coeficientes menor a 1')
  }
}

# Quinta versión: ídem a la anterior, pero se retorna una lista con el valor de la 
# función C-D y adicionalmente un gráfico en ggplot, que usa de insumo el valor obtenido
# en el calculo de la funcion C-D y se usa de forma referencial

calculo_cdV5 <- function(A,
                       K,
                       alfa,
                       beta,
                       L){
  # Función que calcula el valor de la función Cobb-Douglas (C-D)
  
  # Argumentos:
  # A: Productividad total de los factores
  # K: Capital utilizado
  # alfa: Coeficiente de elasticidad del capital
  # beta: Coeficiente de elasticidad del trabajo
  # L: Trabajo utilizado
  
  # Retorna: 
  # caso exito: el valor de la función C-D y un gráfico ggplot de ejemplo
  # caso no exito: un mensaje de error, según caso
  
  # caso éxito
  if((alfa+beta)==1){ 
    valor_cd= round(A*(K^alfa)*(L^beta),2)
    # crear un gráfico de ejemplo
    grafico_retornado <- ggplot(data = data.frame(x = 1:valor_cd, 
                                                  y = rnorm(valor_cd)), 
                                aes(x = x, y = y)) +
      geom_line() +
      labs(title = "Gráfico de ejemplo",
           x = "Eje X",
           y = "Eje Y")
    # retornar una lista con el valor de la función C-D y el gráfico
    list(valor_cd = valor_cd, 
         grafico_retornado = grafico_retornado)

    # caso no éxito 1 (ver uso de la función else if)
  } else if (alfa+beta>1){ 
    
    # valor a retornar
    print('sumatoria coeficientes mayor a 1')
    
    # caso no éxito 2
  } else{
    
    # valor a retornar
    print('sumatoria coeficientes menor a 1')
  }
}


#############################################
## Llamar a la función calculo_cd en sus distintas versiones
# con los argumentos A, K, alfa, beta y L
#############################################

calculo_cdV1(A=3.5,
             K=10,
             L=20,
             alfa= .3,
             beta=.7)

calculo_cdV2(A=3.5,
             K=10,
             L=20,
             alfa= .3,
             beta=.7)

# mensaje que muestra error 
calculo_cdV3(A=3.5,
             K=10,
             L=20,
             alfa= .4,
             beta=.7)

# se redondea la cifra
calculo_cdV3(A=3.5,
             K=10,
             L=20,
             alfa= .3,
             beta=.7)

calculo_cdV4(A=3.5,
             K=10,
             L=20,
             alfa= .3,
             beta=.7)

# mensaje que muestra error 
calculo_cdV4(A=3.5,
             K=10,
             L=20,
             alfa= .4,
             beta=.7)

# mensaje que muestra error 
calculo_cdV4(A=3.5,
             K=10,
             L=20,
             alfa= .1,
             beta=.7)

calculo_cdV5(A=3.5,
             K=10,
             L=20,
             alfa= .3,
             beta=.7)

# Llamar a la función calculo_cd y guardar el resultado en una variable
valor_calculo_cdV5 <- calculo_cdV5( A=3.5,
                                  K=10,
                                  L=20,
                                  alfa= .3,
                                  beta=.7)

# Ver el resultado del cálculo
valor_calculo_cdV5

# Las siguientes línea sólo son válidas para el caso
valor_calculo_cdV5$grafico_retornado
valor_calculo_cdV5$valor_cd


## Complemento sobre explicación de las estructuras de control
# Ejemplo 1: Estructura de control if-else

x <- 10

if (x > 5) {
  # Si la condición (x > 5) es TRUE, se ejecuta este bloque de código
  print("x es mayor que 5")
} else {
  # Si la condición (x > 5) es FALSE, se ejecuta este bloque de código
  print("x no es mayor que 5")
}

# Ejemplo 2: Estructura de control if-else if-else
# la función else if se pudiesen agregar tantos casos como se necesite

y <- 0

if (y > 0) {
  # Si la condición (y > 0) es TRUE
  print("y es positivo")
} else if (y < 0) {
  # Si la condición anterior es FALSE y esta condición (y < 0) es TRUE
  print("y es negativo")
} else {
  # Si todas las condiciones anteriores son FALSE
  print("y es cero")
}


# Ejemplo 3: Estructura de control switch
# Se evalúa cuál caso coincide con la variable opcion y se ejecuta el bloque correspondiente
opcion <- "B"
resultado <- switch(opcion,
                    "A" = "Opción A seleccionada",
                    "B" = "Opción B seleccionada",
                    "C" = "Opción C seleccionada",
                    "D" = "Opción D seleccionada",
                    "Opción no válida")
# Imprimir el resultado
resultado