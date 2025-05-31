#tarea 3 

#instalamos el paquete WDI, Indicadores de Desarrollo Mundial
#install.packages('WDI')

library(tidyverse)
library(WDI)

#obtenemos nuestro primer conjunto de datos
data.rec = WDI(indicator='EG.FEC.RNEW.ZS')
data.rec

# Observación= evita usar el punto al nombrar variables. Si bien es permitido,
# por un detalle algo largo de explicar, es mejor no hacerlo, corresponde a un tema de 
# buenas prácticas según algo así como una escuela de programación en R, no obstante hay 
# otras escuelas que sí lo hacen. Por eso te decía que es un tema algo largo de explicar

#indicador seleccionado 'consumo de energia renovable'
#abreviado: rec 'siglas en ingles'
#asignamos los datos descargados
df_consumo_energia_renovable <- data.rec

#generamos una tabla resumen 
summary(data.rec)

#filtramos los paises de mercosur
mercosur_paises <- c('ARG','BRA','PY','URY','VEN')

df_mercosur_paises = WDI (indicator='EG.FEC.RNEW.ZS', country= mercosur_paises)
df_mercosur_paises

#generamos una trabla resumen para el subconjunto de mercorsur
summary(df_mercosur_paises)

#odernamos los datos de mercosur, ordenados de forma ascendente
sort=(df_mercosur_paises$EG.FEC.RNEW.ZS)
# observación: hay una función que se llama `sort` y no es bueno llamar a una variable
# por el mismo nombre de una función ya que se pueden generar conflictos o sobreescrituras
# Pudieras llamar a esa variable, por ejemplo, paises_ordenados. Igualmente acá no los llegas
# a ordenar. Creo que esto es más o menos lo que querías hacer


df_mercosur_paises_ord_asce <- df_mercosur_paises %>%
  arrange('EG.FEC.RNEW.ZS')

#vamor a indentificar los valores extremos de mercorsur
#buscamos el pais con valor monimo
min_pais_mercorsur<- df_mercosur_paises %>%
  filter(EG.FEC.RNEW.ZS == min(EG.FEC.RNEW.ZS, na.rm = TRUE)) %>%
  pull(country)
min_pais_mercorsur


#buscamos el valor minimo

min_valor_pais_mercosur<- df_mercosur_paises_ord_asce %>%
  filter(EG.FEC.RNEW.ZS == min(EG.FEC.RNEW.ZS, na.rm= TRUE))
min_valor_pais_mercosur

#ahora hacemos los pasos para buscar el [ais y el valor maximo
max_pais_mercosur <- df_mercosur_paises %>%
  filter(!is.na(EG.FEC.RNEW.ZS)) %>%
  filter(EG.FEC.RNEW.ZS == max(EG.FEC.RNEW.ZS, na.rm = TRUE)) %>%
  pull (country)
max_pais_mercosur

#en este punto me guie por una recomendacion de chatgtp
#me indico colocar el !ls.na para eliminar los valores faltantes antes de comprar
#probando sin la recomendacion de la IA
max_pais_mercosur_seg_ej <- df_mercosur_paises %>%
  filter(EG.FEC.RNEW.ZS == max(EG.FEC.RNEW.ZS, na.rm = TRUE)) %>%
  pull (country)

max_pais_mercosur_seg_ej
# quitando ese comando me arroja el mismo resultado, no veo la diferencia en realida
#buscamos el valor maximo

#el valor maximo 
max_valor_pais_mercosur<- df_mercosur_paises_ord_asce %>%
  filter(EG.FEC.RNEW.ZS == max(EG.FEC.RNEW.ZS, na.rm= TRUE))
max_valor_pais_mercosur


#ahora el paso 7, valores resultantes

min_mercorsur<- c(min_pais_mercorsur, min_valor_pais_mercosur)
min_mercorsur

max_mercsur <- c(max_pais_mercosur,max_valor_pais_mercosur )
max_mercsur


## observación: acá tenemos dos asuntos a resolver:
###1) para el valor mínimo que buscaste resulta que existen dos apariciones de tal valor, 
### y por lo tanto, no te da de resultado un vector atómico. Solo para que lo tengas
### presente

###2) en este código:
min_mercorsur<- c(min_pais_mercorsur, min_valor_pais_mercosur)
# la variable `min_pais_mercorsur` es el vector correcto con los nombres del país
# pero la variable `min_valor_pais_mercosur` es una dataframe y no un vector.
# si aplicas colocar en un vector una data frame y otro vector, el resultado obtenido
# no es una estructura de datos que sea de utilidad. Ve el resultado en pantalla de 
# ejecutar
c(min_pais_mercorsur, min_valor_pais_mercosur)
# y te darás cuenta que es un tanto extraño lo que se ve en la consola
# creo que se te pasó y el que debías agregar era `max_pais_mercosur_seg_ej` que si
# era coherente con lo que estabas haciendo
c(min_pais_mercorsur, max_pais_mercosur_seg_ej)

