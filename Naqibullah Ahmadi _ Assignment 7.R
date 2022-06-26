
# ##############################
# Econ 6290 Research Methods summer 2022
# Dr. Christine Moser
# Naqibullah Ahmadi

####################################
#For this exercise, download a series of your choice 
# and make a line plot of the series over time.


install.packages("fredr")
library(fredr)
library(ggplot2)

fredr_set_key("8f61e8f2aa343d6596ac6094050dbc60")

setwd("~/Documents/Summer I 2022/Reserch Methods/Week VII")

inflation_series<-if (fredr_has_key()) {
  fredr_series_search_text(
    search_text = "inflation",
    order_by = "popularity",
    limit = 50
  )
}


RealGDP <- fredr(
  series_id = "A191RL1Q225SBEA",
  observation_start = as.Date("2010-01-01"),
  observation_end = as.Date("2022-04-01")
)

ggplot(RealGDP, aes(x=date, y=value)) +
  geom_line() +
  labs(
    x = "Years",
    y = "Real GDP",
    title = "Real Gross Domestic Product 2010 - 2022"
  )

