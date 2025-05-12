# BIENVENIDO A LA TAREA 3 - "IMPLEMENTACIÓN DE DATOS DEL BANCO MUNDIAL EN R"

# By: Samuel Linares
#     V. 29658512

# En breves términos, las instrucciones a seguir para la resolución de esta
# tarea se plantean con el objetivo de dar práctica a las herramientas usadas
# para extraer, manipular y visualizar datos del Banco Mundial (World Bank Group)
# directamente desde el editor de código en R, sin la necesidad de importar o 
# descargar los datos previamente a través de formatos diferentes.

# Evidentemente, esto resulta en un trabajo mucho más rápido y cómodo para el
# investigador a la hora de buscar los datos deseados. Así que, sin más
# preambulos, empecemos el desarrollo de la tarea.

# ITEM 2: Selección del indicador del Banco Mundial

# Para este cometido, se ha elegido el indicador de las "reservas 
# internacionales sin oro" el cual, al emprender su búsqueda en el portal del
# Banco Mundial, recibe el código ISO "FI.RES.XGLD.CD". Dicho ello, se procede
# instalar el paquete que nos permitirá estas interacciones deseadas.

install.packages("WDI")
library(WDI)

# Además, se aprovechará de llamar a librerias que pueden que se utilicen en un
# punto de esta presentación.

library(ggplot2)
library(tidyverse)
library(dplyr)

# Ahora, se descargan los datos del indicador seleccionado utilizando su código
# ISO de país, asignandole el nombre de "reservas_sin_oro".

df_reservas_sin_oro <- WDI(indicator = "FI.RES.XGLD.CD")

# ITEM 3: Implementación en R

# Luego de crear nuestra variable que tiene asignada los datos del indicador
# con el cual se estará trabajando, veamos las características básicas de dichos
# datos con la función "summary".

summary(df_reservas_sin_oro)

# Primer filtro (PUNTO 3): Países del Mercosur
#        
#        En orden de filtrar los datos para que solo muestren los datos
#        en relación a los países pertenecientes a este proceso de
#        integración, vamos a crear un vector en el que se contengan a 
#        dichos países, pero usando su código país que maneja el Banco Mundial.

#        Conociendo que es conformado por: Argentina, Bolivia, Brasil, Paraguay,
#        Uruguay y Venezuela (exceptuando a este último por condición de 
#        suspendido por el "Protocolo de Ushuaia"), el vector se conforma de la 
#        siguiente manera:

mercosur_paises <- c("ARG", "BOL", "BRA", "PRY", "URY")

#        Hecho esto, se crea el filtro.

df_mercosur_reservas_so <- WDI(country = mercosur_paises, indicator = 
                              "FI.RES.XGLD.CD")

# Observación: si ya habías descargado los datos en `df_reservas_sin_oro` podías filtrarlos sin
# tener que descargarlos nuevamente

#        Podemos realizar un gráfico exploratorio sencillo en el cual
#        visualicemos el comportamiento de las reservas internacionales
#        en los años que contiene los datos originales.

ggplot(df_mercosur_reservas_so, aes(x = year, y = FI.RES.XGLD.CD, 
                                    color = country)) +
  geom_line() +
  ggtitle("Reservas internacionales menos oro")

## Observacion: bien! esto de explorar los datos

#        (PUNTO 4) Con la obtención de nuestro nuevo dataframe sujeto al filtro
#        de los países del Mercosur, veamos su características básicas de la
#        misma manera como se realizó con los datos originales.

summary(df_mercosur_reservas_so)

#        (PUNTO 5) Teniendo esta nueva "data frame", realicemos el siguiente paso
#        el cual consiste en ordenar sus datos respecto a los valores
#        del indicador en cuestión. Para esto, podemos usar la función
#        "arrange"

df_mercosur_reservas_so %>%
  arrange(FI.RES.XGLD.CD)

#        (PUNTO 6) Continuando, se constuirán funciones para lograr obtener los
#        los valores históricos mínimos y máximos del indicador en cuestión, y
#        los países que lo identifican.

min(df_mercosur_reservas_so$FI.RES.XGLD.CD)
max(df_mercosur_reservas_so$FI.RES.XGLD.CD)

#        Las funciones planteadas presentan la irregularidad de los valores N/A
#        de los que padecen los datos originales. Para sortear este particular,
#        bajo instrucción del profesor, se usa un argumento adicional en la
#        función a trabajar, el cual es "na.rm"
#
#        NOTA: Copilot nos brinda la siguiente definición".
#              "Para indicar si los valores NA (faltantes) deben ser eliminados 
#               antes de realizar una operación. Su nombre proviene de 
#               "NA remove", y cuando se establece en TRUE, la función ignora 
#               los valores faltantes en los cálculos"

min(df_mercosur_reservas_so$FI.RES.XGLD.CD, na.rm = TRUE)
max(df_mercosur_reservas_so$FI.RES.XGLD.CD, na.rm = TRUE)

#         Con esta corrección, ya podemos proceder a construir la función para
#         obtener el país al cual pertenece dicho valor, tanto el máximo, como
#         el mínimo. Les asignaremos una variable para una finalidad posterior.

