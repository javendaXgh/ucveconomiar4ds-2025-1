# 1er bloque
df_test <- serial_killers_datos %>%
  # Primero la transformación para los años  
  mutate(rango_limpio = str_replace_all(years_active, "[^0-9to\\s]", ""))%>%
  mutate(rango_limpio = str_squish(rango_limpio))%>%
  mutate(año_inicio = as.numeric(str_extract(rango_limpio, "\\d{4}")))%>%
  mutate(año_fin = case_when(
    str_detect(rango_limpio, " to | \\- ") ~ as.numeric(str_extract(rango_limpio, "\\d{4}$")), 
    TRUE ~ año_inicio))
#sepa


# 2do bloque
df_test <- serial_killers_datos %>%
  mutate(
    rango_limpio_kills = str_replace_all(proven_victims, "[^0-9–+-]", ""),
    rango_limpio_kills = str_squish(rango_limpio_kills))%>%
  mutate( victimas_min = as.numeric(str_extract(rango_limpio_kills, "^\\d+")))%>%
  mutate(rango_limpio_kills2=rango_limpio_kills)%>%
  separate(rango_limpio_kills, into = c("inicio_rango", "fin_rango"), sep = "\\–|\\-\\-")%>%
  select(proven_victims, rango_limpio_kills2,victimas_min,inicio_rango, fin_rango  )

# View(df_test)
getwd()


# df toy example
# Crea un ejemplo de data frame
df <- data.frame(
  id = 1,
  periodo = "11–16"
)

# Usa la función separate de dplyr para separar la columna 'periodo'
df %>%
  separate(periodo, into = c("inicio", "fin"), sep = "-")
