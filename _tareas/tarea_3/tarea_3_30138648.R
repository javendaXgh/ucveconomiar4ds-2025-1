"Hello World"
"Tarea 3. Lara Roselyn"

#Siguiendo el artículo de Dima Diachkov que nos proporcionó el profesor.

#1. Descargar el paquetes.

#En principio "WDI" nos permitira descargar la data del Banco Mundial

library(WDI)
library(dplyr)
library(tidyverse)

#Descargar el indicador de interes: Esperanza de vida al nacer, total (años) -
#El autor del artículo nos sigiere hacerlo de esta manera:

data.esperanza = WDI(indicator = "SP.DYN.LE00.IN")
data.esperanza

#En el tutorial del profesor 
#y en la explicación del artículo también se nos da esta opción:

data.esperanza.1 <-  WDI (country = "all",
                             indicator = "SP.DYN.LE00.IN",
                             start = 1960,
                             end = 2024,
                             extra = FALSE,
                             cache = NULL,
                             latest = NULL,
                             language = "en")
                         
data.esperanza.1


# Observación: es recomendable no usar el punto al nombrar variables. la razón es un cuento
# medio largo

#2. Realizamos una Tabla Resumen de este data.

summary(data.esperanza)

#La guardamos como una variable:

resumen_data_esperanza <- summary(data.esperanza)
resumen_data_esperanza

#3. Filtrado por mercosur: Se puede hacer por los codigos del país o por sus nombres

## Países miembros del Mercosur (Argentina, Brasil, Paraguay, Uruguay, Bolivia)


paises_mercosur <- c("ARG", "VEN", "URY", "BOL", "PRY", "BRA")
paises_mercosur

#La manera en la que lo sugiere el artículo:

df_mercosur <-  WDI(indicator = "SP.DYN.LE00.IN", country = paises_mercosur, start = 1960, end = 2024)
df_mercosur

#La manera que hemos trabajado en clase:

df_mercosur_paises <- data.esperanza.1%>%
  filter(iso3c %in% paises_mercosur)
df_mercosur_paises

#4. Tabla Resumen para Mercosur

resumen_df_mercosur_paises <- summary(df_mercosur_paises)
resumen_df_mercosur_paises

#5. Ordenamiento.

#Orden por año:

df_mercosur_ord_year <-df_mercosur %>%
  arrange(year)
df_mercosur_ord_year


#Orden descendente: 

df_mercosur_descendente <- df_mercosur %>%
  arrange(desc(df_mercosur))
df_mercosur_descendente

#Ordenar la esperanza de vida "SP.DYN.LE00.IN" de forma ascendente
#y tambien los años.

df_mercosur_mult <- df_mercosur_paises %>%
  arrange(SP.DYN.LE00.IN, desc(year))
df_mercosur_mult

#6. Identficar los valores extremos.

#Si lo hacemos de la manera que lo practicamos en la Clase 10 y registramos
#como variable el resultado: 

pais_minimo_2 <- df_mercosur_paises %>%
  filter(SP.DYN.LE00.IN == min(SP.DYN.LE00.IN, na.rm = TRUE)) %>%
  pull(country)
pais_minimo_2


pais_max_2 <- df_mercosur_paises %>%
  filter(SP.DYN.LE00.IN == max(SP.DYN.LE00.IN, na.rm = TRUE )) %>%
  pull(country)
pais_max_2


#7. Crear variables con los resultados

df_Bolivia <- df_mercosur_paises %>%
  filter(country== pais_minimo_2)
head(df_Bolivia)

df_uruguay <- df_mercosur_paises %>%
  filter(country== pais_max_2)
head(df_uruguay)


#9. Filtra para Venezuela y Repite el resultado

df_venezuela_vector <- WDI(indicator = "SP.DYN.LE00.IN",
                           country = 'VEN',
                           start = 1960,
                           end = 2024)
df_venezuela_vector

#Tabla Resumen para Venezuela:

resumen_df_venezuela <- summary(df_venezuela_vector)
resumen_df_venezuela

#Ordenamos df_Venezuela

#Orden por año

df_venezuela_ord_year <-df_venezuela_vector %>%
  arrange(year)
df_venezuela_ord_year


#Orden descendente:
df_venezuela_descen <- df_venezuela_vector %>%
  arrange(desc(df_venezuela_vector))
df_venezuela_descen

#Ordenar la población o "SP.DYN.LE00.IN" de forma ascendente
#y tambien los años.

df_venezuela_mult <- df_venezuela_vector %>%
  arrange(SP.DYN.LE00.IN, desc(year))
df_venezuela_mult

#Identficar los valores extremos.

venezuela_min <- df_venezuela_vector %>%
  filter(SP.DYN.LE00.IN == min(SP.DYN.LE00.IN, na.rm = TRUE))
venezuela_min


venezuela_max <- df_venezuela_vector %>%
  filter(SP.DYN.LE00.IN == max(SP.DYN.LE00.IN, na.rm = TRUE))
venezuela_max


#Crear un Data Frame Combinada:

df_combinadaod <- bind_rows(df_mercosur_paises,
                                 df_venezuela_vector) %>% 
  arrange(desc(year), desc(SP.DYN.LE00.IN))
df_combinadaod

#Gemini sugiere hacerlo de esta manera, pero agrega muchas mas observaciones:

df_combinado_mercosur_ven <- rbind(df_mercosur_paises, df_venezuela_vector)
df_combinado_mercosur_ven


#APARTADO

#Como sugiere el profesor cambiamos el nombre de la variable para evitar futuros
#problemas al asignar variables, colocando un nombre que siga las pautas:

names(df_mercosur)
library(janitor)

df_mercosur_country <- data.esperanza.1%>%
  janitor::clean_names()

names(df_mercosur_country)

#Revisamos el problema con los NA:

df_mercosur_country%>%
  filter(is.na(sp_dyn_le00_in))

df_mercosur_country%>%
  filter(!is.na(sp_dyn_le00_in))


"Bye world" ♥️♥️♥️
