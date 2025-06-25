####################################################################
# Tarea 3 c.i. 27.487.707
####################################################################

#Instalar WDI Package para trabajar la data del Banco Mundial----

#install.packages("WDI")  #Instala el paquete WDI (World Development Indicators) 
                         #en nuestra computadora 

library(WDI)             #Carga el paquete WDI para que podamos usar sus
                         #funciones.
library(tidyverse)

# 1. Descargar datos: Internet Users = IT.NET.USER.Z ----

df_inter_access <- WDI(indicator = "IT.NET.USER.ZS", 
                       start = 1999, 
                       end = 2024) %>%
  rename(internet_user= `IT.NET.USER.ZS`)
  

as_tibble(df_inter_access)  #Este codigo nos permite visualizar los datos
                            # de tibble para una mejor visualizacion. 

# Observación: no es necesario usar ese `as_tibble` ya que su función es cambiar la clase 
# del objeto de data.frame a tibble

# 2. Tabla resumen: Internet Users----

tabla_resumen <- summary(df_inter_access)

tabla_resumen



# 3. Filtrar Internet Users para Mercosur---- 

mercosur_country_codes <- c("AR", "BR", "PY", "UY", "BO", "CL", "CO",
                            "EC", "GY", "PE", "SR")

df_inter_access_mercosur <- WDI(indicator = "IT.NET.USER.ZS", 
                                  country = mercosur_country_codes,   
                                  start = 1999,
                                  end = 2024) %>% 
  rename(internet_user= `IT.NET.USER.ZS`)

as_tibble(df_inter_access_mercosur)

# 4. Tabla resumen Internet Users Mercosur----

tabla_resumen_mercosur <-  summary(df_inter_access_mercosur)

tabla_resumen_mercosur

# 5. Ordenar los datos de Internet Users Mercosur de mayor a menor----

#Ordenar la Data Frame en orden descendente y agrupado por año (Incluyendo
#los valores no disponible):

### Observación: no estás "agrupando", ya que este término tiene otro concepto del que 
### hablaremos luego

df_inter_access_mercosur_desc <- df_inter_access_mercosur %>% 
  arrange(desc(year), desc(internet_user))

### Observación: cuando revisas los resultados puedes ver que el criterio de ordenar
### descendentemente por `internet_user` no funciona del todo ya que se aparecen primero
### los NA's. ¿Qué se te ocurre que puedas hacer para que esto no pase? Quizás el video
### que coloqué sobre esta tarea te pueda ayudar
df_inter_access_mercosur_desc #Este codigo muestra en consola el df

#Ordenar la Data Frame en orden descendente y agrupado por año (sin incluir
#los valores no disponible):

df_inter_access_mercosur_desc_clean <- df_inter_access_mercosur %>% 
 filter(!is.na(internet_user)) %>%  #esta linea de codigo elmina los n/a del df
  arrange(desc(year), desc(internet_user),) 

### 🤡🤡🤡: no aplica la observación que te hice anteriormente. ya te diste cuenta del problema y esa 
### justamente es la idea. Muy Bien!!! por cierto, dejaste una coma de más en la última línea 
### en este caso no va a interrumpir la ejecución del código pero hay funciones en que sí
### te pudiera dar un error



df_inter_access_mercosur_desc_clean #Este codigo muestra en consola el df

# 6. Identificar valores extremos de Internet Users Mercosur----

pais_menor_InterAccess <- df_inter_access_mercosur %>% 
  #rename(nueva_variable= `IT.NET.USER.ZS`)%>%
  # filter(IT.NET.USER.ZS == min(IT.NET.USER.ZS, na.rm = TRUE)) %>%
  filter(internet_user == min(internet_user, na.rm = TRUE)) %>%
  pull(country)

pais_mayor_InterAccess <- df_inter_access_mercosur %>% 
  filter(internet_user == max(internet_user, na.rm = TRUE)) %>%
  pull(country)

# 7. Crear Variables de Resultados:----  

df_paraguay <- df_inter_access_mercosur %>%
  filter(country == pais_menor_InterAccess)

df_chile <- df_inter_access_mercosur %>%
  filter(country == pais_mayor_InterAccess)

# 8. Filtrado para Venezuela: repite los pasos 3, 4 ,5 ,6 y 7 para Venezuela ----

# 8.1 Filtrar Internet Users para Venezuela:
df_inter_access_VE  <- WDI(indicator = "IT.NET.USER.ZS", 
                             country = "VE",   
                             start = 1999,
                             end = 2024) %>% 
  rename(internet_user= `IT.NET.USER.ZS`)

as_tibble(df_inter_access_VE)

# 8.2 Tabla de resumeN, Internet Users VE:

tabla_resumen_VE <- summary(df_inter_access_VE)

tabla_resumen_VE 

# 8.3 Ordenar los datos de Internet Users Venezuela de mayor a menor y eliminar
#los datos no disponibles. 

df_inter_access_VE_clean <- df_inter_access_VE %>% 
  filter(!is.na(internet_user)) %>%  #esta linea de codigo elmina los n/a del df
  arrange(desc(year), desc(internet_user),) 

df_inter_access_VE_clean

# 8.4  Valores extremos de Internet Users VE

#Mayor valor de Usuarios con acceso a internet en venezuela:

df_inter_access_VE_max <- df_inter_access_VE_clean %>% 
  filter(internet_user == max(internet_user)) 

df_inter_access_VE_max

# #Menor valor de Usuarios con acceso a internet en venezuela:
df_inter_access_VE_min <- df_inter_access_VE_clean %>% 
  filter(internet_user == min(internet_user)) 

df_inter_access_VE_min

# 9. Crear Data Frame Combinada: crear una nueva df combinando los valores de Mercosur y Venezuela.----

df_mercosur_incl_VE <- bind_rows(df_inter_access_mercosur_desc_clean,
                                 df_inter_access_VE_clean) %>% 
  arrange(desc(year), desc(internet_user))

# 10. Grafico: Personas que utilizan Internet (% de la pob) a lo largo de tiempo  ----

# Grafico simple:

ggplot (df_mercosur_incl_VE , aes(x = year, y = internet_user ,
       color = country)) +
        geom_line() +
        ggtitle("Personas que utilizan Internet (% de la pob) a lo largo de tiempo")

# Grafico mejorado (con ayuda de deepseek):

ggplot(df_mercosur_incl_VE, aes(x = year, y = internet_user, color = country)) + 
  geom_line(linewidth = 1) +
  labs(
    title = "Evolución del acceso a Internet en Mercosur + Venezuela",
    x = "Año",
    y = "% de población con acceso a Internet",
    color = "País"
  ) +
  theme_minimal() +
  scale_color_viridis_d()

# Codigo para limpiar el Environment----
#rm(list = ls())

# Notas----

# 1. Este Código fue escrito con asistencia parcial de Deepseek 
# 2. Este Código utiliza como referencia el script de la clase 10 y
# la publiación: A Dive into Economic Data Using World Bank Databases in R
# escrita por Dima Diachkov. 
# link: https://medium.com/data-and-beyond/a-dive-into-economic-data-using-world-bank-databases-in-r-39e6536f6dbd
# 3. La fuente de los datos utilizados:  World Bank Group
# link: https://data.worldbank.org/indicator/IT.NET.USER.ZS?name_desc=true

