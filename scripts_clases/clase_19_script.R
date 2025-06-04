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

df_gapminder%>%
  mutate(country= as.character(country))%>%
  group_by(country)%>%
  group_keys()%>%
  pull(country)


# indices
df_gapminder%>%
  group_by(country)%>%
  group_rows()

paises[137]

df_gapminder%>%
  group_by(country)%>%
  group_rows()%>%
  .[[137]]


df_gapminder%>%
  slice(1633)

## reframe vs summarise
df_gapminder%>%
  group_by(country)%>%
  reframe(valor=max(gdpPercap))

df_gapminder%>%
  group_by(country)%>%
  summarise(valor=max(gdpPercap))


df_gapminder%>%
  group_by(country)%>%
  filter(gdpPercap==max(gdpPercap))


df_gapminder%>%
  group_by(country)%>%
  filter(gdpPercap==max(gdpPercap))%>%
  select(country, year, gdpPercap)


df_gapminder %>% 
  group_by(country) %>% 
  reframe(max_gdp = max(gdpPercap)) %>% 
  arrange(desc(max_gdp))%>%
  print(n=45) 


# sin year de maximo
df_gapminder%>%
  group_by(country)%>%
  filter(gdpPercap==max(gdpPercap))%>%
  select(country, year, gdpPercap)%>%
  arrange(desc(gdpPercap))

# con year
df_gapminder%>%
  group_by(country)%>%
  filter(gdpPercap==max(gdpPercap))%>%
  select(country, gdpPercap, year)%>%
  arrange(desc(gdpPercap))

# verificar
df_gapminder %>% 
  group_by(country) %>% 
  reframe(max_gdp = max(gdpPercap), 
          year,
          gdpPercap) %>% 
  arrange(desc(max_gdp))%>%
  print(n=36) 

# se crea un nuevo valor
df_gapminder%>%
  group_by(country)%>%
  reframe(gdpPromedio=mean(gdpPercap))%>%
  arrange(desc(gdpPromedio))%>%
  print(n=50)
