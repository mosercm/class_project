
# Econ 6290 Research Methods summer 2022
# Hunter Jenson
# 


setwd("/Users/hunterjenson/Desktop/class_project")
install.packages("fredr")

library(fredr)
library(ggplot2)


fredr_set_key("4a1a71eb06464975e7755721247de6e3")

#For this exercise, download a series of your choice 
# and make a line plot of the series over time.
# when  you have finished your code, push it to the class
# GitHub where you got this.

money_supply<-if (fredr_has_key()) {
  # search for series with text matching "unemployment rate" and return the top 10 most popular
  # series
  fredr_series_search_text(
    search_text = "money supply",
    order_by = "popularity",
    limit = 20
  )
}
data<-fredr(
  series_id = "M2REAL",
  observation_start = as.Date("1959-01-01"),
  observation_end = as.Date("2022-01-01")
)
ggplot(data, aes(x=date, y=value)) +
  geom_line() +
  labs(
    x = "Date",
    y = "M2 Real Supply",
    title = "M2 Real Money Supply Over TIme"
  )
