
library(tidyverse)
library(palmerpenguins)

# Aufgabe 2
penguins |>
  filter(species == "Gentoo", body_mass_g > 5000) |>
  arrange(desc(body_mass_g)) |>
  head(3)

# Aufgabe 3
penguins |>
  group_by(species, island) |>
  summarise(
    n = n(),
    gram = mean(body_mass_g, na.rm = TRUE),
    sd_g = sd(body_mass_g, na.rm = TRUE)
  )

# Aufgabe 4
penguins |>
  mutate(kg = round(body_mass_g / 1000, 1)) |>
  select(species, kg) |>
  head(3)