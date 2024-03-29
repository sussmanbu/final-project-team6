# This file is purely as an example. 
# There are a few places

library(tidyverse)

NYPD_data <- read_csv("dataset/NYPD_Shooting_Incident_Data__Historic__20240322.csv")

str(NYPD_data)

summary(NYPD_data)


## CLEAN the data
#loan_data_clean <- loan_data

#write_csv(loan_data_clean, file = here::here("dataset", "loan_refusal_clean.csv"))

#saveRDS(cleaned_data, file = "cleaned_dataset.rds")

