# crear carpetas proyecto mitad de curso
source('_materiales_admin/participantes.R')

#View(participantes)
library(tidyverse)

i=1
for (i in 1:length(participantes$`cédula de identidad`)){
  print(i)
  ci <- str_remove_all(participantes$`cédula de identidad`[i],'\\.')
  nombre <- unlist(str_split(participantes$Nombre[i],' '))
  dir.create(paste0('proyectos_mitadcurso/',ci,'_',nombre[1]))
}
#################################
# crear variables para referenciar valores dentro del texto
# usar temas
# no usar View dentro de reportes
# formato de salida de números
# mapeo estético usar el nombre del argumento
# formato de datatable en español, referencia a paquete. Mostrar otro paquete más customizable para tablas
# uso del cat no recomendado, mejor crear variables o hacer un source
# limpiar espacio de trabajo previo a render. Crear proyecto
# formatos en columnas, por ejemplo de tipo porcentaje
# formato de tablas sumario-resumen
# yml global chunks
# configuración del corrector español
# etiquetas en los ejes
# cdad de bins en los hist
# rutas relativas en las lecturas de los archivos
# ancho reporte
# graficos sucios exploratorios

# cuando usar dt o gt

