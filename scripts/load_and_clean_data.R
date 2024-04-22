# This file is purely as an example. 
# There are a few places

library(tidyverse)

# Read the dataset
NYPD_data <- read_csv("dataset/NYPD_Shooting_Incident_Data__Historic__20240322.csv")
NYPD_arrest_data <- read_csv("dataset/NYPD_Arrest_Data__Year_to_Date__20240410.csv")
NYPD_payroll_data <- read_csv("dataset/Payroll_data_2022.csv")

str(NYPD_data)
str(NYPD_arrest_data)
str(NYPD_payroll_data)

# Summary statistics
summary(NYPD_data)
summary(NYPD_arrest_data)

NYPD_clean_data <- NYPD_data %>%
  # mutate(across(everything(), ~na_if(.x, "(null)"))) %>%
  # mutate(across(where(is.character), ~na_if(.x, "(null)"))) %>%
  
  select(-c(OCCUR_TIME, LOC_OF_OCCUR_DESC)) %>%
  filter(!is.na(PERP_RACE) & !is.na(VIC_RACE))

NYPD_clean_data <- na.omit(NYPD_clean_data)

str(NYPD_clean_data)

write_csv(NYPD_clean_data, file = here::here("dataset", "nypd_shooting_clean.csv"))

saveRDS(NYPD_clean_data, here::here("dataset", "nypd_shooting_clean.rds"))

saveRDS(NYPD_arrest_data, here::here("dataset", "nypd_arrest.rds"))

saveRDS(NYPD_payroll_data, here::here("dataset", "nypd_payroll.rds"))

