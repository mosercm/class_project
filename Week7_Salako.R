###########################################################
## Econ 6290 Summer 2022, Dr. Christine Moser
## Assignment 7
## 
## Abdulmuttolib Salako
###########################################################



#For this exercise, download a series of your choice 
# and make a line plot of the series over time.


library(fredr)
library(ggplot2)

setwd("~/WMU_MA_Applied_Economics/Research_Methodology/Week_7/class_project")



fredr_set_key("020658c7badee470ea06dc1cf644de50")



exchr_series<-if (fredr_has_key()) {
  fredr_series_search_text(
    search_text = "exchange rate",
    order_by = "popularity",
    limit = 50
  )
}



exchr<-fredr(
  series_id = "UNRATE",
  observation_start = as.Date("2018-01-01"),
  observation_end = as.Date("2022-01-01")
)    


ggplot(exchr, aes(x=date, y=value)) +
  geom_line() +
  labs(
    x = "Time",
    y = "Exchange rate",
    title = "Trend Line for Exchange Rate"
  )
