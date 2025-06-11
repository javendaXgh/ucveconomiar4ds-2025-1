library(tidyverse)

library(modelr)
options(na.action = na.warn)

ggplot(sim1, aes(x, y)) + 
  geom_point()


models <- tibble(
  a1 = runif(250, -20, 40),
  a2 = runif(250, -5, 5)
)

ggplot(sim1, aes(x, y)) + 
  geom_abline(aes(intercept = a1, slope = a2), data = models, alpha = 1/4) +
  geom_point() 


model1 <- function(a, data) {
  a[1] + data$x * a[2]
}
model1(c(7, 1.5), sim1)


# cuan bueno es nuestro modelo, evaluar predicción contra valores 
# estadística,  “root-mean-squared deviation”.“desviación cuadrática media”

measure_distance <- function(mod, data) {
  diff <- data$y - model1(mod, data)
  sqrt(mean(diff ^ 2))
}

measure_distance(c(7, 1.5), sim1)

#
sim1_dist <- function(a1, a2) {
  measure_distance(c(a1, a2), sim1)
}

models <- models %>% 
  mutate(dist = purrr::map2_dbl(a1, a2, sim1_dist))

models



ggplot(sim1, aes(x, y)) + 
  geom_point(size = 2, colour = "grey30") + 
  geom_abline(
    aes(intercept = a1, 
        slope = a2, 
        colour = -dist), 
    data = models%>%
      filter(rank(dist) <= 10))
  
models%>%
  filter(rank(dist) <= 10)%>%
  arrange(dist)

ggplot(models, aes(a1, a2)) +
  geom_point(data = filter(models, rank(dist) <= 10), 
             size = 4, 
             colour = "red") +
  geom_point(aes(colour = -dist))

# grid search
grid <- expand.grid(
  a1 = seq(-5, 20, length = 25),
  a2 = seq(1, 3, length = 25)) %>% 
  mutate(dist = purrr::map2_dbl(a1, a2, sim1_dist))


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


ggplot(sim1, aes(x, y)) + 
  geom_point(size = 2, colour = "grey30") + 
  geom_abline(
    aes(intercept = a1, 
        slope = a2, 
        colour = -dist), 
    data = filter(grid, rank(dist) <= 10))

#Podrías imaginarte refinando la cuadrícula iterativamente hasta encontrar el mejor modelo. Pero hay una mejor manera de abordar este problema: una herramienta de minimización numérica llamada búsqueda de Newton-Raphson. La intuición de Newton-Raphson es bastante simple: eliges un punto de partida y buscas la pendiente más pronunciada. Luego, bajas por esa pendiente un poco y repites el proceso una y otra vez, hasta que no puedas bajar más. En R, podemos hacerlo con optim().

best <- optim(c(0, 0), 
              measure_distance, 
              data = sim1)
best$par
#> [1] 4.222248 2.051204

ggplot(sim1, aes(x, y)) + 
  geom_point(size = 2, 
             colour = "grey30") + 
  geom_abline(intercept = best$par[1], 
              slope = best$par[2])


sim1_mod <- lm(y ~ x, data = sim1)

#between geometry, calculus, and linear algebra, lm()
coef(sim1_mod)





###########################


sim1a <- tibble(
  x = rep(1:10, each = 3),
  y = x * 1.5 + 6 + rt(length(x), df = 2)
)

sim1a_lm <- lm(y ~ x, data = sim1a)
coef(sim1a_lm)[1]

#One way to make linear models more robust is to use a different distance measure. For example, instead of root-mean-squared distance,
measure_distance_abs <- function(mod, data) {
  diff <- data$y - model1(mod, data)
  mean(abs(diff))
}

best_abs <- optim(c(0, 0), 
                  measure_distance_abs,
                  data = sim1a)
best_abs$par

ggplot(sim1a, aes(x, y)) + 
  geom_point(size = 2, colour = "grey30") + 
  geom_abline(intercept = best_abs$par[1], slope = best_abs$par[2], color='red')+
  geom_abline(intercept = coef(sim1a_lm)[1], slope = coef(sim1a_lm)[2], color='green')


####### grilla
sim1$x
grid <- sim1 %>% 
  data_grid(x) #por cada argumento adicional, encuentra las variables únicas

grid


grid <- grid %>%
  add_predictions(sim1_mod)

ggplot(sim1, aes(x)) +
  geom_point(aes(y = y)) +
  geom_line(aes(y = pred), 
            data = grid, 
            colour = "red", 
            linewidth = 3)+
  geom_smooth(aes(y = pred), 
              data = grid,
              color='green')


sim1 <- sim1 %>%
  add_residuals(sim1_mod) # añadir residuales

