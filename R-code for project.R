<<<<<<< HEAD:using FRED.R
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


fredr_set_key("")

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

# Next you can access data from those series
unr<-fredr(
  series_id = "UNRATE",
  observation_start = as.Date("2018-01-01"),
  observation_end = as.Date("2022-01-01")
)

# Create your own series and plot it on a line chart
# with time on the x-axis.



=======
# ##############################
# Econ 6290 Research Methods summer 2022
# Dr. Christine Moser
# 
# automating data downloads using APIs 
####################################
Install Git https://happygitwithr.com/install-git.html
# lfpr, lfpr-women, unr, unr-women, gdp
#
#
install.packages("fredr")

library(fredr)
getwd ()

getwd() 
setwd("C:/Users/Student/Desktop") 


fredr_set_key("9c21b9c871b6a01e1c6ac66c17d399c8")

# This command calls the  initial unemployment claims from 2018 to 2022
fredr(
  series_id = "ICSA",
  observation_start = as.Date("2018-01-01"),
  observation_end = as.Date("2022-01-01")
)

#the next set of commands request the avaiable series with a search term. 
#this is an easy way to find hthe series_id.
gdp_series<-if (fredr_has_key()) {
  # search for series with text matching "gdp" and return the top 10 most popular
  # series
  fredr_series_search_text(
    search_text = "Gross Domestic Product",
    order_by = "popularity",
    limit = 50
  )
}
unr_series<-if (fredr_has_key()) {
  # search for series with text matching "gdp" and return the top 10 most popular
  # series
  fredr_series_search_text(
    search_text = "unemployment rate",
    order_by = "popularity",
    limit = 20
  )
}
lfpr_series<-if (fredr_has_key()) {
  # search for series with text matching "gdp" and return the top 10 most popular
  # series
  fredr_series_search_text(
    search_text = "participation",
    order_by = "popularity",
    limit = 50
  )
}
infl_series<-if (fredr_has_key()) {
  # search for series with text matching "gdp" and return the top 10 most popular
  # series
  fredr_series_search_text(
    search_text = "inflation",
    order_by = "popularity",
    limit = 50
  )
}

#################
# now this saves the unemployment rate as a df (most recent 4 years)
unr<-fredr(
  series_id = "ICSA",
  observation_start = as.Date("2018-01-01"),
  observation_end = as.Date("2022-01-01")
)

lfpr<-fredr(
  series_id = "CIVPART",
  observation_start = as.Date("2018-01-01"),
  observation_end = as.Date("2022-01-01")
)
>>>>>>> 13d568ecc96d15c4a269e27d7c84374083992d99:R-code for project.R
