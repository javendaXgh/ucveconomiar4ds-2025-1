library(readxl)
library(tidyverse)

# 1era parte/ descarga datos e inspeccion
# tdc <- read_excel('taller_datosBCV/2025_Tr2.xls')
# download.file('https://www.bcv.org.ve/sites/default/files/EstadisticasGeneral/2_1_2b25_smc.xls','taller_datosBCV/2025_Tr2.xls')


download.file('https://www.bcv.org.ve/sites/default/files/precios_consumidor/4_5_7_0.xls','INPC.xls')



View(tdc)
INPC <- read_excel('INPC.xls')%>%
  slice(-1:-6)

View(INPC)
apply(INPC,2, class)

# formatos
names(INPC) <- c('fecha','indice','var')

meses_es <- c("enero", "febrero", "marzo", 
              "abril", "mayo", "junio",
              "julio", "agosto", "septiembre", 
              "octubre", "noviembre", "diciembre")

# https://rstudio.github.io/cheatsheets/strings.pdf

INPC%>%
  print(n=15)

df_inpc <- INPC%>%
  mutate(fecha= str_remove_all(fecha,'[:punct:]'),
         fecha= str_to_lower(fecha),
         indice= as.numeric(indice),
         var= as.numeric(var))%>%
  mutate(year_extract= ifelse(str_detect(fecha,'^[:digit:]'),fecha,NA ))%>%
  mutate(year_extract= as.numeric(year_extract))%>%
  fill(year_extract, .direction = "down")%>%
  filter(!is.na(indice))%>%
  mutate(num_mes= match(fecha, meses_es),
         var2= (indice/lead(indice)-1)*100,
         fecha_nva=paste0(year_extract,'-',num_mes,'-01'),
         fecha_nva=as_date(fecha_nva))%>%
  select( fecha_nva, indice, var2, var)%>%
  print(n=15)
  
INPC%>%
  mutate(fecha= str_remove_all(fecha,'[:punct:]'),
         fecha= str_to_lower(fecha),
         indice= as.numeric(indice),
         var= as.numeric(var))%>%
  mutate(year_extract= ifelse(str_detect(fecha,'^[:digit:]'),fecha,NA ))%>%
  mutate(year_extract= as.numeric(year_extract))%>%
  fill(year_extract, .direction = "down")%>%
  print(n=15)
df_inpc%>%
  mutate(dia_semana= wday(df_inpc$fecha_nva) )
# https://evoldyn.gitlab.io/evomics-2018/ref-sheets/R_lubridate.pdf


# ordenar por fechas,

### apoyos toy examples  
# fill
sales <- tibble::tribble(
  ~quarter, ~year, ~sales,
  "Q1",    2000,    66013,
  "Q2",      NA,    69182,
  "Q3",      NA,    53175,
  "Q4",      NA,    21001,
  "Q1",    2001,    46036,
  "Q2",      NA,    58842,
  "Q3",      NA,    44568,
  "Q4",      NA,    50197,
  "Q1",    2002,    39113,
  "Q2",      NA,    41668,
  "Q3",      NA,    30144,
  "Q4",      NA,    52897,
  "Q1",    2004,    32129,
  "Q2",      NA,    67686,
  "Q3",      NA,    31768,
  "Q4",      NA,    49094
)

sales %>% 
  fill(year)

sales %>% 
  fill(year,.direction = "up")

# lag
df <- tibble::tibble(
  valor = c(10, 20, 30, 60)
)

df %>%
  mutate(razon = valor / lag(valor))

# lead
df %>%
  mutate(razon = valor / lead(valor))


df_toy_bad <- data.frame(a=c(2024, NA, NA, 2023, NA, NA, 2022),
                     b= c(1:7))

df_toy_correct <- data.frame(a=c(2024, 2024, 2024, 2023, 2023, 2023, 2022),
                         b= c(1:7))


library(dplyr)
library(tidyr)

df_toy_bad <- data.frame(a=c(2024, NA, NA, 2023, NA, NA, 2022),
                         b= c(1:7))

df_toy_correct <- df_toy_bad %>%
  fill(a, .direction = "down") # Por defecto, .direction = "down" rellena hacia abajo


