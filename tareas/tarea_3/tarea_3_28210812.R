#tarea 3
install.packages('WDI')
library (WDI)
library(dplyr)


#Paso 1: Descarga de datos
#Ahorro bruto (% del PIB)
df_ab_PIB <- WDI (country = 'all', indicator = 'NY.GNS.ICTR.ZS', start = 1960,
                  end = 2023, extra = FALSE, cache = NULL, latest = NULL,
                  language = 'en'
                  )
df_ab_PIB
View(df_ab_PIB)

#Paso 2: Tabla resumen Inicial
summary(df_ab_PIB)


#Paso 3: Filtrado por MERCOSUR
#Paises miembros: ARG, BRA, PAR, URU, VEN(suspendido)

paises_MERCOSUR <- c('AR', 'BR', 'PY', 'UY', 'VE') #ISO2c

df_ab_MERCOSUR <- WDI (country = paises_MERCOSUR, indicator = 'NY.GNS.ICTR.ZS',
                       start = 1960, end = 2023, extra = FALSE, cache = NULL,
                       latest = NULL, language = 'en'
                       )
df_ab_MERCOSUR

#Paso 4: Tabla Resumen MERCOSUR
summary(df_ab_MERCOSUR)
summary(df_ab_MERCOSUR$NY.GNS.ICTR.ZS)

#Paso 5: Ordenamiento del DF de MERCORSUR
df_ab_MERCOSUR_ordenado <- df_ab_MERCOSUR %>%
  arrange(NY.GNS.ICTR.ZS) #de forma ascendente
df_ab_MERCOSUR_ordenado

#Paso 6: a) Valores extremos

valor_maximo <- max(df_ab_MERCOSUR$NY.GNS.ICTR.ZS, na.rm = TRUE)
valor_maximo
valor_minimo <- min(df_ab_MERCOSUR$NY.GNS.ICTR.ZS, na.rm = TRUE)
valor_minimo

# b) extraer el nombre del pais al que le corresponden estos valores

pais_alto <- df_ab_MERCOSUR %>%
              filter(NY.GNS.ICTR.ZS == valor_maximo)
pais_alto
pais_bajo <- df_ab_MERCOSUR %>%
              filter(NY.GNS.ICTR.ZS == valor_minimo)
pais_bajo

#Paso 8: Filtrado para Venezuela: repetir pasos 3, 4, 5, 6 y 7

#aplico filtrado como usted indica en el video de ayuda para esta tarea

pais_Venezuela <- c('VE') #ISO2c
df_ab_venezuela <- df_ab_MERCOSUR %>% 
  filter(iso2c %in% pais_Venezuela)
df_ab_venezuela

summary(df_ab_venezuela) #tabla resumen

df_ab_venezuela_ordenado <- df_ab_venezuela %>%
  arrange(NY.GNS.ICTR.ZS) #ordenar de forma ascendente
df_ab_venezuela_ordenado

#Como para el DF del MERCOSUR los valores minimos y maximos del ahorro bruto
#son los de venezuela, no necesito encontrarlos, pero de hacerlo...

valor_maximo_VE <- max(df_ab_venezuela$NY.GNS.ICTR.ZS, na.rm = TRUE)
valor_maximo_VE
valor_minimo_VE <- min(df_ab_venezuela$NY.GNS.ICTR.ZS, na.rm = TRUE)
valor_minimo_VE
#ya sabemos el nombre del pais por lo que no hay que extraerlo

#Paso 9: Crear DataFrame combinada
df_ab_combinada <- bind_rows(df_ab_MERCOSUR,
                             df_ab_venezuela)
df_ab_combinada
View (df_ab_combinada) #verifico y tengo datos duplicados
