
# Econ 6290 Research Methods summer 2022
# Kyle Hammerberg
# 


setwd("~/class_project")
#install.packages("fredr")

library(fredr)
library(ggplot2)


fredr_set_key("4105bf11c4de015282d68be8ee9fd365")

#For this exercise, download a series of your choice 
# and make a line plot of the series over time.
# when  you have finished your code, push it to the class
# GitHub where you got this.

GDP <-if (fredr_has_key()) {
  # search for series with text matching "GDP" and return the top 10 most popular
  # series
  fredr_series_search_text(
    search_text = "GDP",
    order_by = "popularity",
    limit = 20
  )
}
data<-fredr(
  series_id = "GDP",
  observation_start = as.Date("1959-01-01"),
  observation_end = as.Date("2022-01-01")
)
ggplot(data, aes(x=date, y=value)) +
  geom_line() +
  labs(
    x = "Date",
    y = "GDP",
    title = "Real GDP Over Time"
  )
