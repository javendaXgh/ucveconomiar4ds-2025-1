# Apartado 1:

# Instalo los paquetes pertinentes
install.packages("wbstats")
library(wbstats)

# Busco los datos que coinciden con mis intereses
data <- wb_search(pattern = 'Unemployment, total', fields = 'indicator') # Asigno la función de búsqueda a la                                                                     
                                                                         # variable "data" para posteriormente
View(data)                                                               # visualizarla con "View" y facilitar
                                                                         # la selección y obtener su ID

# Observación: por qué te resultó más práctico este paquete que el que les recomendé?

# Una vez seleccionada la data la especificamos
total_unemployment <- wb_data(indicator = "SL.UEM.TOTL.ZS", # Le asigno a los datos una variable descriptiva
        country = "all",                                    # Utilizo "all" en country para sellecionar todos
        start_date = 1991,                                  # los países
        end_date = 2024)
total_unemployment 

## Para esta parte usé ayuda del siguiente video: https://www.youtube.com/watch?v=PGX4GCSqUao , por lo mismo,
## es algo distinto a las especificaciones. Sin embargo, se me facilitó mucho más de esta forma.

# Paso preliminar para cambiar el nombre de la columna "SL.UEM.TOTL.ZS"
install.packages("janitor")                  # Instalamos el paquete "janitor"
library(janitor)                            
names(total_unemployment)                    # Vemos los nombres de las columnas y encontramos "SL.UEM.TOTL.ZS"
total_unemployment <- total_unemployment %>% # Aplicamos un encadenamiento para ejecutar janitor y así
  janitor::clean_names()                     # cambiar el nombre a un mejor formato 
names(total_unemployment)                    # Volvemos a la función "names" y verificamos

##############################################################################################################

# Apartado 2:
summary(total_unemployment) # Con la función "summary" obtenemos las estadísticas descriptivas básicas en una
                            # tabla resumen

# Apartado 3:
# Creo una data frame y uso una cadena para filtrar a los países miembros del Mercosur:
df_paises_mercosur <- total_unemployment %>%
  filter(country %in% c("Argentina", "Bolivia", "Brazil", "Paraguay", "Uruguay", "Venezuela, RB"))

# Apartado 4:
summary(df_paises_mercosur$sl_uem_totl_zs) # Obtengo una tabla resumen solo para los paises del Mercosur

# Apartado 5: 
sort(df_paises_mercosur$sl_uem_totl_zs, decreasing = TRUE) # Ordeno de mayor a menor los datos del desempleo
                                                           # para los países del Mercosur
## Se usó la asistencia del LLM "Copilot"

# Apartado 6 y 7:
min_mercosur <- min(df_paises_mercosur$sl_uem_totl_zs)   # Busco el valor mínimo del desempleo y le asigno una 
min_mercosur                                             # variable
max_mercosur <- max(df_paises_mercosur$sl_uem_totl_zs)   # Busco el valor máximo del desempleo y le asigno una
max_mercosur                                             # variable

which(df_paises_mercosur$sl_uem_totl_zs == min_mercosur) # Busco de cuál pais es el valor mínimo y me da el 
                                                         # número de fila
pais_min_valor <- df_paises_mercosur[58,3]               # Ubico el nombre con la fila arrojada y la culumna 3.
                                                         # La asigno a una variable
which(df_paises_mercosur$sl_uem_totl_zs == max_mercosur) # Busco de cuál pais es el valor máximo y me da el 
                                                         # número de fila
pais_max_valor <- df_paises_mercosur[12,3]               # Ubico el nombre con la fila arrojada y la culumna 3.
                                                         # La asigno a una variable

## Observación: no te recomiendo este método para asignar el valor ya que si por ejemplo, 
# descargas los datos nuevamente, vas a perder el índice que estás indicando.
# Por favor, vamos a hablar de esto en el salón, para que entiendas la razón por la cual
# buscamos hacerlo mediante comparaciones lógicas y no definidas mediante la 
# observación del conjunto de datos

pais_min_valor                                           # Obtengo los nombres
pais_max_valor                                           

# Apartado 8:

df_venezuela <- total_unemployment %>%
  filter(country %in% c("Venezuela, RB"))

summary(df_venezuela$sl_uem_totl_zs)

sort(df_venezuela$sl_uem_totl_zs, decreasing = TRUE)

min_vzla <- min(df_venezuela$sl_uem_totl_zs)    
min_vzla 

max_vzla <- max(df_venezuela$sl_uem_totl_zs)   
max_vzla  

## No necesito encontrar el nombre, ya lo filtramos para Venezuela

# Apartado 9:
df_combinada <- bind_rows(df_paises_mercosur,
                          df_venezuela)