# no obstante, esta parte, no era solicitada en el ejercicio. Con crear las dos variables
# ya habías cumplido pero aprovecho para hacerte el comentario
#########################################################################

#realizamos el enunciadp 8, consiste en ralizar el filtrado para venezuela

#creamos una df para venezuela

df_datos_venezuela<- c('VEN') 

# observación: no es conveniente el nombre que estás indicando para el nombre del país
# ya que pareciera que se refiere a una data frame y no a un vector atómico con el nombre 
# de Venezuela

df_venezuela_pais = WDI (indicator='EG.FEC.RNEW.ZS', country= df_datos_venezuela)
df_venezuela_pais

#realizamos una tabla resumen para venezuela

# observación: `df_venzuela_pais` no es el nombre que colocaste para la df con los datos
# que se llama `df_venezuela_pais`, por lo tanto no te va a arrojar nada en pantalla
# voy a agregar una linea adicional para crear la df_venzuela_pais
df_venzuela_pais <- df_venezuela_pais
summary(df_venzuela_pais)


#odemanos los datos de forma ascendente
sort=(df_venzuela_pais$EG.FEC.RNEW.ZS)
# la misma observacion anterior. No uses palabras de funciones para nombrar variables

df_venezuela_pais_ord_ascd <- df_venezuela_pais %>%
  arrange('EG.FEC.RNEW.ZS')
df_venezuela_pais_ord_ascd
#idenficamos los valores extremos
#buscamos el valor minimo para venezuela

min_venzuela_valor<- df_venezuela_pais_ord_ascd %>%
  filter(EG.FEC.RNEW.ZS == min(EG.FEC.RNEW.ZS, na.rm= TRUE))

# observación: te faltó colocar pull para extraer solo el nombre 
min_venzuela_valor

#bucamos el valor maximo para venezuela
max_venezuela_valor<- df_venezuela_pais_ord_ascd %>%
  filter(EG.FEC.RNEW.ZS == max(EG.FEC.RNEW.ZS, na.rm= TRUE))
max_venezuela_valor
# observación: te faltó colocar pull para extraer solo el nombre 

#le asignamos variables

min_venezuela_rec<- c(min_venzuela_valor)
min_venezuela_rec
max_venezuela_rec<- c(max_valor_pais_mercosur)
max_venezuela_rec
## revisa los comentarios anteriores sobre unir dataframes de esta manera
## ya que no es lo correcto

###############################################################################
#Creamos una data frame combinada

# Observación: nada de esto era necesario hacerlo. ya estaba hecho en los pasos anteriores

resultado_mercosur <- df_mercosur_paises %>%
  filter(!is.na(EG.FEC.RNEW.ZS)) %>%
  filter(EG.FEC.RNEW.ZS == min(EG.FEC.RNEW.ZS) | EG.FEC.RNEW.ZS == max(EG.FEC.RNEW.ZS)) %>%
  mutate(
    grupo = "Mercosur",
    tipo = ifelse(EG.FEC.RNEW.ZS == min(EG.FEC.RNEW.ZS), "Mínimo", "Máximo")
  ) %>%
  select(pais = country, valor = EG.FEC.RNEW.ZS, grupo, tipo)
resultado_mercosur

resultado_venezuela <- df_venezuela_pais %>%
  filter(!is.na(EG.FEC.RNEW.ZS)) %>%
  filter(EG.FEC.RNEW.ZS == min(EG.FEC.RNEW.ZS) | EG.FEC.RNEW.ZS == max(EG.FEC.RNEW.ZS)) %>%
  mutate(
    grupo = "Venezuela",
    tipo = ifelse(EG.FEC.RNEW.ZS == min(EG.FEC.RNEW.ZS), "Mínimo", "Máximo")
  ) %>%
  select(pais = country, valor = EG.FEC.RNEW.ZS, grupo, tipo)
resultado_venezuela

#para esre apartdo me guie de una IA porque no entendi que valores tenia que tomar 
#para unificar las df de con solo los valores maximos de mercosur y de venzuela
#por lo que etendi fue que volvi a hacer el proceso de filtraldo tanto para la
#organizacion como para venezuela
#si no le incluia !is.na que era para eliminar los valores faltantes me saltaba un 
#error que no terminada de comprender, por eso las deje aunque no es lo que hemos visto
#en clase.
#creo que el lunes que falta se refleja en mis fallas en esta tarea

## obsercvación: esto sí era lo correspondiente
#unificamos las df

df_resultados <- bind_rows(resultado_mercosur, resultado_venezuela)
df_resultados

  