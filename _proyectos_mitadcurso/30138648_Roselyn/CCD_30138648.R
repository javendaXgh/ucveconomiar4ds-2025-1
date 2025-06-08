"Hello World"

#title: "Análisis de Tasas de Asesinatos en Áreas Metropolitanas de EE. UU"
#author: "Lara Roselyn"

## Introducción
#Este reporte es un análisis estadístico y exploratorio sobre el conjunto
#de datos ***"Murders"***, disponible en el paquete *openintro*. 

## 1. Importación de datos:
#Cargamos las librerías necesarías para el análisis.

library(tidyverse)
library(dplyr)
library(ggplot2)
library(openintro)
library(gt)
library(DT)

data("murders")

datos_asesinatos_US <- murders

#Renombramos la varible "annual_murders_per_mil"

datos_asesinatos_US <- datos_asesinatos_US %>%
  rename(tasa_asesinatos =
           `annual_murders_per_mil`)

### 1.1. Mostramos las primeras filas
datos_asesinatos_US%>%
  sample_n(10)

### 1.2. Tabla Interactiva

datatable(datos_asesinatos_US)

## 2. Valores Estadísticos y Tablas Resúmenes

summary(datos_asesinatos_US)  # Resumen estadístico:

## 3. Análisis Exploratorio de Datos (EDA) y Respuestas a Preguntas:
# 3.1. ¿Cuál es la distribución de las tasas de homicidios por millón de personas?

# Histograma de la tasa de asesinatos

datos_asesinatos_US %>%
  ggplot(aes(x = tasa_asesinatos)) +
  geom_histogram(binwidth = 5, fill = "pink", color = "black") +
  labs(title = "Distribución de la Tasa de Asesinatos",
       x = "Asesinatos por Millón",
       y = "Frecuencia") +
  theme_minimal()

# Boxplot de la tasa de asesinatos para identificar atípicos

datos_asesinatos_US %>%
  ggplot(aes(y = tasa_asesinatos)) +
  geom_boxplot(fill = "blue", color = "pink") +
  labs(title = "Distribución de la Tasa de Asesinatos (Boxplot)",
       y = "Asesinatos por Millón") +
  theme_minimal()

## Las lineas de tendencia fueron sugeridas por Gemini para mejorar el grafico.
# Diagrama de dispersión: Pobreza vs. Tasa de Asesinatos

datos_asesinatos_US %>%
  ggplot(aes(x = perc_pov, y = tasa_asesinatos)) +
  geom_point(alpha = 0.5, color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Pobreza vs. Tasa de Asesinatos",
       x = "Porcentaje en Pobreza",
       y = "Asesinatos por Millón") +
  theme_minimal()

# Coeficiente de correlación (Sugerido por Gemini AI para mejorar el análisis)

cor_pov_homicidios <- cor(datos_asesinatos_US$perc_pov,
                          datos_asesinatos_US$tasa_asesinatos)

cat("Coeficiente de correlación entre pobreza y tasa de asesinatos: ",
    round(cor_pov_homicidios, 2), "\n")

# Diagrama de dispersión: Desempleo vs. Tasa de Asesinatos
datos_asesinatos_US %>%
  ggplot(aes(x = perc_unemp, y = tasa_asesinatos)) +
  geom_point(alpha = 0.5, color = "darkgreen") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Desempleo vs. Tasa de Asesinatos", 
       x = "Porcentaje de Desempleo", 
       y = "Asesinatos por Millón") +
  theme_minimal()

# Coeficiente de correlación (Sugerido por Gemini AI)
cor_unemp_homicidios <- cor(datos_asesinatos_US$perc_unemp,
                            datos_asesinatos_US$tasa_asesinatos)

cat("Coeficiente de correlación entre desempleo y tasa de asesinatos: ",
    round(cor_unemp_homicidios, 2), "\n")


### 3.4 ¿Existe una relación entre el porcentaje de 
#la población en pobreza y la tasa de desempleo?

# Diagrama de dispersión de Pobreza vs. Desempleo.

datos_asesinatos_US %>%
  ggplot(aes(x = perc_pov, y = perc_unemp)) +
  geom_point(alpha = 0.5, color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Pobreza vs. Desempleo",
       x = "Porcentaje en Pobreza",
       y = "Porcentaje de Desempleo") +
  theme_minimal()

# Coeficiente de correlación (Sugerido por Gemini AI)

cor_pov_unemp <- cor(datos_asesinatos_US$perc_pov,
                     datos_asesinatos_US$perc_unemp)

cat("Coeficiente de correlación entre pobreza y desempleo: ",
    round(cor_pov_unemp, 2), "\n")

## 4. Aplicación de `mutates` (Derivación o Agregación de Datos)
### 4.1 Asesinatos absolutos.

df_asesinatos_absolutos <- datos_asesinatos_US %>%
  mutate(asesinatos_absolutos = (tasa_asesinatos / 1000000)
         * population) %>%
  select(population,
         tasa_asesinatos,
         asesinatos_absolutos)

head(df_asesinatos_absolutos, 10)

summary(df_asesinatos_absolutos) # Resumen estadístico:

### 4.2 Tasas altas y bajas de asesinato
# Calculamos el promedio de la tasa de asesinatos

asesinatos_promedio <- mean(datos_asesinatos_US$tasa_asesinatos)
asesinatos_promedio

datos_asesinatos_categorizados <- datos_asesinatos_US %>%
  mutate(nivel_tasa_asesinatos = ifelse(tasa_asesinatos >= asesinatos_promedio,
                                        "tasa_alta_asesinatos",
                                        "tasa_baja_asesinatos"))

datatable(datos_asesinatos_categorizados)

### 4.3. Categorias según la población.

cuartiles_poblacion <- quantile(datos_asesinatos_US$population)
cuartiles_poblacion

# Fijar variables
primer_cuartil_pop <- cuartiles_poblacion[2]
tercer_cuartil_pop <- cuartiles_poblacion[4]

datos_asesinatos_categorizados <- datos_asesinatos_categorizados %>%
  arrange(desc(population)) %>%
  mutate(tamano_ciudad = ifelse(population <= primer_cuartil_pop,
                                "poblacion_pequena",
                                ifelse(population >= tercer_cuartil_pop,
                                       'poblacion_grande',
                                       'poblacion_mediana')))

datatable(datos_asesinatos_categorizados)

## 5. Limitaciones Respecto a la base de datos:

#Una limitación clave de esta base de datos es la ausencia de variables
#como el año o la ciudad específica. 