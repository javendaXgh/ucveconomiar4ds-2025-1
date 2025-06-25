#--------------------------------------------------------------------------- 
# Ciencia de Datos con Programacion en R 
# Prof. Jose Avendaño
# Tarea 03
# CI: 29.521.323 
#---------------------------------------------------------------------------

#Antes de comenzar limpiare el enviroment

rm(list = ls())  # Limpiar todo

#---------------------------------------------------------------------------

# Parte 1: Cargar las librerías necesarias

library(WDI) # Para acceder a los datos del Banco Mundial
library(dplyr) # Para manipulación de datos

#---------------------------------------------------------------------------

# Parte 2: Seleccion de un indicador

# Para mi tarea seleccione de la DATA data del Banco Mundial el indicador de
# Rentas Petroleras (% del PIB) cuyo ID = NY.GDP.PETR.RT.ZS

#---------------------------------------------------------------------------

# Parte 3: Implementación en R

# Paso 1:Descarga de Datos: Descarga los datos correspondientes al indicador 
# seleccionado utilizando las funciones mencionadas en el artículo. 
# Asigna los datos descargados a una variable con un nombre descriptivo

# Cargamos el indicador global

df_renta_petro <- WDI(indicator = "NY.GDP.PETR.RT.ZS")


#Paso 2 Tabla Resumen Inicial:
# Genera una tabla resumen (estadísticas descriptivas básicas) para la
#variable de interés en el conjunto de datos

summary(df_renta_petro) # Vemos algunas estadísticas descriptivas básicas 
resumen_global <- summary(df_renta_petro$NY.GDP.PETR.RT.ZS) 

# De esta forma vemos solamente la tabla resumen de la variable de interes


#Paso 3 Filtrado por Mercosur: 
#Crea un nuevo data frame que contenga únicamente
#los datos de los países miembros del Mercosur


iso2_paises_mercosur <- c("AR",
                          "BR",
                          "BO",
                          "PY",
                          "UY")

df_mercosur <- df_renta_petro %>% 
  filter(iso2c %in% iso2_paises_mercosur)


# Paso 4 Tabla Resumen para Mercosur: Genera una tabla resumen para la
# misma variable de interés, pero esta vez solo para el subconjunto de datos
# de los países del Mercosur.

resumen_mercosur <- summary(df_mercosur$NY.GDP.PETR.RT.ZS) # Genera la tabla resumen de mercosur


# Paso 5 Ordenamiento: Ordena el data frame del Mercosur 
# según los valores de la variable seleccionada.

# Orden ascendente
df_mercosur_ordenado <- df_mercosur %>% 
  arrange(NY.GDP.PETR.RT.ZS)

# Paso 6 Identificación de Valores Extremos: 
# Obtén los valores mínimo y máximo de la variable en el data frame 
# del Mercosur y extrae el nombre del país correspondiente a cada uno de estos valores.

# Filtrar datos sin NA y obtener el país con valor MÍNIMO
pais_min_renta <- df_mercosur %>%
  filter(!is.na(NY.GDP.PETR.RT.ZS)) %>%  # Eliminar NA
  filter(NY.GDP.PETR.RT.ZS == min(NY.GDP.PETR.RT.ZS)) %>%  # Filtrar mínimo
  head(1) %>%  #Evitar repeticiones
  pull(country)  # Extraer el nombre del país

## Observación: recuérdame que luego hablemos de esto

# Filtrar datos sin NA y obtener el país con valor MÁXIMO
pais_max_renta <- df_mercosur %>%
  filter(!is.na(NY.GDP.PETR.RT.ZS)) %>%  # Eliminar NA
  filter(NY.GDP.PETR.RT.ZS == max(NY.GDP.PETR.RT.ZS)) %>%  # Filtrar máximo
  pull(country)  # Extraer el nombre del país

# Paso 7 Crear Variables de Resultados: Asigna los valores mínimo y máximo 
  #obtenidos (junto con el nombre del país) a variables separadas

df_min_renta <- df_mercosur %>% 
  filter(country == pais_min_renta)

df_max_renta <- df_mercosur %>% 
  filter(country == pais_max_renta)

#---------------------------------------------------------------------------

# Paso 8 Filtrado para Venezuela: repite los pasos 3, 4 ,5 ,6 y 7 para Venezuela

# Paso 3: 

df_venezuela <- df_renta_petro %>% 
  filter(iso2c == "VE")

# Paso 4: 

resumen_venezuela <- summary(df_venezuela$NY.GDP.PETR.RT.ZS)

# Paso 5: 

df_venezuela_ordenado <- df_venezuela %>% 
  arrange(NY.GDP.PETR.RT.ZS)

# Paso 6: 
# Minimo
min_venezuela <- df_venezuela %>%
  filter(!is.na(NY.GDP.PETR.RT.ZS)) %>% 
  filter(NY.GDP.PETR.RT.ZS == min(NY.GDP.PETR.RT.ZS))

# Maximo
max_venezuela <- df_venezuela %>%
  filter(!is.na(NY.GDP.PETR.RT.ZS)) %>% 
  filter(NY.GDP.PETR.RT.ZS == max(NY.GDP.PETR.RT.ZS))

# Paso 7: Aqui creo que podemos usar el las variables creadas en el paso 6, 
  #sin embargo, creare otra variable.

df_min_venezuela <- df_venezuela %>% 
  filter(year %in% min_venezuela)  

df_max_venezuela <- df_venezuela %>% 
  filter(year %in% max_venezuela)  

#---------------------------------------------------------------------------
# Paso 9: Crear Data Frame Combinada: crear una nueva df combinando 
  #los valores de Mercosur y Venezuela.

df_combinada <- bind_rows(df_venezuela,df_mercosur) #Creamos el DF



#---------------------------------------------------------------------

# Este Script fue realizado con funciones vistas en clases, 
  # pero use como herramienta al LM DeepSeek para orientacion.
