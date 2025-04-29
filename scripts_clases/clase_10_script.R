##########################################################################################
#
# Script Clase 10 para análisis básico del conjunto de datos 'gapminder'
#
##########################################################################################

##########################################################################################
######## Carga de librerías necesarias                                             #######
##########################################################################################

# Carga la librería 'tidyverse', que incluye paquetes como dplyr para 
# manipulación de datos y ggplot2 para visualización.
library(tidyverse)

# Carga la librería 'gapminder', que contiene el dataset que vamos a analizar.
library(gapminder)

##########################################################################################
######## Inspección y exploración inicial del dataset                              #######
##########################################################################################

# Muestra el dataset 'gapminder' en una ventana del visor de RStudio para una 
# inspección visual.
View(gapminder)

# Obtiene los valores únicos de la columna 'year' del dataset 'gapminder'.
unique(gapminder$year)

# Proporciona un resumen estadístico del dataset 'gapminder', incluyendo la media, 
# mediana, mínimos, máximos y cuartiles de las variables numéricas.
summary(gapminder)

##########################################################################################
######## Identificación de país  con GDP per cápita extremo                       #######
##########################################################################################

# Utiliza el operador pipe ('%>%') para encadenar operaciones en el dataset 'gapminder'.
# 1. 'filter(gdpPercap == min(gdpPercap ))': Filtra las filas donde la columna 'gdpPercap'
# es igual al valor mínimo de esa columna.
# 2. 'pull (country)': Extrae la columna 'country' del resultado filtrado, 
# obteniendo el nombre del país con el menor GDP per cápita.

pais_menorGDP <- gapminder %>%
  filter(gdpPercap == min(gdpPercap )) %>%
  pull (country)

# Muestra en la consola el nombre del país con el menor GDP per cápita encontrado.
pais_menorGDP

# Filtra el dataset 'gapminder' para seleccionar todas las filas correspondientes al 
# país con el menor GDP per cápita.
df_congo <- gapminder %>%
  filter(country== pais_menorGDP )

# Verificar que fueron extraídos los datos con éxito 
head(df_congo)

# Repite el proceso para identificar el país con el mayor GDP per cápita.
pais_mayorGDP <- gapminder %>%
  filter(gdpPercap == max(gdpPercap )) %>%
  pull (country)

# Filtra el dataset 'gapminder' para seleccionar todas las filas correspondientes al 
# país con el mayor GDP per cápita.
df_kuwait <- gapminder %>%
  filter(country== pais_mayorGDP )

# Verificar que fueron extraídos los datos con éxito 
head(df_kuwait)
##########################################################################################
######## Filtrado de países africanos con alta esperanza de vida                   #######
##########################################################################################

# Filtra el dataset 'gapminder' para seleccionar países que cumplen dos condiciones:
# 1. 'lifeExp > mean(lifeExp)': La esperanza de vida ('lifeExp') es mayor que la media de 
# la esperanza de vida en todo el dataset.
# 2. 'continent == 'Africa'': El continente ('continent') es 'Africa'.
df_mayores_lifeExp <- gapminder%>%
  filter(lifeExp> mean(lifeExp),
         continent=='Africa')

##########################################################################################
######## Combinación de dataframes de países con GDP extremo                      #######
##########################################################################################

# Utiliza la función 'bind_rows' de la librería 'dplyr' para combinar las filas de las 
# dataframes 'df_congo' y 'df_kuwait' en un nuevo dataframe.

df_gdp_extremos <- bind_rows(df_congo,
                             df_kuwait)

##########################################################################################
######## Ejemplos de uso de la función `arrange` para ordenar datos                #######
##########################################################################################

# Ejemplo 1: Ordenar el dataframe 'gapminder' por año de forma ascendente.
# El resultado será un nuevo dataframe donde las filas están ordenadas desde el año más antiguo al más reciente.
gapminder_ordenado_anio_asc <- gapminder %>%
  arrange(year)

# Muestra las primeras filas del dataframe ordenado por año ascendente.
head(gapminder_ordenado_anio_asc)

# Ejemplo 2: Ordenar el dataframe 'gapminder' por esperanza de vida de forma descendente.
# Se utiliza la función 'desc()' dentro de 'arrange()' para indicar un orden descendente.
# El resultado será un nuevo dataframe donde las filas están ordenadas desde la mayor esperanza de vida a la menor.
gapminder_ordenado_vida_desc <- gapminder %>%
  arrange(desc(lifeExp))

# Muestra las primeras filas del dataframe ordenado por esperanza de vida descendente.
head(gapminder_ordenado_vida_desc)

# Ejemplo 3: Ordenar el dataframe 'gapminder' primero por continente de forma ascendente
# y luego, dentro de cada continente, por GDP per cápita de forma descendente.
gapminder_ordenado_multiple <- gapminder %>%
  arrange(continent, desc(gdpPercap))

# Muestra las primeras filas del dataframe ordenado por continente (ascendente) y GDP per cápita (descendente).
head(gapminder_ordenado_multiple)