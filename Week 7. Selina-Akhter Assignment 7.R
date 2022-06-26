# ##############################
# Econ 6290 Research Methods summer 2022
# Dr. Christine Moser
# 
# automating data downloads using APIs 
####################################
# Install Git https://happygitwithr.com/install-git.html
# 
#

install.packages("fredr")

library(fredr)


fredr_set_key("9b250fababb7af67f2f9ca58d25a195a")

##irst you can explore what data series are available

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
  # search for series with text matching "participation" and return the top 50 most popular
  # series
  fredr_series_search_text(
    search_text = "participation",
    order_by = "popularity",
    limit = 50
  )
}
infl_series<-if (fredr_has_key()) {
  # search for series with text matching "inflation" and return the top 50 most popular
  # series
  fredr_series_search_text(
    search_text = "inflation",
    order_by = "popularity",
    limit = 50
  )
}

# Next you can access data from those series
unr<-fredr(
  series_id = "UNRATE",
  observation_start = as.Date("2018-01-01"),
  observation_end = as.Date("2022-01-01")
)

# Create your own series and plot it on a line chart
# with time on the x-axis.
fed_funds <- fredr(
  # accessing University of Michigan: Inflation Expectation data from January,1990 to January,2022
  series_id = "MICH",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2022-01-01")
  )

#Line plot
plot(x= fed_funds$date, y = fed_funds$value, ty = "l",
     xlab = "Time", ylab = "University of Michigan: Inflation Expectation")


