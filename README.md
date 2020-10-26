# Databases With R

This repository contains the material for my talk 'Databases With R' at the
  combined San Diego/Boston/South Coast MA useR and San Diego R-Ladies meeting on July 30, 2020.
I show a few basic examples of using databases from within R, provide a few
  tips for effectively incorporating databases in your R workflow, and point
  to a few resources to learn more.


# Data

The data used in the examples comes from the [PokeAPI](https://pokeapi.co/), an
  API for accessing information on pokemon.
The file `data/get-data.R` pulls data from the PokeAPI and creates a local
  [SQLite](https://www.sqlite.org/index.html) database.
  
# Slides

The slides from the talk are in the `slides.html` file.
They are generated from `slides.Rmd` with the R package [xaringan](https://github.com/yihui/xaringan).
Note that you need to also have the `libs` folder in the same directory as
  `slides.html` in order to view the slides.
  
# Usage

If you want to run any of the files, the easiest thing is to dowload the 
  entire repository (fork, clone, or as a zip).
This of course requires that you have all the required software installed.

# Dependencies

Since a SQLite database is used, you need to have SQLite installed, which it 
  may already be.
I won't go into details of that here as this depends on your system.

To get the data and create the database, you will need the following R packages:

* tidyverse
* DBI
* RSQLite

Doing this in conjuction with the slides should be enough to start playing 
  around in R.
If you also want to generate the slides, you will also need the xaringan 
  package.





