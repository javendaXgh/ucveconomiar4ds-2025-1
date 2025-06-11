library(tidyverse)
library(caret)
library(modelr)
library(stats)
library(graphics)
library(splines)

########################### parte I: encontrar el mejor modelo lineal

# conjunto de datos a trabajar, datos simulados
sim1

# grafico dispersión conjunto de datos simulado
ggplot(sim1, aes(x, y)) + 
  geom_point()


# crear distintos modelos lineales que puedan explicar los puntos representados
models <- tibble(
  a1 = runif(250, -20, 40),
  a2 = runif(250, -5, 5)
)

# graficar los modelos
ggplot(sim1, aes(x, y)) + 
  geom_abline(aes(intercept = a1, slope = a2), data = models, alpha = 1/4) +
  geom_point() 

# usar aplicación
#https://raw.githubusercontent.com/javendaXgh/ucveconomiaestadistica1/refs/heads/main/apps/app_modelos.R

# aplicar un modelo a cada punto del conjunto de datos
model1 <- function(a, data) {
  a[1] + data$x * a[2]
  # retorna la predicción de Y
}

# aplicar modelo c(7, 1.5) siendo 7 intercepto y 1.5 pendiente
model1(c(7, 1.5), sim1[1,])


# cuan bueno es nuestro modelo, evaluar predicción contra valores 
# estadística, “root-mean-squared deviation”.“desviación cuadrática media”

measure_distance <- function(mod, data) {
  # diferencia entre valor de predicción y valor real
  diff <- data$y - model1(mod, data)
  
  sqrt(mean(diff ^ 2))
}

# obtener el error para un punto
measure_distance(c(7, 1.5), sim1[1,])

# obtener el error para el conjunto de datos
measure_distance(c(7, 1.5), sim1[1,])

# medir error para conjunto de dato por cada modelo
sim1_dist <- function(a1, a2) {
  measure_distance(c(a1, a2), sim1)
}

# añadir a modelos el error
models <- models %>% 
  mutate(dist = purrr::map2_dbl(a1, a2, sim1_dist))

models

# ver modelos con mejor performance
models%>%
  filter(rank(dist) <= 10)%>%
  arrange(dist)


# graficar modelos con mejor performance
ggplot(sim1, aes(x, y)) + 
  geom_point(size = 2, colour = "grey30") + 
  geom_abline(
    aes(intercept = a1, 
        slope = a2, 
        colour = -dist), 
    data = models%>%
      filter(rank(dist) <= 10))
  

# visualizar paramentros de los 10 mejores modelos en puntos rojos
ggplot(models, aes(a1, a2)) +
  geom_point(data = filter(models, rank(dist) <= 10), 
             size = 4, 
             colour = "red") +
  geom_point(aes(colour = -dist))

# crear una grilla con valores en ejes asociados a rango de los parámetros beta0 y beta1
grid <- expand.grid(
  a1 = seq(-5, 20, length = 25),
  a2 = seq(1, 3, length = 25)) %>% 
  mutate(dist = purrr::map2_dbl(a1, a2, sim1_dist))


# graficar en la grilla los párametros en puntos rojos de los modelos con mejor performance
grid %>% 
  ggplot(aes(a1, a2)) +
  geom_point(data = filter(grid, 
                           rank(dist) <= 10),
             size = 4,
             colour = "red") +
  geom_point(aes(colour = -dist)) 

grid %>% 
  ggplot(aes(a1, a2)) +
  geom_point(data = filter(grid, 
                           rank(dist) <= 10),
             aes(size=-dist),
             # size = 4, 
             colour = "red") +
  geom_point(aes(colour = -dist)) 


# representación de los 10 mejores modelos de RL
ggplot(sim1, aes(x, y)) + 
  geom_point(size = 2, colour = "grey30") + 
  geom_abline(
    aes(intercept = a1, 
        slope = a2, 
        colour = -dist), 
    data = filter(grid, rank(dist) <= 10))


# refinando la cuadrícula iterativamente hasta encontrar el mejor modelo. 
# Pero hay una mejor manera de abordar este problema: una herramienta de minimización n
# numérica llamada búsqueda de Newton-Raphson. La intuición de Newton-Raphson es 
#bastante simple: eliges un punto de partida y buscas la pendiente más pronunciada. 
# Luego, bajas por esa pendiente un poco y repites el proceso una y otra vez, 
# hasta que no puedas bajar más. En R, podemos hacerlo con optim().

best <- optim(c(0, 0), 
              measure_distance, 
              data = sim1)

best$par
#> [1] 4.222248 2.051204

# graficar el mejor modelo
ggplot(sim1, aes(x, y)) + 
  geom_point(size = 2, 
             colour = "grey30") + 
  geom_abline(intercept = best$par[1], 
              slope = best$par[2])


# aplicar el modelo de regresión lineal
sim1_mod <- lm(y ~ x, data = sim1)

