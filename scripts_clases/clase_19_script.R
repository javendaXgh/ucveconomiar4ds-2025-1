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




# df_gapminder%>%
#   group_by(country)%>%
#   reframe(valor_maxgdp=max(gdpPercap),
#           year = year[which.max(gdpPercap)])%>%
#   arrange(desc(valor_maxgdp))

  


############### factores en data frames
# Simulemos un data frame con una columna que debería ser numérica
df_numerico_como_factor <- data.frame(
  ID = 1:5,
  Valor = c("10", "20", "30", "40", "error"),
  stringsAsFactors = TRUE
)

df1 <- data.frame(Grupo = factor(c("A", "B", "A")))
df2 <- data.frame(Grupo = factor(c("B", "C")))

# Intentar combinarlos directamente
rbind(df1, df2) # Los niveles se mantienen por separado

# Si intentas comparar directamente sin cuidado
df1$Grupo == df2$Grupo[1] # Comparación entre factor y un nivel


# R lo leerá como factor
str(df_numerico_como_factor)

# Intentar convertirlo directamente a numérico puede dar resultados inesperados
as.numeric(df_numerico_como_factor$Valor) # ¡Advertencia y NAs!


You can add multiple columns at once using a single expression by returning
# a data frame.
quantile_df <- function(x, probs = c(0.25, 0.5, 0.75)) {
  tibble(
    val = quantile(x, probs, na.rm = TRUE),
    quant = probs
  )
}

valores_maximo <- function(df ){
  df%>%
    mutate(country=as.character(country))%>%
    select(country, gdpPercap, year)%>%
    filter(gdpPercap== max(gdpPercap))
  
  # tibble(gdpMax= max(df$gdpPercap),
  #        anno_max= df$year[which.max(df$gdpPercap)]
  #        )
}

df_gapminder%>%
  group_by(country)%>%
  reframe(valores_maximo(.))%>%
  arrange(desc(gdpPercap))


df_gapminder%>%
  mutate(country=as.character(country))%>%
  select(country, gdpPercap, year)%>%
  filter(gdpPercap== max(gdpPercap))


mtcars %>%
  group_by(cyl) %>%
  summarise(mean = mean(disp), n = n())


mtcars %>%
  group_by(cyl, vs) %>%
  summarise(cyl_n = n()) %>%
  group_vars()


x <- c(10, 15, 18, 12)
quantile_df(x)

quantile_df(x)


library(tidyverse)
starwars %>%
  reframe(quantile_df(height))


df <- 