# Países con el valor máximo y mínimo del indicador

# NOTA: Al intentar utilizar la función que se muestra a continuación, suceden
#       irregularidades que no logré comprender como corregir, tal es el caso
#       de la salida del dato deseado, pero acompañado de varios NA. Para ello,
#       se invita a ejecutar el código para visualizar el error descrito.

pais_mercosur_menor_reserva <- df_mercosur_reservas_so$country[
  df_mercosur_reservas_so$FI.RES.XGLD.CD 
  == min(df_mercosur_reservas_so$FI.RES.XGLD.CD, na.rm = TRUE)]

# Observación: no te vayas por el camino de RBase en estos ejercicios ya que estamos
# buscando trabajar dplyr, pero igual se valora que lo hagas de esta forma
# Avísame si necesitas que te indique cómo hacerlo con dplyr ya que me interesa que esto
# les quede claro

#       En consecuencia, luego de realizar una pequeña busqueda, se decidió
#       continuar las instrucciones con el uso de la función "which.max o
#       which.min". Esta función devuelve la posición del máximo o mínimo
#       valor en el vector indicado, donde, de acuerdo a Copilot, evita la
#       necesidad de comparaciones directas con "==".

#       Por supuesto, si usted tiene alguna observación o comentario acerca
#       de este particular. Es bienvenido a dejarla en el feedback de correción
#       para así ser capaz de mejorar.

#       No obstante, para el resto de la actividad, se seguirá trabajando con la
#       función "which.max o which.min"

# País con el valor histórico máximo del indicador dentro del MERCOSUR

pais_mercosur_mayor_reserva <- df_mercosur_reservas_so$country[which.max(
  df_mercosur_reservas_so$FI.RES.XGLD.CD)]

# País con el valor histórico mínimo del indicador dentro del MERCOSUR.

pais_mercosur_menor_reserva <- df_mercosur_reservas_so$country[which.min(
  df_mercosur_reservas_so$FI.RES.XGLD.CD)]

#        (PUNTO 7) Ahora bien, se crean las variables de resultados bajo la
#        siguiente estructura.

menor_reserva_mercosur <- paste(pais_mercosur_menor_reserva, "con un valor de", 
                                min(df_mercosur_reservas_so$FI.RES.XGLD.CD, 
                                    na.rm = TRUE))

# Observación: está muy bueno que empieces a trabajar la combinación de funciones

mayor_reserva_mercosur <- paste(pais_mercosur_mayor_reserva, "con un valor de", 
                                max(df_mercosur_reservas_so$FI.RES.XGLD.CD, 
                                    na.rm = TRUE))

# Segundo filtro (PUNTO 8): Datos para Venezuela

#         Siguiendo el mismo orden y funciones del caso anterior, vamos a crear
#         un dataframe para Venezuela.

df_venezuela_reservas_so <- WDI(country = "VEN", indicator = "FI.RES.XGLD.CD")

#         Presentación de gráfico exploratorio sencillo para nuevos datos.

ggplot(df_venezuela_reservas_so, aes(x = year, y = FI.RES.XGLD.CD)) +
  geom_line() +
  ggtitle("Reservas internacionales menos oro")

# Tabla resumen para Venezuela

summary(df_venezuela_reservas_so)

# Ordenamiento de datos respecto al valor del indicador

df_venezuela_reservas_so %>%
  arrange(FI.RES.XGLD.CD)

# Funciones para obtener valores mínimos y máximos

min(df_venezuela_reservas_so$FI.RES.XGLD.CD, na.rm = TRUE)
max(df_venezuela_reservas_so$FI.RES.XGLD.CD, na.rm = TRUE)

# Obtención de año asociado al valor mínimo y máximo respectivamente

# 

periodo_venezuela_menor_reserva <- df_venezuela_reservas_so$year[which.min(
  df_venezuela_reservas_so$FI.RES.XGLD.CD)]

#

periodo_venezuela_mayor_reserva <- df_venezuela_reservas_so$year[which.max(
  df_venezuela_reservas_so$FI.RES.XGLD.CD)]

#

menor_reserva_venezuela <- paste("El año", 
                                 periodo_venezuela_menor_reserva, 
                                 "con un valor de", 
                                 min(df_venezuela_reservas_so$FI.RES.XGLD.CD, 
                                     na.rm = TRUE))

mayor_reserva_venezuela <- paste("El año", 
                                 periodo_venezuela_mayor_reserva, 
                                 "con un valor de", 
                                 max(df_venezuela_reservas_so$FI.RES.XGLD.CD, 
                                     na.rm = TRUE))

# (PUNTO 9) Luego de este proceso, podemos tomar ambas dataframe y crear una
# combinada, con los países operativos del Mercosur y Venezuela. De la
# siguiente manera.

df_conjunta_reservas_so <- rbind(df_venezuela_reservas_so, 
                                 df_mercosur_reservas_so)

ggplot(df_conjunta_reservas_so, aes(x = year, y = FI.RES.XGLD.CD, 
                                    color = country)) +
  geom_line() +
  ggtitle("Reservas internacionales menos oro")

# MUCHAS GRACIAS POR SU REVISIÓN.