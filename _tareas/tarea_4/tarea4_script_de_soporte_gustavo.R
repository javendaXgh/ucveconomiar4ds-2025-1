library("owidapi")
library("gt")
library("dplyr")
library("ggplot2")
library("gt")
#importo los datos
hdi_hispano <- owid_get("human-development-index", entities= c('ARG', 'COL', 'ESP', 'VEN') )
#Determino el promedio de 2023
hdi_hispano_2023 <- hdi_hispano %>%
  filter(year==2023 )

 hdi_promedio <- mean(hdi_hispano_2023$hdi__sex_total)
hdi_promedio 
#aplico la condicion
hdi_hispano_2023 <- hdi_hispano_2023 %>%
  mutate(tipo_hdi = ifelse(hdi_hispano_2023$hdi__sex_total > hdi_promedio,
                           "hdi_alto",
                           "hdi_bajo"))
hdi_hispano_2023
#Hago el primer grafico de barras
ggplot(data=hdi_hispano,
       aes(entity_name)) +
  geom_bar(fill="#d00000") +
  labs(x="Paises",
       y="observaciones")
#boxplot
ggplot(data = hdi_hispano,
       mapping = aes(x=entity_name, 
                     y= hdi__sex_total)) +
  geom_boxplot(fill= "#fb8b24",
               color='#00a6fb') +
  labs(x="Paises",
       y="HDI")
#histograma
ggplot(data = hdi_hispano) +
  geom_histogram(aes(x= hdi__sex_total), bins = 8) +
  labs(x="HDI")
#histograma por paises
ggplot(data = hdi_hispano) +
  geom_histogram(aes(x= hdi__sex_total), bins = 8) +
  labs(x="HDI")+
facet_wrap(~entity_name)
#grafico de densidad
ggplot(data = hdi_hispano,
       aes(x = hdi__sex_total,
           color= entity_name)) +
  geom_density(aes(fill = entity_name))
#Grafico de lineas
ggplot(data = hdi_hispano,
       aes(x= year,
           y= hdi__sex_total)) +
  geom_line(aes(color= entity_name))+
  labs(x="Años",
       y="HDI",
       color= "Pais")+
  theme_light()
#tabla en GT
hdi_hispano %>%
  slice_max(by=entity_name, hdi__sex_total) %>%
  gt() %>%
  tab_header(title = "Indice de Desarrollo Humano") %>%
  cols_label(entity_name="Pais",
             year="Año",
             hdi__sex_total="HDI") #se consulto perplexity para usar cols_label
