#Cargar librerias
library(dplyr)
library(ggplot2)
library(readxl)
# Importo los datos de CPI
balance_fiscal <- read_excel("C:/Users/Gus/OneDrive/Documentos/balance_fiscal.xlsx")
#arreglo el titulo de la variable fecha y calculo la variable deficit y deficit/pib
 balance_fiscal_deficit <- balance_fiscal %>%
   rename(fecha=...1) %>%
   #determino el deficit y su proporcion respectoo al PIB
   mutate(deficit=ingreso_gobierno_federal-gasto_gobierno_federal) %>%
   mutate(deficit_pib=deficit/pib_nominal) %>%
   select(fecha, gasto_gobierno_federal, ingreso_gobierno_federal, pib_nominal, deficit, deficit_pib)
#Veo las primeras filas
head(balance_fiscal_deficit)
# Coloco en fechas la columna de fechas de balance fiscal
#Determino la tabla resumen de los ingresos del gobierno federal
summary(balance_fiscal_deficit$ingreso_gobierno_federal)
#Determino la tabla resumen de los gastos del gobierno federal
summary(balance_fiscal_deficit$gasto_gobierno_federal)
#Determino la tabla resumen del deficit del gobierno federal
summary(balance_fiscal_deficit$deficit)
#Determino la tabla resumen del deficit como porcentaje del PIB del gobierno federal
summary(balance_fiscal_deficit$deficit_pib)
#Hago un grafico de dispersion para evaluar comportamiento de una variable con otra

#Hago un grafico de boxplot para evaluar  valores extremos y si hay valores atipicos al igual que ver en un histograma donde se concentran los datos
ggplot(data = balance_fiscal_deficit,
       aes(y=deficit_pib)) +
  geom_boxplot(fill= "#00446a")
#creo el histograma
ggplot(data = balance_fiscal_deficit,
       aes(x= deficit_pib)) +
  geom_histogram(fill='red')
#Determino el omento en que Estados Unidos tuvo deficit altos
deficit_alto <- balance_fiscal_deficit %>%
  filter(deficit_pib < -0.15)
deficit_alto$fecha
#Hago un grafico de dispersion para evaluar relaciones en el tiempo del deficit como porcentaje del PIB y las otras variables
#grafico de dispersion para pib y deficit como porcentaje de PIB
ggplot(data = balance_fiscal_deficit,
       aes(x=pib_nominal,
           y=deficit_pib)) +
  geom_point(color= "#00446a")
##grafico de dispersion para ingresos y deficit como porcentaje de PIB
ggplot(data = balance_fiscal_deficit,
       aes(x=ingreso_gobierno_federal,
           y=deficit_pib)) +
  geom_point(color= "#00446a")
#grafico de dispersion para gastos y deficit como porcentaje de PIB
ggplot(data = balance_fiscal_deficit,
       aes(x=gasto_gobierno_federal,
           y=deficit_pib)) +
  geom_point(color= "#00446a")
#grafico de dispersion para deficit y deficit como porcentaje de PIB
ggplot(data = balance_fiscal_deficit,
       aes(x=deficit,
           y=deficit_pib)) +
  geom_point(color= "#00446a")
