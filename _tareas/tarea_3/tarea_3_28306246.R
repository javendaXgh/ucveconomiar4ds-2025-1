#teniendo el paquete WDI instalado cargo el paquete junto a dplyr y janitor
library(WDI)
library(dplyr)
library(janitor)
#descargo datos de interes del indicador economico y limpio los nombres de las variables
df_inflacion <- WDI(country = 'all',
    indicator = 'NY.GDP.DEFL.KD.ZG',
    start = 1960,
    end = 2023,
    extra = FALSE,
    cache = NULL,
    latest = NULL,
    language = 'en') %>%
  clean_names()
# determino la tabla resumen de la inflacion por deflactor
summary(df_inflacion)
#creo una variable con los paises del mercosur
iso_mercosur <- c('AR', 'BR', 'PY', 'UY', 'BOL')
#filtro el dataframe por paises del mercosur y limpio
df_inflacion_mercosur <- df_inflacion %>%
  filter(iso2c %in% iso_mercosur)
df_inflacion_mercosur
# ordeno de acuerdo a la variable inflacion
df_inflacion_mercosur_cl <- df_inflacion_mercosur %>%
  arrange(ny_gdp_defl_kd_zg)
  
# Resumen de Mercosur
summary(df_inflacion_mercosur)
# valores minimos y maximos del mercosur
max_mercosur_inf <- df_inflacion_mercosur_cl %>%
filter(ny_gdp_defl_kd_zg == max(df_inflacion_mercosur_cl$ny_gdp_defl_kd_zg, na.rm = TRUE)) #filtro la observacion que tenga el valor maximo del mercosur excluyendo valores ausentes del calculo
max_mercosur_inf
min_mercosur_inf <- df_inflacion_mercosur_cl %>%
  filter(ny_gdp_defl_kd_zg == min(df_inflacion_mercosur_cl$ny_gdp_defl_kd_zg, na.rm = TRUE)) #filtro la observacion que tenga el valor minimo del mercosur excluyendo valores ausentes del calculo
min_mercosur_inf

# Observación: acá faltó asignar a una variable los valores extraídos, así como que fuese
# un vector y no una data frame. Si hay dudas sobre lo indicado, por favor conversar conmigo
# para evaluar las omisiones.


# filtro valores de Venezuela, los limpio y los ordeno
inf_venezuela <- df_inflacion %>%
  filter(iso2c == 'VE') %>%
  arrange(ny_gdp_defl_kd_zg)
inf_venezuela
#Resumen de Venezuela
summary(inf_venezuela)
# valores minimos y maximos de Venezuela
max_vnzla_inf <- inf_venezuela %>%
  filter(ny_gdp_defl_kd_zg == max(inf_venezuela$ny_gdp_defl_kd_zg, na.rm = TRUE)) #filtro la observacion que tenga el valor maximo de Venezuela excluyendo valores ausentes del calculo
max_vnzla_inf
min_vnzla_inf <- inf_venezuela %>%
  filter(ny_gdp_defl_kd_zg == min(inf_venezuela$ny_gdp_defl_kd_zg, na.rm = TRUE)) #filtro la observacion que tenga el valor minimo de Venezuela excluyendo valores ausentes del calculo
min_vnzla_inf
# Uno los data frames de Venezuela y mercosur
df_mercosur_vnzla <- rbind(inf_venezuela, df_inflacion_mercosur_cl)
df_mercosur_vnzla

# la función rbind no ha sido, si mal no recuerdo, que sea de uso recomendado en el curso
# la que se debe usar es bind_rows, pero ya que tienes conocimientos previo de R, entiendo
# que la estés usando

