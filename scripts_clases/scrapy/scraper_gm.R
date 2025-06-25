# Ejemplo scraper

# cargar librerias
library(rvest)
library(tidyverse)

# Definir la URL del sitio web con listado de productos

#' https://gamaenlinea.com/es/despensa/c/A0101?currentPage=13'
# se recomienda revisar la cantidad de páges que contiene 
# la correspondiente sección. Este dato igualmente se puede obtener de forma automatizada
# en este caso supongamos que hay 13 páginas con productos

# Sobre cada una de estas páginas vamos a iterar mediante un loop
# y extraer los datos de cada enlace de producto, el cual luego visitaremos

# Para almacenar los enlaces necesitamos un objeto donde los almacenaremos
# en el caso de este supermercado, cosa que puede pasar en otros casos
# a veces cuando se hace la descarga y lectura del contenido, no es satisfactorio
# por lo cual se hizo un chequeo de que efectivamente se descargue la info y sólo si
# se tiene éxito, es que se procede a la lectura, en caso contrario se vuelve a reintentar
# realizar la descarga de los datos n veces, pudiendo establecer el n por parte del usario
# En el caso de Gamma pareciera que con 5 intentos como máximo, es suficiente

# ejemplo de extracción de enlaces fuera del loop
datos_listado <- read_html('https://gamaenlinea.com/es/despensa/c/A0101?currentPage=13')

datos_listado%>%
  html_elements('.product-item a') %>%
  html_attr('href')%>%
  unique(.)

enlaces_pruductos <- datos_listado%>%
  html_elements('.product-item a') %>%
  html_attr('href')%>%
  unique(.)

# añadir prefijo con dominio de la página 
paste0('https://gamaenlinea.com/',enlaces_pruductos)

# si el código anterior retorna character(0) es porque no se descargó correctamente y debe 
# reintentar correr la línea de código anterior read_html

# Ahora vamos a iterar sobre las páginas y extraer los enlaces de cada una de ellas

# Definir el número de páginas a iterar
num_paginas <- 13
# Crear un vector para almacenar los enlaces de productos
enlaces_productos <- character()

# Iterar sobre las páginas
for (i in 1:num_paginas) {
  # Construir la URL de la página actual
  url_visitar <- paste0('https://gamaenlinea.com/es/despensa/c/A0101?currentPage=', i)
  
  # Inicializar un verificador para comprobar si se descargó correctamente la página
  verificador <- list(named= character(0)) # esta estructura fue evaluada para evitar errores
  print(paste('visita página producto',i)) # contador para mostrar en qué página se está visitando
  
  j=1 # contador para mostrar cuántas veces se hace la consulta intentando hacer la descarga
  # igualmente j sirve para no exceder un numero n de intentos de lectura
  # lo que siempre es recomendado cuando se trabaja con un while ya que sino
  # se coloca pudiera intentar infinitamente hacer la descarga de los datos
  # en este caso se establece un máximo de 5 intentos
  
  # Leer el contenido de la página
  while(length(verificador[[1]])==0 & j<5){
    
    print(paste('intento descarga info',j))
    j=j+1 # se añade 1 a j para contar los intentos de descarga
    
    datos_listado <- read_html(url_visitar)
    
    verificador <- datos_listado%>%
      html_nodes('body')%>%
      html_attrs()
    # si el verificador es un objeto vacío, significa que no se 
    # descargó correctamente y vuelve a intentar hacer la descarga
    
    # si el verificador no es un objeto vacío, quiere decir que se puede pasar 
    # a la siguiente fase
    
  }

  # Extraer los enlaces de productos
  enlaces_pagina <- datos_listado %>%
    html_elements('.product-item a') %>%
    html_attr('href') %>%
    unique(.)
  
  # Añadir prefijo con dominio de la página
  enlaces_pagina <- paste0('https://gamaenlinea.com/', enlaces_pagina)
  
  # Almacenar los enlaces en el vector principal
  enlaces_productos <- c(enlaces_productos, enlaces_pagina)
}


# Eliminar duplicados
enlaces_productos <- unique(enlaces_productos)

# Mostrar cdad enlaces de productos
length(enlaces_productos)

### sección descarga información de productos
gama_producto <- read_html(enlaces_productos[1])


#nombre producto
gama_producto%>%
  html_nodes('h1')%>%
  html_text()%>%
  unique()
# nuevamente, si arroja character 0, intentar hacer la descarga otra vez

# precio
gama_producto%>%
  html_nodes('.mb-0 .price')%>%
  html_text()

# iva
gama_producto%>%
  html_nodes('.taxes')%>%
  html_text()

# precio total y promo
gama_producto%>%
  html_nodes('.total span')%>%
  html_text()%>%
  .[1]

# limpiar texto mediante stringr "Total Ref. 27,54 " 
# remplazar coma por punto y remover "Total Ref. " y espacios
gama_producto%>%
  html_nodes('.total span')%>%
  html_text()%>%
  .[1] %>%
  stringr::str_replace_all(',', '.') %>%
  stringr::str_replace_all('Total Ref. ', '') %>%
  stringr::str_trim()%>%
  as.numeric()

