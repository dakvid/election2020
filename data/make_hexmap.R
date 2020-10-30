library(readr)
library(dplyr)
library(sf)

blank_hex <- 
  read_sf("data/Hex_Blank.shp")
hex_seed <- 
  read_csv("data/hex_seed.csv")

nzhex <- 
  inner_join(
    blank_hex,
    hex_seed,
    by = c("u", "v")
  ) %>% 
    select(id, abbr, electorate_name, region) %>% 
    arrange(id)
  
nzhex %>% 
  sf::write_sf("data/nzhex.gpkg")
