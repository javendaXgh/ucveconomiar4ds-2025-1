# Examen parcial: 2da parte, ejemplos respuestas
library(gapminder)


########
TRUE | TRUE | FALSE	#correcto
TRUE | FALSE | FALSE	# correcto
FALSE | FALSE | TRUE # correcto

TRUE & FALSE & TRUE	# incorrecto
FALSE & FALSE & FALSE	


######## acceso elementos lista
canasta <- list(
  nombre = "Canasta básica",
  articulos = list(
    pan = list(precio = 1.50, unidad = "unidad"),
    arroz = list(precio = 1.70, unidad = "kg"),
    huevos = list(precio = 3.50, unidad = "docena")
  ),
  costo_total = 7.00
)

# ejemplos extracción
canasta$articulos$huevos[1]
canasta$articulos$huevos$precio
canasta$articulos[2][[1]]
canasta$articulos[[3]][[1]]

# incorrecto
canasta%>%
  filter(articulos=='arroz')


######## corrección código
# librayr(gapminder)
# 
# # Usar los datos de gapminder y procesarlos con el pipe operator
# datos_procesados <- gapminder %>
#   fiter(continent == "Asia") %>
#   selec(country, year, lifeExp, gdpPercap) %>
#   arraneg(desc(lifeExp)
#           
# Imprimir los primeros resultados
#head(datos_procesados

library(gapminder)

# Usar los datos de gapminder y procesarlos con el pipe operator
datos_procesados <- gapminder %>%
  filter(continent == "Asia")  %>%
  select(country, year, lifeExp, gdpPercap)  %>%
  arraneg(desc(lifeExp))
          
# Imprimir los primeros resultados
head(datos_procesados
               
               


######## sección filtrar
gapminder::gapminder%>%
  filter(continent!= 'Americas')%>% #excluye a Venezuela
  filter(country== 'Venezuela')
## retorna cero filas