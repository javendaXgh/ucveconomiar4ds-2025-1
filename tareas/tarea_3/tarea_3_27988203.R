#En esta tarea me apoye completamente en informacion proveniente del articulo de Medium, de las laminas del curso del profesor José Avendaño, del script de la clase  10 y del video de apoyo subido por el profesor


#instalacion de paquetes necesarios

install.packages("WDI") #instalacion de el paquete WDI, segun el articulo web de medium
library(WDI)

install.packages("tidyverse") #instalo el paquete tidyverse que contiene el paquete dplyr para poder filtrar datos

library(tidyverse)


#Descarga de datos del indicador

empleo_no_agricola <- WDI(indicator="SL.EMP.WORK.ZS") #Asigno la data del indicador a la variable empleo_no_agricola

empleo_no_agricola #llamo la variable para que me muestre la data


#Genero una tabla resumen (estadísticas descriptivas básicas) de todo el conjunto de datos, y del indicador especifico

summary(empleo_no_agricola) #con la funcion summary le pido las estadisticas resumen del conjunto de datos

summary(empleo_no_agricola$SL.EMP.WORK.ZS) #con la funcion summary le pido las estadisticas resumen de la columna o variable que me intereso

## Pregunta: pudiste ver la gran cantidad de valores ausentes?

#Creo un filtro para los paises del mercosur, usea el nombre de los paises y no el codigo iso, genero un nuevo dataframe

paises_mercosur <- c("Argentina", "Brazil", "Paraguay", "Uruguay", "Venezuela, RB") #creo un conjunto con los paises miembros del mercosur (no incluye los asociados) y incluye a Venezuela que esta suspendido

mercosur_empleo <- empleo_no_agricola %>% #Creo un nuevo dataframe llamado mercosur_empleo usando un filtro del paquete tidyverse
  filter(country %in% paises_mercosur) #aca le asigno el filro por paises, los paises ya fueron establecidos en un conjunto anterior

mercosur_empleo #muestro la nuevo dataframe


# Genero una tabla resumen de estadisticas descriptivas de la variable de interes solo del conjunto del mercosur

summary(mercosur_empleo$SL.EMP.WORK.ZS) #con la funcion summary le pido las estadisticas resumen del porcentaje de empleo en ocupaciones no agrícolas de los paises del mercosur


#Dataframe ordenado de menor a mayor (forma ascendente)

mercosur_empleo_ordenado <- mercosur_empleo %>%
  arrange(SL.EMP.WORK.ZS) # Ordeno el dataframe de forma ascendente segun el porcentaje de empleo en ocupaciones no agrícolas

mercosur_empleo_ordenado #muestro el dataframe ordenado de menor a mayor


# Identifico los valores extremos del conjunto de datos

min(mercosur_empleo$SL.EMP.WORK.ZS, na.rm = TRUE )# Obtengo el valor minimo del porcentaje de empleo no agrícola de los países del Mercosur
max(mercosur_empleo$SL.EMP.WORK.ZS, na.rm = TRUE )# Obtengo el valor maximo del porcentaje de empleo no agrícola de los países del Mercosur


# Guardo esos valores extremos en variables, e identifico el pais al que pertenecen mediante un filtro

pais_min_empleo <- mercosur_empleo %>%
  filter(SL.EMP.WORK.ZS == min(SL.EMP.WORK.ZS, na.rm = TRUE)) %>%
  pull (country, SL.EMP.WORK.ZS) # filtro el valor minimo (ignorando los N/A), extrayendo el nombre del país y el valor del indicador, y cargo estos 2 valores en la variable pais_min_empleo

pais_min_empleo #muestro los valores del pais con el % de empleo no agricola minimo que cargue en esa variable


pais_max_empleo <- mercosur_empleo %>%
  filter(SL.EMP.WORK.ZS == max(SL.EMP.WORK.ZS, na.rm = TRUE)) %>%
  pull (country, SL.EMP.WORK.ZS) # filtro el valor maximo (ignorando los N/A), extrayendo el nombre del país y el valor del indicador, y cargo estos 2 valores en la variable pais_max_empleo

pais_max_empleo #muestro los valores del pais con el % de empleo no agricola maximo que cargue en esa variable

####Venezuela####


# Creo un filtro para extraer la data de Venezuela y crear un nuevo dataframe

pais_venezuela <- c("Venezuela, RB") #creo un conjunto con Venezuela

venezuela_empleo <- empleo_no_agricola %>% #Creo un nuevo dataframe llamado venezuela_empleo usando un filtro del paquete dplyr
  filter(country %in% pais_venezuela) #aca le asigno el filro por paises, los paises ya fueron establecidos en un conjunto anterior

venezuela_empleo #muestro la nuevo dataframe


# Genero una tabla resumen de estadisticas descriptivas de la variable de interes solo de Venezuela

summary(venezuela_empleo$SL.EMP.WORK.ZS) #con la funcion summary le pido las estadisticas resumen del porcentaje de empleo en ocupaciones no agrícolas de los paises del mercosur


#Dataframe ordenado de menor a mayor (forma ascendente)

venezuela_empleo_ordenado <- venezuela_empleo %>%
  arrange(SL.EMP.WORK.ZS) # Ordeno el dataframe de forma ascendente segun el porcentaje de empleo en ocupaciones no agrícolas, podemos comparar entre años

venezuela_empleo_ordenado # Muestro el dataframe ordenado de forma ascendente de los valores de Venezuela


# Identifico los valores extremos del conjunto de datos

min(venezuela_empleo$SL.EMP.WORK.ZS, na.rm = TRUE )# Obtengo el valor minimo del porcentaje de empleo no agrícola en Venezuela
max(venezuela_empleo$SL.EMP.WORK.ZS, na.rm = TRUE )# Obtengo el valor maximo del porcentaje de empleo no agrícola en Venezuela


# Guardo esos valores extremos en variables, e identifico el año al que pertenecen mediante un filtro

venezuela_min_empleo <- venezuela_empleo %>%
  filter(SL.EMP.WORK.ZS == min(SL.EMP.WORK.ZS, na.rm = TRUE)) %>%
  pull (year, SL.EMP.WORK.ZS) # filtro el valor minimo (ignorando los N/A), extrayendo el valor del indicador y el año, y cargo ese valor en la variable venezuela_min_empleo

venezuela_min_empleo  #muestro el porcentaje de empleo no agricola minimo y el año que cargue en esa variable


venezuela_max_empleo <- venezuela_empleo %>%
  filter(SL.EMP.WORK.ZS == max(SL.EMP.WORK.ZS, na.rm = TRUE)) %>%
  pull (year, SL.EMP.WORK.ZS) # filtro el valor maximo (ignorando los N/A), extrayendo el valor del indicador y el año, y cargo ese valor en la variable venezuela_max_empleo


venezuela_max_empleo #muestro el porcentaje de empleo no agricola maximo y el año que cargue en esa variable

# Observación: el lunes 12 de mayo les comentaré algo sobre la función pull usando dos 
# columnas y cómo se comporta