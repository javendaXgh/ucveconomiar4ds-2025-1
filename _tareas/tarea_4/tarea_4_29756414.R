library(owidapi)
library(dplyr)
library(ggplot2)
library(janitor)
library(gt)

## Descargar los Datos
install.packages("owidapi")
library(owidapi)
df_indice_desarrollo_humano <- owid_get('human-development-index', entities = c("ARG", "COL", "ESP", "VEN")) %>%
  select(-entity_id) %>% 
  janitor::clean_names() 

## Agregar una nueva columna con una etiqueta de condición
promedio_hdi <- mean(df_indice_desarrollo_humano$hdi_sex_total)
df_indice_desarrollo_humano <- df_indice_desarrollo_humano %>%
  mutate(
    indice_hdi = ifelse(df_indice_desarrollo_humano$hdi_sex_total > promedio_hdi, "alto_indice", "bajo_indice")
  )

## Elaboración de los gráficos
paleta_verano <- c("#d00000", "#f4631e", "#ff9f00", "#309898")
## 1
observaciones_por_pais <- df_indice_desarrollo_humano %>%
  group_by(entity_name) %>%
  reframe(
    total_observaciones = n()
  ) %>%
  ungroup() 
ggplot(data = observaciones_por_pais,
       aes(x = entity_name,
           y = total_observaciones)) +
  geom_bar(stat = "identity", fill= "#d00000") + 
  labs(
    x = "País",
    y = "Número de Observaciones") 
## 2
ggplot(data = df_indice_desarrollo_humano,
       mapping = aes(x = entity_name, 
                     y = hdi_sex_total)) +
  geom_boxplot(fill = paleta_verano) + 
  labs(
    x = "País",
    y = "Índice de Desarrollo Humano")
## 3
ggplot(data = df_indice_desarrollo_humano) +
  geom_histogram(aes(x = hdi_sex_total),
                 bins = 8) + 
  labs(
    x = "Índice de Desarrollo Humano",
    y = "Frecuencia Absoluta")
## 4
ggplot(data = df_indice_desarrollo_humano) +
  geom_histogram(aes(x = hdi_sex_total),
                 bins = 8) + 
  labs(
    x = "Índice de Desarrollo Humano",
    y = "Frecuencia Absoluta") + 
  facet_wrap(~entity_name)
## 5
ggplot(data = df_indice_desarrollo_humano,
       aes(x = hdi_sex_total, 
           fill = entity_name,
           color = entity_name)) +
  geom_density(alpha = 0.5) +
  labs(
    x = "Índice de Desarrollo Humano",
    y = "Densidad") +
  scale_color_manual(values = paleta_verano,
                     name = "País") +
  scale_fill_manual(values = paleta_verano,
                    name = "País")
## 6
ggplot(data = df_indice_desarrollo_humano,
       mapping = aes(x = year,
                     y = hdi_sex_total,
                     color = entity_name)) +
  geom_line() +
  scale_color_manual(values = paleta_verano,
                     name = "País") + 
  labs(
    x = "Año",
    y = "Índice de Desarrollo Humano")
# La personalización de los gráficos fue realizado con la ayuda del LLM "Gemini" en base al trabajo de 
# mitad de curso

## Tabla en GT
df_max_hdi <- df_indice_desarrollo_humano %>%
  group_by(entity_name) %>%
  slice_max(n = 1, order_by = hdi_sex_total, with_ties = FALSE) %>% 
  select(entity_name, year, hdi_sex_total) %>%
  ungroup() 
tabla_max_hdi <- df_max_hdi %>%
  gt() %>%
  tab_header(
    title = md("**Máximo Índice de Desarrollo Humano (IDH) por País**"),
    subtitle = "Valores máximos alcanzados por cada entidad y el año correspondiente."
  ) %>%
  cols_label(
    entity_name = "País",
    year = "Año del Máximo IDH",
    hdi_sex_total = "Máximo IDH"
  ) %>%
  fmt_number(
    columns = hdi_sex_total,
    decimals = 3 
  ) %>%
  cols_align(
    align = "left",
    columns = entity_name
  ) %>%
  cols_align(
    align = "center",
    columns = c(year, hdi_sex_total)
  )
tabla_max_hdi
# Esta parte se hizo con la asistencia de "Gemini"