ggplot(sim1, aes(resid)) +
  geom_freqpoly(binwidth = 0.5)

ggplot(sim1, aes(resid)) +
  geom_density()

ggplot(sim1, aes(resid)) +
  geom_histogram(bins = 10)


ggplot(sim1, aes(x, resid)) +
  geom_ref_line(h = 0, colour='blue') +
  geom_point(size=2)


# con loess

sim1_mod_loess <- loess(y ~ x, data = sim1)

grid1 <- sim1 %>% 
  data_grid(x) #por cada argumento adicional, encuentra las variables únicas

grid1


grid1 <- grid1 %>%
  add_predictions(sim1_mod_loess)

ggplot(sim1, aes(x)) +
  geom_point(aes(y = y)) +
  geom_line(aes(y = pred), 
            data = grid1, 
            colour = "red", 
            linewidth = 3)+
  geom_smooth(aes(y = pred), 
              data = grid,
              color='green')


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


grid12 <- sim1 %>% 
  data_grid(x) %>%
  gather_predictions(sim1_mod,sim1_mod_loess)

#######
df <- tribble(
  ~y, ~x1, ~x2,
  4, 2, 5,
  5, 1, 6
)

df
model_matrix(df, y ~ x1)


require(stats)
require(graphics)
library(splines)
ns(women$height, df = 5)
fm1 <- lm(weight ~ ns(height, df = 1), data = women)
summary(fm1)

View(women)
fm3 <- lm(weight ~ ns(height, df = 2), data = women)

fm5 <- lm(weight ~ ns(height, df = 6), data = women)

## To see what knots were selected
attr(terms(fm1), "predvars")

## example of safe prediction
plot(women, 
     xlab = "Height (in)",
     ylab = "Weight (lb)",
     col = "dark red",
     pch=19,
     cex=3,
     size=5)


ht <- seq(57, 73, length.out = 200)
nD <- data.frame(height = ht)
p1 <- predict(fm1, nD)
p3 <- predict(fm3, nD)
p5 <- predict(fm5, nD)

lines(ht,p1 , col='red',lw=2)
lines(ht,p3, col='green',lw=4)
lines(ht,p5 , col='blue',lw=3)




############
# https://es.wikipedia.org/wiki/Spline
library(splines)

sim5 <- tibble(
  x = seq(0, 3.5 * pi, length = 50),
  y = 4 * sin(x) + rnorm(length(x))
)

ggplot(sim5, aes(x, y)) +
  geom_point()


splines::ns(sim5$x, 1)

mod0 <- lm(y ~ x, data = sim5)
mod1 <- lm(y ~ ns(x, 1), data = sim5)
mod2 <- lm(y ~ ns(x, 2), data = sim5)
mod3 <- lm(y ~ ns(x, 3), data = sim5)
mod4 <- lm(y ~ ns(x, 4), data = sim5)
mod5 <- lm(y ~ ns(x, 5), data = sim5)

grid_df5 <- sim5 %>% 
  data_grid(x = seq_range(x, n = 50, expand = 0.1)) %>% 
  gather_predictions(mod0, mod1, mod2, mod3, mod4, mod5, .pred = "y")



ggplot(sim5, aes(x, y)) + 
  geom_point() +
  geom_line(data = grid_df5, 
            colour = "red") +
  facet_wrap(~ model)


stats
mgcv
MASS
rpart
randomForest
caret

mod6_glm <- stats::glm(y ~ x, data = sim5) #Generalised linear models
mod7_gam <-  mgcv::gam(y ~ x, data = sim5) #Generalised additive models
mod9_rlm <- MASS::rlm(y ~ x, data = sim5) #Robust linear models
mod10_tree <- rpart::rpart(y ~ x, data = sim5) #Trees
mod11_rf <- randomForest::randomForest(y ~ x, data = sim5)




library(caret)
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

ggplot(sim5, aes(x, y)) + 
  geom_point() +
  geom_line(data = grid_df6, 
            colour = "red") +
  facet_wrap(~ model)



test <- data.frame(x=c(1.46,2,6,7.54,9, 14))
test$y <- predict(mod11_rf,test)

ggplot(sim5, aes(x, y)) + 
  geom_point() +
  geom_line(data = grid_df6, 
            colour = "blue") +
  facet_wrap(~ model)+
  geom_point(data=test, aes(x=x, y= y),color='red',size=3)




###########
# Using many simple models to better understand complex datasets.

# Using list-columns to store arbitrary data structures in a data frame. 

# Using the broom package to turn models into tidy data. This is a powerful technique for 
# working with large numbers of models because once you have tidy data, 
# you can apply all of the techniques that you’ve learned about earlier in the book.



library(gapminder)