# promocion
gama_producto%>%
  html_nodes('.eg-product-promotion')%>%
  html_text()


# detalle
gama_producto%>%
  html_nodes('.active .container')%>%
  html_text()

url_visitar <- enlaces_productos[1]
# funcion extraccion
extrar_datos_gama <- function(url_visitar){
  
  verificador <- list(named= character(0)) # esta estructura fue evaluada para evitar errores
  j=1 # contador para mostrar cuántas veces se hace la consulta intentando hacer la descarga
  # igualmente j sirve para no exceder un numero n de intentos de lectura
  # lo que siempre es recomendado cuando se trabaja con un while ya que sino
  # se coloca pudiera intentar infinitamente hacer la descarga de los datos
  # en este caso se establece un máximo de 5 intentos
  
  # Leer el contenido de la página
  while(length(verificador[[1]])==0 & j<=5){
    
    print(paste('intento descarga info',j))
    j=j+1 # se añade 1 a j para contar los intentos de descarga
    
    datos_producto <- read_html(url_visitar)
    
    verificador <- datos_producto%>%
      html_nodes('body')%>%
      html_attrs()
    # si el verificador es un objeto vacío, significa que no se 
    # descargó correctamente y vuelve a intentar hacer la descarga
    
    # si el verificador no es un objeto vacío, quiere decir que se puede pasar 
    # a la siguiente fase
    
  }
  
  if(length(verificador[[1]])==0){
    stop('No se pudo descargar la información del producto')
  }
  
  nombre <- datos_producto %>%
    html_nodes('h1') %>%
    html_text() %>%
    unique()
  
  precio <- datos_producto %>%
    html_nodes('.mb-0 .price') %>%
    html_text()%>%
    stringr::str_replace_all(',', '.') %>%
    stringr::str_replace_all(' Ref. ', '') %>%
    stringr::str_trim()%>%
    as.numeric()
  
  iva <- datos_producto %>%
    html_nodes('.taxes') %>%
    html_text()
  
  if(length(iva)==0){
    iva=NA
  }
  
  precio_total <- datos_producto %>%
    html_nodes('.total span')%>%
    html_text()%>%
    .[1] %>%
    stringr::str_replace_all(',', '.') %>%
    stringr::str_replace_all('Total Ref. ', '') %>%
    stringr::str_trim()%>%
    as.numeric()
  
  promocion <- datos_producto %>%
    html_nodes('.eg-product-promotion') %>%
    html_text()
  
  if(length(promocion)==0){
    promocion=NA
  }
  
  detalle <- datos_producto %>%
    html_nodes('.active .container') %>%
    html_text()%>%
    .[1] # Selecciona el primer elemento, ya que puede haber varios
  
  if(length(detalle)==0){
    detalle=NA
  }
  # Crear un data frame con los datos extraídos
  data.frame(nombre, 
       precio, 
       iva, 
       precio_total, 
       promocion, 
       detalle,
       fecha=Sys.Date(),
       hora= Sys.time())
}

# ejemplo de extracción de datos de un producto
extrar_datos_gama(enlaces_productos[1])

# Extraer datos de todos los productos
df_datos_lacteos <- data.frame()

for (enlace in enlaces_productos[1:10]) {
  print(paste('extracción datos producto', enlace))
  datos_producto <- extrar_datos_gama(enlace)
  df_datos_lacteos <- bind_rows(df_datos_lacteos, datos_producto)
}
# Revisar datos de productos descargados

View(df_datos_lacteos)

# Nota: generalmente los scrapers deben ser ajustados a las páginas web
# por lo cual es recomendable revisar la estructura de la página web
# y pueden presentar fallas que deben ser corregidas poco a poco según el caso


######################################################################
# cursos UCAB ejemplo
library(rvest)
library(tidyverse)
ucab_ls <- read_html('https://www.ciapucab.com/oferta/?product-page=0')


# via etiqueta
ucab_ls%>%
  html_nodes('h2')%>%
  html_text()%>%
  unique()

# via clase .
ucab_ls%>%
  html_nodes('.et_pb_title_container')%>%
  html_text()

# via selector gadget
ucab_ls%>%
  html_nodes('.entry-title')%>%
  html_text()


# extracción links
ucab_ls%>%
  html_nodes('a')%>%
  html_attr('href')


# consultado nodos en la página
ucab_ls%>%
  html_nodes('.product a')%>%
  html_attrs()


ucab_ls%>%
  html_nodes('.product a')%>%
  html_attr('href')


# opcion 2. Buscar nombre atributo
ucab_ls%>%
  html_nodes('a')%>%
  html_attrs()

cursos_ls <- ucab_ls%>% #.woocommerce-loop-product__title
  html_nodes(".woocommerce-loop-product__link" )%>%#.woocommerce-LoopProduct-link
  html_attr('href')

info_curso <- read_html('https://www.ciapucab.com/oferta/certificacion-asistente-en-administracion-de-almacenes/')
info_curso%>%
  html_nodes('.et_pb_module_inner span')%>%# html_nodes es igual a html_elements
  html_text()

info_curso%>%
  html_elements('.et_pb_column_3_tb_body')%>%
  html_text()


