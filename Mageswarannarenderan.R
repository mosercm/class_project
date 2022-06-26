
# ##############################
# Econ 6290 Research Methods summer 2022
# Narenderan Mageswaran


install.packages("fredr")


library(fredr)
library(ggplot2)
getwd (etwd("C:/Users/naren/OneDrive/Desktop/Econs 6290 -Research Method/Week_7"))




fredr_set_key("cef3b99d5d926ed36a64a34b41ab477f")




#Getting Series ID foro Recession
recession_series<-if (fredr_has_key()) {
  # search for series with text matching "gdp" and return the top 10 most popular
  # series
  fredr_series_search_text(
    search_text = "Recession",
    order_by = "popularity",
    limit = 30
  )
}



#################
# Getting Information from the series
recs<-fredr(
  series_id = "USREC",
  observation_start = as.Date("2001-01-01"),
  observation_end = as.Date("2022-01-01")
)

#Plotting Graph
ggplot(recs, aes(x=date, y= value))+
  geom_line() + 
  labs(
    x= "Date",
    Y= "NBER Recession Indicator",
    title = "NBER Recession Indicator Trend Line"
  )





