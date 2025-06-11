##########################################################################################
# usar paquete pdfetch
# https://cran.r-project.org/web/packages/pdfetch/pdfetch.pdf
# install.packages('pdfetch')
# Fetch Economic and Financial Time Series Data from Public Sources

# paquete alternativo
#https://cran.r-project.org/web/packages/pedquant/pedquant.pdf
##########################################################################################

##########################################################################################
######## Cargar librerías                                                          #######
##########################################################################################
library(pdfetch)
library(tidyverse)
library(xts)
library(apexcharter)
##########################################################################################
######## Primera Parte: comprender los formatos de datos wide(ancho) y long(largo) #######
##########################################################################################

# Crear un tibble ancho (wide)
## 1 er caso
datos_ancho <- tribble(
  ~nombre, ~edad_2015, ~edad_2016, ~edad_2017,
  "Juan",   20,         21,         22,
  "Ana",    23,         24,         25
)


datos_ancho

# Crear un tibble largo (long)
datos_largo <- tribble(
  ~nombre, ~año, ~edad,
  "Juan",   2015, 20,
  "Juan",   2016, 21,
  "Juan",   2017, 22,
  "Ana",    2015, 23,
  "Ana",    2016, 24,
  "Ana",    2017, 25
)

datos_largo

# Convertir datos_ancho a datos_largo
datos_largo <- datos_ancho %>%
  pivot_longer(cols = starts_with("edad"),
               names_to = "año",
               values_to = "edad")

datos_largo

# Convertir datos_largo a datos_ancho
datos_ancho <- datos_largo %>%
  pivot_wider(names_from = año,
              values_from = edad)

datos_ancho

## 2 do caso: ventas por mes
# Datos ancho (ejemplo)

ventas_ancho <- tribble(
  ~producto, ~enero, ~febrero, ~marzo,
  "A",        100,    200,      150,
  "B",        120,    220,      180
)

ventas_ancho

# Convertir a formato largo
ventas_largo <- ventas_ancho %>%
  pivot_longer(cols = starts_with("enero"),
               names_to = "mes",
               values_to = "venta")

ventas_largo


## Calcular promedio de ventas por producto
promedio_ventas <- ventas_largo %>%
  group_by(producto) %>%
  summarize(promedio = mean(venta))

promedio_ventas

## 3 er caso: promedio acciones
precio_acciones <- tibble(
  fecha = as.Date("2024-01-01") + 0:9,
  precio_x = rnorm(10, 0, 1),
  precio_y = rnorm(10, 0, 2),
  precio_z = rnorm(10, 0, 4)
)

precio_acciones


# versión anterior con gather
precio_acciones %>% 
  gather("accion_nombe",
         "precio_accion",
         -fecha)

# versión anterior con gather
precio_acciones %>% 
  gather("accion_nombe",
         "precio_accion",
         -fecha)

# acciones pivot_longer
precio_acciones %>% 
  pivot_longer(cols = starts_with("precio"),
               names_to = "accion_nombre",
               values_to = "precio_accion")%>%
  print(n=23)


## 4to caso: relig income
# caso relig income
head(relig_income)

relig_income %>%
  pivot_longer(cols =!religion, 
               names_to = "income", 
               values_to = "count")


## 5 to caso: Éxitos Billoboard
# caso éxitos Billboard
head(billboard)
dim(billboard)

billboard %>%
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    # names_prefix = "wk",
    values_to = "rank",
    values_drop_na = TRUE
  )

## remover prefijos wk
billboard %>%
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_prefix = "wk",
    values_to = "rank",
    values_drop_na = TRUE
  )



##########################################################################################
# Segunda Parte
# Obtener valores acciones con pdfetch_YAHOO                                       #######
##########################################################################################

# listado de identificadores (tickers) de acciones en el siguiente enlace
# https://www.nasdaq.com/market-activity/stocks/screener

# descarga valores en formato zoo
valor_apple <- pdfetch_YAHOO(c("AAPL"))

# procesamiento de datos descargados
valor_apple <- valor_apple%>%
  as_tibble()%>%
  mutate(accion= 'Apple',
         codigo= 'AAPL')%>%
  bind_cols( fecha= index(valor_apple))


df_valor_apple <- valor_apple%>%
  select(fecha, AAPL.close,AAPL.volume )%>%
  mutate(mes= month(fecha),
         year= year(fecha),
         dia= yday(fecha),
         mes_year= paste0(mes,'-',year))%>%
  filter(year>2020)