#between geometry, calculus, and linear algebra, lm()
coef(sim1_mod)

# ¡¡¡¡coindicencia de los coeficientes!



########################### parte II
# crear una nueva simulación de datos

sim1a <- tibble(
  x = rep(1:10, each = 3),
  y = x * 1.5 + 6 + rt(length(x), df = 2)
)

head(sim1a)

# aplicar modelo lineal
sim1a_lm <- lm(y ~ x, data = sim1a)

# verificar cuál es el intencepto
coef(sim1a_lm)[1]

#Una forma de hacer que los modelos lineales sean más robustos es utilizar una medida de 
# distancia diferente. por ejemplo, en lugar de la distancia cuadrática media


# crear función
measure_distance_abs <- function(mod, data) {
  diff <- data$y - model1(mod, data)
  mean(abs(diff))
}

# aplicar optim con la nueva función
best_abs <- optim(c(0, 0), 
                  measure_distance_abs,
                  data = sim1a)
best_abs$par

# comparar ambas líneas
# roja con la distancia cuadrática media
# verde con modelo lineal
ggplot(sim1a, aes(x, y)) + 
  geom_point(size = 2, colour = "grey30") + 
  geom_abline(intercept = best_abs$par[1], slope = best_abs$par[2], color='red')+
  geom_abline(intercept = coef(sim1a_lm)[1], slope = coef(sim1a_lm)[2], color='green')


####### grilla
sim1$x

# crear nueva grilla con valores únicos de X
grid <- sim1 %>% 
  data_grid(x) #por cada argumento adicional, encuentra las variables únicas

grid


# añadir predicciones a cada punto usando la función add_predictions
# y el modelo sim1_mod

grid <- grid %>%
  add_predictions(sim1_mod)

grid

ggplot(sim1, aes(x)) +
  geom_point(aes(y = y)) +
  geom_line(aes(y = pred), 
            data = grid, 
            colour = "red", 
            linewidth = 3)


# añadir valores de residuales
sim1 <- sim1 %>%
  add_residuals(sim1_mod) # añadir residuales
sim1

# visualizar residuales
ggplot(sim1, aes(resid)) +
  geom_freqpoly(binwidth = 0.5)

ggplot(sim1, aes(resid)) +
  geom_density()

ggplot(sim1, aes(resid)) +
  geom_histogram(bins = 10)


ggplot(sim1, aes(x, resid)) +
  geom_ref_line(h = 0, colour='blue') +
  geom_point(size=2)


# con loess Local Polynomial Regression Fitting

sim1_mod_loess <- loess(y ~ x, data = sim1)

grid1 <- sim1 %>% 
  data_grid(x) #por cada argumento adicional, encuentra las variables únicas

grid1

# añadir prediccciones del modelo sim1_mod_loess
grid1 <- grid1 %>%
  add_predictions(sim1_mod_loess)


# linea roja loess
# linea verde lm
ggplot(sim1, aes(x)) +
  geom_point(aes(y = y)) +
  geom_line(aes(y = pred), 
            data = grid1, 
            colour = "red", 
            linewidth = 3)+
  geom_smooth(aes(y = pred), 
              data = grid,
              color='green')


# añadir residuales
sim11 <- sim1 %>%
  add_residuals(sim1_mod_loess) # añadir residuales

ggplot(sim11, aes(resid)) +
  geom_freqpoly(binwidth = 0.5)

ggplot(sim11, aes(resid)) +
  geom_density()

ggplot(sim11, aes(resid)) +
  geom_histogram(bins = 10)


ggplot(sim1, aes(x, resid)) +
  geom_ref_line(h = 0, colour='blue') +
  geom_point(size=2)


grid1
grid11 <- sim1 %>% 
  data_grid(x) %>%
  spread_predictions(sim1_mod,sim1_mod_loess)

grid11

grid12 <- sim1 %>% 
  data_grid(x) %>%
  gather_predictions(sim1_mod,sim1_mod_loess)

grid12

########################### parte III uso de splines
# https://es.wikipedia.org/wiki/Spline
# un spline es una curva diferenciable definida en porciones mediante polinomios

# conjunto de datos women
women

# `df` en este caso es degrees of freedom

# modelo de splines con 1 grado de libertad
fm1 <- lm(weight ~ ns(height, df = 1), data = women)
summary(fm1)

# modelo de splines con 2 grado de libertad
fm3 <- lm(weight ~ ns(height, df = 2), data = women)

# modelo de splines con 6 grado de libertad
fm5 <- lm(weight ~ ns(height, df = 6), data = women)

grid_women <- women %>% 
  data_grid(height = seq(57, 73, length.out = 200)) %>% 
  gather_predictions(fm1, fm3, fm5, .pred = "weight")


