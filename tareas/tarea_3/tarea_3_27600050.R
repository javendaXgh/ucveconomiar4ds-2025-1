#Tarea 3 - C.I: 27600050

library(tidyverse)
library(dplyr)            #Se cargan las librerias dplyr, WDI y Tidyverse
library(WDI)


###########
#Se utilizaron los codigos del articulo A Dive into Economic Data Using World Bank Databases in R, de Dima Diachkov
#junto a los codigos vistos en clases para la realizacion de la tarea.


# 1. Se selecciono el indicador de Migracion neta del Banco Mundial, con la etiqueta: "SM.POP.NETM"
#creamos la variable para el dataframe df_migracion_neta, y se utiliza el codigo del articulo,
# A Dive into Economic Data Using World Bank Databases in R, de Dima Diachkov
df_migracion_neta <- WDI(
  country = "all",
  indicator = "SM.POP.NETM",
  start = 2010,
  end = 2024,
  extra = FALSE,
  cache = NULL,
  latest = NULL,
  language = "en"
  
)
#para visualizar la data descargada, se utilizó la funcion view
view(df_migracion_neta)

#2. Para la tabla resumen con las estadisitcas descriptivas se utilizo la funcion summary, con na.rm = TRUE para omitir los 
#valores ausentes en la dataframe
summary(df_migracion_neta, na.rm = TRUE)

#3.Para el filtrado de paises del Mercosur, se crea la variable paises_del_mercosur, que contiene un vector
# con los codigos ISO de los paises que lo componen, Argentina, Venezuela, Uruguay, Brasil, Bolivia y Paraguay:
#siguiendo 
paises_del_mercosur <- c("AR", "VEN", "UY", "BR", "BOL", "PY")
#Posterior a eso se realiza el dataframe df_migracion_neta_pais_mercosur 
#para los paises del Mercosur, reemplazando en el apartado de country = all, por la variable paises_del_mercosur

df_migracion_neta_pais_mercosur <- WDI(
  country = paises_del_mercosur,
  indicator = "SM.POP.NETM",
  start = 2010,
  end = 2024,
  extra = FALSE,
  cache = NULL,
  latest = NULL,
  language = "en"
)

#para visualizar la data descargada para los paises del Mercosur:
view(df_migracion_neta_pais_mercosur)
#4.Tabla resumen del Mercosur, 
summary(df_migracion_neta_pais_mercosur, na.rm = TRUE)

#5.Ordenamiento descendente y ascendente; se crea el dataframe df_descendente_migracion_neta_pais_mercosur y df_ascendente_migracion_neta_mercosur 
# y la funcion arrange para ordenar los datos de la variable migracion neta en orden ascendente y descendente

#Orden descendente, se coloca un signo menos a la variable SM.POP.NETM, quedando -SM.POP.NETM

df_descendente_migracion_neta_pais_mercosur <- df_migracion_neta_pais_mercosur %>%
  arrange(-SM.POP.NETM , na.rm = TRUE)

head(df_descendente_migracion_neta_pais_mercosur)

#Orden ascendente

df_ascendente_migracion_neta_mercosur <- df_migracion_neta_pais_mercosur %>%
  arrange(SM.POP.NETM , na.rm = TRUE)

head(df_ascendente_migracion_neta_mercosur)

#6.Identificacion de valores extremos: se crea las variables para los paises con el mayor y menor numero de migracion neta
# y se utiliza la funcion filter, para filtrar estos valores maximos y minimos en el data frame

#pais con valor menor de migracion neta, 

pais_con_menor_migracion_neta_mercosur <- df_migracion_neta_pais_mercosur %>%
  filter(SM.POP.NETM == min(SM.POP.NETM , na.rm = TRUE )) %>%
  pull (SM.POP.NETM, country)

head(pais_con_menor_migracion_neta_mercosur)

#pais con valor mayor de migracion neta

pais_con_mayor_migracion_neta_mercosur <- df_migracion_neta_pais_mercosur %>%
  filter(SM.POP.NETM == max(SM.POP.NETM , na.rm = TRUE )) %>%
  pull (SM.POP.NETM, country)

head(pais_con_mayor_migracion_neta_mercosur)


#7.Variables de resultados: se crearon las variables para Argentina, pais con mayor migracion neta,
#y Venezuela que posee la menor migracion neta, y se filtraron con la funcion filter

#Pais con mayor migracion neta:

df_argentina <- df_migracion_neta_pais_mercosur %>%
  filter(country == pais_con_mayor_migracion_neta_mercosur)

head(df_argentina)

# Observación: acá hay un error a revisar. por favor, echale un ojo a ver qué creés que pasó
# lo otro que te debió llamar la atención es que la df no tiene ninguna fila

#Pais con menor migracion neta

df_venezuela <- df_migracion_neta_pais_mercosur %>%
  filter(country == pais_con_menor_migracion_neta_mercosur)

head(df_venezuela)


#Repeticion de los pasos para Venezuela:

#3.1. Filtrado de Venezuela
venezuela <- c('VEN')

df_venezuela_migracion_neta <- WDI(
  country = venezuela,
  indicator = "SM.POP.NETM",
  start = 2010,
  end = 2024,
  extra = FALSE,
  cache = NULL,
  latest = NULL,
  language = "en"
)
#Visualizar dataframe de migracion neta de Venezuela
view(df_venezuela_migracion_neta)
#4.1. Tabla resumen
summary(df_venezuela_migracion_neta)

#5.1. ordenamiento Venezuela

#Descendente
df_descendente_migracion_neta_venezuela <- df_venezuela_migracion_neta %>%
  arrange(-SM.POP.NETM , na.rm = TRUE)


head(df_descendente_migracion_neta_venezuela)

#ascendente
df_ascendente_migracion_neta_venezuela <- df_venezuela_migracion_neta %>%
  arrange(SM.POP.NETM , na.rm = TRUE)

head(df_ascendente_migracion_neta_venezuela)

#6.1. Valores maximos y minimos
#menor migracion neta en Venezuela 
venezuela_menor_migracion_neta <- df_venezuela_migracion_neta %>%
  filter(SM.POP.NETM == min(SM.POP.NETM, na.rm = TRUE )) %>%
  pull (SM.POP.NETM, country)

head(venezuela_menor_migracion_neta)

#mayor migracion neta en Venezuela

venezuela_mayor_migracion_neta <- df_venezuela_migracion_neta %>%
  filter(SM.POP.NETM == max(SM.POP.NETM, na.rm = TRUE )) %>%
  pull (SM.POP.NETM, country)

head(venezuela_mayor_migracion_neta)



#9. Data frame combinada: se crea la nueva dataframe combinando los valores de Mercosur y Venezuela utilizando
#la funcion bind_rows

df_mercosur_venezuela <- bind_rows(df_migracion_neta_pais_mercosur,df_venezuela_migracion_neta)

view(df_mercosur_venezuela)
head(df_mercosur_venezuela)






