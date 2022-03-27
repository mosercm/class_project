# ##############################
# Econ 6290 Research Methods summer 2022
# Dr. Christine Moser
# 
# automating data downloads using APIs 
####################################
# Install Git https://happygitwithr.com/install-git.html
# lfpr, lfpr-women, unr, unr-women, gdp
#
#
install.packages("fredr")

library(fredr)
setwd ("7")


fredr_set_key("")

# This command calls the unemployment rate from 1990 to 2000
fredr(
  series_id = "UNRATE",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2000-01-01")
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

#################
# now this saves the unemployment rate as a df (most recent 4 years)
unr<-fredr(
  series_id = "UNRATE",
  observation_start = as.Date("2018-01-01"),
  observation_end = as.Date("2022-01-01")
)

lfpr<-fredr(
  series_id = "CIVPART",
  observation_start = as.Date("2018-01-01"),
  observation_end = as.Date("2022-01-01")
)
