# ##############################
# Econ 6290 Research Methods summer 2022

#Farbod Dehghani
####################################

install.packages("fredr")

library(fredr)
library(newsAPI) 
library(SnowballC) 
library(RColorBrewer) 
library(wordcloud) 
library(tm)
library(ggplot2)
library(ggraph) 
library(igraph)

fredr_set_key("76e8ff1fc14748f192e7834eaa770144")

inflation<-if (fredr_has_key()) {
  fredr_series_search_text(
    search_text = "inflation",
    order_by = "popularity",
    limit = 20
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
  series_id = "MICH",
  observation_start = as.Date("2018-01-01"),
  observation_end = as.Date("2022-01-01")
)

ggplot(unr, aes(x=date, y=value)) +
  geom_line() +
  labs(
    x = "Date",
    y = "inflation",
    title = "University of Michigan Inflation Expectation"
  )

