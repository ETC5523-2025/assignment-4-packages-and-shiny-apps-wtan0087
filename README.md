# BHAI.AS4: Interactive Exploration of BHAI Dataset

This R package provides tools for exploring the BHAI dataset on
healthcare-associated infections (HAIs). It includes:

- A Shiny app for interactive visualization.
- Functions for loading and preparing the dataset.
- Example vignettes to reproduce key analyses.

Visit the pkgdown site for full documentation, function reference, and vignettes: 
[BHAI.AS4 pkgdown site](https://etc5523-2025.github.io/assignment-4-packages-and-shiny-apps-wtan0087/)

## Installation

``` r
# Install devtools if you haven't
install.packages("remotes")

# Install BHAI.AS4 package from local directory
remotes::install_github("ETC5523-2025/assignment-4-packages-and-shiny-apps-wtan0087")

# Install required packages
install.packages(c("ggplot2", "tidyverse", "shiny", "plotly"))
```

## Usage

How to use

``` r
library(BHAI.AS4)
launch_app()
```



