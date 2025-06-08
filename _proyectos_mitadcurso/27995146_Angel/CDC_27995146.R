######################### IMPORTACIÓN DE DATOS #################################

# Cargar las bibliotecas necesarias
library(WDI)
library(dplyr)
library(rlang)
library(ggplot2)
dir.create("Datos", showWarnings = FALSE)

###################### VALORES ESTADÍSTICOS ####################################

# Importar datos de ahorro bruto, importaciones y comercio
grosssaving_total_csv <- read.csv("Datos/gs_total.csv")
importgs_total_csv <- read.csv("Datos/igs_total.csv")
trade_total_csv <- read.csv("Datos/trade_total.csv")

# Generación del resumen estadístico por región
summ_region <- function(df, variable) {
  var_sym <- sym(variable)

  df %>%
    filter(
      !is.na(.data$region),
      .data$region != "Aggregates",
      !is.na(!!var_sym)
    ) %>%
    group_by(.data$region) %>%
    filter(n() > 1) %>%
    reframe(
      media = mean(!!var_sym, na.rm = TRUE),
      mediana = median(!!var_sym, na.rm = TRUE),
      desviacion = sd(!!var_sym, na.rm = TRUE),
      minimo = min(!!var_sym, na.rm = TRUE),
      maximo = max(!!var_sym, na.rm = TRUE),
      varianza = var(!!var_sym, na.rm = TRUE),
      n = n()
    )
}

# Aplicar la función a cada conjunto de datos
summ_gross <- summ_region(grosssaving_total_csv, "NY.GNS.ICTR.ZS")
summ_import <- summ_region(importgs_total_csv, "NE.IMP.GNFS.ZS")
summ_trade <- summ_region(trade_total_csv, "NE.TRD.GNFS.ZS")

# Imprimir resultados
print(summ_gross)
print(summ_import)
print(summ_trade)

################### ANÁLISIS EXPLORATORIO DE DATOS #############################

# Filtro de datos para los gráficos
filt_graf <- function(df, var_name) {
  sym_name <- sym(var_name)
  df %>%
    filter(
      !is.na(.data$region),
      .data$region != "Aggregates",
      !is.na(!!sym_name)
    )
}

# Aplicación del filtro a los conjuntos de datos
grosssaving_total_csv <- filt_graf(grosssaving_total_csv, "NY.GNS.ICTR.ZS")
importgs_total_csv <- filt_graf(importgs_total_csv, "NE.IMP.GNFS.ZS")
trade_total_csv <- filt_graf(trade_total_csv, "NE.TRD.GNFS.ZS")

# Conjunto de gráficos usando la función de filtro

# Gráfico de Ahorro Bruto (% del PIB)
print(
  ggplot(
    data = grosssaving_total_csv,
    mapping = aes(
      x = year,
      y = NY.GNS.ICTR.ZS,
      fill = region
    )
  ) +
    geom_col(alpha = 0.8, position = "identity") +
    geom_smooth(color = "#707070", alpha = 0.1, size = 1.2) +
    facet_wrap(~region, scales = "free_y") +
    labs(
      title = "Ahorro Bruto (% del PIB) por Región",
      x = "Año",
      y = "Ahorro Bruto (% del PIB)"
    ) +
    theme_minimal()
)

# Gráfico de Importaciones (% del PIB)
print(
  ggplot(
    data = importgs_total_csv,
    mapping = aes(
      x = year,
      y = NE.IMP.GNFS.ZS,
      fill = region
    )
  ) +
    geom_col(alpha = 0.8, position = "identity") +
    geom_smooth(color = "#707070", alpha = 0.1, size = 1.2) +
    facet_wrap(~region, scales = "free_y") +
    labs(
      title = "Importaciones (% del PIB) por Región",
      x = "Año",
      y = "Importaciones (% del PIB)"
    ) +
    theme_minimal()
)

# Gráfico de Comercio (% del PIB)
print(
  ggplot(
    data = trade_total_csv,
    mapping = aes(
      x = year,
      y = NE.TRD.GNFS.ZS,
      fill = region
    )
  ) +
    geom_col(alpha = 0.8, position = "identity") +
    geom_smooth(color = "#707070", alpha = 0.1, size = 1.2) +
    facet_wrap(~region, scales = "free_y") +
    labs(
      title = "Comercio (% del PIB) por Región",
      x = "Año",
      y = "Comercio (% del PIB)"
    ) +
    theme_minimal()
)
