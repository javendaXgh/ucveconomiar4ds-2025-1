# CREACION DE LA CARPETA DE LAS TAREAS 

 dir.create('tareas')


# PREGUNTA 1: Acceder, extraer y asignar a una variable la fila de mtcars con mayor valor mpg.


mayor_mpg <- max(mtcars$mpg)


# PREGUNTA 2: Intentar crear cuatro variables con nombres no permitidos.


 2mayor <- mayor_mpg

 Max*valor <- mayor_mpg

 maximo valor <- mayor_mpg

 .2max_valor <- mayor_mpg
 
 
# PREGUNTA 3: Crear vectores de las distintas “clases”, con su correspondiente nombre.
 
 
 numerico <- c(1,2,3,4,5)
 
 logico <- c(TRUE , FALSE ,FALSE)
 
 caracter <- c('Hola', 'como', 'estas')
 
 enteros <- c(2L, 3L, 4L)

 fechas <- c('2025-03-01','2025-03-02', '2025-03-03')
 
 
 ##### puedes observar que las fechas que creaste no son de clase date
 ##### revisa el siguiente código
 class(fechas)
 Sys.Date()
 class(Sys.Date())
 
# PREGUNTA 4: Crear una lista con al menos cuatro elementos de distintas clases, donde cada uno de estos contenga al menos dos otros elementos.
 
 data_vzla <- list(ciudades = c('Caracas', 'Valencia', 'Maracaibo'), poblacion_estimada= c(3500000, 1800000, 2900000), lagos = c(FALSE, TRUE, TRUE), inseguridad= c('alta', 'media', 'alta'))
 
 data_vzla
# PREGUNTA 5: Crear tres matrices con los mismos 16 elementos y que presenten 3 combinaciones de dimensiones distintas.
 
 matrix(1:16, nrow = 4, ncol= 4)
 matrix(1:16, nrow = 2, ncol= 8)
 matrix(1:16, nrow = 8, ncol= 2)

# PREGUNTA 6.1: Crea una lista llamada persona.
 
 personas <- list(Nombre= 'Ana', Edad= 25, Altura= 1.75, pasatiempos = c('dibujar','cantar','futbol'))

# PREGUNTA 6.2: Accede e imprime los siguientes elementos de la lista persona:
 
 personas[1] #imprimir nombre
 personas[2] #imprimir edad
 personas[4] #imprimir pasatiempos
 
# PREGUNTA 6.3: Modificar Elementos de la lista persona
 
 personas$Nombre <- 'Ana Maria'# cambiar nombre
 personas$ciudad <- 'Valencia' # añadir un elemento con su respectivo valor

# PREGUNTA 6.4: Crea una lista anidada llamada informe_PIB 
 
 informe_PIB <- list(Titulo = 'Informe PIB Venezuela', Autor = 'Raul Cardozo', Datos = matrix(c(2024, 20000,2025,21000,2026, 25000),nrow = 2, ncol = 3), Resumen = c('PIB año 2024','Inflacion','PIB per capita') )
 
# PREGUNTA 6.5: Accede a los siguientes elementos de la lista informe
 
 informe_PIB[2]  # acceder a autor
 informe_PIB[[3]][4] # acceder a el PIB de segundo año
 informe_PIB[[4]][3]  # acceder a PIB per capita
 
# PREGUNTA 7: Crear una data frame y asignar a un objeto, a partir de 4 vectores donde cada uno contenga al menos 4 elementos. Los vectores deben ser al menos de dos clases distintas.
 
 vzla <- data.frame( ciudades= c('Caracas', 'Valencia', 'Maracaibo', 'San Cristobal'), Poblacion = c(3500000, 1800000, 2900000,405000), lagos = c(FALSE, TRUE, TRUE, FALSE), Playa = c(FALSE, TRUE, FALSE, FALSE))
 
 # Una vez creada la data frame evaluar y especificar la mode y la class.
 
 mode(vzla)
 class(vzla)
 