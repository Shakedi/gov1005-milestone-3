library(tidyverse)
library(tidycensus)

MA <- get_acs(geography = "county",
              variables = c(medincome = "B19013_001"), 
              year = 2018,
              state = "MA",
              geometry = TRUE)

map <- MA %>%
  mutate(income_thousand = estimate/1000) %>% 
  ggplot(aes(fill = income_thousand)) +
  ggplot2::geom_sf() +
  scale_fill_viridis_c(option = "magma",
                       direction = -1) +
  labs(title = "Median Income in Massachusetts Per County",
       caption = "Source: Census 2018",
       fill = "Median Income\nIn Thousands\nof Dollars") +
  theme_linedraw()

ggsave("map.png", map)

racevars <- c(White = "B02001_002", 
              Black = "B02001_003", 
              Asian = "B02001_005",
              Hispanic = "B03003_003")

fairfax <- get_acs(geography = "tract",
                   variables = racevars, 
                   year = 2018,
                   state = "VA",
                   county = "Fairfax County",
                   geometry = TRUE,
                   summary_var = "B02001_001") 

map_2 <- fairfax %>%
  mutate(Percent = 100 * (estimate / summary_est)) %>%
  ggplot(aes(fill = Percent, color = Percent)) +
  facet_wrap(~ variable) +
  geom_sf() +
  scale_fill_viridis_c(direction = -1) +
  scale_color_viridis_c(direction = -1) +
  labs(title = "Racial geography of Fairfax County, Virginia",
       caption = "Source: American Community Survey 2014-2018") +
  theme_void()

ggsave("map_2.png", map_2)
