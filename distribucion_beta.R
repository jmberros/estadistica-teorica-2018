library(tidyverse)
library(shiny)

df <-
  cross_df(list(
    "x" = seq(0, 1, .001),
    "a" = 1:10,
    "b" = 1:10
  )) %>%
  mutate(
    densidad = pmap_dbl(list(x, a, b), ~dbeta(..1, ..2, ..3)),
    esperanza = a/(a+b))

df %>%
  filter(a == 6) %>%
  ggplot() +
  aes(x = x, y = densidad, color = as.factor(b)) +
  geom_line()
