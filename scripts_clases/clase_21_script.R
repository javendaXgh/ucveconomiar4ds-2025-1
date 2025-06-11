##########################################################################################
# 
# Clase 07- script apoyo
# 
##########################################################################################

##########################################################################################
######## Cargar Librerías                                                         #######
##########################################################################################

library(gapminder)
library(tidyverse)

df_gapminder_csv <- gapminder

df_venezuela <- df_gapminder_csv%>%
  filter(country=='Venezuela')

# obtener regresión lineal para Venezuela

rl_ven <- lm( df_venezuela$lifeExp ~ df_venezuela$gdpPercap)

# extraer valor de R cuadrado
summary(rl_ven)$r.squared


# crear función para extraer r.cuadrado cuando le doy una lista
extraer_rsq <- function(datos){
  # extraer r cuadrado
  summary(datos)$r.squared
}

# función de ayuda para extraer nombre continente de estructura de datos que se presentará 
# más adelante en df_rl_gapminder

extraer_contintente <- function(datos){
  # extraer continente
  as.character(datos$continent[1])
}


#ejecutar paso a paso en la cadena para ver qué ocurre a medida que prograsamos
df_rl_gapminder <- df_gapminder_csv%>%
  group_by(country)%>%
  nest_by(.keep = TRUE) %>% # función clave ya que anida los datos
  mutate(lm_result= list(lm(lifeExp ~gdpPercap, data = data)))%>% # obtener RL para cada país
  # rowwise()%>% # aplicar la función de la siguiente línea por filas
  mutate(continent= extraer_contintente(data))%>% # extraer continente
  mutate(r_sq= extraer_rsq(lm_result))%>% # extraer r cuadrado de cada país
  arrange(desc(r_sq))%>%
  ungroup()

ggplot(data=df_rl_gapminder, 
       aes( y= r_sq,
            x=continent))+
  geom_boxplot(fill='orange')

### ejercicio preliminar
df_subgapminder <- df_rl_gapminder%>%
  ungroup()%>%
  .[1:10,]


# acceder a la lista
lapply(df_subgapminder$lm_result,"[")

# acceder a los residuales de cada lista de cada país
lapply(df_subgapminder$lm_result,"[",'residuals')

# acceder a los terms de cada lista de cada país
lapply(df_subgapminder$lm_result,"[[",'terms')

# acceder a los coeficientes de cada lista de cada país
lapply(df_subgapminder$lm_result,"[[",'coefficients')


# crear una df con los coeficientes de la RL de cada país
do.call(rbind,
        (lapply(df_rl_gapminder$lm_result,"[[",'coefficients')))%>%
  as_data_frame()
# se usó la función do.call que no será explicada formalmente


# extracción mediante lapply de los coeficientes
lapply(df_rl_gapminder$lm_result,summary)%>%
  lapply('[','r.squared')%>%
  lapply('[')%>%
  unlist()
