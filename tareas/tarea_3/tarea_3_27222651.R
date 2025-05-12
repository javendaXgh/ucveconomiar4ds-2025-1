#Instalo de nuevo el paquete dplyr porque durante la clase el uso de algunos caracteres me indicaba error

install.packages("dplyr")
library(dplyr)

##############################################################################3

#Pregunta 1. Descargamos los datos

#Paso 1.1. Instalamos paquete WDI
#install.packages("WDI")
library(WDI)

#Paso 2.1. Asignacion y conjunto de datos Inflacion precios consumidor
df_inflacion_precios_consumidor = WDI(country = "all",
                                      indicator = "FP.CPI.TOTL.ZG",
                                      start = 1960,
                                      end = 2024,
                                      extra = FALSE,
                                      cache = NULL,
                                      latest = NULL,
                                      language = "en")
                                  

#recordemos que `<-` y `=` sirven para asignar valores a variables

#######################################################################

#Pregunta 2. Tabla Resumen estadistico descriptivo de la Inflacion precios consumidor
summary(df_inflacion_precios_consumidor)

#####################################################################

#Pregunta 3. Filtrado por MERCOSUR

#forma de hacerlo con %in%
df_MERCOSUR <- df_inflacion_precios_consumidor %>%
  filter(country %in% c("Argentina", "Brazil", "Paraguay", "Uruguay"))

View(df_MERCOSUR)
unique(df_MERCOSUR$country)
################################################################


#Pregunta 4. Tabla resumen de MERCOSUR

#Paso 4.1 con summary indicaremos nuestra nueva data frame de mercosur
summary(df_MERCOSUR)

###############################################################################

#Pregunta 5. Ordenamiento: Ordena el data frame del Mercosur según los valores de la variable seleccionada.

#Paso 5.1. Ordenaremos de forma ascedente
Mercosur_inflacion_ascendente <- df_MERCOSUR %>%
  arrange(FP.CPI.TOTL.ZG)

head(Mercosur_inflacion_ascendente) #muestra las primeras filas del data frame ordenado de forma ascendente

#Paso 5.2. Ordenaremos de forma descendente
Mercosur_inflacion_descendente <- df_MERCOSUR %>%
  arrange(desc(FP.CPI.TOTL.ZG))

head(Mercosur_inflacion_descendente) #muestra las primeras filas del data frame ordenado de forma descendente

#Paso 5.3. Ordenaremos de forma multiple y descendente por periodo e inflacion
Mercosur_ordenado_multiple <- df_MERCOSUR %>%
  arrange(year, desc(FP.CPI.TOTL.ZG))

head(Mercosur_ordenado_multiple)
#Este ultimo lo hice para practicar las metodologias vistas en clases

##############################################################

#Pregunta 6. Identificación de Valores Extremos: Obtén los valores mínimo y máximo de la variable en el data frame del Mercosur y extrae el nombre del país correspondiente a cada uno de estos valores.

#valor minimo
min(df_MERCOSUR$FP.CPI.TOTL.ZG, na.rm = TRUE)

#extraemos el nombre del pais con el valor minimo
Pais_menor_InflacionPC <- df_MERCOSUR %>%
  filter(FP.CPI.TOTL.ZG == min(FP.CPI.TOTL.ZG, na.rm = TRUE)) %>%
  pull (country)

Pais_menor_InflacionPC

#valor maximo
max(df_MERCOSUR$FP.CPI.TOTL.ZG, na.rm = TRUE)

#extraemos el nombre del pais con el valor minimo
Pais_mayor_inflacionPC <- df_MERCOSUR %>%
  filter(FP.CPI.TOTL.ZG == max(FP.CPI.TOTL.ZG, na.rm = TRUE)) %>%
  pull(country)

Pais_mayor_inflacionPC

######################################################################

#Pregunta 7. Crear Variables de Resultados: Asigna los valores mínimo y máximo obtenidos (junto con el nombre del país) a variables separadas.

#para el valor minimo

df_paraguay <- df_MERCOSUR %>%
  filter(FP.CPI.TOTL.ZG == min(FP.CPI.TOTL.ZG, na.rm = TRUE))

head(df_paraguay)

#para el valor maximo

df_brazil <- df_MERCOSUR %>%
  filter(FP.CPI.TOTL.ZG == max(FP.CPI.TOTL.ZG, na.rm = TRUE))

head(df_brazil)

######################################################################
#Pregunta 8. Filtrado para Venezuela: repite los pasos 3, 4 ,5 ,6 y 7 para Venezuela.

#Pregunta 3 Venezuela
df_Venezuela <- df_inflacion_precios_consumidor %>%
  filter(country == "Venezuela, RB")

#Pregunta 4 Venezuela
summary(df_Venezuela)

#Pregunta 5 Venezuela
#Paso 5.1. Ordenaremos de forma ascedente
Venezuela_inflacion_ascendente <- df_Venezuela %>%
  arrange(FP.CPI.TOTL.ZG)

head(Venezuela_inflacion_ascendente) #muestra las primeras filas del data frame ordenado de forma ascendente

#Paso 5.2. Ordenaremos de forma descendente
Venezuela_inflacion_descendente <- df_Venezuela %>%
  arrange(desc(FP.CPI.TOTL.ZG))

head(Venezuela_inflacion_descendente) #muestra las primeras filas del data frame ordenado de forma descendente

#Paso 5.3. Ordenaremos de forma multiple y descendente por periodo e inflacion
Venezuela_ordenado_multiple <- df_Venezuela %>%
  arrange(year, desc(FP.CPI.TOTL.ZG))

head(Venezuela_ordenado_multiple)

#Pregunta 6
min(df_Venezuela$FP.CPI.TOTL.ZG, na.rm = TRUE)
max(df_Venezuela$FP.CPI.TOTL.ZG, na.rm = TRUE)

#Pregunta 7 Venezuela
Venezuela_menor_InflacionPC <- df_Venezuela %>%
  filter(FP.CPI.TOTL.ZG == min(FP.CPI.TOTL.ZG, na.rm = TRUE))

#Visualizamos el valor
Venezuela_menor_InflacionPC

#ahora hacemos lo mismo con el valor maximo
Venezuela_mayor_inflacionPC <- df_Venezuela %>%
  filter(FP.CPI.TOTL.ZG == max(FP.CPI.TOTL.ZG, na.rm = TRUE))

Venezuela_mayor_inflacionPC

##############################################################

#Pregunta 9. Crear Data Frame Combinada: crear una nueva df combinando los valores de Mercosur y Venezuela.

df_valores_combinados <- bind_rows(df_MERCOSUR, df_Venezuela)
                                

head(df_valores_combinados)

#utilizamos la funcion bind_rows tal como se aprendimos en clases
#De esta manera culminamos el ejericicio.

