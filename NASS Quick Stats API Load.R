install.packages("dplyr")
install.packages("anytime")
install.packages("tidyverse")
install.packages("scales")

library(httr)
library(jsonlite)
library(dplyr)
library(anytime)
library(tidyverse)


look_up_year <- 2016

res <- GET("http://quickstats.nass.usda.gov/api/api_GET/?key=B3D26AE6-9481-3C6F-9436-0F80B153A773",
           query = list(source_desc = "SURVEY", sector_desc = "CROPS", group_desc = "FIELD CROPS", comodity_desc = "OATS", state_fips_code = 39, year = look_up_year))
res

data <- fromJSON(rawToChar(res$content))

#Converting data into a data frame

data_df <- as.data.frame(data)

#Convert data.week_ending to date
data_df <- data_df %>%
  filter(data.week_ending != "") %>%
  mutate(data.week_ending = anydate(data.week_ending)) 

#Convert data.Value to numeric
data_df <- data_df %>%
  mutate(data.Value = as.numeric(data.Value))


#Oats progress (emerged)

oats_data <- filter(data_df, data.commodity_desc == "OATS", data.short_desc == "OATS - PROGRESS, MEASURED IN PCT EMERGED" )

  
  

#create plot

oats_data %>%
  ggplot(aes(x = data.week_ending, y = data.Value)) + 
  geom_line() +
  geom_point() +
  scale_x_date(date_breaks = "week" , date_labels = "%b-%d-%y") +
  theme(axis.text.x = element_text(angle=45))
