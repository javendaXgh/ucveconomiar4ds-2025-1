
################x
gama_lista <- read_html('https://gamaenlinea.com/es/despensa/c/A0101?currentPage=12')

# via clase vista en página
gm_ls_url <- gama_lista%>%
  html_nodes('.product-item a')%>%
  html_attr('href')%>%
  unique()

gm_ls_url <- paste0('https://gamaenlinea.com/',gm_ls_url)

gm_ls_url[1]

gama_producto <- read_html(gm_ls_url[1])

#nombre producto
gama_producto%>%
  html_nodes('h1')%>%
  html_text()%>%
  unique()

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


# funcion extraccion
extrar_datos_gama <- function(url_visita){
  producto <- read_html(url_visita)
  

  nombre <- producto %>%
    html_nodes('h1') %>%
    html_text() %>%
    unique()
  
  precio <- producto %>%
    html_nodes('.mb-0 .price') %>%
    html_text()%>%
    stringr::str_replace_all(',', '.') %>%
    stringr::str_replace_all(' Ref. ', '') %>%
    stringr::str_trim()%>%
    as.numeric()
  
  iva <- producto %>%
    html_nodes('.taxes') %>%
    html_text()
  
  if(length(iva)==0){
    iva=NA
  }
  
  precio_total <- producto %>%
    html_nodes('.total span')%>%
    html_text()%>%
    .[1] %>%
    stringr::str_replace_all(',', '.') %>%
    stringr::str_replace_all('Total Ref. ', '') %>%
    stringr::str_trim()%>%
    as.numeric()
  
  promocion <- producto %>%
    html_nodes('.eg-product-promotion') %>%
    html_text()
  
  if(length(promocion)==0){
    promocion=NA
  }
  
  detalle <- producto %>%
    html_nodes('.active .container') %>%
    html_text()%>%
    .[1] # Selecciona el primer elemento, ya que puede haber varios
  
  if(length(detalle)==0){
    detalle=NA
  }
  list(nombre, 
             precio, 
             iva, 
             precio_total, 
             promocion, 
             detalle,
             fecha=Sys.Date(),
             hora= Sys.time())
}


url_visita <- "https://gamaenlinea.com/es/yogurt-griego-patilla-yolo-150-gr/p/30010322"

extrar_datos_gama(url_visita_demo)
