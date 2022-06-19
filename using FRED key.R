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
setwd ("C:/Users/chris/Desktop/Research Methods Econ6290/2022/week_7")


fredr_set_key("f2b62575640ea2d74a45936b7e785ace")
fredr(
  series_id = "UNRATE",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2000-01-01")
)

gdp_series<-if (fredr_has_key()) {
  # search for series with text matching "gdp" and return the top 50 most popular
  # series
  fredr_series_search_text(
    search_text = "Gross Domestic Product",
    order_by = "popularity",
    limit = 50
  )
}
unr_series<-if (fredr_has_key()) {
  # search for series with text matching "unemployment rate" and return the top 10 most popular
  # series
  fredr_series_search_text(
    search_text = "unemployment rate",
    order_by = "popularity",
    limit = 20
  )
}
lfpr_series<-if (fredr_has_key()) {
  # search for series with text matching "participation" and return the top 10 most popular
  # series
  fredr_series_search_text(
    search_text = "participation",
    order_by = "popularity",
    limit = 50
  )
}
infl_series<-if (fredr_has_key()) {
  # search for series with text matching "inflation" and return the top 10 most popular
  # series
  fredr_series_search_text(
    search_text = "inflation",
    order_by = "popularity",
    limit = 50
  )
}


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

