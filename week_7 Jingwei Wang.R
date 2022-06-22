#For this exercise, download a series of your choice  
# and make a line plot of the series over time.

install.packages("fredr")

library(fredr)
library(ggplot2)

setwd("~/Desktop/Research Methods/week_7/class_project")

fredr_set_key("7085424f86e9ccce4139e88f72a88552")

cpi_series <- if (fredr_has_key()) {
  fredr_series_search_text(
    search_text = "consumer price index",
    order_by = "popularity",
    limit = 50
  )
}

cpi <- fredr(
  series_id = "CPIAUCSL",
  observation_start = as.Date("2002-01-01"),
  observation_end = as.Date("2022-05-01")
)

ggplot(cpi, aes(x=date, y=value)) +
  geom_line() +
  labs(
    x = "Time",
    y = "Consumer price index",
    title = "CPI for all urban consumers"
    )


