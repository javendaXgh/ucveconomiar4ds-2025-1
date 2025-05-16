### script generacion examenes
library(quarto)

qmd_file <- "examen_parcial.qmd" # 

# Nombre base para los archivos de salida
output_base <- "examen"

num_renders <- 20 # 

for (i in 1:num_renders) {
  print(i)
  output_file <- paste0(output_base, "_iteracion_", i, ".pdf")
  quarto_render(input = qmd_file,
                output_file = output_file ,
                output_format='pdf')
}
