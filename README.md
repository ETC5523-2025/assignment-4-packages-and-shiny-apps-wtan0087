# BHAI.AS4: Interactive Exploration of BHAI Dataset

This R package provides tools for exploring the BHAI dataset on
healthcare-associated infections (HAIs). It includes:

- A Shiny app for interactive visualization.
- Functions for loading and preparing the dataset.
- Example vignettes to reproduce key analyses.

Visit the pkgdown site for full documentation, function reference, and vignettes: 
[BHAI.AS4 pkgdown site](https://etc5523-2025.github.io/assignment-4-packages-and-shiny-apps-wtan0087/)

## Data source

The dataset included in this package is a summary table extracted from the German Point Prevalence Survey (PPS) on healthcare-associated infections (HAIs) conducted in 2011. 
It reports annual cases, attributable deaths and disability adjusted life years (DALYs) for five major types of HAIs: pneumonia (HAP), surgical site infections (SSI), bloodstream infections (BSI), urinary tract infections (UTI) and Clostridioides difficile infections (CDI).  

**Reference (APA 7th edition):**

Zacher, B., Haller, S., Willrich, N., Walter, J., Abu Sin, M., Cassini, A., Plachouras, D., Suetens, C., Behnke, M., Gastmeier, P., Wieler, L. H., & Eckmanns, T. (2019). Application of a new methodology and R package reveals a high burden of healthcare-associated infections (HAI) in Germany compared to the average in the European Union/European Economic Area, 2011 to 2012. Eurosurveillance, 24(46). https://doi.org/10.2807/1560-7917.es.2019.24.46.1900135

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



