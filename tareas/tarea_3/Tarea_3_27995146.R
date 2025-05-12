################################################################################
############################### Inciso 1 #######################################
################################################################################
library(WDI) # Cargar la librería WDI para acceder a datos del Banco Mundial
df_total_reserves <- WDI(indicator = "FI.RES.TOTL.CD",
                         country = "all",
                         start = 1960, end = 2017,
                         extra = FALSE, cache = NULL)

################################################################################
############################### Inciso 2 #######################################
################################################################################

library(dplyr) # Cargar la librería dplyr para manipulación de datos
summary_table <- df_total_reserves %>%
  summarise(
    Minimo = min(FI.RES.TOTL.CD, na.rm = TRUE),
    Maximo = max(FI.RES.TOTL.CD, na.rm = TRUE),
    Media = mean(FI.RES.TOTL.CD, na.rm = TRUE),
    Mediana = median(FI.RES.TOTL.CD, na.rm = TRUE),
    Desviacion = sd(FI.RES.TOTL.CD, na.rm = TRUE),
    Total_Observaciones = n()
  )

print(summary_table)

# Observación: esto no es lo solicitado ni se corresponde con el material revisado 
# en clase

# Pregunta: ¿obtuvo ayuda con alguna IA generativa para realizar este código?

################################################################################
############################### Inciso 3 #######################################
################################################################################

# Crear un nuevo data frame con los países del Mercosur
mercosur_countries <- c("Argentina", "Brazil", "Paraguay", "Uruguay", "Bolivia")

df_mercosur <- df_total_reserves %>%
  filter(country %in% mercosur_countries)

print(df_mercosur)

# Observación: el uso de la función print es inncesario 

################################################################################
############################### Inciso 4 #######################################
################################################################################

summary_table_mercosur <- df_mercosur %>%
  summarise(
    Minimo = min(FI.RES.TOTL.CD, na.rm = TRUE),
    Maximo = max(FI.RES.TOTL.CD, na.rm = TRUE),
    Media = mean(FI.RES.TOTL.CD, na.rm = TRUE),
    Mediana = median(FI.RES.TOTL.CD, na.rm = TRUE),
    Desviacion = sd(FI.RES.TOTL.CD, na.rm = TRUE),
    Total_Observaciones = n()
  )

print(summary_table_mercosur)

# Observación: idem. a la anterior
################################################################################
############################### Inciso 5 #######################################
################################################################################

# Ordenar el data frame del Mercosur en orden descendente
df_mercosur_ordenado <- df_mercosur %>%
  arrange(desc(FI.RES.TOTL.CD))

print(df_mercosur_ordenado)

################################################################################
############################### Inciso 6 #######################################
################################################################################

# Obtener el país con el valor mínimo de FI.RES.TOTL.CD
min_country <- df_mercosur %>%
  filter(FI.RES.TOTL.CD == min(FI.RES.TOTL.CD, na.rm = TRUE))

# Obtener el país con el valor máximo de FI.RES.TOTL.CD
max_country <- df_mercosur %>%
  filter(FI.RES.TOTL.CD == max(FI.RES.TOTL.CD, na.rm = TRUE))

print(paste("País con el valor mínimo:",
            min_country$country, "Valor:",
            min_country$FI.RES.TOTL.CD))

print(paste("País con el valor máximo:",
            max_country$country, "Valor:",
            max_country$FI.RES.TOTL.CD))

################################################################################
############################### Inciso 7 #######################################
################################################################################

# Obtener el país con el valor mínimo
min_country <- df_mercosur %>%
  filter(FI.RES.TOTL.CD == min(FI.RES.TOTL.CD, na.rm = TRUE))

# Obtener el país con el valor máximo
max_country <- df_mercosur %>%
  filter(FI.RES.TOTL.CD == max(FI.RES.TOTL.CD, na.rm = TRUE))

# Asignar los valores mínimo y máximo a variables separadas
pais_minimo <- min_country$country
valor_minimo <- min_country$FI.RES.TOTL.CD

pais_maximo <- max_country$country
valor_maximo <- max_country$FI.RES.TOTL.CD

print(paste("País con el valor mínimo:",
            pais_minimo, "Valor:",
            valor_minimo))

print(paste("País con el valor máximo:",
            pais_maximo, "Valor:",
            valor_maximo))

################################################################################
############################### Inciso 8 #######################################
################################################################################

############################### Inciso 3 (Venezuela) ###########################

# Crear un nuevo data frame con los datos de Venezuela
df_venezuela <- df_total_reserves %>%
  filter(country == "Venezuela, RB")

print(df_venezuela)

############################### Inciso 4 (Venezuela) ###########################

# Generar una tabla resumen para Venezuela
summary_table_venezuela <- df_venezuela %>%
  summarise(
    Minimo = min(FI.RES.TOTL.CD, na.rm = TRUE),
    Maximo = max(FI.RES.TOTL.CD, na.rm = TRUE),
    Media = mean(FI.RES.TOTL.CD, na.rm = TRUE),
    Mediana = median(FI.RES.TOTL.CD, na.rm = TRUE),
    Desviacion = sd(FI.RES.TOTL.CD, na.rm = TRUE),
    Total_Observaciones = n()
  )

print(summary_table_venezuela)

############################### Inciso 5 (Venezuela) ###########################

# Ordenar el data frame de Venezuela en orden descendente
df_venezuela_ordenado <- df_venezuela %>%
  arrange(desc(FI.RES.TOTL.CD))

print(df_venezuela_ordenado)

############################### Inciso 6 (Venezuela) ###########################

# Obtener el valor mínimo de FI.RES.TOTL.CD para Venezuela
min_country_venezuela <- df_venezuela %>%
  filter(FI.RES.TOTL.CD == min(FI.RES.TOTL.CD, na.rm = TRUE))

# Obtener el valor máximo de FI.RES.TOTL.CD para Venezuela
max_country_venezuela <- df_venezuela %>%
  filter(FI.RES.TOTL.CD == max(FI.RES.TOTL.CD, na.rm = TRUE))

print(paste("País con el valor mínimo:",
            min_country_venezuela$country, "Valor:",
            min_country_venezuela$FI.RES.TOTL.CD))

print(paste("País con el valor máximo:",
            max_country_venezuela$country, "Valor:",
            max_country_venezuela$FI.RES.TOTL.CD))

############################### Inciso 7 (Venezuela) ###########################

# Asignar los valores mínimo y máximo a variables separadas para Venezuela
pais_minimo_venezuela <- min_country_venezuela$country
valor_minimo_venezuela <- min_country_venezuela$FI.RES.TOTL.CD

pais_maximo_venezuela <- max_country_venezuela$country
valor_maximo_venezuela <- max_country_venezuela$FI.RES.TOTL.CD

print(paste("País con el valor mínimo:",
            pais_minimo_venezuela, "Valor:",
            valor_minimo_venezuela))

print(paste("País con el valor máximo:",
            pais_maximo_venezuela, "Valor:",
            valor_maximo_venezuela))