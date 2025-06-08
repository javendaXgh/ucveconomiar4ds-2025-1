##########################################################################################
#
# Script Clase 18: group_by y reframe
# versión pre clase 28-05-2025

##########################################################################################


library(tidyverse)
library(gapminder)

df_gapminder <- gapminder

df_gapminder%>%
  group_by(country)%>%
  group_keys()%>%
  pull(country)


paises <- df_gapminder%>%
  group_by(country)%>%
  group_keys()%>%
  pull(country)

paises[10:12]

df_gapminder%>%
  filter( country %in% paises[10:12])


# remover factores
df_gapminder%>%
  mutate(country= as.character(country))%>%
  group_by(country)%>%
  group_keys()%>%
  pull(country)


# obtener índices de filas por países según la lista generada
df_gapminder%>%
  group_by(country)%>%
  group_rows()

# índices de un determinado país
paises[137]

# índices de las filas de un determinado país
df_gapminder%>%
  group_by(country)%>%
  group_rows()%>%
  .[[137]]

# acceso a una fila por índice
df_gapminder%>%
  slice(1633)

## reframe vs summarise
### versión reframe
df_gapminder%>%
  group_by(country)%>%
  reframe(valor=max(gdpPercap))

# versión summarise ya descontinuada
df_gapminder%>%
  group_by(country)%>%
  summarise(valor=max(gdpPercap))


# df con máximos según un criterio, máximo gdpPercap
df_gapminder%>%
  group_by(country)%>%
  filter(gdpPercap==max(gdpPercap))

# anterior con selección columnas
df_gapminder%>%
  group_by(country)%>%
  filter(gdpPercap==max(gdpPercap))%>%
  select(country, year, gdpPercap)

# anterior reordenada por criterio descente gdpPercap
df_gapminder %>% 
  group_by(country) %>% 
  reframe(max_gdp = max(gdpPercap)) %>% 
  arrange(desc(max_gdp))%>%
  print(n=45) 


# con year correspondiente al máximo
df_gapminder%>%
  group_by(country)%>%
  filter(gdpPercap==max(gdpPercap))%>%
  select(country, gdpPercap, year)%>%
  arrange(desc(gdpPercap))

# se crea un nueva variable gdPercap promedio por país
df_gapminder%>%
  group_by(country)%>%
  reframe(gdpPromedio=mean(gdpPercap))%>%
  arrange(desc(gdpPromedio))%>%
  print(n=50)