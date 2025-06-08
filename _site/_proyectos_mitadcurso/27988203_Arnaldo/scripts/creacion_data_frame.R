#use la api del banco mundial para crear la data con el cual voy a trabajar, combine los indicadores de exportaciones y importaciones (% del PIB) y el PIB en precios actuales#

library(WDI)
datos <- WDI(country = "COL", indicator = c("NE.EXP.GNFS.ZS", "NE.IMP.GNFS.ZS", "NY.GDP.MKTP.CD" ), start = 2004, end = 2023)
datos

#creo una nueva dataframe para eliminar columnas que no son de nuestro interes como los codigos iso y la columna pais#
datos_colombia <- data.frame(
  Año = datos$year,
  Exportaciones_x100 = datos$NE.EXP.GNFS.ZS,
  Importaciones_x100 = datos$NE.IMP.GNFS.ZS,
  PIB = datos$NY.GDP.MKTP.CD
)

datos_colombia


save(datos_colombia, file = "data_colombia.RData")