ggplot(women, aes(x=height, y=weight)) + 
  geom_point(size=3, color="dark red" ) +
  geom_line(data = grid_women,
            aes(group=model, color=model))


ggplot(women, aes(x=height, y=weight)) + 
  geom_point(size=3, color="dark red") +
  geom_line(data = grid_women,
            aes(color=model)) +
  facet_wrap(~ model)


## alternativa RBase

########################### parte IV otros modelos
# otra simulación de datos
sim5 <- tibble(
  x = seq(0, 3.5 * pi, length = 50),
  y = 4 * sin(x) + rnorm(length(x)))

# visualizar sim5
ggplot(sim5, aes(x, y)) +
  geom_point()


# modelos mediante splines variando degrees of freedom
mod0 <- lm(y ~ x, data = sim5) # modelo lm
mod1 <- lm(y ~ ns(x, 1), data = sim5)
mod2 <- lm(y ~ ns(x, 2), data = sim5)
mod3 <- lm(y ~ ns(x, 3), data = sim5)
mod4 <- lm(y ~ ns(x, 4), data = sim5)
mod5 <- lm(y ~ ns(x, 5), data = sim5)

# añadir predicciones según cada modelo
grid_df5 <- sim5 %>% 
  data_grid(x = seq_range(x, n = 50, expand = 0.1)) %>% 
  gather_predictions(mod0, mod1, mod2, mod3, mod4, mod5, .pred = "y")


# visualizar predicciones según cada modelo
ggplot(sim5, aes(x, y)) + 
  geom_point() +
  geom_line(data = grid_df5, 
            colour = "red") +
  facet_wrap(~ model)


# uso de distintos modelos incluyendo no lineales
mod6_glm <- stats::glm(y ~ x, data = sim5) #Generalised linear models
mod7_gam <-  mgcv::gam(y ~ x, data = sim5) #Generalised additive models
mod9_rlm <- MASS::rlm(y ~ x, data = sim5) #Robust linear models
mod10_tree <- rpart::rpart(y ~ x, data = sim5) #Trees
mod11_rf <- randomForest::randomForest(y ~ x, data = sim5)


# modelo xgboost

# Definir el control del entrenamiento (método de validación cruzada)
fitControl <- trainControl(
  method = "cv",        # Validación cruzada
  number = 5,           # 5 folds (particiones)
  verboseIter = FALSE   # No mostrar el progreso de cada iteración
)

# Entrenar el modelo con caret
# 'method = "xgbTree"' especifica que usaremos el algoritmo xgboost para árboles.
# 'tuneLength' o 'tuneGrid' se pueden usar para ajustar los hiperparámetros.
mod12_xgb <- train(
  y ~ x,                # Fórmula del modelo: 'y' es la respuesta, 'x' es el predictor
  data = sim5,          # Tus datos
  method = "xgbTree",   # Método xgboost
  trControl = fitControl,
  tuneLength = 3,       # Prueba diferentes combinaciones de parámetros
  verbose = FALSE       # No mostrar mensajes detallados durante el entrenamiento
)


 ### problema extrapolado

grid_df6 <- sim5 %>% 
  data_grid(x = seq_range(x, n = 50, expand = 0.1)) %>% 
  gather_predictions(mod6_glm,
                     mod7_gam,
                     mod9_rlm,
                     mod10_tree, 
                     mod11_rf,
                     mod12_xgb,
                     .pred = "y")

# lineas azules representan el modelo
ggplot(sim5, aes(x, y)) + 
  geom_point() +
  geom_line(data = grid_df6, 
            colour = "blue", 
            linewidth=1.5) +
  facet_wrap(~ model)


### predicciones

test1 <- data.frame(x=c(1.46,2,6,7.54,9,14)) # contiene valores que están extrapolando 
# conjunto de datos de entrenamiento

# añadir predicciones a test1
grid_df7 <- test1 %>% 
  data_grid(x = seq_range(x,
                          n = 8,
                          expand = 0.1)) %>% 
  gather_predictions(mod6_glm,
                     mod7_gam,
                     mod9_rlm,
                     mod10_tree, 
                     mod11_rf,
                     mod12_xgb,
                     .pred = "y")

# visualizar predicciones realizadas por cada modelo en puntos rojos.
# Notar como cambia el valor y en la predicción según modelo
# la línea azul es el modelo y los puntos rojos las predicciones

ggplot(sim5, aes(x, y)) + 
  geom_point() +
  geom_line(data = grid_df6, 
            colour = "blue") +
  facet_wrap(~ model)+
  geom_point(data=grid_df7, aes(x=x, y= y),color='red',size=3)


#### upcoming section
###########
# Using many simple models to better understand complex datasets.

# Using list-columns to store arbitrary data structures in a data frame. 

# Using the broom package to turn models into tidy data. This is a powerful technique for 
# working with large numbers of models because once you have tidy data, 
# you can apply all of the techniques that you’ve learned about earlier in the book.

