# Primero verificamos la ruta de trabajo del presente archivo
getwd()
# Ubicamos la ruta de trabajo de los archivos csv a trabajar
setwd("~/R/UCV_ECONOMIA_R4DS/uvceconomiar4ds-2025-1/proyectos_mitadcurso/halena")
# Creamos una variable por cada archivo csv descomprimido
datos_1 <- read.csv("5_to_14_victim_count.csv", stringsAsFactors = FALSE)
datos_2 <- read.csv("15_to_30_victim_count.csv", stringsAsFactors = FALSE)
datos_3 <- read.csv("Highest_victim_count.csv", stringsAsFactors = FALSE)
datos_4 <- read.csv("Lessthan_5_victim_count.csv", stringsAsFactors = FALSE)
# Juntamos todos los datos en una única tabla
serial_killers_datos <- rbind(datos_1, datos_2, datos_3, datos_4)
## En este caso podemos usar la función "rbin" porque cada tabla individual contaba con el mismo número, nombre y orden de columnas
## es mejor usar bind_rows porque es más suave a la hora de manejar las estructuras de una y otra df
View(serial_killers_datos)

# Limpiamos el formato de los nombres de las columnas a un formato más adecuado
names(serial_killers_datos)                    
serial_killers_datos <- serial_killers_datos %>% 
  janitor::clean_names() ## perfecto!!

# Verificamos las dimensiones y vemos la clase que le asignó a cada columna
dim(serial_killers_datos)
apply(serial_killers_datos,2, class) ## perfecto!!
## Hay que hacer tres modificaciones de clases de "charater" a "numeric"
View(head(serial_killers_datos))
# Realizamos las transformaciones
df_transformacion <- serial_killers_datos %>%
  # Primero la transformación para los años  
  mutate(
    rango_limpio = str_replace_all(years_active, "[^0-9to\\s]", ""),                       
    rango_limpio = str_squish(rango_limpio),
    año_inicio = as.numeric(str_extract(rango_limpio, "\\d{4}")),                         
    año_fin = case_when(
      str_detect(rango_limpio, " - ") ~ as.numeric(str_extract(rango_limpio, "\\d{4}$")), 
      TRUE ~ año_inicio)
  ) %>% 
  # Ahora la transformación para los "proven_victims"
  mutate(
    rango_limpio_kills = str_replace_all(proven_victims, "[^0-9–+-]", ""),
    rango_limpio_kills = str_squish(rango_limpio_kills),
    victimas_min = as.numeric(str_extract(rango_limpio_kills, "^\\d+")),
    victimas_max = case_when(
      str_detect(rango_limpio_kills, "[–-]") ~ {
        segundo_num_str <- str_split(rango_limpio_kills, "[–-]", simplify = TRUE)[,2]
        as.numeric(str_remove(segundo_num_str, "\\+"))
      },
      str_detect(rango_limpio_kills, "\\d+\\+$") ~ as.numeric(str_remove(rango_limpio, "\\+")),
      str_detect(rango_limpio_kills, "^\\d+$") ~ victimas_min,
      TRUE ~ NA_real_
    )) %>%
  # Ahora la transformación para los "possible_victims"
  mutate(
    rango_limpio_p = str_replace_all(possible_victims, "[^0-9–+-]", ""),
    rango_limpio_p = str_squish(rango_limpio_p),
    p_victimas_min = as.numeric(str_extract(rango_limpio_p, "^\\d+")),
    p_victimas_max = case_when(
      str_detect(rango_limpio_p, "[–-]") ~ {
        tercero_num_str <- str_split(rango_limpio_p, "[–-]", simplify = TRUE)[,2]
        as.numeric(str_remove(tercero_num_str, "\\+"))
      },
      str_detect(rango_limpio_p, "\\d+\\+$") ~ as.numeric(str_remove(rango_limpio_p, "\\+")),
      str_detect(rango_limpio_p, "^\\d+$") ~ p_victimas_min,
      TRUE ~ NA_real_
    ))

  

  
 
  df_transformacion <- serial_killers_datos %>%
    # Primero la transformación para los años  
    mutate(rango_limpio = str_replace_all(years_active, "[^0-9to\\s]", ""))%>%                       
    mutate(  rango_limpio = str_squish(rango_limpio))%>%
    mutate( año_inicio = as.numeric(str_extract(rango_limpio, "\\d{4}")))%>%                         
    mutate(año_fin = case_when(str_detect(rango_limpio, " - ") ~ as.numeric(str_extract(rango_limpio, "\\d{4}$")), 
                               TRUE ~ año_inicio)) %>%
    select(years_active,rango_limpio,año_inicio,año_fin )
  
  View(df_transformacion)
  