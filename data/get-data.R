
# this file gets data from the PokeAPI (https://pokeapi.co/) Github and creates
#   a SQLite database
# I'm grabbing the underlying data for the API because it's easier for
#   this use case than using the API directly

library(tidyverse)
library(DBI)
library(RSQLite)

# ---- get pokemon ----
pk_mon_url <- paste0(
  "https://raw.githubusercontent.com/PokeAPI/pokeapi/master/data/v2/csv/",
  "pokemon.csv"
)

pk_mon <- read_csv(pk_mon_url)


# --- get pokemon type codes ----
pk_type_codes_url <- paste0(
  "https://raw.githubusercontent.com/PokeAPI/pokeapi/master/data/v2/csv/",
  "pokemon_types.csv"
)

pk_type_codes <- read_csv(pk_type_codes_url)


# ---- get pokemon type names ----
pk_type_names_url <- paste0(
  "https://raw.githubusercontent.com/PokeAPI/pokeapi/master/data/v2/csv/",
  "types.csv"
)

pk_type_names <- read_csv(pk_type_names_url)


# ---- simple cleaning ----
pokemon <- pk_mon %>%
  rename(
    pokemon_id = id,
    name = identifier,
    base_xp = base_experience
  ) %>%
  select(
    pokemon_id:base_xp,
    -species_id
  )


types <- pk_type_codes %>%
  left_join(pk_type_names, by = c("type_id" = "id")) %>%
  select(
    pokemon_id,
    identifier
  ) %>%
  rename(
    type = identifier
  )


# ---- write to database ----
con <- dbConnect(RSQLite::SQLite(), dbname = "data/pokedex.sqlite")

dbWriteTable(con, "pokemon", pokemon)

dbWriteTable(con, "types", types)

dbDisconnect(con)
