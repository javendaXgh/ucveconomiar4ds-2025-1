#soporte clase 15

# uso de la librería
# https://tidy-intelligence.github.io/r-owidapi/


library(owidapi)
library(tidyverse)

catalog <- owid_get_catalog()%>%
  arrange(desc(updated_at))
View(catalog)


# filtrar nombres conjuntos de datos taxes
datasets_taxes <- catalog%>%
  filter(str_detect(slug,'tax'))%>%
  select(slug, id)

View(datasets_taxes)

datasets_oil <- catalog%>%
  filter(str_detect(slug,'oil'))%>%
  select(slug, id)

View(datasets_oil)

datasets_owi_descargar <- c("direct-democracy-index", 
                           "child-mortality", #"child_mortality_rate"
                           "scientific-publications-per-million", #"articles_per_million_people"
                           "number-of-youth-deaths", #"observation_value__indicator_under_fifteen_deaths__unit_of_measure_deaths"
                           "oil-production-by-country",#"oil_production__twh"
                           "median-income-after-tax-lis") #"median_dhi_eq"

df_test <- owid_get(datasets_owi_descargar[1])

names(df_test)
View(df_test)
# incializar dataset
df_owi_seleccion <- tibble()


for( i in datasets_owi_descargar ){
  print(i)
  edf_datos <- NULL
  df_datos <- try(owid_get(i), silent=TRUE)
  if(class(df_datos)[1]!='try-error'){
    df_owi_seleccion <- bind_rows(df_owi_seleccion,
                                  df_datos%>%
                                    rename(indicador= names(df_datos)[4])%>%
                                    select(1,3,4)%>%
                                    mutate( dataset=i)
                                    )
  }
}
dim(df_owi_seleccion)
unique(df_owi_seleccion$entity_name)


View(df_owi_seleccion%>%
       sample_n(200))
df_owi_seleccion2 <-df_owi_seleccion 
