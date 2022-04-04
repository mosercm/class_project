# ##############################
# Econ 6290 Research Methods summer 2022
# Dr. Christine Moser
# 
# automating data downloads using APIs 
####################################
Install Git https://happygitwithr.com/install-git.html
# lfpr, lfpr-women, unr, unr-women, gdp
#
#
install.packages("fredr")

library(fredr)
getwd ()

getwd() 
setwd("C:/Users/Student/Desktop") 


fredr_set_key("9c21b9c871b6a01e1c6ac66c17d399c8")

# This command calls the  initial unemployment claims from 2018 to 2022
fredr(
  series_id = "ICSA",
  observation_start = as.Date("2018-01-01"),
  observation_end = as.Date("2022-01-01")
)

#the next set of commands request the avaiable series with a search term. 
#this is an easy way to find hthe series_id.
gdp_series<-if (fredr_has_key()) {
  # search for series with text matching "gdp" and return the top 10 most popular
  # series
  fredr_series_search_text(
    search_text = "Gross Domestic Product",
    order_by = "popularity",
    limit = 50
  )
}
unr_series<-if (fredr_has_key()) {
  # search for series with text matching "gdp" and return the top 10 most popular
  # series
  fredr_series_search_text(
    search_text = "unemployment rate",
    order_by = "popularity",
    limit = 20
  )
}
lfpr_series<-if (fredr_has_key()) {
  # search for series with text matching "gdp" and return the top 10 most popular
  # series
  fredr_series_search_text(
    search_text = "participation",
    order_by = "popularity",
    limit = 50
  )
}
infl_series<-if (fredr_has_key()) {
  # search for series with text matching "gdp" and return the top 10 most popular
  # series
  fredr_series_search_text(
    search_text = "inflation",
    order_by = "popularity",
    limit = 50
  )
}
#Using same API provided above
or 
fredr(
  series_id = "UNRATE",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2000-01-01")
)
#################
# now this saves the unemployment rate as a df (most recent 4 years)
unr<-fredr(
  series_id = "ICSA",
  observation_start = as.Date("2018-01-01"),
  observation_end = as.Date("2022-01-01")
)

lfpr<-fredr(
  series_id = "CIVPART",
  observation_start = as.Date("2018-01-01"),
  observation_end = as.Date("2022-01-01")
)

fredr(
  series_id = "UNRATE",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2000-01-01"),
  frequency = "q", # quarterly
  units = "chg" # change over previous value
)


popular_funds_series <- fredr_series_search_text(
    search_text = "federal funds",
    order_by = "popularity",
    sort_order = "desc",
    limit = 1
)


popular_funds_series_id <- popular_funds_series$id

popular_funds_series_id %>%
  fredr(
    observation_start = as.Date("1990-01-01"),
    observation_end = as.Date("2000-01-01")
  ) %>%
  ggplot(data = ., mapping = aes(x = date, y = value, color = series_id)) +
    geom_line() +
    labs(x = "Observation Date", y = "Rate", color = "Series")


library(purrr)

map_dfr(c("UNRATE", "FEDFUNDS"), fredr) %>%
  ggplot(data = ., mapping = aes(x = date, y = value, color = series_id)) +
    geom_line() +
    labs(x = "Observation Date", y = "Rate", color = "Series")


params <- list(
  series_id = c("UNRATE", "OILPRICE"),
  frequency = c("m", "q")
)

pmap_dfr(
  .l = params,
  .f = ~ fredr(series_id = .x, frequency = .y)
)

library(xts)

gnpca <- fredr(series_id = "GNPCA", units = "log") %>%
  mutate(value = value - lag(value)) %>%
  filter(!is.na(value))

gnpca_xts <- xts(
  x = gnpca$value,
  order.by = gnpca$date
)

gnpca_xts %>%
  StructTS() %>%
  residuals() %>%
  acf(., main = "ACF for First Differenced real US GNP, log")

