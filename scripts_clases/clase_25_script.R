# json

library(jsonlite)

json_demo1 <- '{
  "empleados": [
    {
      "nombre": "Juan",
      "edad": 30,
      "departamento": {
        "nombre": "Ventas",
        "ubicacion": "Edificio A"
      }
    },
    {
      "nombre": "Ana",
      "edad": 25,
      "departamento": {
        "nombre": "Marketing",
        "ubicacion": "Edificio B"
      }
    }
  ]
}'

fromJSON(json_demo1)

fromJSON(json_demo1)%>%
  as_data_frame()

json_demo2 <- '{
  "libro": {
    "titulo": "1984",
    "autor": "George Orwell",
    "publicado": 1949,
    "generos": ["Dystopian", "Political Fiction"],
    "reseña": {
      "puntuacion": 4.5,
      "comentario": "Una visión profunda de un futuro distópico."
    }
  }
}'

fromJSON(json_demo2)

#########################################################################################

# script interaccion con modelos de lenguaje
gooai_studio_url <- 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent'

api_key <- Sys.getenv('google_aistudio')

# definir el prompt

library(rvest)
library(tidyverse)
library(httr2)
library(jsonlite)

dato_texto_ucab <- read_html('https://economia.ucab.edu.ve/perspectivas-economicas-de-2025-discutieron-especialistas-en-la-ucab/')|>
  html_nodes('p')|>
  html_text()|>
  paste(collapse = '. ')%>%
  str_squish()

prompt <- 'Eres un experto en análisis de noticias económicas. Vas a extraer en formato json las ideas principales expuestas en el texto {"idea_principal_nombre": "texto del nombre de la idea", "descripcion": "texto descriptivo de la idea desarrollada"} del texto delimitado por triple asterisco. Texto: ***'

post_texto <- '***.  Recuerda solo extraer el valor y no añadir información adicional. '

dato_texto_prompt_gooaistudio <- paste(prompt,
                                       dato_texto_ucab,
                                       post_texto)

llm_resultado_google <- request(gooai_studio_url) %>%
  req_headers("Content-Type" = "application/json") %>%
  req_body_json(
    list(
      contents = list(
        list(
          parts = list(
            list(text = dato_texto_prompt_gooaistudio)
          )
        )
      )
    )
  ) %>% 
  req_url_query(key = api_key) %>% 
  req_method("POST")|>
  req_perform()


llm_resultado_google$body |>
  rawToChar() |>
  fromJSON()%>%
  .$candidates%>%
  .$content%>%
  .$parts%>%
  .[[1]]%>%
  str_squish(.)%>%
  str_remove_all(.,'```json | ```')%>%
  fromJSON()

datos_goo_respuesta <- llm_resultado_google$body |>
  rawToChar() |>
  fromJSON()%>%
  .$candidates %>%
  .$content%>%
  .$parts%>%
  .[[1]]%>%
  str_squish(.)%>%
  str_remove_all(.,'```json | ```')%>%
  fromJSON()

datos_goo_respuesta%>%
  as_tibble()



datos_cepal <- request("https://api-cepalstat.cepal.org/cepalstat/api/v1/thematic-tree?lang=es&format=json")|>
  req_headers("Accept" = "application/json")|>
  req_perform()|>
  resp_body_json()%>%
  .$body

View(datos_cepal)
