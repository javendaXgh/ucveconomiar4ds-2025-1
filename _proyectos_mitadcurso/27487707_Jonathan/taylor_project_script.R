####################################################################
# Proyeto Ciclo de C.D 27.487.707
####################################################################

# Configuración inicial (Cargar librerias) ----

library(tidyverse)    # Para desarrollar este proyecto usaremos la libreria
                      # tidyverse, en caso de no poseer dicha libreria instalada
                      # por favor el operador de comentario (#)
                      # y ejecute siguiente codigo: 
                      # install.packages("tidyverse")

# 1. Importar e Inspeccionar DF----

# 1.1. Importar la data frame a trabajar 

taylor_spotify_data <- read_csv("datos/taylor_swift_spotify.csv")
                     
# 1.2. Inspeccionar la data frame a trabajar 

glimpse(taylor_spotify_data)  #Ejecutar esta funcion nos muestra un resumen
                              #rapido del contenido del dataframe sin necesidad
                              #de llamar a la tabla completa.

colnames(taylor_spotify_data)

summary(taylor_spotify_data)  #Ejecutar esta funcion nos muestra un resumen
                              #estadistico de los datos, podemos obervar que no
                              #hay datos no disponibles (N/A) en nuestro DF.          

unique(taylor_spotify_data$album) #Ejecutar esta funcion nos permite identificar
                                  # los valores únicos de columna album

taylor_spotify_data %>%
  count(album, name = "total_canciones")

# 2. Limpieza y Transformacion Datos----

# 2.1. Eliminar columna inncesaria

taylor_spotify_data <- taylor_spotify_data %>% 
  select(-...1)

head(taylor_spotify_data) 

# 2.1. Convertir milisegundos a minutos y extraer año de lanzamiento

taylor_spotify_data_clean <- taylor_spotify_data %>%
  mutate(                                  #Con esta funcion crearemos nuevas
                                           #columnas
    duration_min = duration_ms / 60000, 
    release_year = as.POSIXlt(release_date)$year + 1900
  ) %>%
  select(-duration_ms)  #Utilizando la funcion select y el operador (-) podemos
                        #eliminar columnas del dataframe, en este caso como ahora 
                        #tenemos la columna duration_min considero pertinente
                        #eliminar duration_ms

# 2.3 Agregar nueva columna de datos: 

taylor_spotify_data_clean <- taylor_spotify_data_clean %>%
  mutate(consolidated = case_when(
    str_detect(album, "THE TORTURED POETS DEPARTMENT") ~ "THE TORTURED POETS DEPARTMENT",
    str_detect(album, "Speak Now") ~ "Speak Now",
    str_detect(album, "Midnights") ~ "Midnights", 
    str_detect(album, "Red") ~ "Red",
    str_detect(album, "Fearless") ~ "Fearless",
    str_detect(album, "evermore") ~ "evermore",
    str_detect(album, "folklore") ~ "folklore",
    str_detect(album, "Lover") ~ "Lover",
    str_detect(album, "reputation") ~ "reputation", 
    str_detect(album, "1989") ~ "1989",
    str_detect(album, "Taylor Swift") ~ "Taylor Swift",
    TRUE ~ 'Others'
  ))

# 3. Valores estadisticos y Tablas Resúmenes----

# 3.1  
taylor_spotify_data_clean %>%
  select(track_number, acousticness, danceability, energy, instrumentalness,
         liveness, loudness, speechiness, tempo, valence, popularity, 
         duration_min, release_year) %>% 
  summary()

# 3.2 Cuantas canciones tiene taylor por album

discografia <-  taylor_spotify_data_clean %>% 
  count(album, name = "total_canciones_por_album") 

summary(discografia)

colnames(taylor_spotify_data_clean)

#Notas---- 
# 1. Este Código fue escrito con asistencia parcial de Deepseek 
# 2. Este Código utiliza como referencia los scripts y laminas vistas en clase 
# desde la clase 09 hasta la 19 sin contar la clase 18.
# 3. Este codigo y su respectivo reporte qmd estan parcialmiente inspirados en 
# el trabajo de Barbara Nicole, titulado: "Taylor Swift: a exploratory data analysis"
# link:https://www.kaggle.com/code/barbarabernal/taylor-swift-a-exploratory-data-analysis
# 4. la data utilizada para este proyecto es: "Taylor Swift Spotify Dataset" de
# kaggle 
# link:https://www.kaggle.com/datasets/jarredpriester/taylor-swift-spotify-dataset/data