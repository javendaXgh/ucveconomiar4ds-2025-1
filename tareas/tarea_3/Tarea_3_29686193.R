#Universidad Central de Venezuela
#Facultad de Ciencias Economica y Sociales
#Escuela de Economía
#Materia Ciencia de Datos Basado en Programación en R para Economista- COD:3335
#Tarea3- Practica 
#Cédula:29.686.193
#Fecha: 10/05/2025

#-----------------------------------------------------------------------------------------------------

# 1. PASOS PREVIOS A LA ACTIVIDAD:
#después de leer el articulo "Una inmersión en los datos económicos 
#utilizando bases de datos del Banco Mundial en R" instalamos el paquete recomendado

#apartir de la función install.packages("WDI") 

#Este paquete nos permite acceso al extenso repositorio de Indicadores
#de Desarrollo Mundial (WDI) del Banco Mundial

#a traves de la función library llamamos al paquete "WDI" 

library(WDI)

#a)*Selección de Datos:* Para esta actividad se ha seleccionado como Indicador del Banco Mundial:
# Renta de recursos naturales (% del PIB)"-(Código del indicador: NY.GDP.TOTL.RT.ZS)

#b)*Implementación en R:* Se Asigna a los datos seleccionados a una variable
#con un nombre descriptivo

renta_de_recursos_naturales <- WDI(indicator="NY.GDP.TOTL.RT.ZS")

#2.Tabla Resumen Inicial: a partir de la función "summary()" Generamos una tabla resumen

summary(renta_de_recursos_naturales)

#3.Filtrado por Mercosur: Crea un nuevo data frame que contenga 
#únicamente los datos de los países miembros del Mercosur.

##creamos una variable cuyo vector son los codigos iso2 de los paises de Mercosur*

paises_mercosur <- c('AR','BR','UY','PY','BO')

#creamos data.frame filtrando la variable del indicador con la variable de los paises de Mercosur 

renta_de_recursos_naturales_mercosur <- renta_de_recursos_naturales %>%
  filter(iso2c %in% paises_mercosur)

#4.Tabla Resumen para Mercosur: al igual que en el caso anterior se ejecuta la función "summary()"
#para ver el resumen de nuestra nueva data.frame (renta_de_recursos_naturales_mercosur)

summary(renta_de_recursos_naturales_mercosur)

#5.Ordenamiento: Ordena el data frame del Mercosur según los valores de la variable seleccionada.
#en este caso se eligió que fuera ordenado por paises y la variable en orden descendiente

renta_rnat_mercosur_ordenado <- renta_de_recursos_naturales_mercosur %>%
  arrange(country,desc(NY.GDP.TOTL.RT.ZS))

#6.Identificación de Valores Extremos: Obtén los valores mínimo y máximo de la variable en 
#el data frame del Mercosur y extrae el nombre del país correspondiente a cada uno de estos valores.

# Se Obtienen los valores mínimo y máximo de la variable en el data frame del Mercosur
#con la funciones "min()" y "max()" respectivamente

min_renta_rnat_mercosur <- min(renta_de_recursos_naturales_mercosur$NY.GDP.TOTL.RT.ZS, na.rm = TRUE)
max_renta_rnat_mercosur <- max(renta_de_recursos_naturales_mercosur$NY.GDP.TOTL.RT.ZS, na.rm = TRUE)

# Ahora se extrae el nombre del país correspondiente a cada uno de estos valores y 
#se asigna a una variable de resultado 

pais_menor_renta_rnat <- renta_de_recursos_naturales_mercosur %>%
  filter(NY.GDP.TOTL.RT.ZS == min(NY.GDP.TOTL.RT.ZS, na.rm = TRUE))
  
pais_mayor_renta_rnat <- renta_de_recursos_naturales_mercosur %>%
  filter(NY.GDP.TOTL.RT.ZS == max(NY.GDP.TOTL.RT.ZS, na.rm = TRUE))

3#7.Filtrado para Venezuela: repite los pasos 3, 4 ,5 ,6 y 7 para Venezuela.

  # Paso No 3: Venezuela

renta_rnat_Venezuela <- renta_de_recursos_naturales %>%
  filter(iso2c %in% 'VE')

  # Paso No 4: Venezuela

summary(renta_rnat_Venezuela)

  # Paso No 5: Venezuela

renta_rnat_Venezuela_ordenado <- renta_rnat_Venezuela %>%
  arrange(desc(NY.GDP.TOTL.RT.ZS))

  # Paso No 6/7: Venezuela
min_renta_rnat_Venezuela <- min(renta_rnat_Venezuela$NY.GDP.TOTL.RT.ZS, na.rm = TRUE)
max_renta_rnat_mercosur <- max(renta_rnat_Venezuela$NY.GDP.TOTL.RT.ZS, na.rm = TRUE)

anio_menor_renta_rnat <-renta_rnat_Venezuela %>%
  filter(NY.GDP.TOTL.RT.ZS == min(NY.GDP.TOTL.RT.ZS, na.rm = TRUE))

anio_mayor_renta_rnat <- renta_rnat_Venezuela %>%
  filter(NY.GDP.TOTL.RT.ZS == max(NY.GDP.TOTL.RT.ZS, na.rm = TRUE))

#8.Crear Data Frame Combinada: crear una nueva df combinando los valores de Mercosur y Venezuela.

# llamamos al paquete 'dplyr' para poder utilizar tiliza la función 'bind_rows' para combinar
#los datos de Venezuela y Mercosur y asi crear un nuevo dataframe.

library(dplyr)

rrnat_mercosur_venezuela <- bind_rows(renta_de_recursos_naturales_mercosur,
                                      renta_rnat_Venezuela)

------------------------------------------------------------------------------------------------------

#+PASOS EXTRAS+

#siguiendo recomendaciones del docente cambiamos nombres de las variables a nombres 
#más adecuados al formato aprendido en clase con la libreria janitor

library(janitor)

renta_de_recursos_naturales <- WDI(indicator="NY.GDP.TOTL.RT.ZS") %>%
  janitor::clean_names()



