library(gapminder)
df_gapminder_csv <- gapminder

df_venezuela <- df_gapminder_csv%>%
  filter(country=='Venezuela')

rl_ven <- lm( df_venezuela$lifeExp ~ df_venezuela$gdpPercap)

summary(rl_ven)$r.squared

extraer_rsq <- function(datos){
  # extraer r cuadrado
  summary(datos)$r.squared
}

extraer_contintente <- function(datos){
  # extraer continente
  as.character(datos$continent[1])
}

df_rl_gapminder <- df_gapminder_csv%>%
  group_by(country)%>%
  nest_by(.keep = TRUE) %>% # función clave ya que anida los datos
  mutate(lm_result= list(lm(lifeExp ~gdpPercap, data = data)))%>%
  rowwise()%>%
  mutate(continent= extraer_contintente(data))%>%
  mutate(r_sq= extraer_rsq(lm_result))%>%
  arrange(desc(r_sq))

ggplot(data=df_rl_gapminder, 
       aes( y= r_sq,x=continent))+
  geom_boxplot(fill='orange')

### ejercicio preliminar
test <- df_rl_gapminder%>%
  ungroup()%>%
  slice(1,50)

test%>%
  rowwise()%>%
  mutate(continent= extraer_contintente(data))

lapply(test$lm_result,"[")
lapply(test$lm_result,"[",'residuals')
lapply(test$lm_result,"[[",'terms')
lapply(test$lm_result,"[[",'coefficients')

do.call(rbind,(lapply(df_rl_gapminder$lm_result,"[[",'coefficients')))%>%
  as_data_frame()

lapply(df_rl_gapminder$lm_result,summary)%>%
  lapply('[','r.squared')%>%
  lapply('[')%>%
  unlist()
  


