<<<<<<< HEAD
# ##############################
# Econ 6290 Research Methods summer 2022
# Dr. Christine Moser
# 
# automating data downloads using APIs 
####################################
# Install Git https://happygitwithr.com/install-git.html
# 
#
#
install.packages("fredr")

library(fredr)


fredr_set_key("")

# these first examples search available data series
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

# Once you know what you want, you can request data
    unr<-fredr(
      series_id = "UNRATE",
      observation_start = as.Date("2018-01-01"),
      observation_end = as.Date("2022-01-01")
    )

#For this exercise, download a series of your choice 
# and make a line plot of the series over time.
# when  you have finished your code, push it to the class
# GitHub where you got this.

=======
# ##############################
# Econ 6290 Research Methods summer 2022
# Dr. Christine Moser
# 
# automating data downloads using APIs 
####################################
# Install Git https://happygitwithr.com/install-git.html
# 
#
#
install.packages("fredr")

library(fredr)


fredr_set_key("")

# these first examples search available data series
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

# now you can request data
unr<-fredr(
  series_id = "UNRATE",
  observation_start = as.Date("2018-01-01"),
  observation_end = as.Date("2022-01-01")
)

#For this exercise, download a series of your choice 
# and make a line plot of the series over time.


>>>>>>> 75244db9c130e32801e2d5010dcc1af34c51cd23
