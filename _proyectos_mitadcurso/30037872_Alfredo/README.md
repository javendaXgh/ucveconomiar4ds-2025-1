# Análisis Demográfico de Islandia (2000-2024)

Reporte sobre el comportamiento poblacional de Islandia durante el periodo 2000-2025. Este proyecto analiza la transformación demográfica de Islandia marcada por la crisis financiera de 2008, el boom turístico posterior, y la llegada de trabajadores internacionales.

## Enlace en RPubs
https://rpubs.com/tiapa/1315246

## Instrucciones de Clonado

Para clonar este repositorio a tu máquina local, ejecuta el siguiente comando:

```bash
git clone https://github.com/AJTB17/ccd_islandia.git
cd ccd_islandia
```

## Requisitos

Para ejecutar este proyecto necesitarás:

- R (versión 4.0.0 o superior recomendada)
- Quarto (versión 1.0 o superior)
- Paquetes de R:
  - ggplot2
  - dplyr
  - Otros paquetes que se importan en los scripts

Para instalar los paquetes de R necesarios, puedes ejecutar:

```r
install.packages(c("ggplot2", "dplyr"))
```

## Instrucciones para Renderizar el Documento

Para generar el reporte en formato HTML, ejecuta:

```bash
quarto render reporte_islandia.qmd
```

El archivo HTML resultante (`reporte_islandia.html`) contendrá el reporte completo con visualizaciones interactivas.

## Estructura del Proyecto

```
.
├── README.md                        # Este archivo
├── _quarto.yml                      # Configuración del proyecto Quarto
├── reporte_islandia.qmd             # Documento principal con análisis y visualizaciones
├── datos/
│   └── datos_islandia_2000_2025.csv # Datos demográficos de Islandia
└── scripts/
    ├── constants.r                  # Constantes y configuraciones
    └── main.r                       # Scripts principales de análisis
```

## Contenido del Reporte

El análisis incluye:
- Evolución de la población total
- Tasas de crecimiento demográfico
- Cambios en la esperanza de vida
- Impacto de eventos históricos en la demografía islandesa
- El papel de la inmigración en el crecimiento poblacional reciente
