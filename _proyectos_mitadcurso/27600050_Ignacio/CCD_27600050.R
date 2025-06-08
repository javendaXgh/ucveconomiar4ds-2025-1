#title: "Rendimiento del Partido del Presidente de Turno y Tasa de Desempleo en Estados Unidos de America (1899-2019)"
#author: "27600050"
#format: html
#editor: visual

### Chunk 1 ### CARGAR LIBRERIAS

#| echo: false
#| warning: false

library(tidyverse)
library(ggplot2)
library(lmtest)
library(openintro)
library(DT)
library(gt)
library(dplyr)

### Chunk 2 ### IMPORTACION Y RENOMBRAR LAS VARIABLES

#| echo: false

data('midterms_house')

desempleo <- midterms_house
#renombramos variables al español
desempleo <- desempleo %>%
  rename(año = year)

desempleo <- desempleo %>%
  rename(presidente = potus)

desempleo <- desempleo %>%
  rename(partido = party)

desempleo <- desempleo %>%
  rename(tasa_de_desempleo = unemp)

desempleo <- desempleo %>%
  rename(camara_de_representantes = house_change)

### CHUNK 3 ### TABLA INTERACTIVA

#| echo: false

datatable(desempleo)

### CHUNK 4 ###Mandatos: Demócratas vs Republicanos:

#| echo: false

table(desempleo$partido)

### CHUNK 5 ###Valores estadisticos de la tasa de desempleo
#| echo: false
summary(desempleo$tasa_de_desempleo)

### CHUNK 6 ###Número de mandatos por presidente
#| echo: false

summary(desempleo$presidente)



### CHUNK 7 ### HISTOGRAMA

#| echo: false
#| warning: false


ggplot(data = desempleo,
       aes(x = tasa_de_desempleo)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(title = "Distribución de la tasa de desempleo", x = "tasa de desempleo", y = "Frecuencia") +
  theme_dark()

### CHUNK 8 ### BLOXPLOT


#| echo: false
#| warning: false


ggplot(data = desempleo,
       aes(y = tasa_de_desempleo)) +
  geom_boxplot(fill = "orange", color = "black") +
  labs(title = "Valores Atipicos", y = "Tasa de desempleo") +
  
  theme_grey()

### CHUNK 9 ### Diagrama de dispersión: 
#Desempleo durante mandato de presidente republicano y puestos ganados o perdidos por la camara de representantes del partido republicano,en el mandato.

#| echo: false
#| warning: false

desempleo_republicano <- desempleo %>%
  filter(partido == "Republican")

ggplot(data = desempleo_republicano,
       aes(x = tasa_de_desempleo, y = camara_de_representantes, color = año)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Tasa de desempleo republicano", x = "Tasa de desempleo", y = "camara de representantes republicanos") +
  theme_dark()

### CHUNK 10 ### Diagrama de dispersión: 
#Desempleo durante mandato de presidente democrata y puestos ganados o perdidos por la camara de representantes del partido democrata,en el mandato

#| echo: false
#| warning: false

desempleo_democrata <- desempleo %>%
  filter(partido == "Democrat")


ggplot(data = desempleo_democrata,
       aes(x = tasa_de_desempleo, y = camara_de_representantes, color = año)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Tasa de desempleo democrata", x = "Tasa de desempleo", y = "Camara de representantes democratas") +
  theme_dark()

### CHUNK 11 ###Promedio de la tasa de desempleo bajo el mandato de presidentes democratas

#| echo: false

promedio_desempleo_democrata <- mean(desempleo_democrata$tasa_de_desempleo)

promedio_desempleo_democrata

### CHUNK 12 ###Promedio de la tasa de desempleo bajo el mandato de presidentes republicanos:

#| echo: false


promedio_desempleo_republicano <- mean(desempleo_republicano$tasa_de_desempleo)

promedio_desempleo_republicano

### CHUNK 13 ###Grafico de puntos comparativo. TASA DE DESEMPLEO, Democratas vs Republicanos

#| echo: false
#| warning: false
ggplot(data = desempleo,
       mapping = aes(x = partido, y = tasa_de_desempleo))+
  geom_point(color= "orange")+
  labs(title = "Tasa de desempleo,Democratas vs Republicanos", x = "Partido", y = "Tasa de desempleo")+
theme_dark()

### CHUNK 14 ###Grafico de linea. Evolucion de la tasa de desempleo, EEUU 1899-2019

#| echo: false
#| warning: false

ggplot(data = desempleo,
       mapping = aes(x = año, y = tasa_de_desempleo))+
  geom_line(color= "orange")+
  labs(title = "Evolucion de la tasa de desempleo, EEUU 1899-2019", x = "Año", y = "Tasa de desempleo")+

theme_dark()

### REGRESIONES LINEALES Y PRUEBAS DE CAUSALIDAD DE GRANGER:
### CHUNK 15 ### Regresion lineal: 
#Tasa de desempleo (variable dependiente), cambios en la camara de representantes (independiente)

#| echo: false
#| warning: false

#Regresiones Lineales
regresion_tasa_de_desempelo <- lm(tasa_de_desempleo ~ camara_de_representantes, data = desempleo)

regresion_tasa_de_desempelo

### CHUNK 16 ### Regresion lineal:
#Cambios en la camara de representantes (dependiente), tasa de desempleo (variable independiente):

#| echo: false
#| warning: false

regresion_camara_de_representantes <- lm(camara_de_representantes ~ tasa_de_desempleo, data = desempleo)

regresion_camara_de_representantes

#PRUEBAS DE CAUSALIDAD DE GRANGER

### CHUNK 17 ###Prueba: ¿Tasa de desempleo genera cambios en la camara de representantes?

#| echo: false
#| warning: false

causalidad_desempleo_representantes <- grangertest(desempleo$tasa_de_desempleo, desempleo$camara_de_representantes, order=2)


causalidad_desempleo_representantes

### CHUNK 18 ###Prueba: ¿Cambios en la camara de representantes genera variaciones en la tasa de desempleo?

#| echo: false
#| warning: false


#Test de Causalidad de Granger

causalidad_representantes_desempleo <- grangertest(desempleo$camara_de_representantes, desempleo$tasa_de_desempleo, order=2)

causalidad_representantes_desempleo

#MUTATE

### CHUNK 19 ###

#| echo: false

df_desempleo <- desempleo %>%
  mutate(cambios_por_tasa_desempleo = camara_de_representantes/tasa_de_desempleo)%>%
  select(año, cambios_por_tasa_desempleo, presidente, partido)


datatable(df_desempleo)


###REFERENCIAS: 
  
#https://ucveconomia-r4ds-2025-1.netlify.app/clases/clase_13#/geom_boxplot-composici%C3%B3n-puntos-orden

#https://ucveconomia-r4ds-2025-1.netlify.app/clases/clase_16#/mutate-ifelse

#https://ggplot2.tidyverse.org/reference/geom_smooth.html

#https://www.sthda.com/english/wiki/ggplot2-scatter-plots-quick-start-guide-r-software-and-data-visualization

#https://eh.net/encyclopedia/the-depression-of-1893/

#https://www.datacamp.com/tutorial/linear-regression-R

#https://eh.net/encyclopedia/the-depression-of-1893/



