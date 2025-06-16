library(rvest)

datos_pagina <- read_html('https://gamaenlinea.com/es/licores/c/A0408?currentPage=0')

View(datos_pagina$node)
enlaces_visitar <- datos_pagina%>%
  html_nodes('.product-item')%>%
  html_nodes('a')%>%
  html_attr('href')

enlaces_visitar <- paste0('https://gamaenlinea.com/',enlaces_visitar)%>%
  unique(.)
enlaces_visitar[1]

datos_pagina_producto <- read_html('https://gamaenlinea.com/es/cerveza-retornable-solera-classica-36-un-222-ml/p/40008365')

datos_pagina_producto%>%
 html_nodes('.total')%>%
  html_text()%>%
  str_replace_all(',','.')%>%
  str_remove_all(' Total Ref\\. ')%>%
  str_extract_all('[[:digit:][:punct:]]')%>%
  unlist()%>%
  paste(collapse = '')%>%
  as.numeric()

datos_pagina%>%
  html_nodes('h1')%>%
  html_text()%>%
  .[1]



datos_pagina%>%
  html_nodes('.total span ')%>%
  html_text()%>%
  str_replace_all(',','.')%>%
  str_remove_all(' Total Ref\\. ')%>%
  str_extract_all('[[:digit:][:punct:]]')%>%
  unlist()%>%
  paste(collapse = '')%>%
  as.numeric()

datos_pagina_producto%>%
  html_nodes('h3')%>%
  html_text()


datos_pagina%>%
  html_nodes('h3')%>%
  html_text()


data_precio <- read_html('https://www.dataprecio.com/?q=huevos')

class(data_precio)
str(data_precio)

print(data_precio)

body_node <- html_node(data_precio, "body")

# Si quieres ver el contenido HTML del body (los tags y el texto)
html_text(body_node) # Extrae solo el texto dentro del body
html_name(body_node) # Debería devolver "body"
html_attr(body_node, "class") # Si el body tiene una clase, por ejemplo
html_children(body_node) # Para ver los hijos directos del body


url <- 'https://dataprecio-com-backend.onrender.com/api/search?q=huevos'




library(httr2)
library(jsonlite) # Para manejar la respuesta JSON, si aplica

# 1. Definir la URL base y el path/query
base_url <- "https://dataprecio-com-backend.onrender.com"
path_query <- "/api/search?q=huevos"
full_url <- paste0(base_url, path_query)

# 2. Crear la solicitud y añadir los headers
req <- request(full_url) |>
  req_headers(
    "Accept" = "*/*",
    # *** MODIFICACIÓN CRÍTICA AQUÍ ***
    # Elimina 'br' y 'zstd' de Accept-Encoding para que el servidor solo envíe
    # 'gzip' o 'deflate', que son reconocidos por libcurl.
    "Accept-Encoding" = "gzip, deflate",
    # ********************************
    "Accept-Language" = "es,en-US;q=0.9,en;q=0.8",
    "Cache-Control" = "no-cache",
    "Dnt" = "1",
    "Origin" = "https://www.dataprecio.com",
    "Pragma" = "no-cache",
    "Priority" = "u=1, i",
    "Referer" = "https://www.dataprecio.com/",
    "Sec-Ch-Ua" = '"Google Chrome";v="137", "Chromium";v="137", "Not/A)Brand";v="24"',
    "Sec-Ch-Ua-Mobile" = "?0",
    "Sec-Ch-Ua-Platform" = '"macOS"',
    "Sec-Fetch-Dest" = "empty",
    "Sec-Fetch-Mode" = "cors",
    "Sec-Fetch-Site" = "cross-site",
    "User-Agent" = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36"
  )

# 3. Realizar la solicitud
# Se recomienda usar req_perform() para ejecutar la solicitud y obtener la respuesta.
resp <- req_perform(req)

# 4. Inspeccionar la respuesta
resp_status(resp)
resp_status_desc(resp)

resp_headers(resp)

if (resp_content_type(resp) == "application/json") {
  data_response <- resp_body_json(resp)
  print("Datos de la respuesta (JSON):")
  print(data_response)
} else {
  data_response <- resp_body_string(resp)
  print("Contenido de la respuesta (texto):")
  print(data_response)
}

objeto <- resp_body_string(resp)%>%
  fromJSON()
View(objeto)

View(objeto$hits)

objeto$hits%>%
  unnest(tiendas)

data_response%>%
  as_data_frame()

print(resp)