# write_csv(df_valor_apple,'data/df_valor_apple.csv')
library(plotly)
gr_apple <- ggplot(df_valor_apple, 
       aes(x=dia,
           y=AAPL.close,
           # group = year,
           color=factor(year)))+
  geom_line()+
  geom_smooth()

gr_apple%>%
  ggplotly()
names(valor_apple) <- c('open','high','low',
                        'close','adjclose', 'volume',
                        'accion','codigo','fecha')


View(head(df_valor_apple))

funcion_procesar_accion <- function(codigop, 
                                    accionp){
  # argumentos:
  # codigop: codigo de la accion
  # accionp: nombre de la accion
  # ejemplo: funcion_procesar_accion('AAPL','Apple')
  # Descarga los datos de la accion segun el codigo
  # Retorna un data frame con los datos de la accion
  
  datos_descarga <- pdfetch_YAHOO(codigop)
  
  df_datos <- datos_descarga%>%
    as_tibble()%>%
    mutate(accion= accionp,
           codigo= codigop,
           fecha_posixct=as.POSIXct(datos_descarga))%>%
    bind_cols( fecha= index(datos_descarga))
  
  
  names(df_datos) <- c('open','high','low',
                       'close','adjclose', 'volume',
                       'accion','codigo','fecha_posixct','fecha')
  
  df_datos
}


# descarga valores 

valor_apple <- funcion_procesar_accion('AAPL','Apple')

valor_bitcoin <- funcion_procesar_accion('BTC-USD','Bitcoin')

head(valor_bitcoin)

valor_nvidia <- funcion_procesar_accion('NVDA','NVIDIA')

valor_google <- funcion_procesar_accion('GOOG','Google')

valor_oracle <- funcion_procesar_accion('ORCL','Oracle')


# unificar en una data frame valores de las acciones descargados
valores_acciones <- bind_rows(valor_apple,
                              valor_bitcoin,
                              valor_nvidia,
                              valor_google,
                              valor_oracle)

dim(valores_acciones)
View(head(valores_acciones))

valores_acciones_pivotlon <- valores_acciones%>%
  select(10,1:7)%>%
  pivot_longer(cols = c('open','high','low',
                        'close','adjclose'),
               names_to = "tipo_valor",
               values_to = "valor")


dim(valores_acciones_pivotlon)
View(head(valores_acciones_pivotlon))

ggplot(data= filter(valores_acciones_pivotlon, 
                    fecha>='2025-01-01' &
                      accion %in% c('NVIDIA')),
       aes(x=fecha, 
           y= valor,
           color= tipo_valor,
           group =tipo_valor))+
  geom_line()

ggplot(data= filter(valores_acciones_pivotlon, 
                    fecha>='2025-05-01' & 
                      accion %in% c('Apple','Google')),
       aes(x=fecha, 
           y= valor,
           color= tipo_valor,
           group =interaction(accion,tipo_valor)))+
  geom_line()

ggplot(data= filter(valores_acciones_pivotlon, 
                    fecha>='2025-05-01' & 
                      accion %in% c('Apple','Google')&
                      tipo_valor=='high'),
       aes(x=fecha, 
           y= valor,
           color= accion,
           group = accion))+
  geom_line()


#
# saveRDS(valores_acciones,'dvalores_acciones.rds')

apex(
  data=filter(valores_acciones,
              fecha>"2025-01-01"& accion=='Bitcoin'), 
  aes(x = fecha_posixct, 
      open = open, 
      close = close, 
      low = low, 
      high = high),
  type = "candlestick")%>%
  ax_yaxis(decimalsInFloat = 0,
           title = list(text = "Precio en USD"),
           labels = list(formatter = format_num("~s", locale = "es-ES")))


#?format_num  formatos en ejes
library(apexcharter)
apex(
  data=filter(valores_acciones, fecha>"2025-01-01"& accion=='Bitcoin'), 
  aes(x = fecha_posixct, 
      open = open, 
      close = close, 
      low = low, 
      high = high),
  type = "candlestick")%>%
  ax_yaxis(decimalsInFloat = 0,
           title = list(text = "Precio en USD"),
           labels = list(formatter = format_num("$,.2f")))%>%
  ax_chart(defaultLocale = "es")
