
# BHAI.AS4

<!-- badges: start -->
<!-- badges: end -->

# BHAI.AS4: Interactive Exploration of BHAI Dataset

This R package provides tools for exploring the BHAI dataset on
healthcare-associated infections (HAIs). It includes:

- A Shiny app for interactive visualization.
- Functions for loading and preparing the dataset.
- Example vignettes to reproduce key analyses.

## Installation

``` r
# Install devtools if you haven't
install.packages("remotes")

# Install BHAI.AS4 package from local directory
remotes::install_github("wtan0087/BHAI.AS4")

# Install required packages
install.packages(c("ggplot2", "dplyr", "shiny", "tidyr"))
```

## Usage

How to use

``` r
library(BHAI.AS4)
launch_app()
```
