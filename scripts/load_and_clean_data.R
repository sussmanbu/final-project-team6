# This file is purely as an example. 
# There are a few places

library(tidyverse)

# Read the dataset
NYPD_data <- read_csv("dataset/NYPD_Shooting_Incident_Data__Historic__20240322.csv")

str(NYPD_data)

# Summary statistics
summary(NYPD_data)

NYPD_clean_data <- NYPD_data %>%
  # mutate(across(everything(), ~na_if(.x, "(null)"))) %>%
  # mutate(across(where(is.character), ~na_if(.x, "(null)"))) %>%
  
  select(-c(OCCUR_TIME, LOC_OF_OCCUR_DESC)) %>%
  filter(!is.na(PERP_RACE) & !is.na(VIC_RACE))

NYPD_clean_data <- na.omit(NYPD_clean_data)

str(NYPD_clean_data)

write_csv(NYPD_clean_data, file = here::here("dataset", "nypd_shooting_clean.csv"))

saveRDS(NYPD_clean_data, here::here("dataset", "nypd_shooting_clean.rds"))

