library(rvest)
library(tidyverse)

datos_listado <- read_html('https://gamaenlinea.com/es/despensa/c/A0101?currentPage=13')

datos_listado%>%
  html_elements('.product-item a') %>%
  html_attr('href')%>%
  unique(.)

enlaces_pruductos <- datos_listado%>%
  html_elements('.product-item a') %>%
  html_attr('href')%>%
  unique(.)

enlaces_pruductos

# agregar prefijo 'https://gamaenlinea.com/'
enlaces_pruductos <- paste0('https://gamaenlinea.com/',enlaces_pruductos)

# incializar la variable con todos los productos a descargar según sección
enlaces_productos <- character()

for(i in 1:13){

  
  # gama a veces en la consulta no manda la información. en el while se hace una adaptación 
  # para que se tenga que corroborar que contiene info el body
  
  while(length(verificador[[1]])==0 & i<5){
    url_visitar <- paste0('https://gamaenlinea.com/es/licores/c/A0101?currentPage=',i)
    print(paste('intento descarga info',j))
    j=j+1
    
    datos_listado <- read_html(url_visitar)
    
    verificador <- datos_listado%>%
      html_nodes('body')%>%
      html_attrs()
  }
  
  enlaces_pruductos_nuevo <- datos_listado%>%
    html_elements('.product-item a') %>%
    html_attr('href')%>%
    unique(.)
  
  # contruir enlace descarga
  enlaces_pruductos_nuevo <- paste0('https://gamaenlinea.com/',enlaces_pruductos_nuevo)
  
  # agregar a enlaces_productos los nuevos productos agregados
  enlaces_productos <- unique(c(enlaces_productos,enlaces_pruductos_nuevo))
  
  Sys.sleep(.5)
}
# to be continued....


############## Caso BCV
library(rvest)
library(tidyverse)
url_datos_bcv_tdc <- 'https://www.bcv.org.ve/estadisticas/tipo-cambio-de-referencia-smc'

# lectura mediante rvest
read_html(url_datos_bcv_tdc)
# arroja problema:
#Error in open.connection(x, "rb") : cannot open the connection


# resolver problema mediante rvest Caused by error in `curl::curl_fetch_memory()`: ! SSL peer certificate or SSH remote key was not OK [www.bcv.org.ve]: SSL certificate problem: unable to get local issuer certificate
# en vez de descargar datos con rvest se usa la librería httr2
library(httr2)
datos_bcv_tdc <- request(url_datos_bcv_tdc) %>%
  req_options(ssl_verifyhost = FALSE, 
              ssl_verifypeer = FALSE) %>% # DESACTIVAR VERIFICACIÓN SSL
  req_perform() %>%
  resp_body_html()


datos_bcv_tdc%>%
  html_elements('.views-field-field-diario a')%>%
  html_attr('href')%>%
  unique(.)
  


# extracción de enlace última página
enlace_ultimo <- datos_bcv_tdc%>%
  html_elements('.pager-last a')%>%
  html_attr('href')%>%
  unique(.)
  
# extracción de cdad (número) de páginas a visitar
indice_final <- str_remove_all(enlace_ultimo,
               "\\/estadisticas\\/tipo\\-cambio-de-referencia-smc\\?page\\=")%>%
  as.numeric()

# crear directorio de descarga
dir.create('bcv')

# loop de descarga
for(i in 1:(indice_final+1)){
  print(i)
  url_datos_bcv_tdc <- paste0("https://www.bcv.org.ve/estadisticas/tipo-cambio-de-referencia-smc?page=",i-1)
  
  datos_bcv_tdc <- request(url_datos_bcv_tdc) %>%
    req_options(ssl_verifyhost = FALSE, ssl_verifypeer = FALSE) %>% # DESACTIVAR VERIFICACIÓN SSL
    req_perform() %>%
    resp_body_html()
  
  # extraer links de descargas
  listado_libros <- datos_bcv_tdc%>%
    html_elements('.views-field-field-diario a')%>%
    html_attr('href')%>%
    unique(.)
  
  # loop anidado para descarga de cada libro
  for(j in 1:length(listado_libros)){ #
    print(paste('descarga archivo',i,'_',j))
    
    # resolver nombre de archivo a asignar
    download.file(listado_libros[j],
                  paste0('bcv/',i,'_',j,'.xls'))
  }
}
