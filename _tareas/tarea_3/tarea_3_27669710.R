# tarea 3
install.packages("WDI")
library(WDI)

#pregunta 1
df_pib_percapita = WDI(indicator="NY.GDP.PCAP.CD")
df_pib_percapita

## Observación: no seleccionó un indicador distinto al que se colocó de ejemplo
## Este requerimiento se encontraba en el punto 2
#pregunta 2
summary(df_pib_percapita)

# Observación: uso de nombre para la variable el mismo que se colocó de ejemplo
#pregunta 3
paises_mercosur <- c("AR","BR","PY","UY","VE","BO","CL","CO","EC","GY","PE","SR")

df_mercosur <- WDI(
  country = paises_mercosur,
  indicator = "NY.GDP.PCAP.CD",
  start = 1960,
  end = 2024,
  extra = FALSE,
  cache = NULL,
  latest = NULL,
  language = "en"
)
df_mercosur

#pregunta 4
summary(df_mercosur)

#pregunta 5
install.packages("dplyr")
library(dplyr)  
# Observación: no siguió la recomendación de no instalar nuevamente los paquetes

# Ordenar de menor a mayor (ascendente)
df_mercosur_ascendente <- df_mercosur %>% 
  arrange(NY.GDP.PCAP.CD)

# Ordenar de mayor a menor (descendente)
df_mercosur_descendente <- df_mercosur %>% 
  arrange(desc(NY.GDP.PCAP.CD))

df_mercosur_ascendente
df_mercosur_descendente

#pregunta 6

# Filtrar datos válidos (sin NA) y obtener el mínimo y máximo
df_extremos <- df_mercosur %>%
  filter(!is.na(NY.GDP.PCAP.CD)) %>%  # Eliminar NA si los hay
  summarise(
    min_pib = min(NY.GDP.PCAP.CD),
    max_pib = max(NY.GDP.PCAP.CD),
    pais_min = country[which.min(NY.GDP.PCAP.CD)],  # País con el mínimo
    pais_max = country[which.max(NY.GDP.PCAP.CD)]   # País con el máximo
  )
df_extremos

# Observación: no concuerda con lo solicitado en el punto 6
# Adicionalmente, usa funciones no vistas en el curso cuya utilidad no 
# está relacionada directamente al requerimiento. Igualmente, en caso de usar fuentes 
# externas a los materiales recomendados, se indicó que hay que incluir la fuente de los
# códigos usados u obtenidos, por ejemplo, con una IA generativa

#pregunta 7
pib_minimo <- df_extremos %>% pull(min_pib)
pais_pib_minimo <- df_extremos %>% pull(pais_min)

pib_minimo
pais_pib_minimo


pib_maximo <- df_extremos %>% pull(max_pib)
pais_pib_maximo <- df_extremos %>% pull(pais_max)

pib_maximo
pais_pib_maximo

#pregunta 8
library(WDI)
# Observación: este paquete ya fue cargado anteriormente en la línea 3 de su código


df_pib_percapita = WDI(indicator="NY.GDP.PCAP.CD")
pais_ve <- c("VE")

# paso tres repetición
df_venezuela <- WDI(
  country = (pais_ve),
  indicator = "NY.GDP.PCAP.CD",
  start = 1960,
  end = 2024,
  extra = FALSE,
  cache = NULL,
  latest = NULL,
  language = "en"
)
df_venezuela

# paso cuatro repetición
summary(df_venezuela)

# paso cinco repetición
install.packages("dplyr")
library(dplyr)  
# Observación: no siguió la recomendación de no instalar nuevamente los paquetes


# Ordenar de menor a mayor (ascendente)
df_venezuela_ascendente <- df_venezuela %>% 
  arrange(NY.GDP.PCAP.CD)

# Ordenar de mayor a menor (descendente)
df_venezuela_descendente <- df_venezuela %>% 
  arrange(desc(NY.GDP.PCAP.CD))

df_venezuela_ascendente
df_venezuela_descendente

# paso seis repetición

# Filtrar datos válidos (sin NA, eliminar si los hay) y obtener el mínimo y máximo
df_extremos1 <- df_venezuela %>%
  filter(!is.na(NY.GDP.PCAP.CD)) %>%
  summarise(
    min_pib = min(NY.GDP.PCAP.CD),
    max_pib = max(NY.GDP.PCAP.CD),
    pais_min = country[which.min(NY.GDP.PCAP.CD)],  # País con el mínimo
    pais_max = country[which.max(NY.GDP.PCAP.CD)]   # País con el máximo
  )
df_extremos1

# paso siete repetición
pib_minimo <- df_extremos1 %>% pull(min_pib)
pais_pib_minimo <- df_extremos1 %>% pull(pais_min)

pib_minimo
pais_pib_minimo


pib_maximo <- df_extremos1 %>% pull(max_pib)
pais_pib_maximo <- df_extremos1 %>% pull(pais_max)

pib_maximo
pais_pib_maximo

#pregunta 9

str(df_mercosur)
str(df_venezuela)

# Combinar los data frames usando bind_rows() de dplyr
df_combinado <- bind_rows(df_mercosur, df_venezuela)

# Verificar la estructura del nuevo data frame
glimpse(df_combinado)

# Ordenar por país y año
df_combinado <- df_combinado %>% 
  arrange(country, year)

# Mostrar las primeras filas
head(df_combinado)

# Crear columna adicional para identificar el grupo (Mercosur o Venezuela)
df_mercosur <- df_mercosur %>% 
  mutate(grupo = "Mercosur")

df_venezuela <- df_venezuela %>% 
  mutate(grupo = "Venezuela")

# Combinar los data frames
df_combinado <- bind_rows(df_mercosur, df_venezuela) %>% 
  select(iso2c, country, year, NY.GDP.PCAP.CD, grupo, everything())

# Resumen estadístico por grupo
df_combinado %>% 
  group_by(grupo) %>% 
  summarise(
    observaciones = n(),
    pib_promedio = mean(NY.GDP.PCAP.CD, na.rm = TRUE),
    pib_minimo = min(NY.GDP.PCAP.CD, na.rm = TRUE),
    pib_maximo = max(NY.GDP.PCAP.CD, na.rm = TRUE)
  )
 
install.packages("ggplot2")
library(ggplot2)

# Gráfico comparativo
ggplot(df_combinado, aes(x = year, y = NY.GDP.PCAP.CD, color = country)) +
  geom_line() +
  labs(title = "Evolución del PIB per cápita",
       x = "Año", y = "PIB per cápita (USD)") +
  theme_minimal()

# Observación: este gráfico no fue solicitado