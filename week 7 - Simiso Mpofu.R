#############################
# Econ 6290 Research Methods summer 2022
# Week 7 Simiso Mpofu

# For this exercise, download a series of your choice 
# and make a line plot of the series over time.

library(fredr)
library(ggplot2)

fredr_set_key("744140c580c41a8eff3809772bbdace3")

#I used average CPI of cities in the US from 1980 to 2022


cpi<-if (fredr_has_key()) {
  # search for series with text matching "gdp" and return the top 50 most popular
  # series
  fredr_series_search_text(
    search_text = "Consumer Price Index",
    order_by = "popularity",
    limit = 20
    
  )
}

CPIAUCSL<-fredr(
  series_id = "CPIAUCSL",
  observation_start = as.Date("1980-01-01"),
  observation_end = as.Date("2022-05-01")
)


ggplot(data=CPIAUCSL, aes(x=value, y=date)) +
  geom_line(color="blue") +
  labs(  x = "CPI",  y = "Date", title = "Consumer Price Index for All Urban Consumers: All Items in U.S. City Average
")

