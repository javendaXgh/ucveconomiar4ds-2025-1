library(ggplot2)
source("constants.r")
suppressPackageStartupMessages(library(dplyr))

#### Pais objetivo: Islandia 1970 - 2024

# ===========================
# 1. Importar y Preparar Datos
# ===========================

##### DATOS EXTRAIDOS DEL WDI
# Importar el CSV y usarlo como fuente de datos
data_all <- read.csv("../datos/datos_islandia_2000_2025.csv")
data_all <- filter(data_all, year >= 2000 & year <= 2024)

# Asignar variables desde el data frame importado
population_total <- data_all$population_total
population_growth_percent <- data_all$population_growth_percent
life_expectancy <- data_all$life_expectancy
years <- data_all$year

# ===========================
# 2. Valores Estadísticos y Tablas Resúmenes
# ===========================

# Calcular estadísticas descriptivas para cada variable
stats_population <- summary(population_total)
stats_growth <- summary(population_growth_percent)
stats_life <- summary(life_expectancy)

# Calcular desviación estándar y varianza
sd_population <- sd(population_total, na.rm = TRUE)
var_population <- var(population_total, na.rm = TRUE)
sd_growth <- sd(population_growth_percent, na.rm = TRUE)
var_growth <- var(population_growth_percent, na.rm = TRUE)
sd_life <- sd(life_expectancy, na.rm = TRUE)
var_life <- var(life_expectancy, na.rm = TRUE)

# Crear tabla resumen
tabla_resumen <- data.frame(
  Variable = c(row_name_pt, row_name_gpt, row_name_le),
  Media = c(mean(population_total, na.rm = TRUE),
            mean(population_growth_percent, na.rm = TRUE),
            mean(life_expectancy, na.rm = TRUE)),
  Mediana = c(median(population_total, na.rm = TRUE),
              median(population_growth_percent, na.rm = TRUE),
              median(life_expectancy, na.rm = TRUE)),
  Min = c(min(population_total, na.rm = TRUE),
          min(population_growth_percent, na.rm = TRUE),
          min(life_expectancy, na.rm = TRUE)),
  Max = c(max(population_total, na.rm = TRUE),
          max(population_growth_percent, na.rm = TRUE),
          max(life_expectancy, na.rm = TRUE)),
  Desv_Estandar = c(sd_population, sd_growth, sd_life),
  Varianza = c(var_population, var_growth, var_life)
)

# ===========================
# 3. Análisis Exploratorio de los Datos (EDA)
# ===========================

# Histograma de la Población Total
hist_poblacion <- ggplot(data_all, aes(x = year, y = population_total)) +
  geom_line(color = "blue") +
  geom_point(color = "blue") +
  labs(title = "Evolución de la Población Total en Islandia",
       x = "Año", y = row_name_pt)

# Histograma del Crecimiento Poblacional (%)
hist_crecimiento <- ggplot(data_all, aes(x = population_growth_percent)) +
  geom_histogram(bins = 10, fill = "lightgreen", color = "darkgreen") +
  labs(title = "Distribución del Crecimiento Poblacional en Islandia",
       x = row_name_gpt, y = "Frecuencia")

# Gráfico de líneas de Esperanza de Vida a lo largo del tiempo
line_esperanza <- ggplot(data_all, aes(x = year, y = life_expectancy)) +
  geom_line(color = "orange") +
  geom_point(color = "tomato") +
  labs(title = "Evolución de la Esperanza de Vida en Islandia",
       x = "Año", y = "Esperanza de Vida (años)")

# Diagrama de dispersión: Población Total vs Esperanza de Vida
scatter_poblacion_vida <- ggplot(data_all, aes(x = population_total, y = life_expectancy)) +
  geom_point(color = "purple") +
  labs(title = "Población Total vs Esperanza de Vida",
       x = row_name_pt, y = row_name_le)

# Diagrama de dispersión: Crecimiento Poblacional (%) vs Esperanza de Vida
scatter_crecimiento_vida <- ggplot(data_all, aes(x = population_growth_percent, y = life_expectancy)) +
  geom_point(color = "orange") +
  labs(title = "Crecimiento Poblacional (%) vs Esperanza de Vida",
       x = row_name_gpt, y = row_name_le)
