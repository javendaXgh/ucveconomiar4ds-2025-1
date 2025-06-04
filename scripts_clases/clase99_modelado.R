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
    aes(intercept = a1, slope = a2, colour = -dist), 
    data = filter(models, rank(dist) <= 10)
  )


ggplot(sim1, aes(x, y)) + 
  geom_point(size = 2, colour = "grey30") + 
  geom_abline(
    aes(intercept = a1, slope = a2, colour = -dist), 
    data = models%>%
      filter(rank(dist) <= 10))
  

ggplot(models, aes(a1, a2)) +
  geom_point(data = filter(models, rank(dist) <= 10), size = 4, colour = "red") +
  geom_point(aes(colour = -dist))

# grid search
grid <- expand.grid(
  a1 = seq(-5, 20, length = 25),
  a2 = seq(1, 3, length = 25)
) %>% 
  mutate(dist = purrr::map2_dbl(a1, a2, sim1_dist))

grid %>% 
  ggplot(aes(a1, a2)) +
  geom_point(data = filter(grid, rank(dist) <= 10), size = 4, colour = "red") +
  geom_point(aes(colour = -dist)) 


ggplot(sim1, aes(x, y)) + 
  geom_point(size = 2, colour = "grey30") + 
  geom_abline(
    aes(intercept = a1, slope = a2, colour = -dist), 
    data = filter(grid, rank(dist) <= 10)
  )

#Podrías imaginarte refinando la cuadrícula iterativamente hasta encontrar el mejor modelo. Pero hay una mejor manera de abordar este problema: una herramienta de minimización numérica llamada búsqueda de Newton-Raphson. La intuición de Newton-Raphson es bastante simple: eliges un punto de partida y buscas la pendiente más pronunciada. Luego, bajas por esa pendiente un poco y repites el proceso una y otra vez, hasta que no puedas bajar más. En R, podemos hacerlo con optim().

best <- optim(c(0, 0), 
              measure_distance, 
              data = sim1)
best$par
#> [1] 4.222248 2.051204

ggplot(sim1, aes(x, y)) + 
  geom_point(size = 2, colour = "grey30") + 
  geom_abline(intercept = best$par[1], slope = best$par[2])


sim1_mod <- lm(y ~ x, data = sim1)

#between geometry, calculus, and linear algebra, lm()
coef(sim1_mod)