# ================= 1 start =================
list_mpg <- mtcars$mpg
sorted_list <- sort(list_mpg, decreasing = TRUE)
max_value <- max(list_mpg)

# result
print(sorted_list[1])
print(max_value)
print("=================1 end===================")

# ================= 2 start =================

tryCatch(
  {
    # Intentar asignar un valor a un nombre reservado (por ejemplo, `if`)
    next <- 42
  },
  error = function(e) {
    # Imprimir el mensaje de error
    print("Se produjo un error:")
    print(e)
  }
)
tryCatch(
  {
    # Intentar asignar un valor a un nombre reservado (por ejemplo, `if`)
    TRUE <- 42
  },
  error = function(e) {
    # Imprimir el mensaje de error
    print("Se produjo un error:")
    print(e)
  }
)
tryCatch(
  {
    # Intentar asignar un valor a un nombre reservado (por ejemplo, `if`)
    break <- 42
  },
  error = function(e) {
    # Imprimir el mensaje de error
    print("Se produjo un error:")
    print(e)
  }
)
tryCatch(
  {
    # Intentar asignar un valor a un nombre reservado (por ejemplo, `if`)
    NaN <- 42
  },
  error = function(e) {
    # Imprimir el mensaje de error
    print("Se produjo un error:")
    print(e)
  }
)
print("=================2 end===================")

# ================= 3 start =================

vector_1 <- c("a", "b", "c", "d")
vector_2 <- c(1.1, 2.2, 3.3, 4.4)
vector_3 <- c(TRUE, FALSE)
vector_4 <- c(1L, 2L, 3L, 4L)


print(paste("type:", class(vector_1)))
print(paste("type:", class(vector_2)))
print(paste("type:", class(vector_3)))
print(paste("type:", class(vector_4)))

print("=================3 end===================")

# ================= 4 start =================

lista <- list(
  vector = c(1, 2),
  matriz = matrix(1:2, nrow = 2),
  factor = factor(c("a", "b")),
  list = list(
    a = "a",
    b = "b"
  )
)
str(lista)
print(lista)
print("=================4 end===================")

# ================= 5 start =================
datos <- 1:16

matriz_1x16 <- matrix(datos)
print("Matriz 1x16:")
print(matriz_1x16)

matriz_4x4 <- matrix(datos, nrow = 4, ncol = 4)
print("Matriz 4x4:")
print(matriz_4x4)

matriz_8x2 <- matrix(datos, nrow = 8, ncol = 2)
print("Matriz 8x2:")
print(matriz_8x2)

print("=================5 end===================")

# ================= 6 start =================
lista_persona <- list(
  Nombre = "Ana",
  Edad = 25,
  Altura = 1.68,
  Pasatiempos = c("dibujar", "cantar", "futbol")
)

print(lista_persona$Nombre)
print(lista_persona$Edad)
print(lista_persona$Pasatiempos)

lista_persona$Nombre <- "Ana Maria"
lista_persona$Ciudad <- "Valencia"

years <- c(2023, 2024, 2025)
pib_simulado <- c(10000, 11000, 12000)
matriz <- rbind(years, pib_simulado)
rownames(matriz) <- c("Años", "PIB")

informe_pib <- list(
  Titulo = "Informe PIB Venezuela",
  Autor = lista_persona$Nombre,
  Datos = matriz,
  Resumen = c("PIB año 2024", "Inflacion", "PIB per capita")
)

lista_persona$informe_PIB <- informe_pib

print(lista_persona$informe_PIB$Autor)
print(lista_persona$informe_PIB$Datos[2, 2])
print(lista_persona$informe_PIB$Resumen[3])

print("=================6 end===================")

# ================= 7 start =================
v_num <- c(1.2, 3.4, 5.6, 7.8)
v_chart <- c("A", "B", "C", "D")
v_bool <- c(TRUE, FALSE, TRUE, FALSE)
v_int <- c(10L, 20L, 30L, 40L)

mi_data_frame <- data.frame(
  Numerico = v_num,
  Caracter = v_chart,
  Logico = v_bool,
  Entero = v_int
)

# Evaluar el modo y la clase del data frame
modo <- mode(mi_data_frame)
clase <- class(mi_data_frame)

# Imprimir el data frame, su modo y clase
print("Data frame:")
print(mi_data_frame)
print(paste("Mode:", modo))
print(paste("Class:", clase))

print("=================7 end===================")
