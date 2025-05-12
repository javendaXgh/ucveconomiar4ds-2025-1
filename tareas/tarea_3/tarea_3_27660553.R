# INSTALAR Y CARGAR PAQUETES

install.packages("WDI")
library(WDI)
library(dplyr)
library (tidyverse)


# 1. DESCARGAR DATOS

df_inflacion_deflac <- WDI(country='all', indicator='FP.CPI.TOTL.ZG', 
                           start ='2010', end ='2020', extra= FALSE,cache= NULL, 
                           latest = NULL, language = 'en')

# 2. TABLA RESUMEN INICIAL

summary(df_inflacion_deflac)

# 3.FILTRADO DE MERCOSUR

mercosur <- c('ARG', 'VEN', 'PRY', 'BRA', 'URY')

df_inflacion_deflac_merco <- WDI(country= mercosur , indicator='FP.CPI.TOTL.ZG', 
                           start = 2010, end = 2020, extra= FALSE,cache= NULL,
                           latest = NULL, language = 'en')

# 4.TABLA RESUMEN MERCOSUR

summary(df_inflacion_deflac_merco)

# 5. ORDENAR

df_inflacion_deflac_merco %>% 
  arrange(FP.CPI.TOTL.ZG)

# 6.IDENTIFICACION DE VALORES EXTREMOS

max_merco <- max(df_inflacion_deflac_merco$FP.CPI.TOTL.ZG , na.rm = TRUE) #Valor Maximo

min_merco <- min(df_inflacion_deflac_merco$FP.CPI.TOTL.ZG, na.rm = TRUE)#Valor Mininimo

# 7.CREAR VARIABLES DE RESULTADO

pais_menor_infla <- df_inflacion_deflac_merco %>%
  filter (FP.CPI.TOTL.ZG== min_merco) %>%
  pull(country)

pais_mayor_infla <- df_inflacion_deflac_merco %>%
  filter (FP.CPI.TOTL.ZG==max_merco) %>%
  pull(country)


# 8.CASO VENEZUELA

          #FILTRADO DE VENEZUELA

df_inflacion_deflac_vzla <- WDI(country= 'VEN' , indicator='FP.CPI.TOTL.ZG', 
                                 start = 1960, end = 2020, extra= FALSE,cache= NULL,
                                 latest = NULL, language = 'en')

          # TABLA RESUMEN VENEZUELA

summary(df_inflacion_deflac_vzla)

          #ORDENAR

df_inflacion_deflac_vzla %>% 
  arrange(FP.CPI.TOTL.ZG)

          #IDENTIFICACION DE VALORES EXTREMOS

max_vzla <- max(df_inflacion_deflac_vzla$FP.CPI.TOTL.ZG, na.rm = TRUE) #Valor Maximo

min_vzla <- min(df_inflacion_deflac_vzla$FP.CPI.TOTL.ZG, na.rm = TRUE) #Valor Mininimo

          #CREAR VARIABLES DE RESULTADO

fecha_menor_infla <- df_inflacion_deflac_merco %>%
  filter (FP.CPI.TOTL.ZG==min_vzla) %>%
  pull(year)

fecha_mayor_infla <- df_inflacion_deflac_merco %>%
  filter (FP.CPI.TOTL.ZG==max_vzla) %>%
  pull(year)

# 9.DATA FRAME COMBINADO

df_combinado <- rbind(df_inflacion_deflac_merco, df_inflacion_deflac_vzla) #lo busque en perplexity ya que no me acordaba como lo hicimos en clase 
