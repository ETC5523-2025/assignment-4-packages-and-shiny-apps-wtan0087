library(usethis)
library(dplyr)

# Load raw CSV and filter out 'ALL'.
HAI_data = read.csv("./data-raw/HAI_data.csv") |>
  filter(Infection != "ALL")

# Save as package dataset
usethis::use_data(HAI_data, overwrite = TRUE)


