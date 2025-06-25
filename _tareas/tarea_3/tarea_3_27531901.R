library(WDI)
library(dplyr)
# Paso 1: Descargar exportaciones e importaciones para 2010–2024

df_exp_imp <- WDI(indicator = c("NE.EXP.GNFS.CD", "NE.IMP.GNFS.CD"),
                  start = 2010, end = 2024)

# Renombrar columnas

df_exp_imp <- df_exp_imp %>%
  rename(exportaciones = NE.EXP.GNFS.CD,
         importaciones = NE.IMP.GNFS.CD)


# Crear variable de balanza comercial y filtrar los NAs

df_exp_imp <- df_exp_imp %>%
  mutate(balanza_comercial = exportaciones - importaciones)

# Paso 2: Tabla resumen general (excluyendo NAs)

summary(df_exp_imp$balanza_comercial)

# Paso 3: Filtrar países del Mercosur (excepto Venezuela aquí)

mercosur_codes <- c("AR", "BR", "PY", "UY", "BO")
df_mercosur <- df_exp_imp %>%
  filter(iso2c %in% mercosur_codes, !is.na(balanza_comercial))

# Paso 4: Tabla resumen para Mercosur

summary(df_mercosur$balanza_comercial)

# Paso 5: Ordenar Mercosur por balanza comercial

df_mercosur_ordenado <- df_mercosur %>%
  arrange(desc(balanza_comercial))

# Paso 6: Valores extremos en Mercosur 

valor_max_mercosur <- max(df_mercosur$balanza_comercial, na.rm = TRUE)
pais_max_mercosur <- df_mercosur %>%
  filter(balanza_comercial == valor_max_mercosur) %>%
  select(country)

valor_min_mercosur <- min(df_mercosur$balanza_comercial, na.rm = TRUE)
pais_min_mercosur <- df_mercosur %>%
  filter(balanza_comercial == valor_min_mercosur) %>%
  select(country)

# Paso 7: Variables de resultados

pais_mercosur_max <- pais_max_mercosur$country[1]
pais_mercosur_min <- pais_min_mercosur$country[1]

# mecanismo alterno, recomendado en este caso era uso de la función `pull`

# Paso 8: Análisis para Venezuela (VE)

df_venezuela <- df_exp_imp %>%
  filter(iso2c == "VE", !is.na(balanza_comercial))

# Tabla resumen para Venezuela

summary(df_venezuela$balanza_comercial)

# Ordenar valores de Venezuela

df_venezuela_ordenado <- df_venezuela %>%
  arrange(desc(balanza_comercial))

# Valores extremos en Venezuela

valor_max_venezuela <- max(df_venezuela$balanza_comercial, na.rm = TRUE)
valor_min_venezuela <- min(df_venezuela$balanza_comercial, na.rm = TRUE)

# Paso 9: Crear data frame combinado

df_combinado <- bind_rows(df_mercosur, df_venezuela)




  