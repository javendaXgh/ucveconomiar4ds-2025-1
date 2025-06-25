library(WDI)
library(ggplot2)
suppressPackageStartupMessages(library(dplyr))

# Paso 1: Descarga de Datos
# Indicador: PIB per cápita (ID: NY.GDP.PCAP.CD)
indicator <- "NY.GDP.PCAP.CD"
start_year <- 2000
end_year <- 2020
df_pib_percapita <- WDI(country = "all", indicator = indicator, start = start_year, end = end_year, extra = FALSE)
df_pib_percapita <- df_pib_percapita %>%
  rename(`GDP` = NY.GDP.PCAP.CD) %>%
  select(-iso3c)

# Observación: no hace falta el uso de ` `en el rename

# Observación: no cumplió con el punto 2 de la asignación que era buscar algún indicador de 
# interés

# Paso 2: Tabla Resumen Inicial
print("Tabla Resumen GDP mundial")
print(summary(df_pib_percapita))

# Paso 3: Filtrado por Mercosur
mercosur_countries <- c("AR", "BR", "PY", "UY", "BO") # Países del Mercosur
df_mercosur <- df_pib_percapita %>%
  filter(iso2c %in% mercosur_countries) %>%
  select(-iso2c)
frame_df_mercosur <- data.frame(df_mercosur)

# Paso 4: Tabla Resumen para Mercosur
print("Tabla Resumen para Mercosur")
print(summary(df_mercosur))

# Paso 5: Ordenamiento
df_mercosur_sorted <- df_mercosur %>% arrange(desc(GDP))

# Paso 6: Identificación de Valores Extremos
min_value <- min(df_mercosur$GDP, na.rm = TRUE)
max_value <- max(df_mercosur$GDP, na.rm = TRUE)

min_country <- df_mercosur %>%
  filter(GDP == min_value) %>%
  select(country)
max_country <- df_mercosur %>%
  filter(GDP == max_value) %>%
  select(country)

# Paso 7: Crear Variables de Resultados
min_result <- list(country = min_country$country, value = min_value)
max_result <- list(country = max_country$country, value = max_value)
# Observación: más simple era asignarlo a un vector, como hizo en min_country y ...,
# y no a una lista

# Paso 8: Filtrado para Venezuela
df_venezuela <- df_pib_percapita %>%
  filter(iso2c == "VE") %>%
  select(-iso2c)

# Tabla Resumen para Venezuela
print("Tabla resumen para Venezuela")
print(summary(df_venezuela))

# Ordenamiento para Venezuela
df_venezuela_sorted <- df_venezuela %>% arrange(desc(GDP))

# Identificación de Valores Extremos para Venezuela
min_value_ven <- min(df_venezuela$GDP, na.rm = TRUE)
max_value_ven <- max(df_venezuela$GDP, na.rm = TRUE)

# Crear Variables de Resultados para Venezuela
min_result_ven <- list(country = "Venezuela", value = min_value_ven)
max_result_ven <- list(country = "Venezuela", value = max_value_ven)

# Paso 9: Crear Data Frame Combinada
df_combined <- bind_rows(
  df_mercosur %>% mutate(BloqueEconomico = "Mercosur"),
  df_venezuela %>% mutate(BloqueEconomico = "Suspendido del Mercosur")
)
frame_df_combined <- data.frame(df_combined)
# Observación: la asignación de `frame_df_combined` es absolutamente inncesaria

View(frame_df_combined)

# Crear el gráfico
grafico <- ggplot(frame_df_combined, aes(x = year, y = GDP, color = country)) +
  geom_line() +
  labs(
    title = "Venezuela vs Mercosur",
    x = "Año",
    y = "PIB per capita",
    color = "Pais"
  ) +
  theme_minimal()

print(grafico)

# Imprimir resultados
print("Resultados Mercosur:")
print(min_result)
print(max_result)

print("Resultados Venezuela:")
print(min_result_ven)
print(max_result_ven)

## Ninguno de los pasos que van desde la línea 85 fueron solicitados. Se agradece seguir 
# las pautas indicadas para las tareas